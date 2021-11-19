module testbench;

	reg rst_n, clk, ld, clr, inc, dec, shr, shl, input_carry;
	reg [3:0] data_in;
	wire [3:0] data_out;
	wire output_carry;

	full_register_4b full_register(rst_n, clk, ld, clr, inc, dec, shr, shl, input_carry, data_in, data_out, output_carry);

	initial begin
		rst_n = 1'b1;
		clk = 1'b0;
		
		ld = 1'b0;
		clr = 1'b0;
		inc = 1'b0;
		dec = 1'b0; 
		shr = 1'b0; 
		shl = 1'b0; 

		input_carry = 1'b0;
		data_in = 4'h0;

		#6;
		rst_n = 1'b0;
		#1;
		rst_n = 1'b1;

		repeat(1000) begin

			ld  = $urandom_range(1);
			clr = $urandom_range(1);
			inc = $urandom_range(1);
			dec = $urandom_range(1); 
			shr = $urandom_range(1); 
			shl = $urandom_range(1); 

			input_carry = $urandom_range(1); 
			data_in = $urandom_range(16); 

			#10;
		end	
		$finish;
	end

	always begin
		#5;
		clk = ~clk;
	end

endmodule
