module ins_mem(
    input wire rst,
	input [31:0] addr,
	output reg [31:0] ins
);
	reg [31:0] mem [1023:0];
	
//	initial begin
//		$readmemb("sum10_ins_bin.mem", mem, 0, 1023);
//		$monitor("Time:%0t | PC = %d, ins = %b", $time, addr[9:0], mem[addr[9:0]]);
//	end
    
    always@(posedge rst) begin
        mem[0] <= 32'b01000100000000010000000000000000;
        mem[1] <= 32'b10001100001000000000000000000100;
        mem[2] <= 32'b00000000010000010001000000000001;
        mem[3] <= 32'b00001000001000010000000000000001;
        mem[4] <= 32'b10000011111111111111111111111101;
        mem[5] <= 32'b10010000000000000000000000000000;
    end
    
	always @(*) begin 
//		 $display("PC = %d, ins = %b", addr[9:0], mem[addr[9:0]]);
		ins = mem[addr[9:0]];
	end
endmodule