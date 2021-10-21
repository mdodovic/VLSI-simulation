module testbench;

	reg i0, i1, i2, i3;
	reg [1:0] s;
	wire out;

	dut m41(i0, i1, i2, i3, s, out);

	initial begin

		i0 = 1'b0;
		i1 = 1'b0;
		i2 = 1'b0;
		i3 = 1'b0;
		s = 2'b00;
		#320 $finish;
	end

	always begin
		#5 i0 = ~i0; // after 5 units of time, change i0
	end

//	always @(out)
//		$display("Vreme = %0d, Izlaz = %d", $time, out); 

endmodule
