`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2024 15:17:51
// Design Name: 
// Module Name: incrementer
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


module incrementer(
    input wire clk, inc,
    input wire [7:0] A,
    output reg [7:0] RES
);
    always@(posedge clk) begin
        if(inc) RES <= A+1;
        else RES <= A;
    end
endmodule
