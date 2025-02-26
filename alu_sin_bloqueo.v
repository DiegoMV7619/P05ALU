module ALU_SIN_BLOQ (
	input [31:0] i_ul_a,
	input [31:0] i_ul_b,
	input [2:0]i_u3_sel,
	input clk,
	
	output reg [31:0] o_ul_r,
	output reg o_bi_zflag
);

always @ (posedge clk) begin
	case (i_u3_sel)
		3'b000:
			begin
			o_ul_r = i_ul_a + i_ul_b;
			end
		3'b001:
			begin
			o_ul_r = i_ul_a & i_ul_b;
			end
		3'b010:
			begin
			o_ul_r = i_ul_a | i_ul_b;
			end
		3'b011:
			begin
			o_ul_r = i_ul_a * i_ul_b;
			end
		3'b100:
			begin
			o_ul_r = i_ul_a - i_ul_b;
			end
		3'b101:
			begin
			o_ul_r = (i_ul_a < i_ul_b)?32'b00000000000000000000000000000001:32'b00000000000000000000000000000000;
			end		
		default:
			o_ul_r = 32'b00000000000000000000000000000000;
	endcase
	
	if (o_ul_r == 32'b00000000000000000000000000000000) begin
		o_bi_zflag = 1'b1;
	end
	else begin
		o_bi_zflag = 1'b0;
	end
end

endmodule