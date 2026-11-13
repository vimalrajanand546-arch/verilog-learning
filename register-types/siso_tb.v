
`timescale 1ns/1ps

module siso_tb;

wire serial_out;
reg serial_in;
reg clk, rst;
integer j;
integer i;

siso DUT (
    .clk(clk),
    .serial_in(serial_in),
    .serial_out(serial_out),
    .rst(rst)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("siso.vcd");
    $dumpvars(0, siso_tb);

    rst = 0;
    serial_in = 0;
    #10;
    rst = 1;

    for (i = 0; i < 16; i = i + 1) begin

        @(negedge clk);
        rst = 0;
        #1;
        rst = 1;

        for (j = 3; j >= 0; j = j - 1) begin
            serial_in = i[j];
            @(negedge clk);
            #1;
        end

        $display("Input = %b, Output = %b", i[3:0], serial_out);
    end

    $display("All 16 tests completed!");
    $finish;
end

// Safety timeout
initial begin
    #1000;
    $display("ERROR: Simulation timeout!");
    $finish;
end

endmodule
