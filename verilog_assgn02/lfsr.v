`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 14:59:08
// Design Name: 
// Module Name: lfsr
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


module lfsr(seed, sel, clk, rst, state);
    input [3:0] seed;
    input sel, clk, rst;
    output [3:0] state;
    
    wire outxor, clk_div;
    wire [3:0] wint;
    
    CLKDiv CLKD(.clk_in(clk),.clk_out(clk_div));    
    xor XOR (outxor, state[0], state[1]);
    
    mux2x1 MUX3 (.in0(seed[3]), .in1(outxor), .sel(sel), .out(wint[3]));
    mux2x1 MUX2 (.in0(seed[2]), .in1(state[3]), .sel(sel), .out(wint[2]));
    mux2x1 MUX1 (.in0(seed[1]), .in1(state[2]), .sel(sel), .out(wint[1]));
    mux2x1 MUX0 (.in0(seed[0]), .in1(state[1]), .sel(sel), .out(wint[0]));
    
    dff DFF3 (.clk(clk_div), .rst(rst), .D(wint[3]), .Q(state[3]));
    dff DFF2 (.clk(clk_div), .rst(rst), .D(wint[2]), .Q(state[2]));
    dff DFF1 (.clk(clk_div), .rst(rst), .D(wint[1]), .Q(state[1]));
    dff DFF0 (.clk(clk_div), .rst(rst), .D(wint[0]), .Q(state[0]));

endmodule
