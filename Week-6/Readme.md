
## Repository Structure

```
Week6/
├── Readme.md              ← Project overview, block selection rationale, repository index
├── block_section.md       ← Why gpio_control_block.v was rejected; why debug_regs.v was chosen; macro dependency problems explained
├── rtl_analysis.md        ← RTL hierarchy, top module ports, Wishbone protocol explanation, register map, how the RTL works
├── debugging_notes.md     ← All errors hit during simulation and GLS; fixes applied; testbench design decisions explained
├── Implementation/        ← RTL2GDSII flow documentation: commands, stage-by-stage results, timing reports, GDS screenshots
├── gls/                   ← GLS simulation: commands, testbench, 11 test descriptions, RTL vs GLS results (14/14 PASS)
└── Screenshots/           ← OpenROAD GUI captures for each flow stage: synth, floorplan, place, CTS, route, final GDS layout
```


