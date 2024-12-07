module sd101_moore(din,clk,rst,dout);
input din,clk,rst;
output reg dout;
parameter zero=2'b00,  one=2'b01, onezero=2'b10, onezeroone=2'b11;
reg [1:0] NS,PS; //present state and next state
always @(posedge clk or posedge rst)
begin
if(rst==1)
	PS<=zero;
else
	PS<=NS;
end
always @(din,PS)
begin
	case(PS)
	zero:begin
		if(din==1)
			NS=one;
		else
			NS=zero;
	end
	
	one:begin
		if(din==0)
			NS=onezero;
		else
			NS=one;
	end
	onezero:begin
		if(din==1)
			NS=onezeroone;
		else
			NS=zero;
	end
	onezeroone:begin
		if(din==0)
			NS=onezero;
		else
			NS=one;
	end
	default:NS=zero;
endcase
end
always @(PS)
begin
case(PS)
zero:dout=0;
one:dout=0;
onezero:dout=0;
onezeroone:dout=1;
default:dout=0;
endcase
end
endmodule
			
