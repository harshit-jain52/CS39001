module data_mem(
    input [31:0] addr,
    input [31:0] wrData,
    input wrMem, rdMem,
    output reg signed[31:0] rdData
);

    reg signed[31:0] mem[0:1023];

    initial begin
		$readmemh("data_mem.txt", mem, 0, 1023);	
	end

    always @(*) begin
        if(wrMem) begin
            mem[addr[9:0]] <= wrData;
        end
        if(rdMem) begin
            rdData <= mem[addr[9:0]];
        end
    end

endmodule