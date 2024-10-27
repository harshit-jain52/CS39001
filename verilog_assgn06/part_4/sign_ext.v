
module sign_ext #(parameter N = 16, parameter M = 32)
(
    input wire [N-1:0] in,
    output wire [M-1:0] out
);  

assign out = { {(M-N){in[N-1]}}, in };

endmodule