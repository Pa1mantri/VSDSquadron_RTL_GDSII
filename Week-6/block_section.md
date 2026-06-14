
# Independent Block Selection

### Initial Choice — `gpio_control_block.v` (Abandoned)

The first block selected for the RTL-to-GDS flow was `gpio_control_block.v` from the
Caravel SoC peripheral library.

After closer inspection, the RTL file directly instantiates sky130 PDK primitives inside
the module body — for example `sky130_fd_sc_hd__buf_2`, `sky130_fd_io__gpiov2`, and
other hard IP cells. This pattern introduces
significant complications in a standard synthesis + place-and-route flow:

**Why technology-embedded macros break the standard RTL2GDSII flow:**

| Problem | What goes wrong |
|---------|----------------|
| Yosys re-synthesis | Yosys tries to synthesize sky130 cell definitions again, causing duplicate or conflicting module definitions |
| Black-box handling | Each embedded macro must be declared as a black box in synthesis so Yosys skips it — requires custom `read_liberty` and `-keep_hierarchy` flags |
| Hard macro LEF files | Place-and-route (OpenROAD) needs `.lef` geometry files for every hard macro so it knows their physical size and pin locations |
| Timing libraries | Each macro needs a `.lib` file for STA — standard cell `.lib` alone is not enough |
| Floorplan complexity | Hard macros must be manually placed inside the floorplan before auto-placement runs, otherwise OpenROAD aborts with obstruction errors |
| I/O ring cells | `sky130_fd_io` cells belong to the I/O ring, not the core, and require a completely separate padframe flow |

Attempting this block would require providing LEF + LIB files for every embedded macro,
writing custom floorplan TCL scripts for hard macro placement, and handling padframe
integration — well beyond the scope of a single-block validation exercise.

---

### Final Choice — `debug_regs.v` ✓

`debug_regs.v` was selected as a clean, self-contained RTL block with zero technology
dependencies. It implements two 32-bit general-purpose debug registers accessed over a
**Wishbone B4 slave interface**.

**Block overview:**

| Property | Value |
|----------|-------|
| Interface | Wishbone B4 (cyc / stb / we / ack / sel / dat / adr) |
| Registers | `debug_reg_1` at address `0x8`, `debug_reg_2` at address `0xC` |
| Data width | 32-bit |
| Byte select | `wbs_sel_i[3:0]` — any combination of 4 bytes can be written independently |
| Reset | Synchronous, active-high — both registers clear to `0x00000000` |
| ACK behaviour | One-shot: `wbs_ack_o` pulses for exactly 1 clock cycle per transaction (`!wbs_ack_o` guard prevents re-assertion) |
| Technology | Pure behavioural RTL — no PDK primitives instantiated |
| Target PDK | sky130 HD (`sky130_fd_sc_hd`) |
| Clock | `wb_clk_i` — 100 MHz (10 ns period) |

Because the RTL contains no embedded macros, it flows through the complete
Yosys → Floorplan → Placement → CTS → Routing → GDS pipeline without any manual
intervention, making it an easy design for a first end-to-end RTL2GDSII exercise.

---

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

