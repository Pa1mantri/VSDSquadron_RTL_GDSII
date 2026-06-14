
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


