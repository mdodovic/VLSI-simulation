module dut(clk, rst_n, t, q);

	input clk, rst_n, t;
	output q;

	reg q_reg, q_next;
	assign q = q_reg;

	always @(posedge clk, negedge rst_n) begin
		
		if(!rst_n)
			q_reg <= 0;
		else
			q_reg <= q_next;	
	end

	always @(t) begin
		if(t)
			q_next = ~q_reg;
		else
			q_next = q_reg;
	end

endmodule
