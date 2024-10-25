module ins_decoder (
    input [31:0] ins
    output reg [5:0] opcode,
    output reg [4:0] func,rs,rt,rd,
    output reg [15:0] imm16,
    output reg [25:0] imm26
);
    parameter
        R_TYPE = 6'b000000,
        ADDI = 6'b000001,
        SUBI = 6'b000010,
        ANDI = 6'b000011,
        ORI = 6'b000100,
        XORI = 6'b000101,
        NORI = 6'b000110,
        SLI = 6'b000111,
        SRLI = 6'b001000,
        SRAI = 6'b001001,
        SLTI = 6'b001010,
        SGTI = 6'b001011,
        NOTI = 6'b001100,
        INCI = 6'b001101,
        DECI = 6'b001110,
        HAMI = 6'b001111,
        LUI = 6'b010000,
        LD = 6'b010001,
        ST = 6'b010010;
        MOVE = 6'b010100,
        CMOV = 6'b010101,
        BR = 6'b100000,
        BMI = 6'b100001,
        BPL = 6'b100010,
        BZ = 6'b100011,
        HALT = 6'b100100,
        NOP = 6'b100101,
        CALL = 6'b100110;

    always @(*) begin
        opcode <= ins[31:26];
        case(opcode)
        HALT: begin
            func <= 5'b0;
            rs <= 5'b0;
            rt <= 5'b0;
            rd <= 5'b0;
            imm16 <= 16'b0;
            imm26 <= 26'b0;
        end
        NOP: begin
            func <= 5'b0;
            rs <= 5'b0;
            rt <= 5'b0;
            rd <= 5'b0;
            imm16 <= 16'b0;
            imm26 <= 26'b0;
        end
        MOVE: begin
            // ADD $rd, $rs, $r0
            func <= 5'b0;
            rs <= ins[25:21];
            rt <= 5'b0;
            rd <= ins[15:11];
            imm16 <= 16'b0;
            imm26 <= 26'b0;
        end
        default: begin
            func <= ins[4:0];
            rs <= ins[25:21];
            rt <= ins[20:16];
            rd <= ins[15:11];
            imm16 <= ins[15:0];
            imm26 <= ins[25:0];
        end
        endcase
        
    end

endmodule