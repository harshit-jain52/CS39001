`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2024 16:59:16
// Design Name: 
// Module Name: master_tb
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


module master_tb;
    reg [15:0] ins;
    reg clk, rst;
    wire [15:0] disp;
    
    master uut(.boardclk(clk), .rst(rst), .ins(ins), .enable(enable), .disp(disp));
    
    initial begin
        $monitor("Time = %0t | op = %b | Rx = %b | Ry = %b | Rz = %b | disp = %b", $time, ins[15:12], ins[11:8], ins[7:4], ins[3:0], disp);
        rst=0;
        #1 clk = 1; rst=1;
        #2 rst=0; ins = 16'b0111000111110001; 
        #5000 $finish;
    end
    
    always #10 clk = ~clk;
endmodule
