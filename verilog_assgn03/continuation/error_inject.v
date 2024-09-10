`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 14:34:19
// Design Name: 
// Module Name: error_inject
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


module error_inject(
    input wire clk, rst,
    input wire data_in, strobe_in,
    output wire data_out, strobe_out,
    input wire [1:7] signal,
);
    wire [1:7] d_orig, d_error;
    receiver REC(.clk(clk),.rst(rst),.data_line(data_in),.strobe(strobe_in),.data_out(d_orig));
    assign d_error = d_orig ^ signal;
    sender SEN(.clk(clk),.rst(rst),.data_line(data_out),.strobe(strobe_out),.data_in(d_error));
endmodule