module testbench;

	reg x[4:0];
	wire m[4:0];

	days_counter counter(x[0], x[1], x[2], x[3], x[4], m[0], m[1], m[2], m[3]);

	integer i;

	initial begin
		for (i = 0; i < 2 ** 5; i = i + 1) begin
			{x[4], x[0], x[1], x[2], x[3]} = i;
			#5;
		end
		$finish;
	end

	initial begin
		$monitor("time = %3d, leap year = %b, month_number = %b%b%b%b, m28 = %b, m29 = %b, m30 = %b, m31 = %b", $time, x[4], x[0], x[1], x[2], x[3], m[0], m[1], m[2], m[3]);		
	end

endmodule
