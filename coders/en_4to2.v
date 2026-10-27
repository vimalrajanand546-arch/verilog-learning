`timescale 1ns/1ps
module en_4to2(
    input wire a,b,c,d,
    input wire [1:0]e,
    output reg x,y,valid
);
always @(*) begin
    x=0; 
    y=0;
    valid=0;
    if(e == 2'b01) begin
       if(a == 1'b1)begin
          x=1; 
          y=1;
          valid=1;
       end
       else if(b == 1'b1)begin
           x=1;
           y=0;
           valid=1;
       end
       else if(c == 1'b1)begin
        x=0;
        y=1;
        valid=1;
       end
       else begin
         x=0;
         y=0;
         valid=1;
       end
    end

end
        
        endmodule