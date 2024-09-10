`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 15:20:01
// Design Name: 
// Module Name: K_ALU8
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


module K_ALU8(
    input wire [31:0] command,
    output wire [7:0] RES
    );

    wire [3:0] func;
    wire [7:0] A, B;
    wire [7:0] outs [15:0];

    assign func = command[31:28];
    assign A = command[15:8];
    assign B = command[7:0];

    mux16x1N #(.N(8)) MUX(.D(outs), .S(func), .Z(RES));
    
    adderN #(.N(8)) ADD(.A(A),.B(B),.S(outs[0]));
    subtractorN #(.N(8)) SUB(.A(A),.B(B),.D(outs[1]));
    multN #(.N(8)) MULT(.A(A),.B(B),.P(outs[2]));
    divN #(.N(8)) DIV(.A(A),.B(B),.Q(outs[3]));
    andN #(.N(8)) AND(.A(A),.B(B),.C(outs[4]));
    orN #(.N(8)) OR(.A(A),.B(B),.C(outs[5]));
    xorN #(.N(8)) XOR(.A(A),.B(B),.C(outs[6]));
    notN #(.N(8)) NOT(.A(A), .C(outs[7]));
    assign outs[8] = A;
    assign outs[9] = B;
    SLL8 SLL(.A(A),.B(B),.C(outs[10]));
    SRL8 SRL(.A(A),.B(B),.C(outs[11]));
    SRA8 SRA(.A(A),.B(B),.C(outs[12]));
    incN #(.N(8)) INC(.A(A), .C(outs[13]));
    decN #(.N(8)) DEC(.A(A), .C(outs[14]));
    hamm8 HAMM(.A(A), .H(outs[15]));
    
endmodule
