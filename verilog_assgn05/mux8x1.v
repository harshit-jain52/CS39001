module mux8x1(
    input wire [7:0] D,
    input wire [2:0] S,
    output wire Z
    );
    
    wire t1, t2;
    mux4x1 m1(.D(D[3:0]), .S(S[1:0]), .Z(t1));
    mux4x1 m2(.D(D[7:4]), .S(S[1:0]), .Z(t2));
    mux2x1 m3(.X(t1), .Y(t2), .sel(S[2]), .Z(Z));

endmodule