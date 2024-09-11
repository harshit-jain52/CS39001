`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 16:18:10
// Design Name: 
// Module Name: control_path
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


module control_path(
    input wire [2:0] c,
    output reg [2:0] src1, src2, dest,
    output reg [3:0] opcode,
    input wire DONE,
    output reg WR
    );
    
    always @(*) begin
        if(DONE) WR <= 0;
        else begin
            WR <= 1;
            case(c)
                3'b000: begin src1 = 3'b010; src2 = 3'b011; dest = 3'b001; opcode=4'b0000; end
                3'b001: begin src1 = 3'b001; src2 = 3'b101; dest = 3'b100; opcode=4'b0001; end
                3'b010: begin src1 = 3'b001; src2 = 3'b010; dest = 3'b010; opcode=4'b1010; end
                3'b011: begin src1 = 3'b001; src2 = 3'b010; dest = 3'b111; opcode=4'b1011; end
                3'b100: begin src1 = 3'b001; src2 = 3'b010; dest = 3'b110; opcode=4'b0010; end
                3'b101: begin src1 = 3'b001; src2 = 3'b010; dest = 3'b001; opcode=4'b0100; end
                3'b110: begin src1 = 3'b010; dest = 3'b011; opcode=4'b1000; end
                3'b111: begin src1 = 3'b000; dest = 3'b110; opcode=4'b1000; end
            endcase
        end
    end
    
endmodule
