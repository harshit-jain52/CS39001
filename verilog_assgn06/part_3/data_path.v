`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2024 16:18:40
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
    input wire clk,rst,Wr,Rd1,Rd2,
    input wire [3:0] src1, src2, dest,
    input wire [3:0] opcode,
    output wire [31:0] out_data
    );
    
    wire [31:0] A, B;
    reg_bank REG(.clk(clk),.rst(rst),.src1(src1),.src2(src2),.dest(dest),.A(A),.B(B),.Z(out_data),.Wr(Wr),.Rd1(Rd1),.Rd2(Rd2));
    ALU32 #(.N(32)) ALU(.A(A),.B(B),.RES(out_data),.func(opcode));
    
endmodule