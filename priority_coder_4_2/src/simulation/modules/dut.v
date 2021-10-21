module dut (
	I, Y, W
);

	input [3:0] I;
	output reg [1:0] Y;
	output reg W;
	
	always @(I) begin

		casex (I)
			4'b0001: begin
				Y = 2'b00;
				W = 1'b1;
			end

			4'b001x: begin
				Y = 2'b01;
				W = 1'b1;
			end

			4'b01xx: begin
				Y = 2'b10;
				W = 1'b1;
			end

			4'b1xxx: begin
				Y = 2'b11;
				W = 1'b1;
			end

			default: begin
				Y = 2'b00;
				W = 1'b0;
			end

		endcase

	end

endmodule