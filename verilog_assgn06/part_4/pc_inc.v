module pc_inc(
    input wire [31:0] PC,
    output wire [31:0] NPC
);

    adderN #(.N(32)) ADD(.S(NPC), .A(PC), .B(1));

endmodule