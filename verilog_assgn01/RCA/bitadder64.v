module bitadder64(a, b, cin, s, cout);
    input [63:0] a, b;
    input cin;
    output [63:0] s;
    output cout;

    wire [1:0] carry;

    bitadder32 BA32_0 (.a(a[31:0]), .b(b[31:0]), .cin(cin), .cout(carry[0]), .s(s[31:0])); 
    bitadder32 BA32_1 (.a(a[63:32]), .b(b[63:32]), .cin(carry[0]), .cout(carry[1]), .s(s[63:32])); 

    assign cout = carry[1];
endmodule