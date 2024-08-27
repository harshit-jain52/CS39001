`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 15:59:20
// Design Name: 
// Module Name: routing_error_correction
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


module routing_error_correction(d_in, d_disp0, d_disp1, d_disp2, d_disp3);
    input [0:5] d_in;
    output [1:4] d_disp0, d_disp1, d_disp2, d_disp3;
    
    wire [1:7] d_out0, d_out1, d_out2, d_out3;
    wire [1:7] d_err0, d_err1, d_err2, d_err3;
    secure_router SR(.d_in(d_in),.d_out0(d_out0),.d_out1(d_out1),.d_out2(d_out2),.d_out3(d_out3));
    
    error_inject EI0(.d_orig(d_out0), .signal(7'b0010000), .d_error(d_err0));
    error_inject EI1(.d_orig(d_out1), .signal(7'b0000100), .d_error(d_err1));
    error_inject EI2(.d_orig(d_out2), .signal(7'b0000010), .d_error(d_err2));
    error_inject EI3(.d_orig(d_out3), .signal(7'b0000001), .d_error(d_err3));
    
    error_correct EC0(.d_hamm(d_err0), .d_disp(d_disp0));
    error_correct EC1(.d_hamm(d_err1), .d_disp(d_disp1));
    error_correct EC2(.d_hamm(d_err2), .d_disp(d_disp2));
    error_correct EC3(.d_hamm(d_err3), .d_disp(d_disp3));
endmodule
