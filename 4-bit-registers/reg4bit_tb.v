`timescale 1ns/1ps
module reg4bit_tb;
 reg [3:0]x;
 reg preset,rst,clk;
 wire [3:0]y;
 integer i;
 reg4bit DUT(
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
     $dumpfile("reg4bit.vcd");
    $dumpvars(0,reg4bit_tb);
    rst = 0;
    preset = 1;
    x = 0;

    #10;
    rst = 1;

    for(i=0; i<16 ; i = i+1) begin
        x=i;
        #10;
    end
    $finish;
end
endmodule