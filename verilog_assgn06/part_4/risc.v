module risc(
    input wire clk, rst, INT,
    output wire [31:0] disp
);
    wire [31:0] PC, NPC, ins, finalPC;
    wire [31:0] A, B, Rdin, aluip1, aluip2, alures, aluip_fin1, aluip_fin2;
    wire [5:0] opcode;
    wire [4:0] func, rs, rt, rd, destReg;
    wire [15:0] imm16;
    wire [25:0] imm26;
    wire [31:0] extimm16, extimm26, finimm;
    wire [3:0] aluOp;
    wire [2:0] brOp;
    wire aluSrc, regAluOut, rdMem, wrMem, mToReg, wrReg, updPC, isBranch, immSel, isCmov;

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
        .regAluOut(regAluOut),
        .rdMem(rdMem),
        .wrMem(wrMem),
        .mToReg(mToReg),
        .wrReg(wrReg),
        .updPC(updPC),
        .isCmov(isCmov)
    );
    
    branch_comp BC(
        .clk(clk),
        .brOp(brOp),
        .rsOut(A),
        .isBranch(isBranch)
    );

    cmov_comp CC(
        .clk(clk),
        .isCmov(isCmov),
        .A(A),
        .B(B),
        .aluip1(aluip1),
        .aluip2(aluip2),
        .aluip_fin1(aluip_fin1),
        .aluip_fin2(aluip_fin2)
    );

    ALU32 #(.N(32)) ALU(
        .A(aluip_fin1), 
        .B(aluip_fin2), 
        .func(aluOp),
        .RES(alures)
    );

    pc_inc INC(
        .PC(PC),
        .NPC(NPC)
    );

    mux2x1N #(.N(32)) MUX_PC (
        .d0(NPC), 
        .d1(alures), 
        .sel(isBranch), 
        .Z(finalPC)
    );

    mux2x1N #(.N(5)) MUX_DEST_REG(
        .d0(rt), 
        .d1(rd), 
        .sel(regAluOut), 
        .Z(destReg)
    );
    
    program_counter PCControl(
        .clk(clk),
        .rst(rst),
        .PCin(finalPC),
        .updPC(updPC),
        .PCout(PC)
    );

    reg_bank RB(
        .clk(clk),
        .rst(rst),
        .wrReg(wrReg),
        .rs(rs),
        .rt(rt),
        .destReg(destReg),
        .rdData1(A),
        .rdData2(B),
        .wrData(Rdin)
    );

    sign_ext #(.N(16), .M(32)) SGEXT16(
        .in(imm16),
        .out(extimm16)
    );

    sign_ext #(.N(26), .M(32)) SGEXT32(
        .in(imm26),
        .out(extimm26)
    );

    mux2x1N #(.N(32)) MUX_IMM(
        .d0(extimm16),
        .d1(extimm26),
        .sel(immSel),
        .Z(finimm)
    );

    mux2x1N #(.N(32)) MUX_ALUIN1(
        .d0(NPC),
        .d1(A),
        .sel(brOp[2]),
        .Z(aluip1)
    );

    mux2x1N #(.N(32)) MUX_ALUIN2(
        .d0(finimm),
        .d1(B),
        .sel(aluSrc),
        .Z(aluip2)
    );

endmodule