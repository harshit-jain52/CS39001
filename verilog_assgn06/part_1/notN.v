`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 17:02:24
// Design Name: 
// Module Name: notN
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


module notN #(parameter N = 8)(
    input wire [N-1:0] A,
    output wire [N-1:0] C
    );
    
    genvar i;
    generate 
      for (i = 0; i < N; i = i+1) begin
        not NOT(C[i],A[i]);
      end
    endgenerate
        
endmodule
