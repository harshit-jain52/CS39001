module halfadder_tb();
    // Inputs
    reg a,b;

    // Outputs
    wire s,c;

    halfadder HA1(.a(a), .b(b), .s(s), .c(c));

    initial begin
        // Monitor the changes
        $monitor("time = %0d, a = %b, b = %b, s = %b, c = %b", $time, a, b, s, c);
        
        // Stimulus to verify the working of the half adder
        a = 1'b0; b = 1'b0;
        #5 a = 1'b0; b = 1'b1;
        #5 a = 1'b1; b = 1'b0;
        #5 a = 1'b1; b = 1'b1;
        #5 $finish;
    end 
endmodule