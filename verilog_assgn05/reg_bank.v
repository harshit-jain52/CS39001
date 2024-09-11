`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 16:14:51
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
    input wire clk, rst, WR,
    input wire [2:0] src1, src2, dest,
    output reg [31:0] A, B,
    input wire [31:0] Z,
    output reg DONE
    );

    reg [31:0] R [7:0];
    
    always @(posedge DONE) begin
        $display("R0=%d, R1=%d, R2=%d, R3=%d, R4=%d, R5=%d, R6=%d, R7=%d",R[0],R[1],R[2],R[3],R[4],R[5],R[6],R[7]);
    end
    
    always @(posedge rst) begin
        R[0] = 0;
        R[1] = 1;
        R[2] = 2;    
        R[3] = 3;    
        R[4] = 4;    
        R[5] = 5;
        R[6] = 6;    
        R[7] = 7;
        $display("R0=%d, R1=%d, R2=%d, R3=%d, R4=%d, R5=%d, R6=%d, R7=%d",R[0],R[1],R[2],R[3],R[4],R[5],R[6],R[7]);
    end
    
    always@(negedge clk) begin
        A <= R[src1];
        B <= R[src2];
    end
    
    always@(posedge clk) begin
        if (WR) begin
            R[dest] = Z;
            DONE = 1;
        end
        else DONE = 0;
    end
endmodule
