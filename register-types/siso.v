`timescale 1ns/1ps
module siso (
    input clk,
    input rst,
    input serial_in,
    output serial_out
);

reg [3:0]shift_reg;

always @(negedge clk or negedge rst) begin

    if (!rst)
        shift_reg <= 4'b0000;
    else
        shift_reg <= {shift_reg[2:0], serial_in};
end

assign serial_out = shift_reg[3];

endmodule
