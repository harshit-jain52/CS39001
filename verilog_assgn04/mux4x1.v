module mux4x1(
    input wire [3:0] D,
    input wire [1:0] S,
    output wire Z
    );
    
    wire t1, t2;
    mux2x1 m1(.d0(D[0]), .d1(D[1]), .sel(S[0]), .Z(t1));
    mux2x1 m2(.d0(D[2]), .d1(D[3]), .sel(S[0]), .Z(t2));
    mux2x1 m3(.d0(t1), .d1(t2), .sel(S[1]), .Z(Z));

endmodule