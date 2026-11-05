`timescale 1ns/1ps
module dff_preset_tb;
  reg d;
  reg clk,rst,preset;
  wire q,qbar;

  dff_preset DUT (
    .d(d),
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
  //input for d
  initial begin
    $dumpfile("dff_preset.vcd");
    $dumpvars(0,dff_preset_tb); // 0 represents the hierachy or depth-
    // -to be observed for the respective tb.
        rst = 1;
        preset=0;
        d=0;
        #10 rst = 0;

    // Preset test
    #10 preset = 1;
    #10 preset = 0;

    
        d=0; #10;
        d=1; #10;
    $finish;
  end
     initial begin
    $monitor("Time=%0t d=%b CLK=%b RST=%b PRESET=%b Q=%b QBAR=%b",
              $time,d,clk,rst,preset,q,qbar);
end
endmodule