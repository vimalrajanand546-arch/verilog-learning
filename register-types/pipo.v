`timescale 1ns/1ps
module pipo(
       input [3:0]a,
       input clk,rst, set,
       output reg [3:0]b
);
always @(negedge clk ) begin
    
    if(!rst) begin
          b<=4'b0000;
     
    end
    else begin
        b<=a;
     end
end 
endmodule
