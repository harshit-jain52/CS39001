`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 14:45:01
// Design Name: 
// Module Name: K_ALU6
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


module K_ALU6(
    input wire [31:0] command,
    output wire [5:0] RES
    );

    wire [3:0] func;
    wire [5:0] A, B;
    wire [5:0] outs [15:0];

    assign func = command[31:28];
    assign A = command[13:8];
    assign B = command[5:0];

    mux16x1N #(.N(6)) MUX(.D(outs), .S(func), .Z(RES));
    
    adderN #(.N(6)) ADD(.A(A),.B(B),.S(outs[0]));
    subtractorN #(.N(6)) SUB(.A(A),.B(B),.D(outs[1]));
    multN #(.N(6)) MULT(.A(A),.B(B),.P(outs[2]));
    divN #(.N(6)) DIV(.A(A),.B(B),.Q(outs[3]));
    andN #(.N(6)) AND(.A(A),.B(B),.C(outs[4]));
    orN #(.N(6)) OR(.A(A),.B(B),.C(outs[5]));
    xorN #(.N(6)) XOR(.A(A),.B(B),.C(outs[6]));
    notN #(.N(6)) NOT(.A(A), .C(outs[7]));
    assign outs[8] = A;
    assign outs[9] = B;
    SLL8 SLL(.A({2'b00,A}),.B({2'b00,B}),.C(outs[10]));
    SRL8 SRL(.A({2'b00,A}),.B({2'b00,B}),.C(outs[11]));
    SRA8 SRA(.A({A[5],A[5],A}),.B({2'b00,B}),.C(outs[12]));
    incN #(.N(6)) INC(.A(A), .C(outs[13]));
    decN #(.N(6)) DEC(.A(A), .C(outs[14]));
    hamm8 HAMM(.A({2'b00,A}), .H(outs[15]));
    
endmodule
