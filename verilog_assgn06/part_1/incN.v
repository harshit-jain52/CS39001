`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:57:32
// Design Name: 
// Module Name: incN
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


module incN #(parameter N = 8)(
    input wire [N-1:0] A,
    output wire [N-1:0] C
    );
    
    wire t;
    adderN #(.N(N)) ADD(.S(C), .A(A), .B(1), .cout(t));
    
endmodule
