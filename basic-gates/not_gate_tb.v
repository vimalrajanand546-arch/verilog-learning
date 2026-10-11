module not_gate_tb;
       reg a;
       wire b;
 not_gate dut(
      .a(a),
      .b(b)
 );
initial begin
    $dumpfile("not_gate.vcd");
    $dumpvars(0,not_gate_tb);
    
    a=0;

    #10;
    a=1;

    #10;
    $finish;
end
endmodule
