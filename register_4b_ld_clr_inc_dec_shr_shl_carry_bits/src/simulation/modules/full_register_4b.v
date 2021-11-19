module full_register_4b (
	rst_n, clk, ld, clr, inc, dec, shr, shl, input_carry, data_in, data_out, output_carry
);

	input rst_n, clk;
	input ld, clr, inc, dec, shr, shl;
	//    1    2    3    4    5    6  
	input input_carry;     
	input [3:0] data_in;
	
	output [3:0] data_out;
	reg [3:0] data_out_reg;
	reg [3:0] data_out_next;
	assign data_out = data_out_reg;

	output output_carry;
	reg output_carry_reg;
	reg output_carry_next;
	assign output_carry = output_carry_reg;

	always @(posedge clk, negedge rst_n) begin
		
		if(!rst_n) begin
			data_out_reg <= 4'h0;
			output_carry_reg <= 1'b0;
		end 
		else begin
			data_out_reg <= data_out_next;
			output_carry_reg <= output_carry_next;
		end

	end

	always @(*) begin
		data_out_next = data_out_reg;
		output_carry_next = output_carry_reg;

		// ld, clr, inc, dec, shr, shl;
		// 1    2    3    4    5    6  

		if(ld == 1'b1) begin
			data_out_next = data_in;
			output_carry_next = 1'b0;
		end 
		else begin
			if(clr == 1'b1) begin
				data_out_next = 4'h0;
				output_carry_next = 1'b0;
			end 
			else begin
				if(inc == 1'b1) begin
					data_out_next = data_out_reg + 4'h1;
					output_carry_next = 1'b0;
				end 	
				else begin
					if(dec == 1'b1) begin
						data_out_next = data_out_reg - 4'h1;
						output_carry_next = 1'b0;
					end
					else begin
						if(shr == 1'b1) begin
							output_carry_next = data_out_reg[0];
							data_out_next = {input_carry, data_out_reg[3:1]};							
						end
						else begin
							if(shl == 1'b1) begin
								output_carry_next = data_out_reg[3];
								data_out_next = {data_out_reg[2:0], input_carry};							
							end	
						end						
					end
				end
			end			
		end
		
	end

endmodule