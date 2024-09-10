module CLKDiv(clk_in, clk_out);
// Board Frequency = 100 MHz = 10^8 Hz
    input clk_in;
    output reg clk_out;
    reg[27:0] counter = 28'd0;
    parameter DIVISOR = 28'd100000000; // Output frequency = 1Hz
    
    always @(posedge clk_in)
    begin
     counter <= counter + 28'd1;
     if(counter>=(DIVISOR-1))
      counter <= 28'd0;
     clk_out <= (counter<DIVISOR/2)?1'b1:1'b0;
    end
endmodule