`timescale 1ns/1ps
module dec_2to4_tb;
  reg a,b,c;
  wire w,y,x,z;

  dec_2to4 DUT (
        .a(a),
        .b(b),
        .c(c),
        .w(w),
        .x(x),
        .y(y),
        .z(z)
  );
  initial begin 
    $dumpfile("dec_2to4.vcd");  
    $dumpvars(0, dec_2to4_tb);

        a = 0; b= 0 ; c=0; #10;
        a = 0; b = 1 ; c=0; #10;
        a = 1; b= 0 ; c=0; #10;
        a = 1; b = 1 ; c=0; #10;
        
        a = 0; b= 0 ; c=1; #10;
        a = 0; b = 1 ; c=1; #10;
        a = 1; b= 0 ; c=1; #10;
        a = 1; b = 1 ; c=1; #10;

        $finish;
  end
endmodule