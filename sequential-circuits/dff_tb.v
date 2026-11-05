`timescale 1ns/1ps
module dff_tb;
  reg d;
  reg clk,rst;
  wire q,qbar;

  dff DUT (
    .d(d),
    .qbar(qbar),
    .clk(clk),
    .rst(rst),
    .q(q)
  );
  //generating clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  //input for d
  initial begin
    $dumpfile("dff.vcd");
    $dumpvars(0,dff_tb); // 0 represents the hierachy or depth-
    // -to be observed for the respective tb.
        rst = 1;
        d=0;
        #10 rst = 0;
    
        d=0; #10;
        d=1; #10;
    $finish;
  end
endmodule