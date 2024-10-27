module reg_bank(
    input wire clk, rst, wrReg,
    input wire [4:0] rs, rt, destReg,
    output signed [31:0] rdData1, rdData2,
    input wire [31:0] wrData
    );

    reg signed [31:0] R [17:0]; // R0-R15,R16=RET
  
    assign rdData1 = R[rs];
    assign rdData2 = R[rt];
    
    initial begin
        R[0] <= 0;
        R[1] <= 0;
        R[2] <= 0;    
        R[3] <= 0;    
        R[4] <= 0;    
        R[5] <= 0;
        R[6] <= 0;    
        R[7] <= 0;
        R[8] <= 0;
        R[9] <= 0;
        R[10]<= 0;
        R[11]<= 0;
        R[12]<= 0;
        R[13]<= 0;
        R[14]<= 0;
        R[15]<= 0;
        R[16]<= 1023;
    end

    always@(posedge clk, posedge rst) begin
        R[0]<=0;
        if(wrReg) begin R[destReg] <= wrData; end
        if(rst) begin
            R[1] <= 0;
            R[2] <= 0;    
            R[3] <= 0;    
            R[4] <= 0;    
            R[5] <= 0;
            R[6] <= 0;    
            R[7] <= 0;
            R[8] <= 0;
            R[9] <= 0;
            R[10]<= 0;
            R[11]<= 0;
            R[12]<= 0;
            R[13]<= 0;
            R[14]<= 0;
            R[15]<= 0;
            R[16]<= 1023;
        end
    end
endmodule
