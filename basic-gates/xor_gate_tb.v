`timescale 1ns / 1ps
module xor_gate_tb;
reg a;
reg b;
wire c;
xor_gate dut(
        .a(a),
        .b(b),
        .c(c)
); 
  initial begin
    $dumpfile("basic-gates/xor_gate.vcd");
    $dumpvars(0,xor_gate_tb);

    a=0;
    b=0;
    #10;

    a=0;
    b=1;
    #10;

    a=1;
    b=0;
    #10;

    a=1;
    b=1;
    #10;

    $finish;
  end
endmodule