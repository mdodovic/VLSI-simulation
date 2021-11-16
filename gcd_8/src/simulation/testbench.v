module testbench;

	reg clk, rst_n;
	reg [7:0] a;
	reg [7:0] b;
	wire [7:0] out;
	

	gcd_8 greatest_common_divisor(clk, rst_n, a, b, out);

	initial begin
		clk = 1'b0;
		rst_n = 1'b1;
		a = 8'h00;
		b = 8'h00;

		#2;
		rst_n = 1'b0;
		#1;
		rst_n = 1'b1;

		repeat(100) begin
			#10;
			a = $urandom_range(255);
			b = $urandom_range(255);
		end

		#10; 
		$finish;

	end

	always begin
		#5; 
		clk = ~clk;
	end

	always @(out) begin
		$display("TIME = %4d, A = %d, B = %d, GCD = %d", $time, a, b, out);
	end

endmodule
