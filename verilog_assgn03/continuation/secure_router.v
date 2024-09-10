`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 14:22:36
// Design Name: 
// Module Name: secure_router
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


module secure_router(
    input wire clk, rst,
    input wire [0:5] d_in,
    output wire data_line0, data_line1, data_line2, data_line3,
    output wire strobe0, strobe1, strobe2, strobe3
);
    reg [1:7] d_out0, d_out1, d_out2, d_out3;
    wire [0:1] port;
    wire [1:7] code;
    
    hamming_code HC(.msg(d_in[2:5]), .code(code));
    assign port = d_in[0:1];
    
    always @( * )
	begin
	   d_out0 = 7'b0000000;
	   d_out1 = 7'b0000000;
	   d_out2 = 7'b0000000;
	   d_out3 = 7'b0000000;
      case (port)
          2'b00: d_out0 = code;
          2'b01: d_out1 = code;
          2'b10: d_out2 = code;
          2'b11: d_out3 = code;
       endcase
    end
    
    sender SEN0(.clk(clk),.rst(rst),.data_in(d_out0),.data_line(data_line0), .strobe(strobe0));
    sender SEN1(.clk(clk),.rst(rst),.data_in(d_out1),.data_line(data_line1), .strobe(strobe1));
    sender SEN2(.clk(clk),.rst(rst),.data_in(d_out2),.data_line(data_line2), .strobe(strobe2));
    sender SEN3(.clk(clk),.rst(rst),.data_in(d_out3),.data_line(data_line3), .strobe(strobe3));
endmodule