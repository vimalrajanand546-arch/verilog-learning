`timescale 1ns/1ps
module reg4bit_en(
    input [3:0]x,
    input en,
    input clk,rst,preset,
    output reg [3:0]y
);
always @(negedge clk or negedge preset or negedge rst) begin
    if(!rst) begin
        y<=4'b0000;
    end
    else if(!preset) begin
        y<=4'b1111;
    end
    else begin
      if(en) begin
        y<=x; end
    end
end
endmodule
