`timescale 1ns/1ps
module dff(
      input d,
    input clk,rst,
    output reg q,
    output qbar
);
always @(posedge clk or posedge rst) begin
      if(rst) begin
         q<=1'b0; end
      else begin
        q<=d;
      end
    end
assign qbar = ~q;
endmodule
