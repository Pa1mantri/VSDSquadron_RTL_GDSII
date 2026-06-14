
## RTL Hierarchy and Dependencies

`debug_regs.v` is a **fully flat, single-module design** — it has no sub-module
instantiations, no `include` directives, and no external dependencies of any kind.

This means synthesis requires **only one file** — `debug_regs.v` — and place-and-route
needs only the standard sky130 HD cell library. No LEF macros, no extra liberty files,
no floorplan constraints for hard IP.

## Top Module — Port Interface
The single top-level module is `debug_regs`. All ports belong to the Wishbone slave interface:

```verilog
module debug_regs (
    // Clock and reset
    input  wire        wb_clk_i,   // system clock (100 MHz)
    input  wire        wb_rst_i,   // synchronous reset, active-high
    // Wishbone slave inputs (driven by the bus master)
    input  wire        wbs_stb_i,      // strobe — valid data beat
    input  wire        wbs_cyc_i,      // cycle — bus transaction active
    input  wire        wbs_we_i,       // write enable: 1=write, 0=read
    input  wire [3:0]  wbs_sel_i,      // byte select: bit0=byte0 ... bit3=byte3
    input  wire [31:0] wbs_dat_i,      // write data from master
    input  wire [31:0] wbs_adr_i,      // address
    // Wishbone slave outputs (driven by this module)
    output reg         wbs_ack_o,      // acknowledge — 1-cycle pulse
    output reg [31:0]  wbs_dat_o       // read data to master
);
```
Total port count: 10 ports — 8 inputs, 2 outputs.
No tri-state, no bidirectional, no analog ports.

## RTL Explanation

The module stores two independent 32-bit values in flip-flop arrays and exposes them
to a Wishbone master for read and write access.

Internal Registers
```
debug_reg_1  [31:0]  — mapped to address 0x00000008
debug_reg_2  [31:0]  — mapped to address 0x0000000C
```
Both registers reset to 0x00000000 on wb_rst_i = 1.

**Write Operation**

A write fires when cyc=1, stb=1, we=1, and — critically — !wbs_ack_o=1.
The address selects which register to write. The wbs_sel_i
byte-enable lines independently assign value each of the four bytes:
```
sel[0] = 1  →  reg[7:0]   updated from dat_i[7:0]
sel[1] = 1  →  reg[15:8]  updated from dat_i[15:8]
sel[2] = 1  →  reg[23:16] updated from dat_i[23:16]
sel[3] = 1  →  reg[31:24] updated from dat_i[31:24]
```

After writing, ``wbs_ack_o`` is set to 1 for exactly one clock cycle.

**Read Operation**

A read fires when cyc=1, stb=1, we=0. The addressed register's value is
driven onto ``wbs_dat_o`` and ``wbs_ack_o`` pulses for one cycle. When neither condition
is met (idle or invalid address), ``wbs_dat_o`` returns to 0 and ``wbs_ack_o`` stays 0.

**Wishbone protocol violation:** The !wbs_ack_o signal inside the write/read ensures the acknowledge
pulse is exactly one clock wide otherwise it leads to writing twice.

---
