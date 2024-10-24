`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2024 16:44:48
// Design Name: 
// Module Name: CLKDiv
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


module CLKDiv #(parameter DIVISOR=28'd100000000)(clk_in, clk_out);
// Board Frequency = 100 MHz = 10^8 Hz
    input clk_in;
    output reg clk_out;
    reg[27:0] counter = 28'd0;
    
    always @(posedge clk_in)
    begin
     counter <= counter + 28'd1;
     if(counter>=(DIVISOR-1))
      counter <= 28'd0;
     clk_out <= (counter<DIVISOR/2)?1'b1:1'b0;
    end
endmodule

