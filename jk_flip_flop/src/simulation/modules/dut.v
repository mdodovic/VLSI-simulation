module dut(clk, rst_n, j, k, q);

	input clk, rst_n, j, k;

	output q;
	reg q_reg, q_next;
	assign q = q_reg;

	always @(posedge clk, negedge rst_n) begin
		
		if(!rst_n)
			q_reg <= 0;
		else
			q_reg <= q_next;
	end

	always @(j, k) begin
		case ({j,k})
			2'b00: begin
				q_next = q_reg;
			end 
			2'b01: begin
				q_next = 0;
			end 
			2'b10: begin
				q_next = 1;
			end 
			2'b11: begin
				q_next = ~q_reg;
			end 
		endcase
	end

endmodule
