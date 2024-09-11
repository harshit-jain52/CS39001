`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2024 14:10:57
// Design Name: 
// Module Name: K_ALU
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


module K_ALU #(parameter N = 8)(
    input wire [N-1:0] A, B,
    input wire [3:0] func,
    output wire [N-1:0] RES
    );

    wire [N-1:0] outs [15:0];

    mux16x1N #(.N(N)) MUX(.D(outs), .S(func), .Z(RES));
    
    adderN #(.N(N)) ADD(.A(A),.B(B),.S(outs[0]));
    subtractorN #(.N(N)) SUB(.A(A),.B(B),.D(outs[1]));
    multN #(.N(N)) MULT(.A(A),.B(B),.P(outs[2]));
    divN #(.N(N)) DIV(.A(A),.B(B),.Q(outs[3]));
    andN #(.N(N)) AND(.A(A),.B(B),.C(outs[4]));
    orN #(.N(N)) OR(.A(A),.B(B),.C(outs[5]));
    xorN #(.N(N)) XOR(.A(A),.B(B),.C(outs[6]));
    notN #(.N(N)) NOT(.A(A), .C(outs[7]));
    assign outs[8] = A;
    assign outs[9] = B;
    SLLN #(.N(N)) SLL(.A(A),.B(B),.C(outs[10]));
    SRLN #(.N(N)) SRL(.A(A),.B(B),.C(outs[11]));
    SRAN #(.N(N)) SRA(.A(A),.B(B),.C(outs[12]));
    incN #(.N(N)) INC(.A(A), .C(outs[13]));
    decN #(.N(N)) DEC(.A(A), .C(outs[14]));
    hamm8 HAMM(.A(A), .H(outs[15]));
    
endmodule
