module VendingMachineFSM_tb;

  reg clk;
  reg rst;
  reg [1:0] data;
  wire [1:0] change;
  wire product;

  VendingMachineFSM uut (
    .clk(clk),
    .rst(rst),
    .data(data),
    .change(change),
    .product(product)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst = 1;
    data = 2'b00;
    #10 rst = 0;
    
    data = 2'b01; #10;
    data = 2'b00; #10;
    
    data = 2'b01; #10;
    data = 2'b10; #10;
    
    data = 2'b00; #10;
    data = 2'b10; #10;
    
    data = 2'b01; #10;
    data = 2'b10; #10;
    
    data = 2'b10; #10;
    data = 2'b00; #10;
    
    $finish;
  end

endmodule
