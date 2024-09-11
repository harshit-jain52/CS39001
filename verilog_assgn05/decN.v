`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:57:32
// Design Name: 
// Module Name: decN
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


module decN #(parameter N = 8)(
    input wire [N-1:0] A,
    output wire [N-1:0] C
    );
    
    subtractorN #(.N(N)) SUB(.D(C), .A(A), .B(4));
    
endmodule
