`timescale 1ns/1ps
module demux_1to2(
    input wire a,
    input wire s,
    output wire x,y
    
);

assign x = a&(~ s);
assign y = a&(s);

endmodule