`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 15:56:22
// Design Name: 
// Module Name: Rshift_A
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


module Rshift_A #(parameter N = 8)(
    input wire [N-1:0] A,
    output wire [N-1:0] C
    );
    assign C = {A[N-1], A[N-1:1]};
endmodule
