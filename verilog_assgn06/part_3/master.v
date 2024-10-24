`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2024 16:21:11
// Design Name: 
// Module Name: master
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


module master(
    input wire boardclk, rst, enable,
    input wire [15:0] ins,
    output wire [15:0] disp
    );
    
    wire [3:0] src1, src2, dest;
    wire [3:0] opcode;
    wire [31:0] out_data;
    wire clk, active;
    reg Rd1, Rd2, Wr;
    
    assign opcode = ins[15:12];
    assign src1 = ins[11:8];
    assign src2 = ins[7:4];
    assign dest = ins[3:0];
    
    CLKDiv #(.DIVISOR(28'd100000000)) CLK (.clk_in(boardclk),.clk_out(clk));
    
    data_path DP(.clk(clk),.rst(rst),.Wr(Wr),.Rd1(Rd1),.Rd2(Rd2),.src1(src1),.src2(src2),.dest(dest),.opcode(opcode), .out_data(out_data));
    controller CP(.clk(clk),.rst(rst),.out_data(out_data),.active(active),.disp(disp));

    always @(active) begin
        if(!active) begin
            Rd1 <= 0;
            Rd2 <= 0;
            Wr <= 0;
        end
        else begin
            Rd1 <= 1;
            Rd2 <= 1;
            Wr <= 1;
        end
    end
endmodule
