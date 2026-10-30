`timescale 1ns/1ps
module halfsub(
    input wire a,b,
    output reg difference, borrow

);
// assign sum = a ^ b;
// assign carry = ~a & b; *** THIS TYPE OF ASSIGNMENTS CAN ALSO BE 
//IMPLEMENTED BY DATA MODELING METHOD BY USING TRUTH TABLE SIMPLIFICATIONS***
// ***HERE BEHAVIORAL MODELING IS USED:***
always @(*) begin
    difference=0;     
    borrow=0;
    if(a == b)begin
        difference=0;
        borrow=0;
    end
    else if(a == 1'b1 && b == 1'b0)begin
        difference=1;
        borrow=0;
    end
    else begin
        difference=1;
        borrow=1;
    end
end
endmodule