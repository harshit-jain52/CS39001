

module branch_comp(
    input wire [2: 0] brOp,
    input wire [31: 0] rsOut,
    input wire clk,
    output reg isBranch
);

    always @(posedge clk)
    begin   
        case(brOp)
            3'b001: isBranch <= 1;
            3'b010: isBranch <= rsOut[31];
            3'b011: isBranch <= (rsOut[31] > 0)? 1'b1 : 1'b0;
            3'b100: isBranch <= (rsOut == 0)? 1'b1 : 1'b0;    
            default: isBranch <=0;
        endcase
    end

endmodule