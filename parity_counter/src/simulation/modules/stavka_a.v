module stavka_a (data_in, control, data_out);
    
    input [6:0] data_in;
    input control;
    output reg [7:0] data_out;

    integer zero_counter;
    integer one_counter;
    integer i;

    reg additional_bit;

    always @(*) begin
        zero_counter = 0;
        one_counter  = 0;
        additional_bit = 1'b0;

        for (i = 0; i < 7; i = i + 1) begin
            if(data_in[i] == 7'h00)
                zero_counter = zero_counter + 1;
            else 
                one_counter = one_counter + 1;
        end

        if(control == 1'b0) begin
            if(zero_counter > one_counter)
                additional_bit = 1'b1;
            else
                additional_bit = 1'b0;            
        end
        else begin
            if(zero_counter > one_counter)
                additional_bit = 1'b0;
            else
                additional_bit = 1'b1;                        
        end

        data_out = {data_in[6:4], additional_bit, data_in[3:0]};

    end

endmodule