module cmov_comp(
    input wire clk, isCmov,
    input wire [31:0] A, B, aluip1, aluip2,
    output reg [31:0] aluip_fin1, aluip_fin2
);

    always @(posedge clk) begin
        if(isCmov) begin
            aluip_fin1 <= (A < B)? A : B;
            aluip_fin2 <= 0;
        end
        else begin
            aluip_fin1 <= aluip1;
            aluip_fin2 <= aluip2;
        end
    end

endmodule