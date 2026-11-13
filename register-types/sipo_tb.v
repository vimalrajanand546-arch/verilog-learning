`timescale 1ns/1ps

module sipo_tb;

reg clk;
reg serial_in;
wire [3:0]q;
reg [3:0]state;  // starting state under test
reg in_bit;     // serial input under test
reg [3:0]expected;
integer i,j,pass_count,fail_count;


sipo dut (
    .clk(clk),
    .serial_in(serial_in),
    .q(q)
);

// Clock: period = 10 time units
initial clk = 0;
always #5 clk = ~clk;

// Shift in ONE bit: change input on posedge, DUT samples on negedge,
// then wait 1 unit so q has settled before anyone reads it.
task apply_bit;
    input bit_in;
    begin
        @(posedge clk);
          serial_in = bit_in;
        @(negedge clk);
          #1;
    end
endtask

// Load a known 4-bit state (MSB first). After 4 shifts, q == value.
task load_state;
    input [3:0] value;
    begin
        apply_bit(value[3]);
        apply_bit(value[2]);
        apply_bit(value[1]);
        apply_bit(value[0]);
    end
endtask

initial begin
    $dumpfile("sipo.vcd");
    $dumpvars(0, sipo_tb);

    serial_in  = 0;
    pass_count = 0;
    fail_count = 0;

    for (i = 0; i < 16; i = i + 1) begin // 
        for (j = 0; j < 2; j = j + 1) begin
            state  = i;
            in_bit = j;

            // 1. Reload the state for EVERY test (this was the bug)
            load_state(state);

            // Sanity check: the load itself must give q == state
            if (q !== state) begin
                $display("LOAD FAIL: wanted %b, got %b", state, q);
                fail_count = fail_count + 1;
            end

            // 2. Apply the test input
            apply_bit(in_bit);

            // 3. Expected next state: drop MSB, append new bit at LSB
            expected = {state[2:0], in_bit};

            // 4. Compare
            if (q !== expected) begin
                $display("FAIL: State=%b Input=%b Expected=%b Actual=%b",state, in_bit, expected, q);
                fail_count = fail_count + 1;
            end else begin
                $display("PASS: State=%b Input=%b Next=%b",state, in_bit, q);
                pass_count = pass_count + 1;
            end
        end
    end

    $display("--------------------------------");
    $display("Testing completed: %0d passed, %0d failed", pass_count, fail_count);
    if (fail_count == 0)
        $display("ALL TESTS PASSED");
    $finish;
end

endmodule