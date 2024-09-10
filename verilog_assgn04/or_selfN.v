module or_selfN #(parameter N = 8)(
    input wire [N-1:0] A,
    output wire res
    );
    
    wire [N:0] tmp;
    assign tmp[0] = 0;
    assign res = tmp[N];

    genvar i;
    generate 
      for (i = 0; i < N; i = i+1) begin
        or OR(tmp[i+1],tmp[i],A[i]);
      end
    endgenerate
        
endmodule