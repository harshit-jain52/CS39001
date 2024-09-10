`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:49:46
// Design Name: 
// Module Name: fulladder
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


module fulladder(
    input wire a, b, cin,
    output wire s, cout
    );
    
    wire t1,t2,t3;

    xor g1(t1,a,b);     // t1 = a^b
    xor g2(s,cin,t1);   // s = cin^a^b
    and g3(t2,a,b);     // t2 = a&b
    and g4(t3,t1,cin);  // t3 = (a^b)&c0
    or g5(cout,t2,t3);  // cout = (a&b) | ((a^b)&c0)
    
endmodule
