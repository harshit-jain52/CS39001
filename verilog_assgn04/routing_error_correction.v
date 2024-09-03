`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 15:59:20
// Design Name: 
// Module Name: routing_error_correction
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


module routing_error_correction(
    input wire clk_board, rst,
    input wire [0:5] d_in,
    output wire [1:4] d_disp0, d_disp1, d_disp2, d_disp3
);
    wire data_line0, data_line1, data_line2, data_line3;
    wire err_line0, err_line1, err_line2, err_line3;
    wire strobe0, strobe1, strobe2, strobe3;
    wire err_strobe0,err_strobe1,err_strobe2,err_strobe3;
    wire clk;
    
    CLKDiv DIV(.clk_in(clk_board),.clk_out(clk));
    
    secure_router SR(.clk(clk),.rst(rst),.d_in(d_in),
    .data_line0(data_line0),.data_line1(data_line1),.data_line2(data_line2),.data_line3(data_line3),
    .strobe0(strobe0),.strobe1(strobe1),.strobe2(strobe2),.strobe3(strobe3)
    );
    
    error_inject EI0(.clk(clk),.rst(rst),.data_in(data_line0),.strobe_in(strobe0),.data_out(err_line0),.strobe_out(err_strobe0),.signal(7'b0010000));
    error_inject EI1(.clk(clk),.rst(rst),.data_in(data_line1),.strobe_in(strobe1),.data_out(err_line1),.strobe_out(err_strobe1),.signal(7'b0000100));
    error_inject EI2(.clk(clk),.rst(rst),.data_in(data_line2),.strobe_in(strobe2),.data_out(err_line2),.strobe_out(err_strobe2),.signal(7'b0000010));
    error_inject EI3(.clk(clk),.rst(rst),.data_in(data_line3),.strobe_in(strobe3),.data_out(err_line3),.strobe_out(err_strobe3),.signal(7'b0000001));
    
    error_correct EC0(.clk(clk),.rst(rst),.data_in(err_line0),.strobe_in(err_strobe0),.d_disp(d_disp0));
    error_correct EC1(.clk(clk),.rst(rst),.data_in(err_line1),.strobe_in(err_strobe1),.d_disp(d_disp1));
    error_correct EC2(.clk(clk),.rst(rst),.data_in(err_line2),.strobe_in(err_strobe2),.d_disp(d_disp2));
    error_correct EC3(.clk(clk),.rst(rst),.data_in(err_line3),.strobe_in(err_strobe3),.d_disp(d_disp3));
endmodule