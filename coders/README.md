# Encoders and Decoders Using Verilog HDL

## Introduction

In this project, I explored two important combinational logic circuits: **Encoders and Decoders** using Verilog HDL.

I implemented these circuits to understand how digital systems convert information from one representation into another.

Encoders and decoders are widely used in digital electronics, communication systems, processors, memory systems, and control circuits.

## 1. Decoder Design

A decoder is a combinational circuit that converts an n-bit binary input into one of \(2^n\) output lines.

For this project, I worked with a **3-to-8 decoder**.

### Specifications

- Number of input bits: 3
- Number of output bits: 8
- Circuit type: Combinational logic
- Output: Active-high
- Verilog modeling: Behavioral modeling using `case`

### Working Principle

A 3-to-8 decoder has three input bits, giving eight possible input combinations.

For every input combination, exactly one output becomes HIGH, while all the remaining outputs stay LOW.

### Truth Table

| A | B | C | Y[7:0] |
|---|---|---|---|
| 000 | | | 00000001 |
| 001 | | | 00000010 |
| 010 | | | 00000100 |
| 011 | | | 00001000 |
| 100 | | | 00010000 |
| 101 | | | 00100000 |
| 110 | | | 01000000 |
| 111 | | | 10000000 |

### Design Approach

I used behavioral modeling with an `always @(*)` block and a `case` statement.

The `case` statement checks the input combination and assigns the corresponding output.

I also understood that a decoder can be implemented using Boolean expressions and smaller decoder ICs.

## 2. Encoder Design

An encoder performs the reverse operation of a decoder.

It converts an input with one active line into a smaller binary output.

For this project, I worked with a **4-to-2 priority encoder with enable and valid output**.

### Specifications

- Number of input lines: 4
- Number of encoded output bits: 2
- Enable input: Included
- Valid output: Included
- Priority: A > B > C > D
- Circuit type: Combinational logic

### Working Principle

A normal 4-to-2 encoder converts one active input into a two-bit binary code.

However, when multiple inputs become HIGH simultaneously, a normal encoder cannot uniquely identify which input should be encoded.

To solve this, I used a priority encoder.

The priority encoder gives preference to the highest-priority input.

In my design, the priority order is:

A > B > C > D

This means that if A and C are HIGH at the same time, A gets priority.

### Priority Table

| A | B | C | D | Output |
|---|---|---|---|---|
| 1 | X | X | X | 11 |
| 0 | 1 | X | X | 10 |
| 0 | 0 | 1 | X | 01 |
| 0 | 0 | 0 | 1 | 00 |
| 0 | 0 | 0 | 0 | 00 |

Here, X represents a don't-care input because a higher-priority input has already been detected.

The valid output indicates whether at least one input has been activated.

The enable input controls whether the encoder is allowed to operate.

## 3. Testbench and Verification

I created testbenches to verify the functionality of the encoder and decoder.

### Decoder Testing

For the 3-to-8 decoder, I used a loop to apply all eight possible input combinations.

I observed the corresponding outputs using GTKWave.

I verified that only the expected output bit becomes HIGH for each input combination.

### Encoder Testing

For the priority encoder, I tested different input combinations, including:

- No active input.
- Only one active input.
- Multiple active inputs.
- Different priority combinations.
- Enable and disable conditions.

I also explored exhaustive testing by applying all 64 combinations of the four input bits and two enable bits.

This helped me verify the priority behavior and valid output.

## 4. Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- VS Code / Text Editor

## 5. What I Learned

Through this project, I understood:

- The difference between encoders and decoders.
- How binary inputs are converted into output lines.
- How priority encoders resolve multiple active inputs.
- The purpose of enable and valid signals.
- How to implement combinational circuits using behavioral modeling.
- How to write testbenches and verify all possible input combinations.
- How to observe digital waveforms using GTKWave.

## 6. Future Improvements

I would like to explore:

- 8-to-3 priority encoder.
- Decoder implementation using smaller decoder ICs.
- Structural modeling of encoders and decoders.
- Practical implementation using digital logic ICs.

## Conclusion

This project helped me understand the working principles of encoders and decoders and how they are implemented using Verilog HDL.

It also improved my understanding of combinational logic, priority handling, enable signals, and testbench verification.

I consider this an important step in building my digital electronics and Verilog HDL foundation.