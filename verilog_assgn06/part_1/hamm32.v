`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 16:40:06
// Design Name: 
// Module Name: hamm32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module hamm32(
    input wire [31:0] A,
    output wire [31:0] H 
);

    wire [1:0] t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16;
    wire [2:0] t17,t18,t19,t20,t21,t22,t23,t24;
    wire [3:0] t25,t26,t27,t28;
    wire [4:0] t29,t30;
    assign H[31:6] = {(26){1'b0}};
    
    fulladder FA1(.s(t1[0]),.cout(t1[1]),.a(A[0]),.b(A[1]),.cin(1'b0));
    fulladder FA2(.s(t2[0]),.cout(t2[1]),.a(A[2]),.b(A[3]),.cin(1'b0));
    fulladder FA3(.s(t3[0]),.cout(t3[1]),.a(A[4]),.b(A[5]),.cin(1'b0));
    fulladder FA4(.s(t4[0]),.cout(t4[1]),.a(A[6]),.b(A[7]),.cin(1'b0));
    fulladder FA5(.s(t5[0]),.cout(t5[1]),.a(A[8]),.b(A[9]),.cin(1'b0));
    fulladder FA6(.s(t6[0]),.cout(t6[1]),.a(A[10]),.b(A[11]),.cin(1'b0));
    fulladder FA7(.s(t7[0]),.cout(t7[1]),.a(A[12]),.b(A[13]),.cin(1'b0));
    fulladder FA8(.s(t8[0]),.cout(t8[1]),.a(A[14]),.b(A[15]),.cin(1'b0));
    fulladder FA9(.s(t9[0]),.cout(t9[1]),.a(A[16]),.b(A[17]),.cin(1'b0));
    fulladder FA10(.s(t10[0]),.cout(t10[1]),.a(A[18]),.b(A[19]),.cin(1'b0));
    fulladder FA11(.s(t11[0]),.cout(t11[1]),.a(A[20]),.b(A[21]),.cin(1'b0));
    fulladder FA12(.s(t12[0]),.cout(t12[1]),.a(A[22]),.b(A[23]),.cin(1'b0));
    fulladder FA13(.s(t13[0]),.cout(t13[1]),.a(A[24]),.b(A[25]),.cin(1'b0));
    fulladder FA14(.s(t14[0]),.cout(t14[1]),.a(A[26]),.b(A[27]),.cin(1'b0));
    fulladder FA15(.s(t15[0]),.cout(t15[1]),.a(A[28]),.b(A[29]),.cin(1'b0));
    fulladder FA16(.s(t16[0]),.cout(t16[1]),.a(A[30]),.b(A[31]),.cin(1'b0));

    adderN #(.N(2)) ADD1(.A(t1), .B(t2), .S(t17[1:0]), .cout(t17[2]));
    adderN #(.N(2)) ADD2(.A(t3), .B(t4), .S(t18[1:0]), .cout(t18[2]));
    adderN #(.N(2)) ADD3(.A(t5), .B(t6), .S(t19[1:0]), .cout(t19[2]));
    adderN #(.N(2)) ADD4(.A(t7), .B(t8), .S(t20[1:0]), .cout(t20[2]));
    adderN #(.N(2)) ADD5(.A(t9), .B(t10), .S(t21[1:0]), .cout(t21[2]));
    adderN #(.N(2)) ADD6(.A(t11), .B(t12), .S(t22[1:0]), .cout(t22[2]));
    adderN #(.N(2)) ADD7(.A(t13), .B(t14), .S(t23[1:0]), .cout(t23[2]));
    adderN #(.N(2)) ADD8(.A(t15), .B(t16), .S(t24[1:0]), .cout(t24[2]));

    adderN #(.N(3)) ADD9(.A(t17), .B(t18), .S(t25[2:0]), .cout(t25[3]));
    adderN #(.N(3)) ADD10(.A(t19), .B(t20), .S(t26[2:0]), .cout(t26[3]));
    adderN #(.N(3)) ADD11(.A(t21), .B(t22), .S(t27[2:0]), .cout(t27[3]));
    adderN #(.N(3)) ADD12(.A(t23), .B(t24), .S(t28[2:0]), .cout(t28[3]));

    adderN #(.N(4)) ADD13(.A(t25), .B(t26), .S(t29[3:0]), .cout(t29[4]));
    adderN #(.N(4)) ADD14(.A(t27), .B(t28), .S(t30[3:0]), .cout(t30[4]));
    
    adderN #(.N(5)) ADD15(.A(t29), .B(t30), .S(H[4:0]), .cout(H[5]));

endmodule
