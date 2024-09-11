`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2024 14:06:13
// Design Name: 
// Module Name: master
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


module master(
    input wire clk, rst,
    input wire [2:0] c
    );
    
    wire [2:0] src1, src2, dest;
    wire [3:0] opcode;
    wire WR, DONE;
    control_path CP(.c(c),.src1(src1),.src2(src2),.dest(dest),.opcode(opcode),.WR(WR),.DONE(DONE));
    data_path DP(.clk(clk),.rst(rst),.src1(src1),.src2(src2),.dest(dest),.opcode(opcode),.WR(WR),.DONE(DONE));
    
endmodule
