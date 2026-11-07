`timescale 1ns/1ps
module reg8bit_tb;
 reg [7:0]x;
 reg preset,rst,clk;
 wire [7:0]y;
 integer i;
 reg8bit DUT(
    .x(x),
    .y(y),
    .preset(preset),
    .rst(rst),
    .clk(clk)
 );
 initial begin
    clk =0;
    forever #5 clk = ~clk;
 end
 initial begin 
     $dumpfile("reg8bit.vcd");
    $dumpvars(0,reg8bit_tb);
    rst = 0;
    preset = 1;
    x = 0;

    #10;
    rst = 1;

    for(i=0; i<256 ; i = i+1) begin
        x=i;
        #10;
    end
    $finish;
end
endmodule