module subtractorN_tb;

    reg [15:0] A, B;
    wire [15:0] D;

    subtractorN #(.N(16)) uut(.A(A),.B(B),.D(D));

    initial begin
        $monitor("Time = %t: A=%b, B=%b, D=%b", $time, A, B, D);
        #10 A = 65535; B = 65535;
        #10 A = 65535; B = 65534;
        #10 A = 65535; B = 1;
        #10 A = 1; B = 65535;
        #10 A = 64; B = 23;

        #100 $finish;
    end

endmodule