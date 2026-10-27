`timescale 1ns/1ps
module dec_2to4(
    input wire  a,b,c,
    output wire w,x,y,z
);

assign w=c&(~ a)&(~ b);
assign x=c&(~ a)&b;
assign y=c&a&(~ b);
assign z=c&a&b;

endmodule

