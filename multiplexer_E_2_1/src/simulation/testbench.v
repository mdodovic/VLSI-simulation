module testbench;

	reg i0, i1, e, s0;
	wire out;

	dut m21_e(.I0(i0), .I1(i1), .S0(s0), .E(e), .Y(out));

	initial begin
		i0 = 1'b0;
		i1 = 1'b0;
		s0 = 1'b0;
		e  = 1'b0;
		#10 
		i0 = 1'b1;
		#10 
		s0 = 1'b1;
		e = 1'b1;
		#10 
		i1 = 1'b1;
		#10 
		$finish;
	end

	initial begin
		$monitor("Time: %2d, Out: %d", $time, out); 		
		//$monitoroff;
	end

endmodule
