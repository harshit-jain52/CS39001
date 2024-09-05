`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:45:03
// Design Name: 
// Module Name: LShift
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


module Lshift #(parameter N = 8)(
    input wire [N-1:0] A,
    output wire [N-1:0] C
    );
    assign C = {A[N-1:1], 1'b0};
endmodule
