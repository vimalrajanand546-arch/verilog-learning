`timescale 1ns/1ps
module jk_preset_tb;
  reg j,k;
  reg clk,rst,preset;
  wire q,qbar;

  jk_preset DUT (
    .j(j), 
    .k(k),
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
  //input for j and k
  initial begin
    $dumpfile("jk_preset.vcd");
    $dumpvars(0,jk_preset_tb); // 0 represents the hierachy or depth-
    // -to be observed for the respective tb.
        preset=0;
        rst = 1;
        j = 0;
        k = 0;
        #10 rst = 0;
            // Preset test
    #10 preset = 1;
    #10 preset = 0;

    
    j=0;k=0;#10;
    j=0;k=1;#10;
    j=1;k=0;#10;
    j=1;k=1;#10;

    $finish;

  end
      initial begin
    $monitor("Time=%0t J=%b K=%b CLK=%b RST=%b PRESET=%b Q=%b QBAR=%b",
              $time,j,k,clk,rst,preset,q,qbar);
end
endmodule