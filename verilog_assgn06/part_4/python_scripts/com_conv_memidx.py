def convert_to_binary(imm, bit_count):
    # remove the first # and convert rest of the string to int
    imm = int(imm[1:])
    # convert imm to signed binary representation with "bit_count" bits
    if imm < 0:
        imm = (1 << bit_count) + imm
    return format(imm, f"0{bit_count}b")

Rtype_func_map = {
    "ADD": "00001",
    "SUB": "00010",
    "AND": "00011",
    "OR": "00100",
    "XOR": "00101",
    "NOR": "00110",
    "SL": "00111",
    "SRL": "01000",
    "SRA": "01001",
    "SLT": "01010",
    "SGT": "01011",
    "NOT": "01100",
    "INC": "01101",
    "DEC": "01110",
    "HAM": "01111",
    "MOVE": "10000",
    "CMOV": "10001"
}

Itype = ["ADDI", "SUBI", "ANDI", "ORI", "XORI", "NORI", "SLI", "SRLI", "SRAI", "SLTI", "SGTI", "NOTI", "INCI", "DECI", "HAMI", "LUI", "LD", "ST", "BMI", "BPL", "BZ"]
Itype_3_ri = ["ADDI", "SUBI", "ANDI", "ORI", "XORI", "NORI", "SLI", "SRLI", "SRAI", "SLTI", "SGTI"]

Itype_opcode_map = {
    "ADDI": "000001",
    "SUBI": "000010",
    "ANDI": "000011",
    "ORI": "000100",
    "XORI": "000101",
    "NORI": "000110",
    "SLI": "000111",
    "SRLI": "001000",
    "SRAI": "001001",
    "SLTI": "001010",
    "SGTI": "001011",
    "NOTI": "001100",
    "INCI": "001101",
    "DECI": "001110",
    "HAMI": "001111",
    "LUI": "010000",
    "LD": "010001",
    "ST": "010010",
    "BMI": "100001",
    "BPL": "100010",
    "BZ": "100011"
}

Jtype = ["BR"]

Jtype_opcode_map = {
    "BR": "100000"
}

PCtype = ["HALT", "NOP", "CALL"]

PCtype_opcode_map = {
    "HALT": "100100",
    "NOP": "100101",
    "CALL": "100110"
}

R_REG_MAPPING = {
    "R0": "00000",
    "R1": "00001",
    "R2": "00010",
    "R3": "00011",
    "R4": "00100",
    "R5": "00101",
    "R6": "00110",
    "R7": "00111",
    "R8": "01000",
    "R9": "01001",
    "R10": "01010",
    "R11": "01011",
    "R12": "01100",
    "R13": "01101",
    "R14": "01110",
    "R15": "01111",
}


# read a high level instruction text file
with open("instructions.txt") as file:
    lines = file.readlines()

instructions = []
for line in lines:
    # removing leading and trailing whitespace and remove newline characters and split the line into a list of words separating by commas and spaces
    instructions.append(line.strip().replace(",", " ").split())

file = open("binary_memidx.txt", "w") # file to write the binary instructions to be understood by the processor


Rtype = ["ADD", "SUB", "AND", "OR", "XOR", "NOR", "SL", "SRL", "SRA", "SLT", "SGT", "NOT", "INC", "DEC", "HAM", "MOVE", "CMOV"]
Rtype_3reg = ["ADD", "SUB", "AND", "OR", "XOR", "NOR", "SL", "SRL", "SRA", "SLT", "SGT", "CMOV"]


for idx, instr in enumerate(instructions):
    file.write(f"mem[{idx}] <= 32'b")

    if instr[0] in ["LD", "ST"]: # LD R1, #10(R2) -> LD R1, #10 R2
        imm, reg = instr[2].split("(")
        imm = imm.strip()
        reg = reg.strip()
        reg = reg[:-1]
        instr[2] = imm
        instr.append(reg)

    if instr[0] in Rtype:

        file.write("000000") # opcode

        if instr[0] in Rtype_3reg or instr[0] == "MOVE" : # rs
            file.write(R_REG_MAPPING[instr[2]]) 
        else:
            file.write("00000")
        
        if instr[0] in Rtype_3reg: # rt
            file.write(R_REG_MAPPING[instr[3]])
        else:
            file.write(R_REG_MAPPING[instr[2]])
        
        file.write(R_REG_MAPPING[instr[1]]) # rd

        file.write("000000") # don't care
        
        file.write(Rtype_func_map[instr[0]]) # funct
        file.write(";\n")
    
    elif instr[0] in Itype:

        file.write(Itype_opcode_map[instr[0]]) # opcode

        if instr[0] in Itype_3_ri: #rs
            file.write(R_REG_MAPPING[instr[2]])
        elif instr[0] in ["BMI", "BPL", "BZ"]:
            file.write(R_REG_MAPPING[instr[1]])
        elif instr[0] in ["LD", "ST"]:
            file.write(R_REG_MAPPING[instr[3]])
        
        if instr[0] in ["BMI", "BPL", "BZ"]: #rt
            file.write("00000")
        else:
            file.write(R_REG_MAPPING[instr[1]])

        if instr[0] in Itype_3_ri: #immediate
            file.write(convert_to_binary(instr[3], 16))
        else:
            file.write(convert_to_binary(instr[2], 16))
        
        file.write(";\n")
    
    elif instr[0] in Jtype:

        file.write(Jtype_opcode_map[instr[0]]) # opcode
        file.write(convert_to_binary(instr[1], 26)) # immediate
        file.write(";\n")

    elif instr[0] in PCtype:
            
        file.write(PCtype_opcode_map[instr[0]]) # opcode
        file.write("00000000000000000000000000")
        file.write(";\n")

        



       
        