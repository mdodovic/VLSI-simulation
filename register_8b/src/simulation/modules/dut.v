module dut(clk, rst_n, ld, inc, in, out);

	input clk, rst_n, ld, inc;
	input [7:0] in;
	output /*reg*/ [7:0] out;

	reg [7:0] out_reg;
	reg [7:0] out_next;
	assign out = out_reg;

	always @(posedge clk, negedge rst_n) begin
		
		if(!rst_n)
			// out <= 8'h00;
			out_reg <= 8'h00;
		else 
			// if both inc and ld singals are active, ld should be treated first
			/*			
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
			*/
			out_reg <= out_next;
	end
	
	always @(ld, inc, in, out) begin
		// combinational block
		// sensitivity list, first create logic, then see what has been used.

		out_next = out_reg; // always it is good, to set out_next to value that is previous active value
		// this is good because if-than-else structure may not assign out_next

		if (ld)
				out_next = in;
		else 
			if(inc)
				out_next <= out + {{7{1'b0}}, 1'b1};
			// in this else out_next will reamin same, so safety assign in the begining of the always block

	end

endmodule
