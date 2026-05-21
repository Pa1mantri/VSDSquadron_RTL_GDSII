
## Phase - 1 

# Task -1 SPI Master Standalone Verification

The terminal commands use to clone the repository and run the tests

```
git clone https://github.com/vsdip/vsdsquadron-soc
cd workspace/vsdsquadron-soc/caravel_mgmt_soc_litex/verilog/dv/tests-standalone/spi_master
make clean
make

```

spi_master_passed.png

## Phase - 4

**What happens when `make` is executed**

Makefile runs are based on a Dependency Graph. It starts at the target and works backwards, checking dependencies and timestamps to avoid recompiling everything.

**How the Makefile invokes the simulator**

Makefile ivokes iverilog with different switches to compile the hardware and then ivokes vvp command to run the simulation.

**Total Compiled files**

Firmware C file (.c) is converted into .elf and then .hex. Hardware files inlcude .v(verilog) files of testbench and all the files in the folder ``includes.rtl.caravel`` which includes CPU, system bus, peripherals, and standard cells.

**How testbench interacts with the design**

In Standlone testing, the testbench is only wrapping the internal management core, not the whole chip. Because the core is exposed, the testbench interacts directly with internal wires. 
In Caravel testing, the testbench wraps the massive, complete chip. It must interact by providing the main chip power and looking strictly at the external GPIO pads.


**How PASS/FAIL is determined**

A wire from the verilog testbench checks on the C firmware. In standalone testing it checks on the internal wires. In caravel testing it checks on the external physical pin. The testbench uses Verilog wait statements to pause its execution until the firmware outputs a specific code. Once unlocked by the code, the testbench uses an if statement to verify if the peripheral's data matches the expected result, printing FAIL and aborting if it is wrong, or printing PASS once all checks are completed successfully."









