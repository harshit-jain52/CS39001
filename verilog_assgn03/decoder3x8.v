`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 15:16:35
// Design Name: 
// Module Name: decoder3x8
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


module decoder3x8( in,out );
input [2:0]  in;
output reg [1:7] out;

 always @( in )
	begin
	out = 7'd0;
      case (in)
          3'b001: out[1]=1'b1;
          3'b010: out[2]=1'b1;
          3'b011: out[3]=1'b1;
          3'b100: out[4]=1'b1;
          3'b101: out[5]=1'b1;
          3'b110: out[6]=1'b1;
          3'b111: out[7]=1'b1;
          default: out=7'd0;
       endcase
    end
endmodule
