
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


**How PASS/FAIL is determined**









