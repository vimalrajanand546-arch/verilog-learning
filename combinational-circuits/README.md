# Adders and Subtractors Using Verilog HDL

## Introduction

In this project, I explored arithmetic circuits used in digital electronics: **Adders and Subtractors** using Verilog HDL.

These circuits are fundamental building blocks of an Arithmetic Logic Unit (ALU) and are widely used in processors, calculators, digital systems, and computers.

My main objective was to understand how binary addition and subtraction are performed at the hardware level and how these operations can be described using Verilog HDL.

## 1. Half Adder

A half adder is a combinational circuit that adds two single-bit binary inputs.

It produces two outputs:

- Sum
- Carry

### Specifications

- Inputs: A, B
- Outputs: Sum, Carry
- Circuit type: Combinational logic

### Truth Table

| A | B | Sum | Carry |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

### Boolean Expressions

\[
Sum=A\oplus B
\]

\[
Carry=A\cdot B
\]

I understood that the XOR gate generates the sum, while the AND gate generates the carry.

## 2. Full Adder

A full adder adds three single-bit inputs: A, B, and Carry-in.

It produces two outputs:

- Sum
- Carry-out

### Specifications

- Inputs: A, B, Cin
- Outputs: Sum, Cout
- Circuit type: Combinational logic

### Truth Table

| A | B | Cin | Sum | Cout |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

### Boolean Expressions

\[
Sum=A\oplus B\oplus Cin
\]

\[
Cout=AB+ACin+BCin
\]

I also understood that a full adder can be constructed using two half adders and an OR gate.

## 3. Half Subtractor

A half subtractor performs subtraction between two single-bit binary inputs.

It subtracts B from A and produces:

- Difference
- Borrow

### Specifications

- Inputs: A, B
- Outputs: Difference, Borrow
- Circuit type: Combinational logic

### Truth Table

| A | B | Difference | Borrow |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 0 |

### Boolean Expressions

\[
Difference=A\oplus B
\]

\[
Borrow=\overline{A}B
\]

I understood that a borrow is required when we subtract 1 from 0.

## 4. Full Subtractor

A full subtractor performs subtraction between three single-bit inputs: A, B, and Borrow-in.

It produces:

- Difference
- Borrow-out

### Specifications

- Inputs: A, B, Bin
- Outputs: Difference, Bout
- Circuit type: Combinational logic

### Truth Table

| A | B | Bin | Difference | Bout |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 1 |
| 0 | 1 | 0 | 1 | 1 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 0 |
| 1 | 1 | 0 | 0 | 0 |
| 1 | 1 | 1 | 1 | 1 |

### Boolean Expressions

\[
Difference=A\oplus B\oplus Bin
\]

\[
Bout=\overline{A}B+\overline{A}Bin+B\cdot Bin
\]

I learned that a full subtractor considers the borrow from the previous subtraction stage.

## 5. Design Approach

I implemented the arithmetic circuits using Verilog HDL.

I explored how Boolean expressions can be translated into Verilog assignments and how combinational logic can also be described using behavioral modeling.

I understood the importance of assigning outputs correctly and ensuring that combinational circuits do not unintentionally infer storage elements.

## 6. Testbench and Verification

I used testbenches to verify the functionality of the arithmetic circuits.

For the half adder and half subtractor, I tested all four possible input combinations.

For the full adder and full subtractor, I tested all eight possible input combinations.

I observed the output waveforms using GTKWave and compared the results with their respective truth tables.

This helped me identify errors in logic expressions and verify that the circuits produced the expected outputs.

## 7. Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- VS Code / Text Editor

## 8. What I Learned

Through this project, I understood:

- How binary addition works at the gate level.
- The difference between half adders and full adders.
- How carry propagation works.
- How binary subtraction works.
- The difference between difference and borrow.
- The importance of carry-in and borrow-in.
- How Boolean expressions are implemented using Verilog.
- How to create testbenches and verify combinational circuits.

## 9. Future Improvements

I would like to explore:

- 4-bit binary adder.
- 4-bit binary subtractor.
- Ripple carry adder.
- Adder-subtractor circuit using XOR gates.
- Carry look-ahead adder.
- Signed arithmetic operations.

## Conclusion

This project helped me understand the fundamental arithmetic operations performed inside digital systems.

By implementing adders and subtractors using Verilog HDL, I gained a better understanding of binary arithmetic, Boolean logic, carry propagation, and borrow handling.

These circuits form an important foundation for understanding ALU design and processor architecture.