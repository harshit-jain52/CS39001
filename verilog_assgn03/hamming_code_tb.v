`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 16:32:43
// Design Name: 
// Module Name: hamming_code_tb
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


module hamming_code_tb;

    reg [1:4] msg;
    wire [1:7] code;
    
    hamming_code uut(.msg(msg), .code(code));
    initial begin 
       msg = 4'b1011;
       
    end
endmodule
