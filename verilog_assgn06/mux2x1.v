module mux2x1(
    input wire d0, d1, sel,
    output wire Z
    );
    
    wire selc, t1, t2;
    not g1(selc, sel);
    and g2(t1, d0, selc);
    and g3(t2, d1, sel);
    or g4(Z, t1, t2);

endmodule