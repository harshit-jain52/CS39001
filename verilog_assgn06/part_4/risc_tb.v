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
    wire [31:0] disp;
    
    risc uut(.clk(clk),.rst(rst),.INT(INT),.disp(disp));
    
    initial begin
        $monitor("Time = %0t | disp = %b %d |", $time, disp,disp);
        clk=0; rst=1; INT=0;
        
        #100 rst=0;
        #2000 $finish;
    end
    
    always #5 clk=~clk;
endmodule
