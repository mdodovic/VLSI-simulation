module gcd_8(clk, rst_n, a, b, out);

	input clk, rst_n;
	input [7:0] a;
	input [7:0] b;

	output [7:0] out;
	reg [7:0] out_reg;
	reg [7:0] out_next;
	assign out = out_reg;

	reg [7:0] i;

	always @(posedge clk, negedge rst_n) begin
		if(!rst_n)
			out_reg <= 8'h00;
		else
			out_reg <= out_next;			
	end
	
	always @(*) begin
		out_next = out_reg;

		for (i = 8'h00; i <= a || i <= b; i = i + 8'h01) begin
			if(a % i == 0 && b % i == 0)
				out_next = i;
		end

	end	

endmodule
