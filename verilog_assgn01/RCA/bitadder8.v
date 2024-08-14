module bitadder8(a, b, cin, s, cout);
    input [7:0] a, b;
    input cin;
    output [7:0] s;
    output cout;

    wire [8:0] carry;
    assign carry[0] = cin;

    fulladder FA0 (.a(a[0]), .b(b[0]), .c0(cin), .c(carry[1]), .s(s[0])); 
    fulladder FA1 (.a(a[1]), .b(b[1]), .c0(carry[1]), .c(carry[2]), .s(s[1])); 
    fulladder FA2 (.a(a[2]), .b(b[2]), .c0(carry[2]), .c(carry[3]), .s(s[2]));
    fulladder FA3 (.a(a[3]), .b(b[3]), .c0(carry[3]), .c(carry[4]), .s(s[3])); 
    fulladder FA4 (.a(a[4]), .b(b[4]), .c0(carry[4]), .c(carry[5]), .s(s[4])); 
    fulladder FA5 (.a(a[5]), .b(b[5]), .c0(carry[5]), .c(carry[6]), .s(s[5])); 
    fulladder FA6 (.a(a[6]), .b(b[6]), .c0(carry[6]), .c(carry[7]), .s(s[6])); 
    fulladder FA7 (.a(a[7]), .b(b[7]), .c0(carry[7]), .c(carry[8]), .s(s[7]));

    assign cout = carry[8];
endmodule