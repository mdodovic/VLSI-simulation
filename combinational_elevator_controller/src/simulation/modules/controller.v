module controller (input_floor, output_description);
    
    input [3:0] input_floor;
    output reg [1:0] output_description; // 00 - P, 01 - S, 10 - G, 11 - Error

    always @(input_floor) begin

        if ((4'd0 <= input_floor && input_floor <= 4'd2) || (input_floor == -4'd4)) begin
            output_description = 2'b00;
        end
        else if (4'd3 <= input_floor && input_floor <= 4'd7) begin
            output_description = 2'b01;
        end 
        else if (-4'd3 <= input_floor && input_floor <= -4'd1) begin
            output_description = 2'b10;
        end 
        else begin
            output_description = 2'b11;
        end
    end
    
endmodule