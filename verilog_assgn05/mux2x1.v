module mux2x1(
    input wire X, Y, sel,
    output wire Z
    );
    
    wire selc, t1, t2;
    not g1(selc, sel);
    and g2(t1, X, selc);
    and g3(t2, Y, sel);
    or g4(Z, t1, t2);

endmodule