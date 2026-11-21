`timescale 1ns/1ps
module pipo_tb;
   reg [3:0]a;
   reg clk,rst;
   wire [3:0]b;
   integer i;

 pipo DUT (
      .a(a),
      .b(b),
      .clk(clk),
      .rst(rst)
      
);

initial begin
   
   clk =0;
   forever 
    #5 
    clk = ~clk;
end

initial begin
      a=0;
      $dumpfile("pipo.vcd");
      $dumpvars(0,pipo_tb);

      rst = 0;
      #10;
      rst = 1;

      for(i = 0; i < 16; i = i + 1) begin
                a=i;
                #10; 
      end
      $finish;
end
endmodule

      
  
