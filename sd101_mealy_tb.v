module sd101_mealy_tb;

  // Inputs
  reg din;
  reg clk;
  reg rst;

  // Outputs
  wire dout;

  // Instantiate the Sequence Detector using Moore FSM
  sd101_mealy MEAL(.din(din), .clk(clk), .rst(rst), .dout(dout));

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end 

  // Stimulus
  initial begin
    // Initialize Inputs
    din = 0;
    rst = 1;
    #10;
    rst = 0;

    // Apply test sequence: 101
    #10 din = 1;
    #10 din = 0;
    #10 din = 1; 
    #10 din = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1; 
    #10 din = 0; 
    #10 din = 1; 
    #10 din = 0;

    #20 $finish;
  end
      
endmodule

