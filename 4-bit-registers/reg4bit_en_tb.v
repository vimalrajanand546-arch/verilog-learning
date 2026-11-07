`timescale 1ns/1ps
module reg4bit_en_tb;
 reg [3:0]x;
 reg en;
 reg preset,rst,clk;
 wire [3:0]y;
 integer i;
 reg4bit_en DUT(
    .x(x),
    .y(y),
    .preset(preset),
    .en(en),
    .rst(rst),
    .clk(clk)
 );
 initial begin
    clk =0;
    forever #5 clk = ~clk;
 end
 initial begin 
     $dumpfile("reg4bit_en.vcd");
    $dumpvars(0,reg4bit_en_tb);
    rst = 0;
    en=0;
    preset = 1;
    x = 0;

    #12;
    rst = 1;
    preset = 0;
    en=0;
    
    #12; // #12 is used to avoid race conditions.
// Control signals (preset, rst, en) are changed
// away from the falling edge of the clock.
// This prevents simultaneous events in the testbench and DUT.
//IF #15 OR #25, THE CONTROL SIGNALS COINCIDE WITH THE FALLING EDGE OF THE CLOCK.
//#10 IS ALSO VALID, BUT HERE #12 IS USED IN ORDER TO DIFFERENTIATE WITH
//ACTIVE EDGE AND IT IS ALSO CLOSER TO #10.
    rst = 1;
    preset = 1;
    en=1;
    

    for(i=0; i<16 ; i = i+1) begin
        x=i;
        #10;
    end
      en = 0;
    x = 4'b0000;
    #20;

    $finish;
end
endmodule