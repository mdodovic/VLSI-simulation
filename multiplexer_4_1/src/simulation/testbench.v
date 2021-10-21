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

	always #5 i0 = ~i0; // after 5 units of time, change i0
	always #10 i1 = ~i1; // after 10 units of time, change i1
	always #20 i2 = ~i2; // after 20 units of time, change i2
	always #40 i3 = ~i3; // after 40 units of time, change i3
	always #80 s[0] = ~s[0]; // after 80 units of time, change s[0]
	always #160 s[1] = ~s[1]; // after 160 units of time, change s[1]


endmodule
