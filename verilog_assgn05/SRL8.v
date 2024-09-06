`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 15:56:22
// Design Name: 
// Module Name: SRL8
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


module SRL8 (
    input wire [7:0] A, B,
    output wire [7:0] C
    );

    wire [7:0] x,y,z,tmp;
    wire rst;

    andN #(.N(8)) AND(.A(B),.B(8'b11111000),.C(tmp));
    or_selfN #(.N(8)) OR(.A(tmp),.res(rst));

    genvar i;
    generate
        // 4-bit
        for (i = 4; i < 8; i = i + 1) begin
            mux2x1 MUX4 (.d0(A[i]), .d1(1'b0), .sel(B[2]), .Z(x[i]));
        end
        
        for (i = 0; i < 4; i = i + 1) begin 
            mux2x1 MUX4 (.d0(A[i]), .d1(A[i+4]), .sel(B[2]), .Z(x[i]));
        end

        // 2-bit
        for (i = 6; i < 8; i = i + 1) begin
            mux2x1 MUX2 (.d0(x[i]), .d1(1'b0), .sel(B[1]), .Z(y[i]));
        end
        
        for (i = 0; i < 6; i = i + 1) begin
            mux2x1 MUX2 (.d0(x[i]), .d1(x[i+2]), .sel(B[1]), .Z(y[i]));
        end

        // 1-bit
        for (i = 7; i < 8; i = i + 1) begin
            mux2x1 MUX1 (.d0(y[i]), .d1(1'b0), .sel(B[0]), .Z(z[i]));
        end
        
        for (i = 0; i < 7; i = i + 1) begin
            mux2x1 MUX1 (.d0(y[i]), .d1(y[i+1]), .sel(B[0]), .Z(z[i]));
        end

        // Reset
        for (i = 0; i < 8; i = i + 1) begin
            mux2x1 MUX1 (.d0(z[i]), .d1(1'b0), .sel(rst), .Z(C[i]));
        end
    endgenerate
 
endmodule
