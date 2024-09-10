module mux16x1N #(parameter N = 8)(
    input wire [N-1:0] D [15:0],
    input wire [3:0] S,
    output wire [N-1:0] Z
    );
    
    genvar i;
    generate 
      for (i = 0; i < N; i = i+1) begin
        mux16x1 MUX(.D({D[15][i],D[14][i],D[13][i],D[12][i],D[11][i],D[10][i],D[9][i],D[8][i],D[7][i],D[6][i],D[5][i],D[4][i],D[3][i],D[2][i],D[1][i],D[0][i]}), .S(S), .Z(Z[i]));
      end
    endgenerate
endmodule
