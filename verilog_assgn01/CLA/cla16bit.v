module cla16bit(a,b,cin,s,cout);
	input [15:0] a, b;
	input cin;
	output [15:0] s;
	output cout;
	
	wire [3:0] P, G;
	wire [4:0] C;
	
	cla4bit_aug AUG0(.a(a[3:0]),.b(b[3:0]),.cin(C[0]),.p(P[0]),.g(G[0]),.s(s[3:0]));
	cla4bit_aug AUG1(.a(a[7:4]),.b(b[7:4]),.cin(C[1]),.p(P[1]),.g(G[1]),.s(s[7:4]));
	cla4bit_aug AUG2(.a(a[11:8]),.b(b[11:8]),.cin(C[2]),.p(P[2]),.g(G[2]),.s(s[11:8]));
	cla4bit_aug AUG3(.a(a[15:12]),.b(b[15:12]),.cin(C[3]),.p(P[3]),.g(G[3]),.s(s[15:12]));
	lcu LCU0(.P(P),.G(G),.cin(cin),.C(C));
	
	assign cout = C[4];
endmodule