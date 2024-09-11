`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 16:25:05
// Design Name: 
// Module Name: read_port
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


module read_port(
    input wire clk,
    input wire [31:0] din,
    output reg [31:0] dout
    );
    
    always@(negedge clk) begin
        dout <= din;
    end
    
endmodule
