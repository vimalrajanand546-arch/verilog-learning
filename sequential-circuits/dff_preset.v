`timescale 1ns/1ps
module dff_preset(
      input d,
    input clk,rst,preset,
    output reg q,
    output qbar
);
always @(posedge clk or posedge rst or posedge preset) begin
      if(rst) begin
         q<=1'b0; end
      else if(preset) begin
        q<=1'b1; end
      else begin
        q<=d;
      end
    end
assign qbar = ~q;
endmodule
