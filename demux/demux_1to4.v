`timescale 1ns/1ps
module demux_1to4(
    input wire a,
    input wire [1:0]s,
    output reg w,x,y,z
    
);
always @(*) begin

    w = 0;
    x = 0;
    y = 0;
    z = 0;

    if(s == 2'b00)
          w=a;
    else if(s == 2'b01)
          x=a;
    else if(s == 2'b10)
          y=a;
    else
        z=a;
    
end



endmodule