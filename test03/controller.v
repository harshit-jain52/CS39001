`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2024 14:24:59
// Design Name: 
// Module Name: controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controller(
    input wire clk, rst,gte,
    output reg ldR, decR, ldQ, incQ, ldData
    );
    
    reg [2:0] state, next_state;
    parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100, S5=3'b101;
    
    initial begin
        $monitor("t=%t:S=%d|NS=%d",$time,state,next_state);
    end
    always@(posedge clk, posedge rst) begin
        if(rst) state<=S0;
        else state <= next_state;
    end
    
    always@(state) begin
        case(state)
        S0: begin ldData=0; ldR=0; decR=0; ldQ=0; incQ=0; next_state=S1; end
        S1: begin ldData=1; next_state=S2; end
        S2: begin ldData=0; ldR=0; ldQ=0; next_state=S3; end
        S3: begin
            if(gte) begin decR=1; incQ=1; next_state=S4; end
            else next_state=S5;
        end
        S4: begin decR=0; incQ=0; ldR=1; ldQ=1; next_state=S2; end
        S5: begin next_state <= S5; end
        default: next_state=S0;
        endcase
    end
endmodule
