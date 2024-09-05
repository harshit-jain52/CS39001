`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:47:24
// Design Name: 
// Module Name: adderN
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


module adderN #(parameter N = 8)(
    input wire [N-1:0] A, B,
    output wire [N-1:0] S,
    output wire cout
    );
    
    wire [N:0] carry;
    assign carry[0] = 0;
    assign cout = carry[N];
    
    genvar i;
    generate 
      for (i = 0; i < N; i = i+1) begin
        fulladder ADD(.s(S[i]), .a(A[i]), .b(B[i]), .cin(carry[i]), .cout(carry[i+1]));
      end
    endgenerate
        
endmodule
