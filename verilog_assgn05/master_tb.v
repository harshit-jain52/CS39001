`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2024 14:46:34
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
    reg [2:0] c;
    reg clk, rst;
    
    master uut(.clk(clk), .rst(rst), .c(c));
    
    initial begin
        clk = 1; rst=1;
        #2 rst=0; c = 3'b000;
        #40 c = 3'b001;
        #40 c = 3'b010;
        #40 c = 3'b011;
        #40 c = 3'b100;
        #40 c = 3'b101;
        #40 c = 3'b110;
        #40 c = 3'b111;
        #40 rst=1;
        #10 $finish;
    end
    
    always #10 clk = ~clk;
endmodule
