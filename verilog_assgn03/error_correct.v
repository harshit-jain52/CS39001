`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 14:38:39
// Design Name: 
// Module Name: error_correct
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


module error_correct(d_hamm, d_disp);
    input [1:7] d_hamm;
    output [1:4] d_disp;
    
    reg [3:1] c;
    wire [1:7] signal, corrected;

    always @(d_hamm)
    begin
        c[1] = d_hamm[1] ^ d_hamm[3] ^ d_hamm[5] ^ d_hamm[7];
        c[2] = d_hamm[2] ^ d_hamm[3] ^ d_hamm[6] ^ d_hamm[7];
        c[3] = d_hamm[4] ^ d_hamm[5] ^ d_hamm[6] ^ d_hamm[7];
    end
    
    decoder3x8 DEC0(.in(c),.out(signal));
    assign corrected = d_hamm ^ signal;
    assign d_disp = {corrected[3], corrected[5:7]};
endmodule
