# Multiplexer (MUX)

A multiplexer selects one input from multiple inputs and sends it to a single output based on the select lines.

## 2-to-1 MUX
### Module
- The module has two inputs, one select line and one output.
- The select line decides which input is connected to the output.

### Testbench
- Input values are assigned manually in the testbench.
- Different combinations of inputs and the select line are applied.
- A delay of 10 ns is given between each input combination to observe the output changes.

## 4-to-1 MUX
### Module
- The module has four inputs, two select lines and one output.
- The select lines decide which input is connected to the output.
- An if-else block is used to select the appropriate input.

### Testbench
- A for loop is used to apply different input combinations.
- The input and select signals are assigned using concatenation.
- A delay of 10 ns is given for each combination.
- The waveform is generated using `$dumpfile` and `$dumpvars` and can be viewed in GTKWave.

## Tools Used
- Verilog HDL
- Icarus Verilog
- GTKWave
- VS Code