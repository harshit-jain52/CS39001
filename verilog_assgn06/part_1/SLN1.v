`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 15:10:53
// Design Name: 
// Module Name: SLN1
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


module SLN1 #(parameter N = 8)(
    input wire [N-1:0] A,
    input wire B,
    output wire [N-1:0] C
);

    genvar i;
    generate 
        for (i = N-1; i > 0; i=i-1) begin
            mux2x1 MUX(.d0(A[i]), .d1(A[i-1]), .Z(C[i]), .sel(B));
        end
        
        mux2x1 MUX(.d0(A[0]), .d1(1'b0), .Z(C[0]), .sel(B));
    endgenerate
endmodule
