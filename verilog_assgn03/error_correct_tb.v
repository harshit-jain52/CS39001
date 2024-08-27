`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 16:28:37
// Design Name: 
// Module Name: error_correct_tb
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


module error_correct_tb();
    reg [1:7] d_hamm;
    wire [1:4] d_disp;
    
    error_correct uut(.d_hamm(d_hamm), .d_disp(d_disp));
    initial begin
        $monitor("time = %0d, %b, output = %b", $time, d_hamm, d_disp);
       d_hamm = 7'b0100011;
       #5 d_hamm = 7'b0110111;
       #5 d_hamm = 7'b0110001;
       #5 d_hamm = 7'b0110010;
    end
endmodule
