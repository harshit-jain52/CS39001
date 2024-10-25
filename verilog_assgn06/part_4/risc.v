module risc(
    input wire clk, rst, INT,
    output wire [31:0] disp
);
    wire [31:0] PC, ins;
    wire [5:0] opcode;
    wire [4:0] func, rs, rt, rd;
    wire [15:0] imm16;
    wire [25:0] imm26;
    wire [3:0] aluOp;
    wire [2:0] brOp;
    wire aluSrc, aluOut, rdMem, wrMem, mToReg, wrReg, updPC;

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
    
endmodule