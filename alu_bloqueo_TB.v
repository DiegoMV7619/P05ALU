`timescale 1ns / 1ns

module alu_bloqueo_TB ();
	reg [31:0] i_ul_a;
	reg [31:0] i_ul_b;
	reg [2:0] i_u3_sel;
	reg clk;
	
	wire [31:0] o_ul_r;
	wire o_bi_zflag;
	
ALU_BLOQ TB1 (
		.i_ul_a(i_ul_a),
		.i_ul_b(i_ul_b),
		.i_u3_sel(i_u3_sel),
		.clk(clk),
		.o_ul_r(o_ul_r),
		.o_bi_zflag(o_bi_zflag)
);

initial begin
    clk = 0; 
    forever #5 clk = ~clk;  
end

initial begin
	i_ul_a = 32'b00000000000000000000000000000000;
	i_ul_b = 32'b00000000000000000000000000000000;
	i_u3_sel = 3'b111;
	#100;
	
	i_ul_a = 32'b00001100000001000001100000100000;
	i_ul_b = 32'b00100100001000001000000100000000;
	i_u3_sel = 3'b000;	
	#100;
	
	i_u3_sel = 3'b001;	
	#100;

	i_u3_sel = 3'b010;	
	#100;
	
	i_u3_sel = 3'b011;	
	#100;
	
	i_u3_sel = 3'b101;	
	#100;

end

endmodule
