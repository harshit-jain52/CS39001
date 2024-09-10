module decN_tb;

    parameter N = 16;
    reg [N-1:0] A;
    wire [N-1:0] C;

    decN #(.N(N)) uut(.A(A),.C(C));

    initial begin
        $monitor("Time = %t: A=%b %d, C=%b %d", $time, A, A, C, C);
        #10 A = 42937;
        #100 $finish;
    end

endmodule