`timescale 1ns/1ps
module demux_1to4_tb;
       reg a;
       reg [1:0]s;
       wire w,x,y,z;
       integer i;


    demux_1to4 DUT (
           .a(a),
           .s(s),
           .w(w),
           .x(x),
           .y(y),
           .z(z)
    );

initial begin
    $dumpfile("demux_1to4.vcd");
    $dumpvars(0, demux_1to4_tb);
    
    

    for (i = 0; i < 8; i = i + 1) begin
        {s,a} = i;
        #10;
    end

    $finish;
end
endmodule
