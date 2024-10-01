`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 15:07:49
// Design Name: 
// Module Name: norN
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


module norN #(parameter N = 8)(
    input wire [N-1:0] A, B,
    output wire [N-1:0] C
    );
    
    genvar i;
    generate 
      for (i = 0; i < N; i = i+1) begin
        nor NOR(C[i],A[i],B[i]);
      end
    endgenerate
        
endmodule
