
# Debugging Notes

Issues encountered during RTL simulation, GLS setup, and testbench development.

---

## Issue 1 — Test 11 Failed (13/14 PASS) on First RTL Run.

### Failed at 
```
FAIL | ack exactly 1-cycle (c1=1 c2=0) | ack_c1=1 ack_c2=1
```

### Root Cause
The original Test 11 held `cyc=stb=we=1` for 10 clock cycles and counted
how many times `wbs_ack_o` went high. The intent was to check the one-shot
ACK guard — but holding the bus signals high across multiple cycles creates
a **new Wishbone transaction every cycle**:

```
Cycle 1: ack=0 → condition true  → write fires → ack→1
Cycle 2: ack=1 → guard blocks it → ack→0
Cycle 3: ack=0 → condition true  → write fires AGAIN → ack→1
...
```

The DUT was behaving correctly — each posedge with `cyc=stb=1` is a valid
new transaction per Wishbone Bus spec. The test design was wrong.

**Summary** : Not de-asserting wb_cyc_i, wb_stb_i and wb_we_i signals after one clock cycle results in ack going high in third cycle.

### Fix
Changed Test 11 to a proper **single-transaction test**:

```
negedge  → assert cyc=stb=we=1
posedge1 → write fires, sample ack_c1 (expect 1)
negedge  → DE-ASSERT cyc=stb=we immediately
posedge2 → ELSE branch fires, sample ack_c2 (expect 0)
```

`ack_c1=1` and `ack_c2=0` together prove the pulse was exactly 1 cycle wide.

---

## Issue 2 — Test 11 Failed in GLS (ack_c1=0, ack_c2=1)

### Failed at 
```
FAIL | ack exactly 1-cycle (c1=1 c2=0) | ack_c1=0 ack_c2=1
```
Result was backwards — ack appeared to arrive one cycle late.

### Root Cause
GLS uses `UNIT_DELAY="#1"` — every gate in the netlist adds 1 ns of
propagation delay. The total output delay from clock edge to `wbs_ack_o`
settling is approximately: 4ns

```
Clock tree (2 clkbuf_8 stages) :  ~0.34 ns
FF clk-to-Q (dfrtp_1)          :  ~0.38 ns
Output buffer (clkdlybuf4s50_1):  ~0.45 ns
──────────────────────────────────────────
Total propagation               :  ~1.17 ns (but with UNIT_DELAY stacking: ~4 ns)
```

The original sampling point was `@(posedge clk) #1` — only **1 ns after
posedge**. The GLS output had not settled yet, so `ack_c1` read 0 (old
value) and `ack_c2` read 1 (delayed arrival from the previous cycle).

### Fix
Changed sampling to `@(posedge clk) @(negedge clk) #1` — this waits
**5 ns after posedge** (half period), giving GLS output full time to settle:

```verilog
// Before (broken for GLS):
@(posedge wb_clk_i); #1;
ack_c1 = wbs_ack_o;   // too early — GLS output not arrived yet

// After (works for both RTL and GLS):
@(posedge wb_clk_i);
@(negedge wb_clk_i); #1;
ack_c1 = wbs_ack_o;   // 5ns after posedge — GLS settled, RTL still 0-delay correct
```

---

## Issue 3 — VCD Files Overwriting Each Other

### Symptom
Running GLS after RTL erased the RTL waveform — both simulations wrote
to the same file `debug_regs_tb.vcd`.

### Fix
Added `ifdef GL` inside the testbench to select separate filenames:

```verilog
initial begin
`ifdef GL
    $dumpfile("gls_debug_regs_tb.vcd");
`else
    $dumpfile("rtl_debug_regs_tb.vcd");
`endif
    $dumpvars(0, debug_regs_tb);
end
```

Now both VCD files exist simultaneously and can be opened side-by-side
in GTKWave for comparison.

---

## Testbench Design Choices for GLS Compatibility

### Why signals are driven on `negedge`

All bus signals (`cyc`, `stb`, `we`, `addr`, `dat`, `sel`) are driven on
the **falling edge**, not the rising edge:

```verilog
@(negedge wb_clk_i);   // drive here
wbs_cyc_i = 1'b1;
wbs_adr_i = addr;
// ...
// posedge arrives 5ns later → FF samples clean, settled signal
```

**Two reasons:**

1. **Setup time margin** — driving on negedge gives the signal a full
   half-period (5 ns) to propagate through PCB traces and input buffers
   before the next posedge latches it. This satisfies setup time for both
   RTL and GLS.

2. **Avoids X-propagation in GLS** — if signals were driven exactly at
   posedge, they would be changing at the same simulation timestep that
   the flip-flops sample. In GLS, gate delays cause the new value and the
   old value to coexist briefly, producing **X (unknown)** at the FF input.
   X then spreads downstream through combinational logic — all outputs
   become X — and every check fails. Driving on negedge ensures signals are
   stable and fully settled before the next posedge.

### Why `#1` is added after `@(posedge)`

```verilog
@(posedge wb_clk_i); #1;
```

At exactly the posedge timestamp, the RTL DUT updates outputs at
simulation time zero — the testbench and DUT write to the same signals
in the same timestep, causing a **race condition**. The `#1` advances
1 ns past the edge, after all DUT outputs have settled, so the testbench
reads a deterministic value.

### Why `UNIT_DELAY="#1"` is used instead of real SDF timing

`-DUNIT_DELAY="#1"` adds a flat 1 ns delay to every gate. This is
**functional simulation with nominal delay** — not real extracted timing.

Real timing simulation would require an SDF file from OpenROAD containing
the actual gate and interconnect delays for every net. For functional
verification (does the logic produce correct results?), `#1` is sufficient
and avoids the complexity of SDF annotation.

### Why `-DFUNCTIONAL` is required

Without `-DFUNCTIONAL`, the sky130 cell library includes `specify` blocks
containing pin-to-pin timing checks. iverilog does not fully support these
and produces errors or incorrect simulation. `-DFUNCTIONAL` strips the
`specify` blocks, leaving only the behavioural logic of each cell.

---

## Summary

| Issue | Symptom | Fix |
|-------|---------|-----|
| Test 11 wrong design | `ack_c2=1` (double-ack counted) | Single transaction: assert → sample → de-assert → sample |
| GLS sampling too early | `ack_c1=0 ack_c2=1` (reversed) | Sample at negedge (+5 ns) instead of posedge+1 ns |
| VCD overwrite | GLS erased RTL waveform | `ifdef GL` selects separate dumpfile names |
