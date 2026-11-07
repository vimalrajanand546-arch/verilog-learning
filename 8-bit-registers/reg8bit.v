`timescale 1ns/1ps
module reg8bit(
    input [7:0]x,
    input clk,rst,preset,
    output reg [7:0]y
);
always @(negedge clk or negedge preset or negedge rst) begin
    if(!rst) begin
        y<=8'b00000000;
    end
    else if(!preset) begin
        y<=8'b11111111;
    end
    else begin
        y<=x;
    end
end
endmodule
