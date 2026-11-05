`timescale 1ns/1ps
module tff_tb;
  reg t;
  reg clk,rst,preset;
  wire q,qbar;

  tff DUT (
    .t(t),
    .qbar(qbar),
    .preset(preset),
    .clk(clk),
    .rst(rst),
    .q(q)
  );
  //generating clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  //input for t
  initial begin
    $dumpfile("tff.vcd");
    $dumpvars(0,tff_tb); // 0 represents the hierachy or depth-
    // -to be observed for the respective tb.
        rst = 1;
        preset=0;
        t=0;
        #10 rst = 0;

    // Preset test
    #10 preset = 1;
    #10 preset = 0;

    
        t=0; #10;
        t=1; #10;
    $finish;
  end
     initial begin
    $monitor("Time=%0t t=%b CLK=%b RST=%b PRESET=%b Q=%b QBAR=%b",
              $time,t,clk,rst,preset,q,qbar);
end
endmodule