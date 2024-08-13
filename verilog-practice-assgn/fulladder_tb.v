module fulladder_tb();
    // Inputs
    reg a,b,c0;

    // Outputs
    wire s,c;

    fulladder FA1(.a(a), .b(b), .c0(c0), .s(s), .c(c));

    initial begin
        // Monitor the changes
        $monitor("time = %0d, a = %b, b = %b, c0 = %b, s = %b, c = %b", $time, a, b, c0, s, c);
        
        // Stimulus to verify the working of the full adder
        a = 1'b0; b = 1'b0; c0 = 1'b0;
        #5 a = 1'b0; b = 1'b0; c0 = 1'b1;
        #5 a = 1'b0; b = 1'b1; c0 = 1'b0;
        #5 a = 1'b0; b = 1'b1; c0 = 1'b1;
        #5 a = 1'b1; b = 1'b0; c0 = 1'b0;
        #5 a = 1'b1; b = 1'b0; c0 = 1'b1;
        #5 a = 1'b1; b = 1'b1; c0 = 1'b0;
        #5 a = 1'b1; b = 1'b1; c0 = 1'b1;
        #5 $finish;
    end 
endmodule