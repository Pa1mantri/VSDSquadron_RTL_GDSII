
## Overview

This covers the complete RTL-to-GDS II
implementation flow for an independent block, followed by gate-level simulation
to validate the physical netlist against the original RTL behaviour.

## Design — `debug_regs.v`

`debug_regs.v` implements two 32-bit general-purpose debug registers
accessible over a **Wishbone Bus slave interface**. It is a small, flat,
pure-behavioural RTL block with no sub-modules and no technology-specific
dependencies.

A Wishbone bus master (such as a CPU or SoC fabric) can read and write
the two registers by placing an address and data on the bus and asserting
the handshake signals. The design supports **byte-selective writes** —
any combination of the four bytes within a 32-bit word can be updated
independently without disturbing the remaining bytes.
Both registers clear to zero on reset and the bus acknowledge pulse
is guaranteed to be exactly one clock cycle wide per transaction.

## Repository Structure

```
Week6/
├── Readme.md              ← Project overview
├── block_section.md       ← Why gpio_control_block.v was rejected; why debug_regs.v was chosen; macro dependency problems explained
├── rtl_analysis.md        ← RTL hierarchy, top module ports, Wishbone protocol explanation, register map, how the RTL works
├── debugging_notes.md     ← All errors hit during simulation and GLS; fixes applied; testbench design decisions explained
├── Implementation/        ← RTL2GDSII flow documentation: commands, stage-by-stage results, timing reports, GDS screenshots
├── gls/                   ← GLS simulation: commands, testbench, RTL vs GLS results (14/14 PASS)
└── Screenshots/           ← OpenROAD GUI captures for each flow stage: synth, floorplan, place, CTS, route, final GDS layout
```


