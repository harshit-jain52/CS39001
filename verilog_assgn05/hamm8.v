module hamm8(
    input wire [7:0] A,
    output wire [3:0] H 
);

    wire [1:0] t1,t2,t3,t4;
    wire [2:0] t5, t6;

    fulladder FA1(.s(t1[0]),.cout(t1[1]),.a(A[0]),.b(A[1]),.cin(1'b0));
    fulladder FA2(.s(t3[0]),.cout(t2[1]),.a(A[2]),.b(A[3]),.cin(1'b0));
    fulladder FA3(.s(t3[0]),.cout(t3[1]),.a(A[4]),.b(A[5]),.cin(1'b0));
    fulladder FA4(.s(t4[0]),.cout(t4[1]),.a(A[6]),.b(A[7]),.cin(1'b0));

    adderN #(.N(2)) ADD1(.A(t1), .B(t2), .S(t5[1:0]), .cout(t5[2]));
    adderN #(.N(2)) ADD2(.A(t3), .B(t4), .S(t6[1:0]), .cout(t6[2]));

    adderN #(.N(3)) ADD3(.A(t5), .B(t6), .S(H[2:0]), .cout(H[3]));

endmodule