`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 16:18:03
// Design Name: 
// Module Name: master_tb
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


module master_tb();
    reg [0:5] d_in;
    reg clk, rst;
    wire [1:4] d_disp0, d_disp1, d_disp2, d_disp3;
    
    
    routing_error_correction uut(.clk(clk), .rst(rst), .d_in(d_in),.d_disp0(d_disp0),.d_disp1(d_disp1),.d_disp2(d_disp2),.d_disp3(d_disp3));
    initial begin
        $monitor("time = %0d, output = %d %d %d %d", $time, d_disp0, d_disp1, d_disp2, d_disp3);
        
        clk = 0;
        rst = 1;
        d_in = 6'b001011;
        #10 rst = 0;
        #200 rst=1; d_in = 6'b011011;
        #10 rst=0;
        #200 rst=1; d_in = 6'b101011;
        #10 rst=0;
        #200 rst=1; d_in = 6'b111011;
      	#10 rst=0;
      	
      	#200 $finish;
    end
    
    always #5 clk = ~clk; 
endmodule