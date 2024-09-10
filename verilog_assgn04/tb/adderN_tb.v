module adderN_tb;

    reg [15:0] A, B;
    wire [15:0] S;
    wire cout;

    adderN #(.N(16)) uut(.A(A),.B(B),.S(S), .cout(cout));

    initial begin
        $monitor("Time = %t: A=%b, B=%b, S=%b, cout=%b", $time, A, B, S, cout);
        #10 A = 65535; B = 65535;
        #10 A = 65535; B = 65534;
        #10 A = 65535; B = 1;
        #10 A = 64; B = 23;

        #100 $finish;
    end

endmodule