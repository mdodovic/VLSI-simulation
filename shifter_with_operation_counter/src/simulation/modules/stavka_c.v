module stavka_c (rst_n, clk, data_in, control, data_out);

    input rst_n;
    input clk;
    input [3:0] data_in;
    input [2:0] control;
    output [3:0] data_out;
    
    reg [3:0] data_out_reg;
    reg [3:0] data_out_next;

    assign data_out = data_out_reg;

    reg enable;
    reg double;
    reg operation;
    reg [3:0] operand;

    always @(posedge clk, negedge rst_n) begin
        if(!rst_n)
            data_out_reg <= 4'h0;
        else
            data_out_reg <= data_out_next;
    end 

    always @(*) begin
        data_out_next = data_out_reg;

        enable = control[0];
        double = control[1];
        operation = control[2];

        if(enable == 1'b1) begin
            if(operation == 1'b1) begin
                data_out_next = data_out_reg + 4'h1;
            end 
            else begin
                if(double == 1'b0)
                    operand = data_in;
                else
                    operand = data_in << 1'b1;
                data_out_next = operand;
            end
        end

    end

endmodule