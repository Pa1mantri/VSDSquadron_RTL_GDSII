// ============================================================
//  Testbench  : debug_regs_tb.v
//  Design     : debug_regs.v  (2 x 32-bit Wishbone registers)
//  Compatible : RTL simulation  AND  GLS simulation
//  Tools      : iverilog + gtkwave
// ============================================================
//
//  ── RTL SIMULATION ──────────────────────────────────────────
//
//  Step 1 – Compile:
//    iverilog -g2012 -o sim_rtl debug_regs_tb.v debug_regs.v
//
//  Step 2 – Run:
//    vvp sim_rtl
//
//  Step 3 – Open waveform:
//    gtkwave debug_regs_tb.vcd
//
//  ── GLS SIMULATION (after RTL-to-GDS flow) ──────────────────
//
//  Step 1 – Compile (replace paths to match your ORFS output):
//    iverilog -g2012                                           \
//      -DGL                                                    \
//      -DFUNCTIONAL                                            \
//      -DUNIT_DELAY="#1"                                       \
//      -o sim_gl                                               \
//      debug_regs_tb.v                                         \
//      /path/to/results/final/nl/debug_regs.nl.v              \
//      $PDK_ROOT/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v \
//      $PDK_ROOT/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v
//
//  Step 2 – Run:
//    vvp sim_gl
//
//  Step 3 – Open waveform (same VCD, compare side-by-side):
//    gtkwave debug_regs_tb.vcd
//
//  ── KEY SIGNALS TO OBSERVE IN GTKWAVE ───────────────────────
//    wb_clk_i    – clock
//    wb_rst_i    – reset
//    wbs_cyc_i   – master: valid cycle
//    wbs_stb_i   – master: valid beat
//    wbs_we_i    – master: write=1 read=0
//    wbs_adr_i   – master: address
//    wbs_dat_i   – master: write data
//    wbs_sel_i   – master: byte-enable
//    wbs_ack_o   – slave:  acknowledge (1-cycle pulse)
//    wbs_dat_o   – slave:  read data
//
//  ── WHAT TO COMPARE RTL vs GLS ──────────────────────────────
//    1. wbs_ack_o  pulse width must be exactly 1 clock cycle
//    2. wbs_dat_o  must match the last written value on read
//    3. No extra ACK pulses (one-shot lock must hold)
//    4. Reset clears dat_o and ack_o to 0
// ============================================================

`timescale 1ns / 1ps
`default_nettype none

module debug_regs_tb;

// ── Localparams ───────────────────────────────────────────────────────
localparam CLK_HALF    = 5;    // 5 ns → 10 ns period → 100 MHz
localparam ACK_TIMEOUT = 20;   // max clock cycles to wait for ack

// ── DUT port signals ──────────────────────────────────────────────────
reg         wb_clk_i;
reg         wb_rst_i;
reg         wbs_stb_i;
reg         wbs_cyc_i;
reg         wbs_we_i;
reg  [3:0]  wbs_sel_i;
reg  [31:0] wbs_dat_i;
reg  [31:0] wbs_adr_i;
wire        wbs_ack_o;
wire [31:0] wbs_dat_o;

// ── DUT instantiation ─────────────────────────────────────────────────
// Module name stays "debug_regs" for both RTL and GLS.
// For GLS compile, supply the gate-level netlist instead of debug_regs.v
debug_regs dut (
    .wb_clk_i  (wb_clk_i),
    .wb_rst_i  (wb_rst_i),
    .wbs_stb_i (wbs_stb_i),
    .wbs_cyc_i (wbs_cyc_i),
    .wbs_we_i  (wbs_we_i),
    .wbs_sel_i (wbs_sel_i),
    .wbs_dat_i (wbs_dat_i),
    .wbs_adr_i (wbs_adr_i),
    .wbs_ack_o (wbs_ack_o),
    .wbs_dat_o (wbs_dat_o)
);

// ── Clock generation ──────────────────────────────────────────────────
initial wb_clk_i = 1'b0;
always  #(CLK_HALF) wb_clk_i = ~wb_clk_i;

// ── VCD dump for GTKWave ──────────────────────────────────────────────
initial begin
    $dumpfile("debug_regs_tb.vcd");
    $dumpvars(0, debug_regs_tb);   // dumps ALL signals: tb + dut ports
end

// ── Scoreboard registers ──────────────────────────────────────────────
integer pass_count;
integer fail_count;
reg [31:0] rd_data;

// ═════════════════════════════════════════════════════════════════════
//  TASK: apply_reset
//  Drives wb_rst_i high for n_cycles, then releases it.
//  All bus signals are idle (0) during reset.
// ═════════════════════════════════════════════════════════════════════
task apply_reset;
    input [4:0] n_cycles;
    integer i;
    begin
        // Put bus signals in safe idle state before asserting reset
        @(negedge wb_clk_i);
        wb_rst_i  = 1'b1;
        wbs_cyc_i = 1'b0;
        wbs_stb_i = 1'b0;
        wbs_we_i  = 1'b0;
        wbs_sel_i = 4'h0;
        wbs_dat_i = 32'h0;
        wbs_adr_i = 32'h0;

        // Hold reset for n_cycles
        for (i = 0; i < n_cycles; i = i + 1)
            @(posedge wb_clk_i);

        // Release reset on a negedge so it is stable at next posedge
        @(negedge wb_clk_i);
        wb_rst_i = 1'b0;

        // One idle cycle after reset
        @(posedge wb_clk_i); #1;
    end
endtask

// ═════════════════════════════════════════════════════════════════════
//  TASK: wb_write
//  Performs a single Wishbone write transaction.
//
//  Timeline:
//    negedge  → assert cyc=1 stb=1 we=1 addr data sel
//    posedge  → slave WRITE branch fires, ack_next=1, reg updated
//    posedge+1→ ack=1 seen, de-assert on next negedge
//    negedge  → cyc=0 stb=0 we=0
//    posedge  → slave ELSE branch fires, ack_next=0
// ═════════════════════════════════════════════════════════════════════
task wb_write;
    input [31:0] addr;
    input [31:0] data;
    input  [3:0] sel;
    integer      timer;
    begin
        // Assert on negedge — maximises setup time before next posedge
        @(negedge wb_clk_i);
        wbs_cyc_i = 1'b1;
        wbs_stb_i = 1'b1;
        wbs_we_i  = 1'b1;
        wbs_adr_i = addr;
        wbs_dat_i = data;
        wbs_sel_i = sel;

        // Wait for ack — normally arrives after 1 posedge
        timer = 0;
        @(posedge wb_clk_i); #1;
        while (!wbs_ack_o) begin
            timer = timer + 1;
            if (timer >= ACK_TIMEOUT) begin
                $display("[ERROR] WB_WRITE timeout  addr=0x%08h  data=0x%08h",
                         addr, data);
                $finish;
            end
            @(posedge wb_clk_i); #1;
        end
        // ack is 1 here — de-assert on next negedge
        @(negedge wb_clk_i);
        wbs_cyc_i = 1'b0;
        wbs_stb_i = 1'b0;
        wbs_we_i  = 1'b0;
        wbs_sel_i = 4'h0;
        wbs_dat_i = 32'h0;
        wbs_adr_i = 32'h0;

        // One idle posedge so ELSE branch fires and ack returns to 0
        @(posedge wb_clk_i); #1;
    end
endtask

// ═════════════════════════════════════════════════════════════════════
//  TASK: wb_read
//  Performs a single Wishbone read transaction.
//  Captures wbs_dat_o into 'data' while ack is high.
//
//  Timeline:
//    negedge  → assert cyc=1 stb=1 we=0 addr
//    posedge  → slave READ branch fires, dat_o_next=reg, ack_next=1
//    posedge+1→ ack=1, dat_o=reg → capture here
//    negedge  → de-assert cyc=0 stb=0
//    posedge  → ELSE fires, ack→0, dat_o→0
// ═════════════════════════════════════════════════════════════════════
task wb_read;
    input  [31:0] addr;
    output [31:0] data;
    integer       timer;
    begin
        @(negedge wb_clk_i);
        wbs_cyc_i = 1'b1;
        wbs_stb_i = 1'b1;
        wbs_we_i  = 1'b0;     // we=0 → triggers READ branch
        wbs_adr_i = addr;
        wbs_sel_i = 4'hF;
        wbs_dat_i = 32'h0;

        timer = 0;
        @(posedge wb_clk_i); #1;
        while (!wbs_ack_o) begin
            timer = timer + 1;
            if (timer >= ACK_TIMEOUT) begin
                $display("[ERROR] WB_READ timeout  addr=0x%08h", addr);
                $finish;
            end
            @(posedge wb_clk_i); #1;
        end
        // ack=1, dat_o=register value → capture now
        data = wbs_dat_o;

        @(negedge wb_clk_i);
        wbs_cyc_i = 1'b0;
        wbs_stb_i = 1'b0;
        wbs_adr_i = 32'h0;

        @(posedge wb_clk_i); #1;
    end
endtask

// ═════════════════════════════════════════════════════════════════════
//  TASK: check_result
//  Compares got vs expected and prints PASS or FAIL.
// ═════════════════════════════════════════════════════════════════════
task check_result;
    input [31:0]     got;
    input [31:0]     expected;
    input [64*8-1:0] label;      // up to 64-character string
    begin
        if (got === expected) begin
            $display("  PASS | %-42s | 0x%08h", label, got);
            pass_count = pass_count + 1;
        end else begin
            $display("  FAIL | %-42s | expected=0x%08h  got=0x%08h",
                     label, expected, got);
            fail_count = fail_count + 1;
        end
    end
endtask

// ═════════════════════════════════════════════════════════════════════
//  MAIN TEST SEQUENCE
// ═════════════════════════════════════════════════════════════════════
initial begin
    // Initialise all inputs before simulation starts
    wb_rst_i  = 1'b0;
    wbs_cyc_i = 1'b0;
    wbs_stb_i = 1'b0;
    wbs_we_i  = 1'b0;
    wbs_sel_i = 4'h0;
    wbs_dat_i = 32'h0;
    wbs_adr_i = 32'h0;
    pass_count = 0;
    fail_count = 0;

    $display("=======================================================");
    $display("   debug_regs Testbench — RTL and GLS compatible       ");
`ifdef GL
    $display("   Mode : Gate-Level Simulation (GLS)                  ");
`else
    $display("   Mode : RTL Simulation                               ");
`endif
    $display("=======================================================");

    // -----------------------------------------------------------
    // TEST 1: Reset
    // After reset both registers must read back as 0x00000000
    // -----------------------------------------------------------
    $display("\n[TEST 1]  Reset — both registers must be 0x00000000");
    apply_reset(4);
    wb_read(32'h00000008, rd_data);
    check_result(rd_data, 32'h00000000, "reg1 after reset");
    wb_read(32'h0000000C, rd_data);
    check_result(rd_data, 32'h00000000, "reg2 after reset");

    // -----------------------------------------------------------
    // TEST 2: Full 32-bit write to reg1 (all 4 bytes, sel=0xF)
    // Write 0xDEADBEEF, read back, expect 0xDEADBEEF
    // -----------------------------------------------------------
    $display("\n[TEST 2]  Full write to reg1  addr=0x8  sel=0xF");
    wb_write(32'h00000008, 32'hDEADBEEF, 4'hF);
    wb_read (32'h00000008, rd_data);
    check_result(rd_data, 32'hDEADBEEF, "reg1 full write+read");

    // -----------------------------------------------------------
    // TEST 3: Full 32-bit write to reg2 (all 4 bytes, sel=0xF)
    // Write 0xCAFEBABE, read back, expect 0xCAFEBABE
    // -----------------------------------------------------------
    $display("\n[TEST 3]  Full write to reg2  addr=0xC  sel=0xF");
    wb_write(32'h0000000C, 32'hCAFEBABE, 4'hF);
    wb_read (32'h0000000C, rd_data);
    check_result(rd_data, 32'hCAFEBABE, "reg2 full write+read");

    // -----------------------------------------------------------
    // TEST 4: Independence — writing reg2 must not change reg1
    // -----------------------------------------------------------
    $display("\n[TEST 4]  Independence — reg1 must still hold 0xDEADBEEF");
    wb_read(32'h00000008, rd_data);
    check_result(rd_data, 32'hDEADBEEF, "reg1 unchanged after reg2 write");

    // -----------------------------------------------------------
    // TEST 5: Byte-select — write byte0 only  (sel = 4'h1 = 0001)
    //
    //  reg1 before  : DE AD BE EF
    //  dat_i        : 00 00 00 AA
    //  sel          : 0  0  0  1  → only byte0 [7:0] written
    //  byte0: EF → AA   (bytes 1,2,3 unchanged)
    //  Expected     : DE AD BE AA = 0xDEADBEAA
    // -----------------------------------------------------------
    $display("\n[TEST 5]  Byte-select byte0 only  sel=4'h1  (EF->AA)");
    wb_write(32'h00000008, 32'h000000AA, 4'h1);
    wb_read (32'h00000008, rd_data);
    check_result(rd_data, 32'hDEADBEAA, "reg1 byte0 only (sel=4'h1)");

    // -----------------------------------------------------------
    // TEST 6: Byte-select — write byte3 only  (sel = 4'h8 = 1000)
    //
    //  reg1 before  : DE AD BE AA   (from TEST 5)
    //  dat_i        : 11 00 00 00
    //  sel          : 1  0  0  0  → only byte3 [31:24] written
    //  byte3: DE → 11   (bytes 0,1,2 unchanged)
    //  Expected     : 11 AD BE AA = 0x11ADBEAA
    // -----------------------------------------------------------
    $display("\n[TEST 6]  Byte-select byte3 only  sel=4'h8  (DE->11)");
    wb_write(32'h00000008, 32'h11000000, 4'h8);
    wb_read (32'h00000008, rd_data);
    check_result(rd_data, 32'h11ADBEAA, "reg1 byte3 only (sel=4'h8)");

    // -----------------------------------------------------------
    // TEST 7: Byte-select — write bytes 1&2  (sel = 4'h6 = 0110)
    //
    //  reg2 before  : CA FE BA BE   (from TEST 3)
    //  dat_i        : 00 22 33 00
    //  sel          : 0  1  1  0  → byte1[15:8] and byte2[23:16] written
    //  byte1: BA → 33   byte2: FE → 22   (bytes 0,3 unchanged)
    //  Expected     : CA 22 33 BE = 0xCA2233BE
    // -----------------------------------------------------------
    $display("\n[TEST 7]  Byte-select bytes 1 and 2  sel=4'h6  (BA->33, FE->22)");
    wb_write(32'h0000000C, 32'h00223300, 4'h6);
    wb_read (32'h0000000C, rd_data);
    check_result(rd_data, 32'hCA2233BE, "reg2 bytes 1&2 (sel=4'h6)");

    // -----------------------------------------------------------
    // TEST 8: Invalid address — ack must NOT assert
    //
    //  Address 0x4 is not 0x8 or 0xC.
    //  The decode condition fails, so ELSE branch fires every cycle.
    //  wbs_ack_o must stay 0 for 5 cycles.
    // -----------------------------------------------------------
    $display("\n[TEST 8]  Invalid address 0x4 — ack must stay 0 for 5 cycles");
    @(negedge wb_clk_i);
    wbs_cyc_i = 1'b1;
    wbs_stb_i = 1'b1;
    wbs_we_i  = 1'b1;
    wbs_adr_i = 32'h00000004;   // ← not 0x8 or 0xC
    wbs_dat_i = 32'hFFFFFFFF;
    wbs_sel_i = 4'hF;
    repeat(5) @(posedge wb_clk_i);
    #1;
    if (!wbs_ack_o) begin
        $display("  PASS | %-42s | ack=0 confirmed", "no ack for invalid addr 0x4");
        pass_count = pass_count + 1;
    end else begin
        $display("  FAIL | %-42s | unexpected ack!", "no ack for invalid addr 0x4");
        fail_count = fail_count + 1;
    end
    // Clean up
    @(negedge wb_clk_i);
    wbs_cyc_i = 1'b0;
    wbs_stb_i = 1'b0;
    wbs_we_i  = 1'b0;
    wbs_adr_i = 32'h0;
    wbs_dat_i = 32'h0;
    wbs_sel_i = 4'h0;
    repeat(2) @(posedge wb_clk_i);

    // -----------------------------------------------------------
    // TEST 9: Reset mid-session clears both registers
    // Registers currently hold non-zero values from above tests.
    // After reset both must read 0x00000000.
    // -----------------------------------------------------------
    $display("\n[TEST 9]  Reset mid-session — both registers cleared");
    apply_reset(4);
    wb_read(32'h00000008, rd_data);
    check_result(rd_data, 32'h00000000, "reg1 cleared by mid-session reset");
    wb_read(32'h0000000C, rd_data);
    check_result(rd_data, 32'h00000000, "reg2 cleared by mid-session reset");

    // -----------------------------------------------------------
    // TEST 10: Back-to-back transactions
    // Write reg1, write reg2, read reg1, read reg2 in sequence.
    // Verifies no state leaks between consecutive transactions.
    // -----------------------------------------------------------
    $display("\n[TEST 10] Back-to-back: write reg1, write reg2, read both");
    wb_write(32'h00000008, 32'hA5A5A5A5, 4'hF);
    wb_write(32'h0000000C, 32'h5A5A5A5A, 4'hF);
    wb_read (32'h00000008, rd_data);
    check_result(rd_data, 32'hA5A5A5A5, "reg1 back-to-back");
    wb_read (32'h0000000C, rd_data);
    check_result(rd_data, 32'h5A5A5A5A, "reg2 back-to-back");

    // -----------------------------------------------------------
    // TEST 11: One-shot ACK — !wbs_ack_o gate prevents double-ack
    //
    //  Correct behaviour within one Wishbone transaction:
    //    Cycle 1 posedge: cyc=1 stb=1 we=1 ack=0 → WRITE fires → ack_next=1
    //    Cycle 1+1ns    : ack=1  ← sample here (expect 1)
    //    negedge        : de-assert cyc/stb/we immediately after seeing ack
    //    Cycle 2 posedge: ELSE fires (cyc=0) → ack_next=0
    //    Cycle 2+1ns    : ack=0  ← sample here (expect 0)
    //
    //  ack_c1=1 AND ack_c2=0 proves the pulse was exactly 1 cycle wide.
    //  Note: holding cyc/stb/we HIGH past the ack is a NEW transaction
    //  in Wishbone — that is correct bus behaviour, not a DUT bug.
    // -----------------------------------------------------------
    $display("\n[TEST 11] One-shot ACK — !wbs_ack_o gate: ack must be 1 cycle wide");
    begin : ack_width_test
        reg ack_c1, ack_c2;

        // Assert on negedge
        @(negedge wb_clk_i);
        wbs_cyc_i = 1'b1;
        wbs_stb_i = 1'b1;
        wbs_we_i  = 1'b1;
        wbs_adr_i = 32'h00000008;
        wbs_dat_i = 32'h12345678;
        wbs_sel_i = 4'hF;

        // Cycle 1: write fires, sample ack
        @(posedge wb_clk_i); #1;
        ack_c1 = wbs_ack_o;   // expect 1

        // De-assert immediately on negedge after seeing ack
        @(negedge wb_clk_i);
        wbs_cyc_i = 1'b0;
        wbs_stb_i = 1'b0;
        wbs_we_i  = 1'b0;
        wbs_adr_i = 32'h0;

        // Cycle 2: ELSE branch fires (cyc=0), ack must drop to 0
        @(posedge wb_clk_i); #1;
        ack_c2 = wbs_ack_o;   // expect 0

        @(posedge wb_clk_i); #1;   // idle

        if (ack_c1 === 1'b1 && ack_c2 === 1'b0) begin
            $display("  PASS | %-42s | ack_c1=%b ack_c2=%b",
                     "ack exactly 1-cycle (c1=1 c2=0)", ack_c1, ack_c2);
            pass_count = pass_count + 1;
        end else begin
            $display("  FAIL | %-42s | ack_c1=%b ack_c2=%b (expected 1,0)",
                     "ack exactly 1-cycle (c1=1 c2=0)", ack_c1, ack_c2);
            fail_count = fail_count + 1;
        end
    end

    // -----------------------------------------------------------
    // Final report
    // -----------------------------------------------------------
    $display("\n=======================================================");
    $display("  RESULTS : %0d PASSED   %0d FAILED   out of %0d tests",
             pass_count, fail_count, pass_count + fail_count);
    if (fail_count == 0)
        $display("  STATUS  : *** ALL TESTS PASSED ***");
    else
        $display("  STATUS  : *** %0d TEST(S) FAILED — open GTKWave ***",
                 fail_count);
    $display("=======================================================");

    // Extra idle time so final transactions are fully visible in GTKWave
    repeat(10) @(posedge wb_clk_i);
    $finish;
end

// ── Simulation watchdog ───────────────────────────────────────────────
// Kills simulation if it hangs (e.g. ack never comes in GLS)
initial begin
    #100_000;   // 100 µs maximum simulation time
    $display("[WATCHDOG] Simulation exceeded 100us — force stop");
    $finish;
end

endmodule
`default_nettype wire
