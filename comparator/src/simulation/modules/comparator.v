module comparator(x1, x2, x3, x4, z1, z2, z3);

	input x1, x2, x3, x4;
	output reg z1, z2, z3;

	reg [1:0] N1;
	reg [1:0] N2;

	always @(*) begin
		N1 = {x1, x2};
		N2 = {x3, x4};

		z1 = 1'b0;
		z2 = 1'b0;
		z3 = 1'b0;


		if(N1 > N2) begin
			z1 = 1'b1;
		end
		else begin
			if(N1 < N2) begin
				z3 = 1'b1;				
			end
			else begin
				z2 = 1'b1;
			end
		end 
			
	end
	
endmodule