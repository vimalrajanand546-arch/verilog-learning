`timescale 1ns/1ps
module fulladder(
    input wire a,b,c,
    output wire sum,carry
);
assign sum = (a ^ b) ^ c;
assign carry = (a & b) | ( (a ^ b) & c);
endmodule