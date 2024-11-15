module control_unit (
    input [5:0] opcode,
    input [4:0] func,
    input clk, INT, rst,
    output reg [3:0] aluOp,
    output reg [2:0] brOp,
    output reg aluSrc, regAluOut, rdMem, wrMem, wrReg, mToReg, immSel, updPC, isCmov
);
    
    reg [2:0] state, ins_state;

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
        ST = 6'b010010,
        MOVE = 6'b010100,
        CMOV = 6'b010101,
        BR = 6'b100000,
        BMI = 6'b100001,
        BPL = 6'b100010,
        BZ = 6'b100011,
        HALT = 6'b100100,
        NOP = 6'b100101,
        CALL = 6'b100110;

//    initial begin        
//        $monitor("Time=%0t|S=%d| IS=%d",$time,state,ins_state);
//    end

    always@(posedge clk, posedge rst) begin
        if(rst) begin
            state <= 0;
            ins_state <= 0;
        end
        else begin
        case(state)
        0: begin
            updPC <= 0;
            state <= 1;
        end
        1: begin
            case(opcode)
            R_TYPE: begin
                case(ins_state)
                0: begin
                    aluOp <= func[3:0]-1;
                    brOp <= 3'b100;
                    aluSrc <= 1;
                    regAluOut <= 1;
                    rdMem <= 0;
                    wrMem <= 0;
                    wrReg<=0;
                    mToReg <= 0;
                    // immSel - don't care
                    isCmov <= 0;
                    ins_state <= 1;
                end
                1: begin
                    wrReg <= 1;
                    ins_state<=2;
                end
                2: begin
                    wrReg <= 0;
                    updPC <= 1;
                    state <= 0;
                    ins_state <= 0;
                end
                endcase
            end
            MOVE: begin
            // ADD $rd, $rs, $r0
                case(ins_state)
                0: begin
                    aluOp <= 4'b0000;
                    brOp <= 3'b100;
                    aluSrc <= 1;
                    regAluOut <= 1;
                    rdMem <= 0;
                    wrMem <= 0;
                    wrReg<=0;
                    mToReg <= 0;
                    // immSel - don't care
                    isCmov <= 0;
                    ins_state <= 1;
                end
                1: begin
                    wrReg <= 1;
                    ins_state<=2;
                end
                2: begin
                    wrReg <= 0;
                    updPC <= 1;
                    state <= 0;
                    ins_state <= 0;
                end
                endcase
            end
            CMOV: begin
                case(ins_state)
                0: begin
                    aluOp <= 4'b0000;
                    brOp <= 3'b100;
                    aluSrc <= 1;
                    regAluOut <= 1;
                    rdMem <= 0;
                    wrMem <= 0;
                    wrReg<=0;
                    mToReg <= 0;
                    // immSel - don't care
                    isCmov <= 1;
                    ins_state <= 1;
                end
                1: begin
                    // buffer
                    ins_state<=2;
                end
                2: begin
                    wrReg <= 1;
                    ins_state<=3;
                end
                3: begin
                    wrReg <= 0;
                    updPC <= 1;
                    state <= 0;
                    isCmov <= 0;
                    ins_state <= 0;
                end
                endcase
            end
            LUI: begin
                case(ins_state)
                0: begin
                    aluOp <= 4'b1111;
                    brOp <= 3'b100;
                    aluSrc <= 0;
                    regAluOut <= 0;
                    rdMem <= 0;
                    wrMem <= 0;
                    wrReg<=0;
                    mToReg <= 0;
                    immSel <= 0;
                    isCmov <= 0;
                    ins_state <= 1;
                end
                1: begin
                    wrReg <= 1;
                    ins_state<=2;
                end
                2: begin
                    wrReg <= 0;
                    updPC <= 1;
                    state <= 0;
                    ins_state <= 0;
                end
                endcase
            end
            LD: begin
                case(ins_state)
                0: begin
                    aluOp <= 4'b0000;
                    brOp <= 3'b100;
                    aluSrc <= 0;
                    regAluOut <= 0;
                    wrMem <= 0;
                    wrReg<=0;
                    immSel <= 0;
                    isCmov <= 0;
                    ins_state <= 1;
                end
                1: begin
                    rdMem <= 1;
                    ins_state<=2;
                end
                2: begin ins_state<=3; end
                3: begin
                    rdMem <= 0;
                    mToReg <= 1;
                    wrReg <= 1;
                    ins_state<=4;
                end
                4: begin
                    mToReg <= 0;
                    wrReg <= 0;
                    updPC <= 1;
                    state <= 0;
                    ins_state <= 0;
                end
                endcase
            end
            ST: begin
                case(ins_state)
                0: begin
                    aluOp <= 4'b0000;
                    brOp <= 3'b100;
                    aluSrc <= 0;
                    regAluOut <= 0;
                    rdMem <= 0;
                    mToReg <= 0;
                    wrReg<=0;
                    immSel <= 0;
                    isCmov <= 0;
                    ins_state <= 1;
                end
                1: begin
                    ins_state<=2;
                end
                2: begin
                    wrMem <= 1;
                    ins_state<=3;
                end
                3: begin
                    wrMem <= 0;
                    updPC <= 1;
                    state <= 0;
                    ins_state <= 0;
                end
                endcase
            end
            BR: begin
                case(ins_state)
                0: begin
                    aluOp <= 4'b0000;
                    brOp <= 3'b000;
                    aluSrc <= 0;
                    regAluOut <= 0;
                    rdMem <= 0;
                    wrMem <= 0;
                    wrReg<=0;
                    mToReg <= 0;
                    immSel <= 1;
                    isCmov <= 0;
                    ins_state <= 1;
                end
                1: begin
                    ins_state<=2;
                end
                2: begin
                    updPC <= 1;
                    state <= 0;
                    ins_state <= 0;
                end
                endcase
            end
            BMI: begin
                case(ins_state)
                0: begin
                    aluOp <= 4'b0000;
                    brOp <= 3'b001;
                    aluSrc <= 0;
                    regAluOut <= 0;
                    rdMem <= 0;
                    wrMem <= 0;
                    wrReg<=0;
                    mToReg <= 0;
                    immSel <= 1;
                    isCmov <= 0;
                    ins_state <= 1;
                end
                1: begin
                    ins_state<=2;
                end
                2: begin
                    updPC <= 1;
                    state <= 0;
                    ins_state <= 0;
                end
                endcase
            end
            BPL: begin
                case(ins_state)
                0: begin
                    aluOp <= 4'b0000;
                    brOp <= 3'b010;
                    aluSrc <= 0;
                    regAluOut <= 0;
                    rdMem <= 0;
                    wrMem <= 0;
                    wrReg<=0;
                    mToReg <= 0;
                    immSel <= 1;
                    isCmov <= 0;
                    ins_state <= 1;
                end
                1: begin
                    ins_state<=2;
                end
                2: begin
                    updPC <= 1;
                    state <= 0;
                    ins_state <= 0;
                end
                endcase
            end
            BZ: begin
                case(ins_state)
                0: begin
                    aluOp <= 4'b0000;
                    brOp <= 3'b011;
                    aluSrc <= 0;
                    regAluOut <= 0;
                    rdMem <= 0;
                    wrMem <= 0;
                    wrReg<=0;
                    mToReg <= 0;
                    immSel <= 1;
                    isCmov <= 0;
                    ins_state <= 1;
                end
                1: begin
                    ins_state<=2;
                end
                2: begin
                    updPC <= 1;
                    state <= 0;
                    ins_state <= 0;
                end
                endcase
            end
            HALT: begin
                case(ins_state)
                0: begin
                    // aluOp - don't care
                    brOp <= 3'b100;
                    aluSrc <= 0;
                    // regAluOut - don't care
                    rdMem <= 0;
                    wrMem <= 0;
                    wrReg <= 0;
                    mToReg <= 0;
                    // immSel - don't care
                    isCmov <= 0;
                    if(INT) ins_state <= 1;
                    else ins_state <= 0;
                end
                1: begin
                    updPC <= 1;
                    state <= 0;
                    ins_state <= 0;
                end
                endcase
            end
            NOP: begin
                case(ins_state)
                0: begin
                    // aluOp - don't care
                    brOp <= 3'b100;
                    aluSrc <= 0;
                    // regAluOut - don't care
                    rdMem <= 0;
                    wrMem <= 0;
                    wrReg <= 0;
                    mToReg <= 0;
                    // immSel - don't care
                    isCmov <= 0;
                    ins_state<=1;
                end
                1: begin
                    updPC <= 1;
                    state <= 0;
                    ins_state <= 0;
                end
                endcase
            end
            CALL: begin
            // ADDI $r16, $r0, PC
                case(ins_state)
                0: begin
                    aluOp <= 4'b0000;
                    brOp <= 3'b100;
                    aluSrc <= 0;
                    regAluOut <= 0;
                    rdMem <= 0;
                    wrMem <= 0;
                    mToReg <= 0;
                    immSel <= 0;
                    isCmov <= 0;
                    ins_state <= 1;
                end
                1: begin
                    wrReg <= 1;
                    ins_state<=2;
                end
                2: begin
                    wrReg <= 0;
                    updPC <= 1;
                    state <= 0;
                    ins_state <= 0;
                end
                endcase            
            end
            default: begin
                // ADDI, SUBI, ANDI, ORI, XORI, NORI, SLI, SRLI, SRAI, SLTI, SGTI, NOTI, INCI, DECI, HAMI
                case(ins_state)
                0: begin
                    aluOp <= opcode[3:0]-1;
                    brOp <= 3'b100;
                    aluSrc <= 0;
                    regAluOut <= 0;
                    rdMem <= 0;
                    wrMem <= 0;
                    mToReg <= 0;
                    immSel <= 0;
                    isCmov <= 0;
                    ins_state <= 1;
                end
                1: begin
                    wrReg <= 1;
                    ins_state<=2;
                end
                2: begin
                    wrReg <= 0;
                    updPC <= 1;
                    state <= 0;
                    ins_state <= 0;
                end
                endcase
            end
            endcase
        end
        endcase
        end
    end
endmodule