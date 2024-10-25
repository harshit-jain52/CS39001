module risc(
    input wire clk, rst, INT,
    output wire [31:0] disp
);
    wire [31:0] PC, NPC, ins, finalPC;
    wire [31:0] A, B, Rdin, aluip1, aluip2, alures,
    wire [5:0] opcode;
    wire [4:0] func, rs, rt, rd;
    wire [15:0] imm16;
    wire [25:0] imm26;
    wire [3:0] aluOp;
    wire [2:0] brOp;
    wire aluSrc, aluOut, rdMem, wrMem, mToReg, wrReg, updPC, isBranch;

    ins_mem IM(
        .addr(PC),
        .ins(ins)
    );

    ins_decoder ID(
        .ins(ins),
        .opcode(opcode),
        .func(func),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .imm16(imm16),
        .imm26(imm32)
    );

    control_unit CPU(
        .clk(clk),
        .INT(INT),
        .opcode(opcode),
        .func(func),
        .aluOp(aluOp),
        .brOp(brOp),
        .aluSrc(aluSrc),
        .aluOut(aluOut),
        .rdMem(rdMem),
        .wrMem(wrMem),
        .mToReg(mToReg),
        .wrReg(wrReg),
        .updPC(updPC)
    );
    
    branch_comp BC(
        .brOp(brOp),
        .rsOut(A),
        .clk(clk),
        .isBranch(isBranch)
    );

    ALU32 #(.N(32)) ALU(
        .A(aluip1), 
        .B(aluip2), 
        .RES(alures)
    );

    incN #(.N(32)) INC(
        .A(PC),
        .C(NPC)
    );

    mux2x1N #(.N(32)) MUX_PC (
        .d0(NPC), 
        .d1(alures), 
        .sel(isBranch), 
        .Z(finalPC)
    );

    program_counter PCControl(
        .clk(clk),
        .rst(rst),
        .PCin(finalPC),
        .updPC(updPC),
        .PCout(PC)
    );

endmodule