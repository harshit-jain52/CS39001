module SRL8_tb;
    
    reg [7:0] A, B;
    wire [7:0] C;

    SRL8 uut(.A(A),.B(B), .C(C));

    initial begin
        $monitor("Time = %0t: A=%b, shamt=%d, C=%b", $time, A, B, C);
        A = 8'b10110101;

        #10 B = 8'b00000000;
        #10 B = 8'b00000001;
        #10 B = 8'b00000010;
        #10 B = 8'b00000011;
        #10 B = 8'b00000100;
        #10 B = 8'b00000101;
        #10 B = 8'b00000110;
        #10 B = 8'b00000111;
        #10 B = 8'b00001000;
        #10 B = 8'b01100010;
        #100 $finish;
    end
endmodule