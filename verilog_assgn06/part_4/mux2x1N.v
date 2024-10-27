
module mux2x1N #(parameter N = 32)
(
    input wire [N-1: 0] d0, d1,
    input wire sel,
    output wire [N-1: 0] Z
);

    genvar i;
    generate
        for(i = 0; i < N; i=i+1)
        begin
            mux2x1 MUX(.d0(d0[i]), .d1(d1[0]), .sel(sel), .Z(Z[i]));
        end
    endgenerate
endmodule