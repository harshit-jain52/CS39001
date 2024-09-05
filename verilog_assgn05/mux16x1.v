module mux16x1(
    input wire [15:0] D,
    input wire [3:0] S,
    output wire Z
    );
    
    wire t1, t2;
    mux8x1 m1(.D(D[7:0]), .S(S[2:0]), .Z(t1));
    mux8x1 m2(.D(D[15:8]), .S(S[2:0]), .Z(t2));
    mux2x1 m3(.X(t1), .Y(t2), .sel(S[3]), .Z(Z));

endmodule