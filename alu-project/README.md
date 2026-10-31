# 4-Bit ALU Design Using Verilog HDL

## 1. Introduction

This project is my implementation of a 4-bit Arithmetic Logic Unit (ALU) using Verilog HDL.

An ALU is one of the fundamental components of a CPU. It performs arithmetic and logical operations on binary data based on the control signals provided to it.

I started this project after learning individual digital circuits and their Verilog implementations, such as adders, subtractors, multiplexers, decoders and logic gates.

Instead of designing each operation as a separate module, I wanted to combine multiple operations into a single ALU and select the required operation using a control input.

The main objective of this project was to understand how different digital operations can be integrated into one design using behavioral modeling.

## 2. Project Specifications

The ALU is designed with the following specifications:

| Parameter | Specification |
|---|---|
| ALU type | 4-bit ALU |
| Operand A | 4 bits |
| Operand B | 4 bits |
| Selection input | 4 bits |
| Output | 8 bits |
| Number of operations | 11 |
| Modeling technique | Behavioral modeling |
| Operation selection | Case statement |

I used an 8-bit output because multiplication of two 4-bit unsigned numbers can produce an 8-bit result. The same output bus can accommodate the results of the other operations.

## 3. Supported Operations

I implemented 11 different arithmetic and logical operations.

| Selection (`sel`) | Operation | Description |
|---|---|---|
| 0000 | Addition | A + B |
| 0001 | Subtraction | A - B |
| 0010 | Multiplication | A * B |
| 0011 | Division | A / B |
| 0100 | AND | A & B |
| 0101 | OR | A \| B |
| 0110 | NOT | ~A |
| 0111 | XOR | A ^ B |
| 1000 | NAND | ~(A & B) |
| 1001 | XNOR | ~(A ^ B) |
| 1010 | NOR | ~(A \| B) |

The selection input is 4 bits wide because:

2³ = 8 combinations

2⁴ = 16 combinations

Since I needed to select among 11 operations, 4 bits were sufficient.

The remaining five selection combinations (1011 to 1111) are unused and handled using the default condition.

## 4. Design Approach

I used behavioral modeling to describe the functionality of the ALU.

The main idea was to use a single output variable instead of declaring separate output variables for every operation.

The selection input determines which operation is performed.

I used the Verilog `case` statement inside an `always @(*)` block.

The general structure is:

- A and B are the two operands.
- SEL determines the operation.
- The case statement identifies the selected operation.
- The result is assigned to a common output variable Y.
- The default condition assigns zero for unused selection values.

This approach makes the design easier to understand and extend.

## 5. Testbench Development

After completing the ALU module, I created a separate testbench to verify its functionality.

I used Icarus Verilog for simulation and GTKWave to observe the generated waveform.

Initially, I considered testing a few input combinations manually. However, I wanted to verify the ALU for every possible combination of its inputs.

This led me to implement an exhaustive testing method using nested `for` loops.

### Why Nested For Loops?

Each input has 16 possible combinations because it is 4 bits wide.

- A: 0 to 15
- B: 0 to 15
- SEL: 0 to 15

Therefore, the total number of possible input combinations is:

16 × 16 × 16 = 4096

I used three nested loops to generate all these combinations automatically.

The outer loop changes A, the middle loop changes B, and the innermost loop changes SEL.

This ensures that every possible combination of operands and selection inputs is covered.

### Exhaustive Testing

The testbench checks:

- All 256 possible combinations of A and B.
- All 16 possible selection values.
- All 11 implemented operations.
- All five unused selection values.
- The default condition for invalid operation selections.

The total number of combinations is 4096.

### Handling Division by Zero

During exhaustive testing, I encountered an important special case: division by zero.

Division by zero is undefined, so I excluded those combinations from the normal output comparison.

For a 4-bit B input, there are 16 possible values of A when B is zero.

Therefore:

16 × 1 × 1 = 16 division-by-zero combinations for the division selection.

The remaining combinations are checked normally.

**Note:** The ALU should also define an intentional behavior for division by zero if this project is extended further.

## 6. Automatic Output Verification

Instead of manually checking all the outputs in GTKWave, I extended the testbench with an automatic verification approach.

I introduced an additional variable called `expected`.

The purpose of this variable is to store the expected result calculated by the testbench.

The verification process works as follows:

1. The testbench generates the input values A, B and SEL.
2. The ALU performs the selected operation.
3. The testbench independently calculates the expected result.
4. The actual output Y is compared with the expected output.
5. If both match, the test passes.
6. If they differ, an error is recorded.

I also introduced counters to keep track of the total checked combinations, skipped combinations and errors.

This approach helps identify incorrect ALU operations automatically without manually examining every waveform.

## 7. Simulation Tools

I used the following tools during this project:

| Tool | Purpose |
|---|---|
| Verilog HDL | Hardware description |
| Icarus Verilog | Compilation and simulation |
| GTKWave | Waveform observation |

### Simulation Commands

**Compilation:**

```bash
iverilog -o alu_sim alu_4bit.v alu_4bit_tb.v
```

**Simulation:**

```bash
vvp alu_sim
```

**Waveform observation:**

```bash
gtkwave alu_4bit.vcd
```

## 8. What I Learned

Through this project, I gained a better understanding of how multiple digital operations can be integrated into a single hardware module.

Some of the important concepts I practised were:

- Behavioral modeling in Verilog.
- Using `always @(*)` for combinational logic.
- Implementing operation selection using `case`.
- Working with multi-bit input and output vectors.
- Understanding arithmetic and bitwise logical operators.
- Generating test inputs using nested `for` loops.
- Understanding exhaustive testing.
- Creating an expected-output reference in a testbench.
- Comparing actual and expected outputs.
- Using Icarus Verilog and GTKWave for verification.

One of the most interesting parts of this project was developing an exhaustive testbench rather than relying only on manually selected test cases.

## 9. Future Improvements

There are several improvements I would like to explore in future versions:

- Implement signed arithmetic and two's complement subtraction.
- Add separate carry, borrow and overflow flags.
- Introduce zero and negative flags.
- Improve division-by-zero handling.
- Extend the design to an 8-bit or 16-bit ALU.
- Explore structural modeling using individual arithmetic and logic circuits.

## 10. Conclusion

This project helped me understand how individual digital circuits and logic operations can be combined to create a functional ALU.

I particularly enjoyed developing the exhaustive testbench because it allowed me to verify the design across all possible input combinations instead of relying on a few manually selected examples.

This is one of my learning projects in Verilog HDL, and I plan to improve it further as I learn more about digital design and computer architecture.