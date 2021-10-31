module dut (
	clk, rst_n, d, q
);

	input clk, rst_n, d;
	output q;

	// every signal creates 2 helper
	reg q_reg, q_next; // _reg and _next helper are going to be chaned
	assign q = q_reg; // when q is changed by continual assign, change q_reg immediatelly
		

	// clk:: on every change BUT on rising edge: posedge
	// rst_n:: on every drop from 1 to 0: negedge
	always @(posedge clk, negedge rst_n) begin
		// divide into sequential and combinational logic
		// this remains sequential: acts on risign edge chage clk and falling egde rst_n

		// here, q_REG is changed: registers should be changed only on clock tick and async reset
		// all _reg will be changed in this block
		if (!rst_n) // seqiential logic
			// q <= 0;	// non-blocking assignment
			// - this is combinational logic
			q_reg <= 0; // 
		else
			// q <= d; - this is combinational logic
			q_reg <= q_next; // this is created based on comment in always @(d) block
							 // we are interested in the last change of q_next on clk change, it is not important what happened between 2 clocks

		// <= is non-blocking assign
		// in sequential module, this assign should be used, why?
		// on clk, we need changes to be happened at the same time, not in a sequential order.
		// //q_reg is 1
		// q_reg <= 0;
		// q_next <= q_reg;
		// after this non-blocking assing, q_req will be 0, BUT q_next will be 1, not 0 because those 2 assigns has happened at the same time
	end

	always @(d) begin 
		// combinational logic, acts on every input singals, exept clk and rst_n
		// input signals, in this case d, can be changed in any moment
		// BUT that change can only be seen on clk rising edge signal
		// Here we should collect every change, but the last change is only important, and it will be collected on clk signal
		q_next = d;
	end

endmodule