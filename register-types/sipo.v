`timescale 1ns/1ps
module sipo(
    input clk,
    input serial_in,
    output reg [3:0]q
);
always @(negedge clk) begin
    q<={q[2:0],serial_in};
end
endmodule