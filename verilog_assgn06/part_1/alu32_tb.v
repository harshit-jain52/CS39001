`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 16:07:03
// Design Name: 
// Module Name: alu32_tb
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


module alu32_tb;
    parameter N = 32;
    reg [N-1:0] A, B;
    reg [3:0] func;
    wire [N-1:0] RES;
    
    ALU32 #(.N(N)) uut(.func(func),.A(A),.B(B),.RES(RES));
    
    initial begin
        $monitor("Time = %0t | func = %b | A = %b %d | B = %b %d | Res = %b %d", $time, func, A, A, B, B, RES, RES);
        
        A = 32'b00100010011011110000101010011011; B = 32'b10010000011011000010110010010101;
        
        func = 4'b0000; #10;
        func = 4'b0001; #10;
        func = 4'b0010; #10;
        func = 4'b0011; #10;
        func = 4'b0100; #10;
        func = 4'b0101; #10;
        func = 4'b0110; #10;
        func = 4'b0111; #10;
        func = 4'b1000; #10;
        func = 4'b1001; #10;
        func = 4'b1010; #10;
        func = 4'b1011; #10;
        func = 4'b1100; #10;
        func = 4'b1101; #10;
        func = 4'b1110; #10;
        func = 4'b1111; #10;
    end
endmodule
