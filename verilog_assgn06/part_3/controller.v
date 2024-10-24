`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2024 14:28:57
// Design Name: 
// Module Name: controller
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


module controller(
    input wire clk,rst,
    input [31:0] out_data,
    output reg active,
    output reg [15:0] disp
    );
    
    reg [1:0] state, nxt_state;
    parameter S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;
    
    always@(posedge clk, posedge rst) begin
        if(rst) begin
            state <= S3;
        end
        else begin
            state <= nxt_state;
        end   
    end
    
    always@(state) begin
        case(state)
            S0: begin active <= 1'b1; nxt_state <= S1; disp <= 16'b0; end
            S1: begin active <= 1'b0; nxt_state <= S2; disp <= out_data[31:16]; end
            S2: begin active <= 1'b0; nxt_state <= S0; disp <= out_data[15:0]; end
            default: begin active <= 1'b0; nxt_state <= S0; disp <= 16'b1111111111111111; end
        endcase
     end
     
endmodule
