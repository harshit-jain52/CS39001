module program_counter(
    input rst,clk,updPC,
    input [31:0] PCin,
    output reg [31:0] PCout
);
    // initial begin 
    //     PCout <= 0; 
    // end

    always @(posedge clk)
    begin
        if(rst) begin
            PCout <= 0;
        end
        else if (updPC) begin
//            $display("UPDATING PC to %d", PCin);
            PCout <= PCin;
        end
    end

endmodule