`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2024 16:05:33
// Design Name: 
// Module Name: channel_tb
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


module channel_tb();

    reg [1:7] data_in;
    wire [1:7] data_out;
    reg clk, rst;
    wire data_line, strobe;
    
    sender uut_send(.clk(clk), .rst(rst), .data_in(data_in), .data_line(data_line), .strobe(strobe));
    receiver uut_rec(.clk(clk), .rst(rst), .data_out(data_out), .data_line(data_line), .strobe(strobe));

    initial begin
        $monitor("Time=%0t, data_in=%b, data_out=%b",$time, data_in, data_out); 
        clk = 1'b0;
        
        rst = 1;
        #10 rst = 0;
        data_in = 7'b1010111;
        #100; rst = 1;
        #10 rst = 0;
        data_in = 7'b0010101;
        #100;
    end
     
    always #5 clk = ~clk;
    
endmodule