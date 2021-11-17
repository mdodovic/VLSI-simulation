module stavka_c (
    rst_n, clk, data_in, control, data_out
);

    input rst_n, clk;
    input [3:0] data_in;
    input [2:0] control;

    output [3:0] data_out;

    reg [3:0] data_out_reg;
    reg [3:0] data_out_next;
    assign data_out = data_out_reg;

    always @(posedge clk, negedge rst_n) begin
        if(!rst_n)
            data_out_reg <= 4'h0;
        else
            data_out_reg <= data_out_next;            
    end

    reg enable;
    reg double;
    reg operation;
     
    reg [3:0] temporary_operand;
    always @(*) begin
        data_out_next = data_out_reg;
        enable = control[0];
        double = control[1];
        operation = control[2];

        if(enable == 1'b1) begin
            temporary_operand = data_in;
            if (double == 1'b1) 
                temporary_operand = temporary_operand * 2;
            // else - temporary operand remains data_in
            
            if(operation == 1'b0)
                data_out_next = temporary_operand;
            else
                data_out_next = temporary_operand + 1;

        end
        // else - no change of out register


    end

endmodule