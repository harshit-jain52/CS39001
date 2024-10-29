module ins_mem(
	input [31:0] addr,
	output reg [31:0] ins
);
	reg [31:0] mem [1023:0];
	
	initial begin
		$readmemb("instructions_bin.mem", mem, 0, 1023);
		$monitor("Time:%0t | PC = %d, ins = %b", $time, addr[9:0], mem[addr[9:0]]);
	end

	always @(*) begin 
//		 $display("PC = %d, ins = %b", addr[9:0], mem[addr[9:0]]);
		ins = mem[addr[9:0]];
	end
endmodule