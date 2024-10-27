module data_mem(
    input wire clk,
    input [31:0] addr,
    input [31:0] wrData,
    input wrMem, rdMem,
    output reg signed [31:0]rdData
);

    reg signed [31:0] mem [0:1023];

    initial begin
		$readmemh("data_hex.mem", mem, 0, 1023);
		
		$monitor("Time: %0t | mem[0]: %d", $time, mem[0]);
        $monitor("Time: %0t | mem[1]: %d", $time, mem[1]);
        $monitor("Time: %0t | mem[2]: %d", $time, mem[2]);
        $monitor("Time: %0t | mem[3]: %d", $time, mem[3]);
        $monitor("Time: %0t | mem[4]: %d", $time, mem[4]);
        
//        $monitor("Time=%0t|addr=%b",$time,addr[9:0]);

	end

    always @(posedge clk) begin
        if(wrMem) begin
            mem[addr[9:0]] <= wrData;
        end
        if(rdMem) begin
            rdData <= mem[addr[9:0]];
        end
    end

endmodule