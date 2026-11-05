`timescale 1ns/1ps
module jk_tb;
  reg j,k;
  reg clk,rst;
  wire q,qbar;

  jk DUT (
    .j(j), 
    .k(k),
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
  //input for j and k
  initial begin
    $dumpfile("jk.vcd");
    $dumpvars(0,jk_tb); // 0 represents the hierachy or depth-
    // -to be observed for the respective tb.
        rst = 1;
        j = 0;
        k = 0;
        #10 rst = 0;
    
    j=0;k=0;#10;
    j=0;k=1;#10;
    j=1;k=0;#10;
    j=1;k=1;#10;

    $finish;
  end
endmodule