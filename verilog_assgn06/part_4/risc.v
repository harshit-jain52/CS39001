module risc(
    input wire boardclk, rst, INT,
    input wire [3:0] show,
    output wire [15:0] disp
);  
    wire clk;
    wire [31:0] PC, NPC, ins, finalPC;
    wire [31:0] A, B, Rdin, aluip1, aluip2, alures, aluip_fin1, aluip_fin2, LMD;
    wire [5:0] opcode;
    wire [4:0] func, rs, rt, rd, destReg;
    wire [15:0] imm16;
    wire [25:0] imm26;
    wire [31:0] extimm16, extimm26, finimm;
    wire [3:0] aluOp;
    wire [2:0] brOp;
    wire aluSrc, regAluOut, rdMem, wrMem, mToReg, wrReg, updPC, isBranch, immSel, isCmov;
    
//    initial begin
//        $monitor("Time=%0t|aluOp=%b|brOp=%b|aluSrc=%b|regAluOut=%b|immSel=%b|wrReg=%b|mToReg=%b",$time,aluOp,brOp,aluSrc,regAluOut,immSel,wrReg,mToReg);
//        $monitor("Time=%0t|aluOp=%b|aluip_fin1=%b|aluip_fin2=%b|alures=%b",$time,aluOp,aluip_fin1,aluip_fin2,alures);
//        $monitor("Time=%0t|imm16=%b|extimm16=%b|extimm26=%b|finimm=%b",$time,imm16,extimm16,extimm26,finimm);
//        $monitor("Time=%0t|Rdin=%b",$time,Rdin);
//        $monitor("Time=%0t|LMD=%b|rdMem=%b|wrMem=%b",$time,LMD,rdMem,wrMem);
//        $monitor("Time=%0t|brOp=%b|isBranch=%b|aluip2=%b|finalPC=%b",$time,brOp,isBranch,aluip2,finalPC);        
//    end
    
    CLKDiv #(.DIVISOR(28'd2)) CLK (.clk_in(boardclk),.clk_out(clk));
    
    ins_mem IM(
        .addr(PC),
        .ins(ins),
        .rst(rst)
    );
    
//    ins_bram IMB(
//        .clka(~clk),
//        .addra(PC[7:0]),
//        .douta(ins)
//    );

    data_mem DM(
        .clk(clk),
        .rst(rst),
        .addr(alures),
        .wrData(B),
        .wrMem(wrMem),
        .rdMem(rdMem),
        .rdData(LMD)
    );
    
//    data_bram DMB(
//        .clka(~clk),
//        .addra(alures[6:0]),
//        .dina(B),
//        .wea(wrMem),
//        .ena(rdMem|wrMem),
//        .douta(LMD)
//    );
    
    ins_decoder ID(
        .ins(ins),
        .opcode(opcode),
        .func(func),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .imm16(imm16),
        .imm26(imm26),
        .PC(PC)
    );

    control_unit CPU(
        .clk(clk),
        .rst(rst),
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
        .immSel(immSel),
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
        .wrData(Rdin),
        .disp(disp),
        .showReg(show)
    );

    sign_ext #(.N(16), .M(32)) SGEXT16(
        .in(imm16),
        .out(extimm16)
    );

    sign_ext #(.N(26), .M(32)) SGEXT26(
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
        .d0(PC),
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

    mux2x1N #(.N(32)) MUX_MEM(
        .d0(alures),
        .d1(LMD),
        .sel(mToReg),
        .Z(Rdin)
    );

endmodule