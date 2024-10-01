`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 15:31:00
// Design Name: 
// Module Name: luiN
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


module luiN #(parameter N = 8)(
    input wire [N-1:0] A,
    output wire [N-1:0] C
    );
    
    assign C = {A[N-1:N/2], {(N/2){1'b0}}};
endmodule
