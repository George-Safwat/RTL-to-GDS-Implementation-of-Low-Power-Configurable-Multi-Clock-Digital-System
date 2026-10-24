# 🚀 Complete ASIC SoC Design Flow

An end-to-end ASIC implementation of a multi-domain System-on-Chip (SoC) integrating 12 IP blocks across two asynchronous clock domains. The project spans the entire digital front-to-back design lifecycle: **RTL Design → Lint/CDC → Logic Synthesis → DFT Insertion → Equivalence Checking → Physical Design → STA & Gate-Level Simulation (GLS)**.

---

## 📌 Top-Level Layout (Post-PnR)

<div align="center">
  <img src="pic/1792730083209.jpg" alt="SoC Physical Design Layout" width="800"/>
  <br>
  <em>Figure 1: Final routed layout generated using Cadence Encounter.</em>
</div>

---

## 🛠 Flow & Tools Overview

| Stage | Tool / Methodology | Core Deliverables & Key Results |
| :--- | :--- | :--- |
| **RTL Design** | Verilog HDL | 12 integrated IP blocks across 2 asynchronous clock domains |
| **Lint & CDC** | Synopsys SpyGlass | Zero lint/fatal errors; 0 unsynchronized CDC violations |
| **Synthesis** | Synopsys Design Compiler | Clean area/power/timing setup; zero constraint violations |
| **DFT Insertion** | Synopsys Design Compiler / TetraMAX | 4 scan chains inserted; **99.70%** stuck-at fault coverage |
| **Equivalence** | Synopsys Formality | Passed formal checks (RTL vs. Synth, DFT, and Post-PnR) |
| **Physical Design** | Cadence Encounter | Clean PnR routing; positive setup/hold slack; 0 DRC errors |
| **STA & GLS** | Cadence / Synopsys PrimeTime | SDF back-annotated simulation; 10/10 test scenarios passed |

---

## 🏗 System Architecture

The SoC integrates the following sub-modules to perform control, processing, and off-chip communication:

- **Processing Unit:** 16-bit ALU & Register File
- **Communication Interfaces:** UART TX / RX
- **Clock Management:** Clock Dividers, Integrated Clock Gating (ICG) cells
- **Cross-Domain Synchronization:** Asynchronous FIFO, multi-stage synchronizers
- **Control & Utility Logic:** Top-level controller and auxiliary glue logic

---

## 🔬 Flow Breakdown & Verification Details

### 1. RTL Design & Integration
- Module-level development in Verilog HDL.
- Partitioned into two asynchronous clock domains (system clock and communication/UART clock).

### 2. Linting & Clock Domain Crossing (SpyGlass)
- Strict lint rules enforced to ensure synthesizable and safe Verilog constructs.
- Qualified all CDC paths using multi-stage flop synchronizers and Gray-code pointers for the Async FIFO.

### 3. Logic Synthesis & Constraints (Design Compiler)
- Defined strict primary inputs/outputs timing constraints, clock uncertainty, and transition targets.
- Resolved all high-effort path timing issues to achieve zero negative slack (TNS/WNS).

### 4. Design for Testability (DFT)
- Configured 4 parallel scan chains to maximize test throughput while maintaining pin budget.
- Target Fault Coverage achieved: **99.70%** stuck-at fault coverage.

### 5. Equivalence Checking (Formality)
Executed sequential equivalence checking (LEC) across three critical design checkpoints:
1. `RTL` vs. `Unmapped Synthesis Netlist`
2. `Unmapped Synthesis` vs. `DFT Scan-Inserted Netlist`
3. `DFT Netlist` vs. `Post-PnR Physical Netlist`

### 6. Physical Design (Cadence Encounter)
- Floorplanning, power grid distribution (VDD/VSS rings and stripes), placement, CTS (Clock Tree Synthesis), and routing.
- Achieved full DRC/LVS clean status with verified timing closure post-routing.

### 7. Gate-Level Simulation & STA
- Exported post-layout `.sdf` and `.v` netlist for gate-level simulation with full back-annotation.
- Executed 10 comprehensive test scenarios checking functional accuracy.
- Successfully processed **928 UART response bytes** with zero errors across all timing corners.

---

## 📂 Repository Structure

```text
├── rtl/                   # Verilog source files for all 12 IP blocks
├── tb/                    # Testbenches & test vectors
├── scripts/
│   ├── spyglass/          # Lint & CDC scripts
│   ├── dc/                # Synthesis & DFT constraints/scripts
│   ├── formality/         # Equivalence checking scripts
│   └── encounter/         # PnR & Floorplan scripts
├── sim/                   # Gate-Level Simulation & SDF files
├── docs/
│   └── assets/
│       └── soc_layout.png # Layout image
└── README.md              # Project documentation
