module sd101_mealy_tb;

  reg din, clk, rst;
  wire dout;
  wire [1:0] PS_out, NS_out;

  // Instantiate the Mealy Machine
  sd101_mealy uut (
    .din(din),
    .clk(clk),
    .rst(rst),
    .dout(dout),
    .PS_out(PS_out),
    .NS_out(NS_out)
  );

  // Clock Generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test Stimulus
  initial begin
    rst = 1;
    din = 0;
    #10 rst = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 0;
    #20 $finish;
  end

endmodule

