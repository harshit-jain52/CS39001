module cla16bit_tb();
  reg [15:0] a, b;
  reg cin;
  
  wire [15:0] s;
  wire cout;
  
  cla16bit CLA16_0(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
  
  initial begin 
    $monitor("time = %0d, a = %b, b = %b, cin = %b, s = %b, cout = %b", $time, a, b, cin, s, cout);
    a = 65535; b = 65535; cin = 0;
    #5 a = 65535; b = 65535; cin = 1;
    #5 a = 65535; b = 0; cin = 1;
   
  end
  
endmodule
