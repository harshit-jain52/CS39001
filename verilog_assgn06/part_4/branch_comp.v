module branch_comp(
    input wire [2: 0] brOp,
    input wire [31: 0] rsOut,
    input wire clk,
    output reg isBranch
);

    parameter BR=3'b000, BMI=3'b001, BPL=3'b010, BZ=3'b011;

    always @(*)
    begin   
        case(brOp)
            BR: isBranch <= 1;
            BMI: isBranch <= rsOut[31];
            BPL: isBranch <= (~rsOut[31]) & |rsOut;
            BZ: isBranch <= ~|rsOut;
            default: isBranch <= 0;
        endcase
    end

endmodule