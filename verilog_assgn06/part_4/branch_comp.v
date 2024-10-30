module branch_comp(
    input wire clk,rst,
    input wire [2:0] brOp,
    input wire [31:0] alures,rsOut,PCin,
    output reg [31:0] PCout
);

    parameter BR=3'b000, BMI=3'b001, BPL=3'b010, BZ=3'b011;

    initial begin
        PCout<=0;
    end
    
    always @(posedge clk, posedge rst)
    begin   
        if(rst) PCout <= 0;
        else begin
            case(brOp)
                BR: PCout <= alures;
                BMI: PCout <= (rsOut[31] ? alures : PCin+1);
                BPL: PCout <= (((~rsOut[31]) & |rsOut)? alures:PCin+1);
                BZ: PCout <= ((~|rsOut) ? alures : PCin+1);
                default: PCout <= PCin +1;
            endcase
        end
    end

endmodule