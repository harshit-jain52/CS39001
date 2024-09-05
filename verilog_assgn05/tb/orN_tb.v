module orN_tb;

    reg [31:0] A, B;
    wire [31:0] C;

    orN #(.N(32)) uut(.A(A),.B(B),.C(C));

    initial begin
        $monitor("Time = %t: A=%b, B=%b, C=%b", $time, A, B, C);
        #10 A = 1000000000; B = 4293967295;
        #100 $finish;
    end

endmodule