module lcu(P,G,cin,C);
	input [3:0] P, G;
	input cin;
	
	output [4:0] C;
	
	assign C[0] = cin;
	assign C[1] = G[0]|(P[0]&C[0]);
	assign C[2] = G[1]|(P[1]&G[0])|(P[1]&P[0]&C[0]);
	assign C[3] = G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&C[0]);
	assign C[4] = G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&C[0]);
endmodule