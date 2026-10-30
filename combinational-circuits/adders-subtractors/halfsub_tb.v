`timescale 1ns/1ps
module halfsub_tb;
   wire difference,borrow;
   reg a,b;
 
 halfsub DUT(
    .a(a),
    .b(b),
    .difference(difference),
    .borrow(borrow)
 );
 initial begin
    $dumpfile("halfsub.vcd");
    $dumpvars(0,halfsub_tb);
    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;
    $finish;
 end
endmodule