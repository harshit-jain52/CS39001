`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 14:26:55
// Design Name: 
// Module Name: kalu8_tb
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


module kalu8_tb;
    reg [31:0] command;    
    wire [7:0] RES;
    K_ALU8 uut (.command(command), .RES(RES));

    initial begin
        $monitor("Time = %0t | func = %b | A = %b | B = %b | Res = %b", $time, command[31:28], command[15:8], command[7:0], RES);

        command[15:8] = 8'b01011101; command[7:0] = 8'b00000010; 

        command[31:28] = 4'b0000; #10;
        command[31:28] = 4'b0001; #10;
        command[31:28] = 4'b0010; #10;
        command[31:28] = 4'b0011; #10;
        command[31:28] = 4'b0100; #10;
        command[31:28] = 4'b0101; #10;
        command[31:28] = 4'b0110; #10;
        command[31:28] = 4'b0111; #10;
        command[31:28] = 4'b1000; #10;
        command[31:28] = 4'b1001; #10;
        command[31:28] = 4'b1010; #10;
        command[31:28] = 4'b1011; #10;
        command[31:28] = 4'b1100; #10;
        command[31:28] = 4'b1101; #10;
        command[31:28] = 4'b1110; #10;
        command[31:28] = 4'b1111; #10;

        #100 $finish;
    end

endmodule
