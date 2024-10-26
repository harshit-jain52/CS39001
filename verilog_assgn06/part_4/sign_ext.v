
module sign_ext #(parameter N = 16, parameter M = 32)
(
    input wire [N-1] in,
    output wire [M-1] out
);  

assign out = { {(M-N){in[N-1]}}, in };

endmodule