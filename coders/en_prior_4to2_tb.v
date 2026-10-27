`timescale 1ns/1ps
module en_prior_4to2_tb;
       reg a,b,c,d;
       reg [1:0]e;
       wire x,y,valid;
       integer i;
    
    en_prior_4to2 DUT(
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
     $dumpfile("en_prior_4to2.vcd");
    $dumpvars(0, en_prior_4to2_tb);

    for (i = 0; i < 64; i = i + 1) begin
        {e,a,b,c,d} = i;
        #10;
    end
    $finish;
end
endmodule