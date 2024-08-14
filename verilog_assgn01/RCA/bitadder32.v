module bitadder32(a, b, cin, s, cout);
    input [31:0] a, b;
    input cin;
    output [31:0] s;
    output cout;

    wire [1:0] carry;

    bitadder16 BA16_0 (.a(a[15:0]), .b(b[15:0]), .cin(cin), .cout(carry[0]), .s(s[15:0])); 
    bitadder16 BA16_1 (.a(a[31:16]), .b(b[31:16]), .cin(carry[0]), .cout(carry[1]), .s(s[31:16])); 

    assign cout = carry[1];
endmodule