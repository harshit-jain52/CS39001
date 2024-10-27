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
        
        $monitor("Time: %0t | R[0]: %d", $time, R[0]);
        $monitor("Time: %0t | R[1]: %d", $time, R[1]);
        $monitor("Time: %0t | R[2]: %d", $time, R[2]);
        $monitor("Time: %0t | R[3]: %d", $time, R[3]);
        $monitor("Time: %0t | R[4]: %d", $time, R[4]);
        $monitor("Time: %0t | R[5]: %d", $time, R[5]);
        $monitor("Time: %0t | R[6]: %d", $time, R[6]);
        $monitor("Time: %0t | R[7]: %d", $time, R[7]);
        $monitor("Time: %0t | R[8]: %d", $time, R[8]);
        $monitor("Time: %0t | R[9]: %d", $time, R[9]);
        $monitor("Time: %0t | R[10]: %d", $time, R[10]);
        $monitor("Time: %0t | R[11]: %d", $time, R[11]);
        $monitor("Time: %0t | R[12]: %d", $time, R[12]);
        $monitor("Time: %0t | R[13]: %d", $time, R[13]);
        $monitor("Time: %0t | R[14]: %d", $time, R[14]);
        $monitor("Time: %0t | R[15]: %d", $time, R[15]);
//        $monitor("Time: %0t|destReg:%b|wrData=%b", $time,destReg,wrData);
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
