`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2024 14:27:47
// Design Name: 
// Module Name: SRAN
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


module SRAN #(parameter N = 8)(
    input wire [N-1:0] A, B,
    output wire [N-1:0] C
);

    wire [N-1:0] level_mux_out [$clog2(N):0];
    wire [N-2-$clog2(N):0] or_out;
    assign level_mux_out[0] = A;

    or or0 (or_out[N-2-$clog2(N)], B[N-1], B[N-2]);
    
    genvar i, j, k, l;
    generate
        for (k = (N-3); k >= $clog2(N); k = k - 1) begin: or_gen
            or orgate (or_out[k-$clog2(N)], or_out[k-$clog2(N)+1], B[k]);
        end

        for (i = 1; i <= $clog2(N); i = i + 1) begin: level_decider_loop
            for (j = N-1; j >= 0 ; j = j - 1) begin: level_mux_gen
                if (j < (N - 2**(i-1)))
                    mux2x1 MUX (.sel(B[i-1]), .d0(level_mux_out[i-1][j]), .d1(level_mux_out[i-1][j + 2**(i-1)]), .Z(level_mux_out[i][j]));
                else
                    mux2x1 MUX (.sel(B[i-1]), .d0(level_mux_out[i-1][j]), .d1(A[N-1]), .Z(level_mux_out[i][j]));
            end
        end

        for (l = 0; l < N; l = l + 1) begin: mux_level_3_gen
            mux2x1 MUX (.sel(or_out[0]), .d0(level_mux_out[$clog2(N)][l]), .d1(A[N-1]), .Z(C[l]));
        end
    endgenerate
    
endmodule
