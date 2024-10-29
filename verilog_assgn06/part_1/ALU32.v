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
    
//    initial begin
//       $monitor("ALU Time=%0t|A=%b|B=%b|RES=%b",$time,A,B,RES);
//    end
    
    wire [N-1:0] outs [15:0];

    mux16x1N #(.N(N)) MUX(.D(outs), .S(func), .Z(RES));
    
    adderN #(.N(N)) ADD(.A(A),.B(B),.S(outs[0]));
    subtractorN #(.N(N)) SUB(.A(A),.B(B),.D(outs[1]));
    andN #(.N(N)) AND(.A(A),.B(B),.C(outs[2]));
    orN #(.N(N)) OR(.A(A),.B(B),.C(outs[3]));
    xorN #(.N(N)) XOR(.A(A),.B(B),.C(outs[4]));
    norN #(.N(N)) NOR(.A(A),.B(B),.C(outs[5]));
    SLN1 #(.N(N)) SL(.A(A),.B(B[0]),.C(outs[6]));
    SRLN1 #(.N(N)) SRL(.A(A),.B(B[0]),.C(outs[7]));
    SRAN1 #(.N(N)) SRA(.A(A),.B(B[0]),.C(outs[8]));
    sltN #(.N(N)) SLT(.A(A), .B(B), .C(outs[9]));
    sgtN #(.N(N)) SGT(.A(A), .B(B), .C(outs[10]));
    notN #(.N(N)) NOT(.A(B), .C(outs[11]));
    incN #(.N(N)) INC(.A(B), .C(outs[12]));
    decN #(.N(N)) DEC(.A(B), .C(outs[13]));
    hamm32 HAMM(.A(B), .H(outs[14]));
    luiN #(.N(N)) LUI(.A(B), .C(outs[15]));
    
endmodule
