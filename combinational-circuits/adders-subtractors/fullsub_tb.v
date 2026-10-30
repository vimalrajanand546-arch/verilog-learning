`timescale 1ns/1ps
module fullsub_tb;
  reg a,b,c;
  wire diff,borrow;
  integer i;
  fullsub DUT(
    .a(a),
    .b(b),
    .c(c),
    .diff(diff),
    .borrow(borrow)
  );
  initial begin
    $dumpfile("fullsub.vcd");
    $dumpvars(0,fullsub_tb);

    for(i=0;i<8;i=i+1) begin
        {a,b,c}=i;
        #10;
    end
    $finish;
end
endmodule