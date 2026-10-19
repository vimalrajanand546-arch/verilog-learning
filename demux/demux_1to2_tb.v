`timescale 1ns/1ps
module demux_1to2_tb;

       reg a,s;
       wire x,y;
    

    demux_1to2 DUT (
          .a(a),
          .s(s),
          .x(x),
          .y(y)
        
    );

    initial begin
        $dumpfile("demux_1to2_tb.vcd");
        $dumpvars(0,demux_1to2_tb);

        a = 0; s = 0 ; #10;
        a = 0; s = 1 ; #10;
        a = 1; s = 0 ; #10;
        a = 1; s = 1 ; #10;

        $finish;
    end
endmodule