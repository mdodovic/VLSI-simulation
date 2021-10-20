module testbench;

	reg i [1:0], e, s0;
	wire out;
	integer j;

	dut m21_e(.I0(i[0]), .I1(i[1]), .S0(s0), .E(e), .Y(out));

	initial begin

		for (j = 0; j < 2; j = j + 1) begin
			i[j] = 1'b0;			
		end

		s0 = 1'b0;
		e  = 1'b0;
		#10 
		i[0] = 1'b1;
		#10 
		s0 = 1'b1;
		e = 1'b1;
		#10 
		i[1] = 1'b1;
		#10 
		$finish;
	end

	initial begin
		$monitor("Time: %2d, Out: %d", $time, out); 		
		//$monitoroff;
	end

endmodule


