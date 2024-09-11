`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:02:19
// Design Name: 
// Module Name: divN
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


module divN #(parameter N = 8)(
    input wire [N-1:0] A, B,
    output wire [N-1:0] Q
    );
    
    assign Q = A / B;
endmodule
