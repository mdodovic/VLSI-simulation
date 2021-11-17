module stavka_a (
	data_in, control, data_out
);
	
	input [6:0] data_in;
	input control;

	output reg [7:0] data_out;

	integer zero_counter;
	integer one_counter;

	integer i;

	reg desired_output_bit;

	always @(*) begin
		$display(data_in, control);		
		for (i = 0; i < 6 ; i = i + 1) begin
			if(data_in[i] == 1'b0) 
				zero_counter = zero_counter + 1;
			else
				one_counter = one_counter + 1;
		end

		if(control == 1'b0) begin
			if(zero_counter > one_counter)
				desired_output_bit = 1'b1;
			else 
				desired_output_bit = 1'b0;
		end
		else begin
			if(one_counter > zero_counter)
				desired_output_bit = 1'b1;
			else 
				desired_output_bit = 1'b0;
		end

		data_out = {data_in[6], data_in[5], data_in[4], data_in[3], desired_output_bit, data_in[2], data_in[1], data_in[0]};

	end


endmodule