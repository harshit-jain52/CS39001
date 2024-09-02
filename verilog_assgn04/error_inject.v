module error_inject(
    input wire clk, rst,
    input wire data_in, strobe_in,
    output wire data_out, strobe_out,
    input wire [1:7] signal,
    output wire [1:7] d_error
);
    wire [1:7] d_orig;
    
    receiver REC(.clk(clk),.rst(rst),.data_line(data_in),.strobe(strobe_in),.data_out(d_orig));
    assign d_error = d_orig ^ signal;
    sender SEN(.clk(clk),.rst(rst),.data_line(data_out),.strobe(strobe_out),.data_in(d_error));
endmodule