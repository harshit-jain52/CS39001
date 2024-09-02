`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2024 16:01:12
// Design Name: 
// Module Name: receiver
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


module receiver(clk, rst, data_out, data_line, strobe);
    input clk, rst, data_line, strobe;
    output reg [1:7] data_out;
    
    reg [2:0] bit_counter;
    
    always @(posedge clk, posedge rst)
    begin
    if(rst) begin
        bit_counter <= 1;
        data_out <= 7'b0;
    end
    else begin
        if(strobe) begin
            data_out[bit_counter] <= data_line;
            bit_counter <= bit_counter + 1;
        end
    end
    end    
endmodule