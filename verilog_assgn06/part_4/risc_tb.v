`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 06:07:08 PM
// Design Name: 
// Module Name: risc_tb
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


module risc_tb;
    reg clk,rst,INT;
    reg [3:0] show;
    wire signed [15:0] disp;
    
    risc uut(.boardclk(clk),.rst(rst),.INT(INT),.disp(disp), .show(show));
    
    initial begin
        $monitor("Time = %0t | disp = %b %d |", $time,disp,disp);
        clk=0; rst=1; INT=0; show=0;
        
        #20 rst=0;
//        #11 $finish;
//        #190 INT=1'b1;
//        #1000 $finish;
        #5000 show=1;
        #5 show=2;
        #5 show=3;
        #5 show=4;
        #5 show=5;
        #5 show=6;
        #5 show=7;
        #5 show=8;
        #5 show=9;
        #5 show=10;
    end
    
    always #1 clk=~clk;
endmodule
