`timescale 1ns/1ps
module alu_4bit(
    input wire [3:0]a,
    input wire [3:0]b,
    input wire [3:0]sel,
    output reg [7:0]y
);
always @(*) begin
    case(sel)
        4'b0000: y = a + b;
        4'b0001: y = a - b;
        4'b0010: y = a * b;
        4'b0011: y = a / b;

        4'b0100: y = a & b;
        4'b0101: y = a | b;
        4'b0110: y = ~a;
        4'b0111: y = a ^ b;

        4'b1000: y = ~(a & b);
        4'b1001: y = ~(a ^ b);
        4'b1010: y = ~(a | b);

        default: y = 8'b00000000;
    endcase
end
endmodule