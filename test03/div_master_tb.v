`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2024 15:24:43
// Design Name: 
// Module Name: div_master_tb
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


module div_master_tb;
    reg clk,rst;
    reg [7:0] N,D;
    wire [7:0] R,Q;
    
    div_master UUT(.clk(clk),.rst(rst),.N(N),.D(D),.R(R),.Q(Q));
    
    always #5 clk=~clk;
    
    initial begin
        $monitor("t=%t,N=%d,D=%d,Q=%d,R=%d",$time,N,D,Q,R);
        rst=0; N=32; D=3; clk=0;
        
        #2 rst=1;
        #2 rst=0;
        #1000 $finish;
    end
endmodule
