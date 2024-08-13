module fulladder(s,c,a,b,c0);
    input a,b,c0;
    output s,c;
    assign s = a^b^c0;
    assign c = a&b | b&c0 | c0&a;
endmodule