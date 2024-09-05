module hamm8_tb;
    
    reg [7:0] A;
    wire [3:0] H;

    hamm8 uut(.A(A),.H(H));

    initial begin
        $monitor("Time = %0t: A=%b, HAMM(A)=%d", $time, A, H);
        #10 A = 8'b10110110;
        #10 A = 8'b10000111;
        #10 A = 8'b11100011;
        #10 A = 8'b01110110;
        #10 A = 8'b01001010;
        #100 $finish;
    
    end
endmodule