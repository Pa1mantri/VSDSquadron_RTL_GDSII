
## Modifying verification flow for GLS

The following modifications were made strictly to the ifeq ($(SIM),GL) block within the existing test Makefiles, preserving the standard execution flow.

```
ifeq ($(SIM),GL)
ifeq ($(CONFIG),caravel_user_project)
	iverilog -Ttyp -DFUNCTIONAL -DGL -DSIM -DUSE_POWER_PINS -DUNIT_DELAY=#1 \
	  -f$(VERILOG_PATH)/includes/includes.gl.caravel \
	  -f$(USER_PROJECT_VERILOG)/includes/includes.gl.$(CONFIG) \
	  -o $@ $<
else
	iverilog -Ttyp -DFUNCTIONAL -DGL -DSIM -DUSE_POWER_PINS -DUNIT_DELAY=#1 \
	  -y $(CARAVEL_VERILOG_PATH)/rtl \
	  -I $(CARAVEL_VERILOG_PATH)/rtl \
	  -f $(VERILOG_PATH)/includes/includes.rtl.$(CONFIG) \
	  /home/vsdsquadron/.volare/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v \
	  /home/vsdsquadron/.volare/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v \
	  /home/vsdsquadron/workspace/vsd-scl180-orfs/orfs/flow/results/sky130hd/user_project_wrapper/base/6_final.v \
	  -o $@ $<
endif
endif

```

### Explanation of the changes made
The ``SIM=GL`` target was updated to support a **Mixed-Mode Simulation**.

The following specific changes were implemented:

1. Replaced RTL with Synthesized Netlist: The dummy RTL wrapper (__user_project_wrapper.v) was removed and replaced with the absolute path to the post-routed         OpenROAD gate-level netlist (6_final.v).

2. Included Simulation Dependencies: Because the physical netlist uses standard cells instead of behavioral logic, the paths to the Sky130 behavioral models          (primitives.v and sky130_fd_sc_hd.v) were explicitly added to the compilation command to resolve any "missing module" errors.

3. Prevented "Missing Core" Errors (Mixed-Mode): The includes file was reverted from .gl. to .rtl., and the -y and -I pointers were added to target the               $(CARAVEL_VERILOG_PATH)/rtl directory. This tells the simulator to use the fast, behavioral RTL logic for the Caravel SoC and RISC-V CPU, while reserving the      Gate-Level simulation strictly for the user_project_wrapper.

