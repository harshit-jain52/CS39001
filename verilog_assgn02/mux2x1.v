`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 14:59:08
// Design Name: 
// Module Name: mux2x1
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


module mux2x1 (in0, in1, sel, out);
    input in0, in1;
    input sel;
    output reg out;

    always @(*)
    begin
        if (sel)
            out <= in1;
        else
            out <= in0;
    end
endmodule
