`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 15:53:33
// Design Name: 
// Module Name: lfsr_tb
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


module lfsr_tb;
    reg sel, clk, rst;
    reg [3:0] seed;
    
    wire [3:0] state;
    
    lfsr uut(.seed(seed), .sel(sel), .rst(rst), .clk(clk), .state(state));
    // Change divisor to small number (e.g. 2-10) in clock-divider before simulating on test bench
    initial begin
        $monitor("time = %0d, output = %b%b%b%b", $time, state[3], state[2], state[1], state[0]);
        clk = 1'b0;
        sel = 1'b0;
        seed = 4'b1111;
        #10 sel = 1'b1;
    end
    
    always begin
        #1 clk <= ~clk;
    end
endmodule
