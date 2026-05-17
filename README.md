#  VSD-Squadron RTL to GDSII SOC Implementation

## WEEK-1 (Digital VLSI SoC Design and Planning – Foundation Phase)

<details>
<summary><b>PHASE 1 — OpenLANE Flow Familiarity</b></summary>
<br>

The initial steps to invoke openlane flow.

<img width="1124" height="735" alt="Image" src="https://github.com/user-attachments/assets/0e4e3ee1-65dd-491e-8d06-3cc6cfb8f23e" />
<br>

Prepping the design involves setting all the environment variables like PDK, SDC file and standard cell library used. Below statistics shows the synthesis report about the standard cells used to synthesize picorv32a netlist. 

<img width="1589" height="889" alt="Image" src="https://github.com/user-attachments/assets/0770f7a9-92c5-4bca-994d-b480e60e51ba" />
<br>

Flop ratio = no.of flipflops/Total no of cells = 1613/15762 = 10.2%. 

<img width="1585" height="881" alt="Image" src="https://github.com/user-attachments/assets/6a9ca41d-4761-4b58-a9ae-30af855a9b03" />

<img width="1587" height="881" alt="Image" src="https://github.com/user-attachments/assets/e6046bbe-1c9a-4fb4-b78c-c5514174da4e" />
<br>

Synthesis report shows the area occupied by the logic
 
<img width="1594" height="854" alt="Image" src="https://github.com/user-attachments/assets/73bd79d2-3f4e-4d63-843d-59aff27cab39" />
<br>
Timing report generated after the synthesis step. Both TNS and WNS are zero. Worst slack is 0.52ns. Library used ``nom`` typical library.

</details>

<details>
<summary><b>PHASE 2 — Floorplan Fundamentals</b></summary>
<br>

<img width="1041" height="470" alt="Image" src="https://github.com/user-attachments/assets/4541c22d-58b9-4a94-aab1-1fb70d1bac02" />
<br>

Aspect ration and the utilization factor in the config.tcl file.

<img width="1033" height="532" alt="Image" src="https://github.com/user-attachments/assets/c2b23f29-930f-42d7-9d14-eae546871440" />
<br>

Die area from the def file generated after the floorplan step

<img width="1047" height="548" alt="Image" src="https://github.com/user-attachments/assets/ff0ee2d2-213c-4efa-9fda-7b46157034d8" />
<br>

Changing the  utilization factor to 30% and then running the floor plan again. 

<img width="1004" height="360" alt="Image" src="https://github.com/user-attachments/assets/52faf8f2-21ac-403e-8fe4-632135d24758" />
<br>

Die area is changed as it can be observed from the new def file.

<img width="1007" height="513" alt="Image" src="https://github.com/user-attachments/assets/164985ef-9d7f-4bfe-94a6-5f5e48e38e76" />
<br>


<img width="732" height="742" alt="Image" src="https://github.com/user-attachments/assets/6d645a1f-b393-4655-a012-f452dd72daa5" />
<br>

<img width="1322" height="796" alt="Image" src="https://github.com/user-attachments/assets/b19725be-bd63-45b2-87c4-cb8d50c8d276" />
<br>

RAM is a macro different from a standard cell. These Macro's are placed along with preplaced cells before floorplan and placement. During the placement stage standard cells are placed. These Macro are blackboxed, it means these macro's are already implemented so only the input and output pins.

</details>

<details>
<summary><b>PHASE 3 — Timing Literacy with Ideal Clocks</b></summary>
<br>

The ``pre_sta.conf`` file used to run timing analysis using OpenSTA

<img width="956" height="304" alt="Image" src="https://github.com/user-attachments/assets/6012fdc5-9234-4e23-abcf-d7931dde9bfc" />
<br>

<img width="947" height="718" alt="Image" src="https://github.com/user-attachments/assets/017171cb-81f8-4f1e-ac68-5ed5fe50f101" />
<br>

<img width="942" height="597" alt="Image" src="https://github.com/user-attachments/assets/23bd98d7-a7c7-4f65-927f-144a19349a9d" />
<br>

<img width="949" height="597" alt="Image" src="https://github.com/user-attachments/assets/17b6a6db-e4c7-415e-ada4-a87f27815296" />
<br>

<img width="946" height="615" alt="Image" src="https://github.com/user-attachments/assets/c8c832b7-e3c7-4f33-9813-c238f351c6c9" />
<br>

<img width="1117" height="622" alt="Image" src="https://github.com/user-attachments/assets/c99a0365-05c3-4474-8ae7-cf0b7bba6933" />
<br>

After replacing a cell with large fanout of 10

<img width="927" height="621" alt="Image" src="https://github.com/user-attachments/assets/d57853d6-ee6e-4b89-a2c2-ff43d487f7bd" />
<br>

The new modified slack value from the report checks command

<img width="949" height="618" alt="Image" src="https://github.com/user-attachments/assets/c4137193-63d6-4d90-80b8-bcbb44fcaf9a" />
<br>

After changing synthesis strategy from "AREA O" to "DELAY 3" and then running the timing analysis changes the slack value to -2.79ns.

<img width="948" height="578" alt="Image" src="https://github.com/user-attachments/assets/034bbefb-a1b5-42d6-87e3-a38c271db6d7" />
<br>

<img width="941" height="658" alt="Image" src="https://github.com/user-attachments/assets/6d5c9ed3-fd2b-4d6b-879f-a773b344cbf0" />
<br>

</details>

<details>
<summary><b>PHASE 4 — CTS and Timing with Real Clocks</b></summary>
<br>

<img width="941" height="694" alt="Image" src="https://github.com/user-attachments/assets/0ebae7f1-fefd-4acd-aca1-a5636eee5d7c" />
<br>

<img width="952" height="633" alt="Image" src="https://github.com/user-attachments/assets/6ab7f131-0e18-4985-91d7-7f47369e3181" />
<br>

<img width="935" height="641" alt="Image" src="https://github.com/user-attachments/assets/2b6a555f-0865-4d67-b9da-53704708a984" />
<br>

<img width="949" height="644" alt="Image" src="https://github.com/user-attachments/assets/f231626d-e908-40b6-ab0a-6bff4354dd15" />

<img width="942" height="619" alt="Image" src="https://github.com/user-attachments/assets/9f67608d-a86c-4798-9c1b-7d6c75382f24" />
<br>

<img width="941" height="626" alt="Image" src="https://github.com/user-attachments/assets/6144e06d-5cef-43b2-85c4-7f38b98ccc2e" />
<br>

<img width="937" height="640" alt="Image" src="https://github.com/user-attachments/assets/6c2e2f2b-f77b-47b8-86a0-278485c5174f" />
<br>

<img width="941" height="638" alt="Image" src="https://github.com/user-attachments/assets/f5387b10-1b9f-4280-845f-5418732a1bba" />
<br>

<img width="935" height="417" alt="Image" src="https://github.com/user-attachments/assets/dc53846e-b91a-4d9c-890c-39d2f5a0e229" />


</details>

<details>
<summary><b>PHASE 5 — PDN Awareness</b></summary>
<br>

<img width="962" height="679" alt="Image" src="https://github.com/user-attachments/assets/385f14e5-a0be-4e05-b4fd-855ca9766e1b" />
<br>

<img width="1355" height="826" alt="Image" src="https://github.com/user-attachments/assets/49d62861-6304-4777-b5cd-704cab887eab" />
<br>

<img width="1352" height="825" alt="Image" src="https://github.com/user-attachments/assets/c7002cf1-5c10-47f1-a996-1864ab651e77" />
<br>

In the RTL-to-GDSII flow, the PDN is build immediately after floorplanning (and sometimes macro placement), long before you route a single data signal.
Power and ground (VDD and VSS) need to travel across the entire chip with the least possible resistance. Therefore, they claim the top, thickest metal layers.

</details>


## WEEK-2 (Toolchain Mastery and ORFS Execution [Cloud to Local])

<details>
<summary><b>PHASE 1 — ORFS Execution in GitHub Codespaces</b></summary>
<br>
 
Cloned this repo `` https://github.com/vsdip/vsd-scl180-orfs ``and then launched github codespaces.

After a successful dev container build, checking whether all the required tools are present.



<br>

</details>

<details>
<summary><b>PHASE 2 — Toolchain Understanding (Devcontainer Deep Dive)</b></summary>
<br>

# Tools used in the flow

| S.No | Tool Name | Installed From | Purpose in the flow | Stage used | 
|------|-----------|----------------|---------------------|------------|
| 1 | OpenROAD | Compiled from source | Bind all the tools for PnR flow | All the stages after Synthesis |
| 2 | Yosys |Compiled from source  | Synthesizing the netlist | Synthesis |
| 3 | TritonCTS | Integrated within OpenROAD | Generation of Clock Tree | During CTS | 
| 4 | FastRoute | Integrated within OpenROAD | Global Routing | Routing | 
| 5 | OpenSTA | Integrated within OpenROAD | Static Timing Analysis | Timing check at all stages | 
| 6 | KLayout | Compiled from source |Layout Viewer | Final sign-off & GDS generation | 
| 7 | Python | Package Manager | Calculating Run times | Reporting & log creation | 
| 8 | Make | Package Manager | Running flow scripts | All the stages | 
| 9 | Git | Package Manager | Version Cotrol | Environment setup | 
 
----

### **What ORFS automates**

ORFS automates the passing of data between completely separate point tools (Yosys -> OpenROAD -> KLayout). It automates the complete RTL2GDSII flow using Makefiles. Using one command "make all", it generates all the reports and final GDS with the required results.

----

### **How makefiles orchestrate the flow**

It creates switches for every step of the flow. Like make synth, make floorplan, make place, make gui_place. For every operation underneath the make switch
it runs a script to send the result to the appropriate location and take the appropriate inputs from the correct locations.

The true power of a Makefile is Dependency Tracking. If you edit your Verilog file, the Makefile knows it has to rerun Yosys. It orchestrates the flow by tracking the timestamps of input and output files to ensure steps are only run when necessary.

-----

### **Where synthesis ends and physical design begins**

synthesis means converting RTL into gate level netlist. Yosys creates the netlist. SDC constranints + netlist(from synthesis) is merged into one file .odb file. 
this odb file is the input for place and route step.

Physical design begins when OpenROAD spins up and imports three separate things: The Yosys Verilog netlist, The technology files (LEF/LIB) and The SDC constraints (Separate file) Once OpenROAD reads all three of those pieces into its memory to initialize the floorplan,then it saves that combined state as the very first 1_synth.odb database.

-----

### **Where timing is checked**

At every stage actually. After synthesis, after placement we call it prelayout sta with ideal clocks. after cts pre-layout sta with actual clocks.after routing 
post layout sta

------

### **Where GDS is produced**

OpenROAD finishes by producing a .def or .odb file, which is just an abstract text description of where the wires are. GDS is produced during the make finish stage. A completely different tool (KLayout or Magic) takes the abstract OpenROAD routing data and physically merges it with the exact, proprietary polygon shapes provided by the foundry (SkyWater) to draw the final photographic mask (.gds).

------

</details>

<details>
<summary><b>PHASE 3 — Local Installation (Self-Owned Environment)</b></summary>
<br>

The image below shows the tools that are locally installed to run the flow

![OpenROAD Binary Output](Week-2/Phase-3/openroad_binary.PNG)

The OpenROAD toolchain supports two installation approaches: a pre-built binary installation (used in the Cloud Codespaces environment) and a manual compilation from source (used for the local Ubuntu VM).

![OpenROAD Success Both](Week-2/Phase-3/openroad_success_both.PNG)

The dependencies required to compile openroad from the source.

![OpenROAD Dependencies](Week-2/Phase-3/openroad_dependencies.PNG)

Successful compilation of the OpenROAD toolchain from source. The terminal indicates a 100% build completion and verifies the executable by querying the installed version (26Q2-1229-g08035c8730).

![Finally Success](Week-2/Phase-3/finally.PNG)

</details>

<details>
<summary><b>PHASE 4 — Re-Run RTL-to-GDS Locally</b></summary>
<br>

| Metric        | Cloud | Local |
|----------------|------|-------|
| Runtime        |  2189s     |   6855s     |
| WNS            |  -0.57     |  -0.76      |
| TNS            |  -10.31    |  -16.28     |
| GDS Generated  |    Yes     |    Yes      |

</details>

<details>
<summary><b>PHASE 5 — Debugging and Unix Literacy</b></summary>
<br>

### Essential Unix Commands for Physical Design

During the RTL-to-GDSII flow, navigating thousands of lines of logs and deeply nested directories requires basic Unix literacy. Here are three incredibly powerful commands used to extract physical design metrics efficiently:

#### 1. The `cat` Command
**Description:** Short for "concatenate," `cat` is used to instantly read the contents of a file and print it directly to the terminal. In physical design, it is perfect for quickly reading short summary files, like the final timing reports, without having to open a heavy text editor.

![CAT Command - WNS and TNS](Week-2/Phase-5/cat_WNS_TNS.PNG)

#### 2. The `find` Command
**Description:** The `find` command is a search engine for your terminal. When an automated flow generates hundreds of intermediate database files, `find` allows you to instantly locate a specific file (like a `.def` or `.gds`) by searching through the current directory and all sub-directories.

![FIND Command](Week-2/Phase-5/find.PNG)

#### 3. The `grep` Command
**Description:** Short for "Global Regular Expression Print," `grep` is arguably the most used Unix command in VLSI. It allows you to search for a specific word or phrase inside a massive file and prints only the lines containing that phrase. Here, it is used to instantly extract the exact "Design area" metric from a massive synthesis log file without scrolling manually.

![GREP Command - Design Area](Week-2/Phase-5/grep_design_area.PNG)

</details>
