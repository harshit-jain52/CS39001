`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 16:18:10
// Design Name: 
// Module Name: data_path
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


module data_path(
    input wire clk, rst, WR, DONE,
    input wire [2:0] src1, src2, dest,
    input wire [3:0] opcode
    );
    
    wire [31:0] A, B, Z;
    reg_bank REG(.clk(clk),.rst(rst),.src1(src1),.src2(src2),.dest(dest),.A(A),.B(B),.Z(Z),.WR(WR),.DONE(DONE));
    K_ALU #(.N(32)) KALU(.A(A),.B(B),.RES(Z),.func(opcode));

endmodule
