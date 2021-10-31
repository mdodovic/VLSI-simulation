module dut(clk, rst_n, ld, inc, in, out);

	input clk, rst_n, ld, inc;
	input [7:0] in;
	output reg [7:0] out;

	always @(posedge clk, negedge rst_n) begin
		
		if(!rst_n)
			out <= 8'h00;
		else 
			// if both inc and ld singals are active, ld should be treated first
			if (ld)
				out <= in;
			else 
				if(inc) begin
					// out <= out + 8'h01; - this is the best way
					// but this approach is funny
					out <= out + {{7{1'b0}}, 1'b1};
								// ^ this will repeat value 0 for 7 times => 0000000
										//  ^ and concate it with 1 will give => 00000001 

				end
	end
	
endmodule
