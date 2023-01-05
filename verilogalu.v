module verilogalu(A, B, OP, Neg, R);

input [3:0] A;
input [3:0] B;
input [1:0] OP;

output Neg;
output [4:0] R;

reg temp_neg;
reg [4:0] temp_R;

always @(*)
	begin
		case (OP)
			2'b00: temp_R<=A&B;
			2'b10: temp_R<=A|B;
			2'b01: temp_R<=A+B;
			2'b11:
				begin 
				temp_R<=A+(~B)+1;
				if (B>A)
					temp_neg <= 1'b1;
				else 
					temp_neg <= 1'b0;
				end
			endcase		
	end
assign R=temp_R;
assign Neg= temp_neg;
endmodule
