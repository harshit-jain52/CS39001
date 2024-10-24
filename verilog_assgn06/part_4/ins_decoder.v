module ins_decoder (
    input [31:0] ins
    output reg [5:0] opcode,
    output reg [4:0] func,rs,rt,rd,
    output reg [15:0] imm16,
    output reg [25:0] imm26
);
    
    always @(*) begin
        opcode <= ins[31:26];
        func <= ins[5:0];
        rs <= ins[25:21];
        rt <= ins[20:16];
        rd <= ins[15:11];
        imm16 <= ins[15:0];
        imm26 <= ins[25:0];
    end

endmodule