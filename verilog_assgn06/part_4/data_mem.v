module data_mem(
    input wire clk, rst,
    input [31:0] addr,
    input [31:0] wrData,
    input wrMem, rdMem,
    output reg signed [31:0]rdData
);

    reg signed [31:0] mem [0:1023];

//    initial begin
//		$readmemb("sum10_data_bin.mem", mem, 0, 1023);
		
//		$monitor("Time: %0t | mem[0]: %d", $time, mem[0]);
//        $monitor("Time: %0t | mem[1]: %d", $time, mem[1]);
//        $monitor("Time: %0t | mem[2]: %d", $time, mem[2]);
//        $monitor("Time: %0t | mem[3]: %d", $time, mem[3]);
//        $monitor("Time: %0t | mem[4]: %d", $time, mem[4]);
//        $monitor("Time: %0t | mem[5]: %d", $time, mem[5]);
//        $monitor("Time: %0t | mem[6]: %d", $time, mem[6]);
//        $monitor("Time: %0t | mem[7]: %d", $time, mem[7]);
//        $monitor("Time: %0t | mem[8]: %d", $time, mem[8]);
//        $monitor("Time: %0t | mem[9]: %d", $time, mem[9]);
        
//        $monitor("Time=%0t|addr=%b",$time,addr[9:0]);

//	end

//    always @(posedge clk) begin
//        if(wrMem) begin
//            mem[addr[9:0]] <= wrData;
//        end
//        if(rdMem) begin
//            rdData <= mem[addr[9:0]];
//        end
//    end

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            // Sum of natural numbers till 10
//            mem[0] <= 32'b00000000000000000000000000001010;

            // Insertion sort of 10 integers 
            mem[0] <= 32'd57;
            mem[1] <= 32'd23;
            mem[2] <= 32'd89;
            mem[3] <= 32'd45;
            mem[4] <= 32'd76;
            mem[5] <= 32'd12;
            mem[6] <= 32'd34;
            mem[7] <= 32'd98;
            mem[8] <= 32'd67;
            mem[9] <= 32'd29;
        end
        else begin
            if(wrMem) begin
                mem[addr[9:0]] <= wrData;
            end
            if(rdMem) begin
                rdData <= mem[addr[9:0]];
            end
        end
    end

endmodule