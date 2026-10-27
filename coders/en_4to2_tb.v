`timescale 1ns/1ps
module en_4to2_tb;
       reg a,b,c,d;
       reg [1:0]e;
       wire x,y,valid;
       integer i;
    
    en_4to2 DUT(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .x(x),
        .y(y),
        .valid(valid)
    );

initial begin 
     $dumpfile("en_4to2.vcd");
    $dumpvars(0, en_4to2_tb);
    e = 2'b01;
    {a, b, c, d} = 4'b1000;  #10;
    {a, b, c, d} = 4'b0100;  #10;
    {a, b, c, d} = 4'b0010;  #10;
    {a, b, c, d} = 4'b0001;  #10;

    $finish;
end
endmodule