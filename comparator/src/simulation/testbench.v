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

	always @(*) begin
		$display("time = %3d, x = %b, z = %b", $time, x, z);
	end

endmodule
