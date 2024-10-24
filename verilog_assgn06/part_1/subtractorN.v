`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:47:24
// Design Name: 
// Module Name: subtractorN
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


module subtractorN #(parameter N = 8)(
    input wire [N-1:0] A, B,
    output wire [N-1:0] D,
    output wire bout
    );
    
    wire [N:0] borrow;
    assign borrow[0] = 0;
    assign bout = borrow[N];
    
    genvar i;
    generate 
      for (i = 0; i < N; i = i+1) begin
        fullsubtractor SUB(.d(D[i]), .a(A[i]), .b(B[i]), .bin(borrow[i]), .bout(borrow[i+1]));
      end
    endgenerate
endmodule
