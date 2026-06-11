
## GLS for Caravel Integrated Tests

# Caravel GLS Result Table

| Test | RTL Status (Week–3) | GLS Status |
|------|---------------------|------------|
| user_pass_thru |PASS |PASS |
| uart |PASS |PASS |
| sysctrl |FAIL |FAIL|
| sram_exec |PASS |PASS |
| spi_master |PASS |PASS |
| pullupdown |PASS |PASS |
| pll |FAIL |FAIL |
| pass_thru_fix |PASS |PASS |
| mem |PASS |PASS |
| hkspi_power |PASS |PASS |
| gpio_mgmt |PASS |PASS |
| hkspi |PASS |PASS |

----

## 1. user_pass_thru

This test verifies the "Pass-Through" mode of the Caravel chip's Housekeeping system. It connects the external SPI pins straight through the chip's internal routing(HouseKeeping) to the user project area.

**GLS Simulation Result**

![user_pass_thru GLS Passed](Screenshots/Phase-4/user_pass_through_gl_passed.PNG)

**GTKWave Output**

![user_pass_thru GTKWave](Screenshots/Phase-5/user_pass_thru_gtkwave.PNG)

---

## 2. uart

The RISC-V CPU executes C-code that tells the internal UART peripheral (via wishbone) to transmit a specific text message one letter at a time. The UART hardware converts this text into a rapid stream of 1s and 0s and pushes it out(via uart_tx) to housekeeping which redirect that to physical pin mprj_io[6]. Outside the chip, the Verilog testbench acts as a receiving computer, catching those bits 

**GLS Simulation Result**

![uart GLS Passed](Screenshots/Phase-4/uart_gl_passed.PNG)

**GTKWave Output**

![uart GTKWave](Screenshots/Phase-5/uart_gtkwave.PNG)

---

## 3. sysctrl

This test proves that the Caravel chip can dynamically reroute its high-speed internal clock signals out to the external pins for debugging and monitoring. This test failed in both RTL and GLS simulations.

**GLS Simulation Result**

![sysctrl GLS Failed](Screenshots/Phase-4/sysctrl_gl_failed.PNG)

**GTKWave Output**

![sysctrl GTKWave](Screenshots/Phase-5/sysctrl_gtkwave.PNG)

---

## 4. sram_exec

RISC-V CPU fetches its C-code instructions one-by-one from the slow, external SPI Flash memory chip. This test proves that the CPU can take a chunk of C-code, physically copy it from the external Flash into its ultra-fast internal SRAM (Static Random Access Memory), and then "jump" into the SRAM to execute the code directly from inside the chip.

**GLS Simulation Result**

![sram_exec GLS Passed](Screenshots/Phase-4/sram_exec_gl_passed.PNG)

**GTKWave Output**

![sram_exec GTKWave](Screenshots/Phase-5/sram_exec_gtkwave.PNG)

---

## 5. spi_master

Instead of just reading its boot code from the primary flash memory, the CPU actively initiates communication with a secondary, external SPI flash chip connected to the user area pins. The CPU sends out clock and chip-select signals, requests data from specific memory addresses, reads the returning data, and then broadcasts that data out to the testbench to prove the two-way SPI communication was successful.

**GLS Simulation Result**

![spi_master GLS Passed](Screenshots/Phase-4/spi_master_gl_passed.PNG)

**GTKWave Output**

![spi_master GTKWave](Screenshots/Phase-5/spi_master_gtkwave.PNG)

---

## 6. pullupdown

This test verifies the physical, electrical resistor configurations of the Caravel chip's outer GPIO pads.

**GLS Simulation Result**

![pullupdown GLS Passed](Screenshots/Phase-4/pullupdown_gl_passed.PNG)

**GTKWave Output**

![pullupdown GTKWave](Screenshots/Phase-5/pullupdown_gtkwave.PNG)

---

## 7. pll

This test verifies the analog Phase-Locked Loop (PLL), which is the "transmission" of the chip. It takes a slow, steady external clock signal and multiplies it into an ultra-fast internal clock for the CPU to use. The C-code starts the chip in "bypass" mode (using the slow external clock), and then dynamically flips a switch to turn off the bypass, forcing the chip to run on the high-speed PLL. It also tests different clock divider settings. This desing fails in both RTL and GLS simulation due to timeout.

**GLS Simulation Result**

![pll GLS Failed](Screenshots/Phase-4/pll_gl_failed.PNG)

**GTKWave Output**

![pll GTKWave](Screenshots/Phase-5/PLL_gtkwave2.PNG)

---

## 8. pass_thru_fix

This test proves the chip can act as a direct "extension cord" to talk to external memory wihtout any timing issue.

**GLS Simulation Result**

![pass_thru_fix GLS Passed](Screenshots/Phase-4/pass_thru_fix_gl_passed.PNG)

**GTKWave Output**

![pass_thru_fix GTKWave](Screenshots/Phase-5/pass_thru_fix_gtkwave.PNG)

---

## 9. mem

This test verifies the physical integrity of the CPU’s internal memory (DFFRAM - D-Flip-Flop RAM). The RISC-V processor runs a rigorous stress test by writing specific mathematical values into memory addresses and immediately reading them back to ensure they weren't corrupted. It tests this across different data sizes.

**GLS Simulation Result**

![mem GLS Passed](Screenshots/Phase-4/mem_gl_passed.PNG)

**GTKWave Output**

![mem GTKWave](Screenshots/Phase-5/mem_gtkwave.PNG)

---

## 10. hkspi_power

It tests a scenario where the custom "User Project" is completely powered off (simulating a deep sleep state or a catastrophic power failure in the user area). The testbench physically grounds the power supplies to the user area (vccd1, vdda1, etc.). Despite half the chip being dead, the testbench successfully uses the external SPI pins to talk to the chip's internal Housekeeping module

**GLS Simulation Result**

![hkspi_power GLS Passed](Screenshots/Phase-4/hkspi_power_gl_passed.PNG)

**GTKWave Output**

![hkspi_power GTKWave](Screenshots/Phase-5/hkspi_power_gtkwave.PNG)

---

## 11. gpio_mgmt

This test verifies a single, dedicated hardware pin belonging exclusively to the management CPU. This dedicated gpio pin is traditionally used by the system for simple, critical status indicators (like a heartbeat LED on the motherboard).

**GLS Simulation Result**

![gpio_mgmt GLS Passed](Screenshots/Phase-4/gpio_mgmt_gl_passed.PNG)

**GTKWave Output**

![gpio_mgmt GTKWave](Screenshots/Phase-5/gpio_mgmt_gtkwave.PNG)

---

## 12. hkspi

It proves that an external device (the testbench acting as a master) can tap into the chip's Housekeeping SPI pins to read internal system registers and issue hardware resets while the internal RISC-V CPU is completely busy doing its own job.

**GLS Simulation Result**

![hkspi GLS Passed](Screenshots/Phase-4/hkspi_gl_passed.PNG)

**GTKWave Output**

![hkspi GTKWave](Screenshots/Phase-5/hkspi_gtkwave.PNG)

---
