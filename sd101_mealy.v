module sd101_mealy(din, clk, rst, dout);
input din, clk, rst;
output reg dout;
parameter zero = 2'b00, one = 2'b01, onezero = 2'b10;
reg [1:0] NS, PS; // Next State and Present State
// State Transition on Clock Edge
always @(posedge clk or posedge rst) begin
if (rst)
PS <= zero; // Reset to initial state
else
PS <= NS;   // Update to next state
end
// Next State Logic and Output Logic
always @(PS, din) begin
dout = 0; // Default output for all states
case (PS)
zero: begin
if (din == 1) begin
NS = one;
end else begin
NS = zero;
end
end
one: begin
if (din == 0) begin
NS = onezero;
end else begin
NS = one;
end
end
onezero: begin
if (din == 1) begin
NS = one;
dout = 1; // Output `1` when `din` is `1` in this state
end else begin
NS = zero;
end
end
default: NS = zero;
endcase
end
endmodule
