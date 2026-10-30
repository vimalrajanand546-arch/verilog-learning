`timescale 1ns/1ps
module fulladder_tb;
  wire sum,carry;
  reg a,b,c;
  integer i;

  fulladder DUT(
    .a(a),
    .b(b),
    .c(c),
    .sum(sum),
    .carry(carry)
  );

  initial begin
    $dumpfile("fulladder.vcd");
    $dumpvars(0,fulladder_tb);

    for(i=0;i<8;i=i+1) begin
        {a,b,c} = i;
        #10;
    end
    $finish;
end
endmodule