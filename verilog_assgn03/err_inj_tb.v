`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 16:39:45
// Design Name: 
// Module Name: err_inj_tb
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


module err_inj_tb;
    reg [1:7] d_orig, signal;
    wire [1:7] d_error;
    
    error_inject uut(.d_orig(d_orig), .d_error(d_error), .signal(signal));
    initial begin
        $monitor("time = %0d, output = %b", $time, d_error);
       d_orig = 7'b0110011;
       #5 signal = 7'b0010000;
       #5 signal = 7'b0000100;
       #5 signal = 7'b0000010;
       #5 signal = 7'b0000001;
    end
endmodule
