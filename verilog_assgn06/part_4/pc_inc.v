module pc_inc(
    input wire [31:0] PC,
    output wire [31:0] NPC
);
    incN #(.N(32)) INC(.C(NPC), .A(PC));
endmodule