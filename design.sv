module VendingMachineFSM(
  input clk,
  input rst,
  input [1:0] data,
  output reg [1:0] change,
  output reg product
);

  reg [1:0] p_state, n_state;
  parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;

  // Sequential block
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      p_state <= s0;
    end else begin
      p_state <= n_state;
    end
  end

  // Combinational block
  always @(*) begin
    case (p_state)
      s0: begin
        if (data == 2'b01) begin
          n_state = s1;
          change = 2'b00;
          product = 1'b0;
        end else if (data == 2'b10) begin
          n_state = s2;
          change = 2'b00;
          product = 1'b0;
        end else begin
          n_state = s0;
          change = 2'b00;
          product = 1'b0;
        end
      end

      s1: begin
        if (data == 2'b01) begin
          n_state = s2;
          change = 2'b00;
          product = 1'b0;
        end else if (data == 2'b10) begin
          n_state = s0;
          change = 2'b00;
          product = 1'b1;
        end else begin
          n_state = s0;
          change = 2'b01;
          product = 1'b0;
        end
      end

      s2: begin
        if (data == 2'b01) begin
          n_state = s0;
          change = 2'b00;
          product = 1'b1;
        end else if (data == 2'b10) begin
          n_state = s0;
          change = 2'b01;
          product = 1'b1;
        end else begin
          n_state = s0;
          change = 2'b10;
          product = 1'b0;
        end
      end

      default: begin
        n_state = s0;
        change = 2'b00;
        product = 1'b0;
      end
    endcase
  end

endmodule
