module dut (
	clk, rst_n, d, q
);

	input clk, rst_n, d;
	output reg q;

	// clk:: on every change BUT on rising edge: posedge
	// rst_n:: on every drop from 1 to 0: negedge
	always @(posedge clk, negedge rst_n) begin

		if (!rst_n)
			q = 0;			
		else
			q = d;

	end

endmodule