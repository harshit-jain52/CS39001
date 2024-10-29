`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2024 14:20:06
// Design Name: 
// Module Name: div_master
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


module div_master(
    input wire [7:0] N, D,
    output reg [7:0] Q, R,
    input wire clk,rst
);
    wire ldData, ldR, decR, ldQ, incQ, gte;
    wire [8:0]X,Y;
       
    controller CP(
    .clk(clk),
    .rst(rst),
    .ldR(ldR),
    .decR(decR),
    .ldQ(ldQ),
    .ldData(ldData),
    .incQ(incQ),
    .gte(gte)
    );    
    
    always@(posedge clk) begin
        if(ldData) begin R<=N; Q<=8'b00000000; end
        else begin
        if(ldR) R<=X;
        if(ldQ) Q<=Y;
        end
    end
    
    comparator COMP(.A(R),.B(D),.gte(gte));
    subtractor SUB(.clk(clk),.A(R),.B(D),.RES(X),.dec(decR));
    incrementer INC(.clk(clk),.A(Q),.inc(incQ),.RES(Y));
endmodule
