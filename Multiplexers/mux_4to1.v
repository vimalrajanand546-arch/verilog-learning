`timescale 1ns/1ps
module mux_4to1(
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    input wire [1:0]s,
    output reg y
);

always @(*) begin

    if(s == 2'b00)
        y=a;
    else if(s == 2'b01)
        y=b;
    else if(s == 2'b10)
        y=c;
    else
        y=d;
end

endmodule