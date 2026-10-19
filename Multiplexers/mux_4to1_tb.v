`timescale 1ns/1ps
module mux_4to1_tb;
reg a,b,c,d;
reg [1:0]s;
wire y;
integer i;


    mux_4to1 DUT (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .s(s),
        .y(y)
    );

initial begin
    $dumpfile("mux_4to1.vcd");
    $dumpvars(0, mux_4to1_tb);
    
    $monitor("time=%0t a=%b b=%b c=%b d=%b s=%b y=%b", $time, a, b, c, d, s, y);

    for (i = 0; i < 64; i = i + 1) begin
        {s, a, b, c, d} = i;
        #10;
    end

    $finish;
end
endmodule