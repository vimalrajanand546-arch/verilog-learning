`timescale 1ns/1ps
module halfadder(
    input wire a,b,
    output reg sum,carry
);
// assign sum = a ^ b;
// assign carry = a & b; *** THIS TYPE OF ASSIGNMENTS CAN ALSO BE 
//IMPLEMENTED BY DATA MODELING METHOD BY USING TRUTH TABLE SIMPLIFICATIONS***
// ***HERE BEHAVIORAL MODELING IS USED:***
always @(*) begin
    sum=0;     
    carry=0;
    if(a == b)begin
        if(a == 1'b1 && b == 1'b1) begin  
            sum=0;
            carry=1;
        end
        else begin
            sum=0;
            carry=0;
        end
    end
    else begin
        sum=1;
        carry=0;
    end
end
endmodule 
