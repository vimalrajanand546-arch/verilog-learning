`timescale 1ns / 1ps
module mux_2to1(
    input wire a,
    input wire b,
    input wire s,
    output wire y
);
assign y = ((~s & a)|(b & s));

endmodule