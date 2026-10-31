`timescale 1ns/1ps
module alu_4bit_tb;
   wire [7:0]y;
   reg [3:0] a,b,sel;
   integer i,j,k;
   reg [7:0] expected;
   integer errors;
   integer tested;
   integer skipped;
 alu_4bit DUT (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
 );
 initial begin
    $dumpfile("alu_4bit.vcd");
    $dumpvars(0,alu_4bit_tb);
       errors = 0;
       tested = 0;
       skipped = 0;
     
    for(i=0;i<16;i=i+1) begin
         for(j=0;j<16;j=j+1) begin
            for(k=0;k<16;k=k+1) begin
               a=i;
               b=j;
               sel=k;
               #1;

               case(sel)
                        4'b0000: expected = a + b;
                        4'b0001: expected = a - b;
                        4'b0010: expected = a * b;
                        4'b0011: expected = a / b;
                        4'b0100: expected = a & b;
                        4'b0101: expected = a | b;
                        4'b0110: expected = ~a;
                        4'b0111: expected = a ^ b;
                        4'b1000: expected = ~(a & b);
                        4'b1001: expected = ~(a ^ b);
                        4'b1010: expected = ~(a | b);

                        default: expected = 8'b0;
                endcase
                 if(sel == 4'b0011 && b == 0) begin
                        skipped = skipped + 1;
                 end
                 else begin
                        tested = tested + 1;

                        if(y !== expected) begin
                            errors = errors + 1;

                            $display("FAIL: A=%d B=%d SEL=%b Expected=%d Actual=%d",
                                     a,b,sel,expected,y);
                        end
                  end

                    #9;
                  end
               end
            end
        $display("--------------------------------");
        $display("Total checked = %d",tested);
        $display("Division skipped = %d",skipped);
        $display("Total errors = %d",errors);
        $display("--------------------------------");

        if(errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TESTING FAILED");

        $finish;

    end

endmodule