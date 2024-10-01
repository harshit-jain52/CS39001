`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 14:56:29
// Design Name: 
// Module Name: ALU32
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


module ALU32 #(parameter N = 32)(
    input wire [N-1:0] A, B,
    input wire [3:0] func,
    output wire [N-1:0] RES
    );

    wire [N-1:0] outs [15:0];

    mux16x1N #(.N(N)) MUX(.D(outs), .S(func), .Z(RES));
    
    adderN #(.N(N)) ADD(.A(A),.B(B),.S(outs[0]));
    subtractorN #(.N(N)) SUB(.A(A),.B(B),.D(outs[1]));
    andN #(.N(N)) AND(.A(A),.B(B),.C(outs[2]));
    orN #(.N(N)) OR(.A(A),.B(B),.C(outs[3]));
    xorN #(.N(N)) XOR(.A(A),.B(B),.C(outs[4]));
    norN #(.N(N)) NOR(.A(A),.B(B),.C(outs[5]));
    notN #(.N(N)) NOT(.A(A), .C(outs[6]));
    SLN1 #(.N(N)) SL(.A(A),.B(B[0]),.C(outs[7]));
    SRLN1 #(.N(N)) SRL(.A(A),.B(B[0]),.C(outs[8]));
    SRAN1 #(.N(N)) SRA(.A(A),.B(B[0]),.C(outs[9]));
    incN #(.N(N)) INC(.A(A), .C(outs[10]));
    decN #(.N(N)) DEC(.A(A), .C(outs[11]));
    sltN #(.N(N)) SLT(.A(A), .B(B), .C(outs[12]));
    sgtN #(.N(N)) SGT(.A(A), .B(B), .C(outs[13]));
    luiN #(.N(N)) LUI(.A(A), .C(outs[14]));
    hamm32 HAMM(.A(A), .H(outs[15]));
    
endmodule
