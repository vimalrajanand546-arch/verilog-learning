`timescale 1ns/1ps
module jk (
    input j,k,
    input clk,rst,
    output reg q,
    output qbar
);
always @(posedge clk or posedge rst) begin
    if(rst) begin
         q<=1'b0; end
    else begin
        case({j,k}) 
          2'b00: q<=q; // assigning hold
          2'b01: q<=1'b0; //reset
          2'b10: q<=1'b1;//set
          2'b11: q<= ~q;//toggle
        endcase
    end
    
end
assign qbar=~q;
    

endmodule