`timescale 1ns/1ps
module fullsub(
    input wire a,b,c,
    output wire diff,borrow

);
assign diff = (a ^ b) ^ c;
assign borrow = (~a & b) | (~a & c) | (b & c);
endmodule