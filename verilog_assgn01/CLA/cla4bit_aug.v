module cla4bit_aug(a, b, cin, s, p, g);
	input [3:0] a, b;
    input cin;
    output [3:0] s;
    output p, g;
	
	wire [4:0] C;
	wire [3:0] P, G;
	
	assign G = a&b;
	assign P = a^b;
	assign C[0]=cin;

	assign C[1] = G[0]|(P[0]&C[0]);
	assign C[2] = G[1]|(P[1]&G[0])|(P[1]&P[0]&C[0]);
	assign C[3] = G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&C[0]);
	assign C[4] = G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&C[0]);
	
	assign s = C[3:0]^P;
	assign p = &P;
	assign g = G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0]);
endmodule