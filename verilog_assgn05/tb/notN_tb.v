module notN_tb;

    reg [31:0] A;
    wire [31:0] C;

    notN #(.N(32)) uut(.A(A),.C(C));

    initial begin
        $monitor("Time = %t: A=%b, C=%b", $time, A, C);
        #10 A = 4293967295;
        #100 $finish;
    end

endmodule