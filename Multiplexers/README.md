# Demultiplexer (DEMUX)

A demultiplexer takes a single input and sends it to one of multiple outputs based on the select lines.

## 1-to-2 DEMUX
### Module
- The module has one input, one select line and two outputs.
- The select line decides which output receives the input.

### Testbench
- Input and select values are assigned manually in the testbench.
- Different combinations are applied to observe the output changes.
- A delay of 10 ns is given between each input combination.

## 1-to-4 DEMUX
### Module
- The module has one input, two select lines and four outputs.
- An if-else block is used to direct the input to the selected output.
- The unselected outputs remain 0.

### Testbench
- A for loop is used to apply all eight combinations of the input and select signals.
- Concatenation is used to assign values to the select lines and input together.
- A delay of 10 ns is given for each combination.
- The waveform is generated using `$dumpfile` and `$dumpvars` and can be viewed in GTKWave.

## Tools Used
- Verilog HDL
- Icarus Verilog
- GTKWave
- VS Code