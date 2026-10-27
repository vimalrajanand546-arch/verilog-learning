`timescale 1ns/1ps
module dec_3to8_tb;
  reg [2:0]a;
  wire [7:0]y;
  integer i;

  dec_3to8 DUT(
    .a(a),
    .y(y)
);

initial begin
    $dumpfile("dec_3to8.vcd");
    $dumpvars(0,dec_3to8_tb);

    for(i = 0; i<8; i=i+1)begin
       {a} = i;
       #10;
    end
    $finish;
end
endmodule