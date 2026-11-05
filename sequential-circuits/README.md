# Sequential Circuits – Flip-Flops

This repository contains the Verilog HDL implementation of different types of flip-flops. Flip-flops are sequential circuits that store one bit of data (0 or 1). Unlike combinational circuits, their output depends on the previous state as well as the current inputs.

I have implemented JK, D, and T flip-flops using Verilog HDL and simulated their functionality using Icarus Verilog and GTKWave.

## Tools Used

- **HDL:** Verilog
- **Simulator:** Icarus Verilog
- **Waveform Viewer:** GTKWave
- **Version Control:** Git and GitHub

## 1. JK Flip-Flop

A JK flip-flop is an improved version of the SR flip-flop. It has two inputs, J and K, and a clock input.

It has four different operations depending on the values of J and K.

### Truth Table

| J | K | Q(next) | Operation |
|---|---|---|---|
| 0 | 0 | Q(previous) | Hold |
| 0 | 1 | 0 | Reset |
| 1 | 0 | 1 | Set |
| 1 | 1 | Q̅(previous) | Toggle |

### Verilog Implementation

The JK flip-flop is implemented using an `always` block triggered by the positive edge of the clock.

A `case` statement is used to implement the four different operations.

### JK Flip-Flop with Preset

I have also implemented a JK flip-flop with an additional preset input.

- **Reset:** Forces the output Q to 0.
- **Preset:** Forces the output Q to 1.
- Both reset and preset are asynchronous and active HIGH.
- Reset has priority over preset in the implemented design.

The output changes immediately when reset or preset is activated, without waiting for a clock edge.

## 2. D Flip-Flop

A D flip-flop (Data or Delay flip-flop) has a single data input called D.

The input value is transferred to the output at the positive edge of the clock.

### Truth Table

| Clock | D | Q(next) |
|---|---|---|
| ↑ | 0 | 0 |
| ↑ | 1 | 1 |
| No edge | X | Q(previous) |

### Verilog Implementation

The D flip-flop is implemented using an `always` block triggered by the positive edge of the clock.

The output Q follows the input D only at the rising edge of the clock.

### D Flip-Flop with Preset

An additional preset input is implemented in the D flip-flop.

- **Reset:** Forces Q = 0.
- **Preset:** Forces Q = 1.
- Both inputs are asynchronous and active HIGH.
- Reset has priority over preset.

When neither reset nor preset is active, the flip-flop operates normally and captures D at the rising edge of the clock.

## 3. T Flip-Flop

A T flip-flop (Toggle flip-flop) is mainly used in counter circuits.

It has a single input T.

### Truth Table

| T | Q(next) | Operation |
|---|---|---|
| 0 | Q(previous) | Hold |
| 1 | Q̅(previous) | Toggle |

### Verilog Implementation

The T flip-flop is implemented using an `always` block triggered by the positive edge of the clock.

- When T = 0, the output remains unchanged.
- When T = 1, the output toggles its previous state.

The T flip-flop implemented in this project includes an asynchronous active-HIGH reset. No preset input is implemented.

## Folder Structure

All Verilog modules and their respective testbenches are maintained in a single folder.

```text
sequential-circuits/
│
├── jk.v
├── jk_tb.v
├── jk_preset.v
├── jk_preset_tb.v
│
├── dff.v
├── dff_tb.v
├── dff_preset.v
├── dff_preset_tb.v
│
├── tff.v
├── tff_tb.v
│
└── README.md
```

- `.v` files contain the Verilog module implementations.
- `_tb.v` files contain the respective testbenches.

## Simulation

I used Icarus Verilog to compile and simulate the designs and GTKWave to view the output waveforms.

### Step 1: Compile

Example for JK flip-flop:

```bash
iverilog -o jk_sim jk.v jk_tb.v
```

### Step 2: Run Simulation

```bash
vvp jk_sim
```

### Step 3: View Waveform

```bash
gtkwave jk.vcd
```

The same procedure can be followed for the remaining flip-flops using their respective module, testbench, and VCD filenames.

## What I Learned

Through these implementations, I learned:

- The difference between combinational and sequential circuits.
- How flip-flops store one bit of data.
- How positive-edge-triggered clocking works.
- The functionality of JK, D, and T flip-flops.
- The difference between synchronous and asynchronous inputs.
- How asynchronous reset and preset work.
- How to use `always` blocks and `case` statements in sequential Verilog designs.
- How to write testbenches and verify outputs through simulation.
- How to inspect signal transitions using GTKWave.

## Next Steps

After completing the basic flip-flops, I plan to move towards more advanced sequential circuits:

1. 4-bit and 8-bit registers.
2. Shift registers (SISO, SIPO, PISO, PIPO).
3. Ring counter and Johnson counter.
4. Asynchronous counters.
5. Synchronous counters.
6. Finite State Machines (FSM).

This project is part of my journey in learning Verilog HDL and building a strong foundation in digital design and VLSI.