`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2024 16:00:15
// Design Name: 
// Module Name: reg_bank
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


module reg_bank(
    input wire clk, rst,Wr,Rd1,Rd2,
    input wire [3:0] src1, src2, dest,
    output reg [31:0] A, B,
    input wire [31:0] Z
    );

    reg [31:0] R [15:0];
  
    always@(negedge clk) begin
        if(Rd1) begin A <= R[src1]; end
        if(Rd2) begin B <= R[src2]; end
    end
    
    always@(posedge clk, posedge rst) begin
        R[0]<=0;
        if(Wr) begin R[dest] <= Z; end
        if(rst) begin
            R[1] <= 1;
            R[2] <= 2;    
            R[3] <= 3;    
            R[4] <= 4;    
            R[5] <= 5;
            R[6] <= 6;    
            R[7] <= 7;
            R[8] <= 8;
            R[9] <= 9;
            R[10]<=10;
            R[11]<=11;
            R[12]<=12;
            R[13]<=13;
            R[14]<=14;
            R[15]<=15;
        end
    end
endmodule
