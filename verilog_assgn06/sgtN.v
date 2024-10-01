`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 16:04:26
// Design Name: 
// Module Name: sgtN
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


module sgtN #(parameter N = 8)(
    input wire [N-1:0] A, B,
    output wire [N-1:0] C
    );
    
    assign C[N-1:1] = {(N-1){1'b0}};
    subtractorN #(.N(N)) SUB(.A(B),.B(A),.bout(C[0]));
endmodule
