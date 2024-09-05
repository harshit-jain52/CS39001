module mux4x1(
    input wire [3:0] D,
    input wire [1:0] S,
    output wire Z
    );
    
    wire t1, t2;
    mux2x1 m1(.X(D[0]), .Y(D[1]), .sel(S[0]), .Z(t1));
    mux2x1 m2(.X(D[2]), .Y(D[3]), .sel(S[0]), .Z(t2));
    mux2x1 m3(.X(t1), .Y(t2), .sel(S[1]), .Z(Z));

endmodule