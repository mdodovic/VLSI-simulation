module testbench;

	reg i0, i1, i2, i3;
	reg s0, s1;
	wire out;
	integer index;

	dut m41(i0, i1, i2, i3, {s1, s0}, out);

	initial begin

		for (index = 0; index < 64; index = index + 1) begin
			{s1, s0, i3, i2, i1, i0} = index;		
			#5;
		end
		
		$finish;

	end

/*

	initial begin

		i0 = 1'b0;
		i1 = 1'b0;
		i2 = 1'b0;
		i3 = 1'b0;
		{s1, s0} = 2'b00;

		#320 $finish;

	end

	always #5 i0 = ~i0; // after 5 units of time, change i0
	always #10 i1 = ~i1; // after 10 units of time, change i1
	always #20 i2 = ~i2; // after 20 units of time, change i2
	always #40 i3 = ~i3; // after 40 units of time, change i3
	always #80 s0 = ~s0; // after 80 units of time, change s[0]
	always #160 s1 = ~s1; // after 160 units of time, change s[1]
*/

endmodule
