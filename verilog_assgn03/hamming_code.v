`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 14:22:36
// Design Name: 
// Module Name: hamming_code
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


module hamming_code(msg, code);
    input [1:4] msg;
    output [1:7] code;

    reg p1, p2, p3;
    
    always@(*)
    begin
        p1 <= msg[1] ^ msg[2] ^ msg[4];
        p2 <= msg[1] ^ msg[3] ^ msg[4];
        p3 <= msg[2] ^ msg[3] ^ msg[4];
    end
    
    assign code = {p1, p2, msg[1], p3, msg[2], msg[3], msg[4]};
endmodule
