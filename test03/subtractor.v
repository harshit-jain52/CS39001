`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2024 15:15:09
// Design Name: 
// Module Name: subtractor
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


module subtractor(
    input clk,
    input [7:0] A,B,
    input wire dec,
    output reg [7:0] RES
);
    always@(posedge clk) begin
        if(dec) RES <= A-B;
        else RES <= A;
    end
endmodule
