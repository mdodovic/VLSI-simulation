module testbench;

	reg [3:0] i;
	wire [1:0] out;
	wire w;

	dut cd4_1(.I(i), .Y(out), .W(w));

	initial begin
		i = 4'b0;
		#10;
		i = 4'hF;
		#10;
		i = 4'h5;
		#10;
		i = 4'h2;
		#10;
		i = 4'h1;
				
		#10 
		$finish;

	end

endmodule
