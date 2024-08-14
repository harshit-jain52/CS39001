module fulladder(s,c,a,b,c0);
    input a,b,c0;
    output s,c;
    wire t1,t2,t3;
    xor g1(t1,a,b);
    xor g2(s,c0,t1);
    and g3(t2,a,b);
    and g4(t3,t1,c0);
    or g5(c,t2,t3);
endmodule