
# Gate-Level Simulation (GLS)

---

## Files Used

| File | Role |
|------|------|
| `debug_regs_tb.v` | Testbench — compatible with both RTL and GLS via `ifdef GL` |
| `debug_regs.v` | RTL source — used for RTL simulation only |
| `debug_regs_gl.v` | Gate-level netlist — copied from `results/6_final.v` |
| `$PDK_ROOT/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v` | sky130 primitive definitions |
| `$PDK_ROOT/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v` | sky130 standard cell models |

`PDK_ROOT` must be set before running GLS:
```bash
export PDK_ROOT=/home/vsdsquadron/.volare
```
Added to `~/.bashrc` so it persists across terminal sessions.

---

## RTL Simulation

RTL simulation runs directly on the Verilog source with zero gate delays.
Used to verify functional correctness before the RTL-to-GDS flow.

```bash
# Step 1 — Compile
iverilog -g2012 -o sim_rtl debug_regs_tb.v debug_regs.v

# Step 2 — Run
vvp sim_rtl

# Step 3 — Open waveform
gtkwave rtl_debug_regs_tb.vcd
```

**Result: 14/14 PASS**

---

## GLS Simulation

GLS runs the same testbench against the gate-level netlist produced after
RTL-to-GDS. Each standard cell has a `#1` nominal propagation delay added,
making outputs arrive ~4 ns later than in RTL simulation.

```bash
# Step 1 — Compile
iverilog -g2012                                                              \
  -DGL                                                                       \
  -DFUNCTIONAL                                                               \
  -DUNIT_DELAY="#1"                                                          \
  -o sim_gl                                                                  \
  debug_regs_tb.v                                                            \
  debug_regs_gl.v                                                            \
  $PDK_ROOT/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v           \
  $PDK_ROOT/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v

# Step 2 — Run
vvp sim_gl

# Step 3 — Open waveform
gtkwave gls_debug_regs_tb.vcd
```

### Compiler Flags Explained

| Flag | Purpose |
|------|---------|
| `-DGL` | Activates `ifdef GL` blocks in testbench — selects separate VCD filename (`gls_debug_regs_tb.vcd`) |
| `-DFUNCTIONAL` | Tells sky130 cell library to use behavioural models only — skips `specify` timing blocks |
| `-DUNIT_DELAY="#1"` | Adds 1 ns propagation delay to every gate — prevents zero-delay glitches |

**Result: 14/14 PASS**

---

## Testbench — `debug_regs_tb.v`

The testbench is written to work for both RTL and GLS without modification.
The only difference between the two runs is the compiler flags passed to iverilog.

### 11 Tests — What Each Verifies

| Test | Operation | Expected result |
|------|-----------|----------------|
| 1 | Reset | Both registers read `0x00000000` |
| 2 | Full write + read `reg1` | `0xDEADBEEF` stored and read back |
| 3 | Full write + read `reg2` | `0xCAFEBABE` stored and read back |
| 4 | Independence check | `reg1` unchanged after writing `reg2` |
| 5 | Byte-select `sel=0x1` (byte 0 only) | `DEADBEEF` → `DEADBEAA` |
| 6 | Byte-select `sel=0x8` (byte 3 only) | `DEADBEAA` → `11ADBEAA` |
| 7 | Byte-select `sel=0x6` (bytes 1 & 2) | `CAFEBABE` → `CA2233BE` |
| 8 | Invalid address `0x4` | `wbs_ack_o` stays 0 for 5 cycles |
| 9 | Reset mid-session | Both registers cleared to `0x00000000` |
| 10 | Back-to-back transactions | No state leak between consecutive reads/writes |
| 11 | One-shot ACK width | `ack` pulses exactly 1 clock cycle wide |

### Key Testbench Design Decisions

**Assertions on `negedge`, sampling after `posedge`:**  
All bus signals are driven on the falling edge to give maximum setup time
before the next rising edge. In GLS, outputs take ~4 ns to propagate through
the clock tree and gates. Sampling at `@(negedge clk) #1` (5 ns after posedge)
gives enough margin for both RTL (zero delay) and GLS (~4 ns delay).

**Separate VCD files via `ifdef GL`:**
```verilog
`ifdef GL
    $dumpfile("gls_debug_regs_tb.vcd");
`else
    $dumpfile("rtl_debug_regs_tb.vcd");
`endif
```
Prevents the GLS run from overwriting the RTL waveform — both can be opened
side-by-side in GTKWave for comparison.

---

## Results Summary

| Simulation | Tests passed | VCD file |
|-----------|-------------|---------|
| RTL | **14 / 14** | `rtl_debug_regs_tb.vcd` |
| GLS | **14 / 14** | `gls_debug_regs_tb.vcd` |

Both simulations pass all 14 checks — confirming that the gate-level netlist
produced by OpenROAD is functionally equivalent to the original RTL.
