module testbench;

	reg x[3:0];
	wire z[2:0];

	comparator c(x[0], x[1], x[2], x[3], z[0], z[1], z[2]);

	integer i;

	initial begin
		for (i = 0; i < 2**4; i = i + 1) begin
			{x[3], x[2], x[1], x[0]} = i;
			#10;
		end		
		$finish;
	end
/*
	always @(z[2], z[1], z[0]) begin
		$display("time = %3d, x = %b%b%b%b, z = %b%b%b", $time, x[3], x[2], x[1], x[0], z[2], z[1], z[0]);
	end
*/
	initial begin
		$monitor("time = %3d, x = %b%b%b%b, z = %b%b%b", $time, x[3], x[2], x[1], x[0], z[2], z[1], z[0]);		
	end

endmodule
