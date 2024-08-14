module bitadder16(a, b, cin, s, cout);
    input [15:0] a, b;
    input cin;
    output [15:0] s;
    output cout;

    wire [1:0] carry;

    bitadder8 BA8_0 (.a(a[7:0]), .b(b[7:0]), .cin(cin), .cout(carry[0]), .s(s[7:0])); 
    bitadder8 BA8_1 (.a(a[15:8]), .b(b[15:8]), .cin(carry[0]), .cout(carry[1]), .s(s[15:8])); 

    assign cout = carry[1];
endmodule