`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:36:28
// Design Name: 
// Module Name: orN
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


module orN #(parameter N = 8)(
    input wire [N-1:0] A, B,
    output wire [N-1:0] C
    );
    
    genvar i;
    generate 
      for (i = 0; i < N; i = i+1) begin
        or OR(C[i],A[i],B[i]);
      end
    endgenerate
        
endmodule
