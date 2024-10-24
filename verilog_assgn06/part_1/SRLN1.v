`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 15:25:24
// Design Name: 
// Module Name: SRLN1
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


module SRLN1 #(parameter N = 8)(
    input wire [N-1:0] A,
    input wire B,
    output wire [N-1:0] C
);

    genvar i;
    generate 
        for (i = 0; i < N-1; i=i+1) begin
            mux2x1 MUX(.d0(A[i]), .d1(A[i+1]), .Z(C[i]), .sel(B));
        end
        
        mux2x1 MUX(.d0(A[N-1]), .d1(1'b0), .Z(C[N-1]), .sel(B));
    endgenerate
endmodule
