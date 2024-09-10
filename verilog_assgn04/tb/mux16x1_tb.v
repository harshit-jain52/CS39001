module subtractorN_tb;

    reg [15:0] D;
    reg [3:0] S;
    wire Z;

    mux16x1 uut(.D(D),.S(S),.Z(Z));

    initial begin
        $monitor("Time = %0t | D = %b | S = %b | Z = %b", $time, D, S, Z);
        D = 16'b1011_0101_0011_1100;
        
        #10 S = 4'b0000;
        #10 S = 4'b0001;
        #10 S = 4'b0010;
        #10 S = 4'b0011;
        #10 S = 4'b0100;
        #10 S = 4'b0101;
        #10 S = 4'b0110;
        #10 S = 4'b0111;
        #10 S = 4'b1000;
        #10 S = 4'b1001;
        #10 S = 4'b1010;
        #10 S = 4'b1011;
        #10 S = 4'b1100;
        #10 S = 4'b1101;
        #10 S = 4'b1110;
        #10 S = 4'b1111;
        #100 $finish;
    end

endmodule