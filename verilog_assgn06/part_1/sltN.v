`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 15:59:23
// Design Name: 
// Module Name: sltN
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


module sltN #(parameter N = 8)(
    input wire signed [N-1:0] A, B,
    output wire [N-1:0] C
    );
    
    assign C[N-1:1] = {(N-1){1'b0}};
//    subtractorN #(.N(N)) SUB(.A(A),.B(B),.bout(C[0]));
    assign C[0] = A < B;
endmodule
