`timescale 1ns/1ps
module tff(
    input t,clk,rst,preset,
    output reg q,
    output qbar

);
always @(posedge clk or posedge rst or posedge preset) begin
    if(rst) begin
        q<=1'b0;
    end
    else if(preset) begin
        q<=1'b1;
    end
    else if(t) begin //Assigning toggling whenever t is 1
        q<= ~q;
    end
    else begin // q remains the same whenever t is 0
        q<=q;
    end
end
assign qbar= ~q;
endmodule


