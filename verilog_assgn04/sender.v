`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2024 15:55:34
// Design Name: 
// Module Name: sender
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


module sender(clk, rst, data_in, data_line, strobe);
    input clk, rst;
    input [1:7] data_in;
    output reg data_line, strobe;
    
    reg [2:0] bit_counter;
    
    always @(posedge clk, posedge rst)
    begin
    if(rst) begin
        bit_counter <= 1;
        strobe <= 0;
        data_line <= 0;
    end
    else begin
        if(bit_counter <= 7) begin
            data_line <= data_in[bit_counter];
            strobe <= 1;
            bit_counter <= bit_counter + 1;
        end
        else begin
            strobe <= 0;
        end
    end
    end    
endmodule