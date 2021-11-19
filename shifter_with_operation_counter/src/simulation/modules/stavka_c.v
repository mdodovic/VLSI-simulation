module stavka_c (rst_n, clk, data_in, control, data_out, counter);

    input rst_n;
    input clk;
    input [3:0] data_in;
    input [2:0] control;
    output [3:0] data_out;
    output [7:0] counter;

    reg [3:0] data_out_reg;
    reg [3:0] data_out_next;
    assign data_out = data_out_reg;

    reg [7:0] counter_reg;
    reg [7:0] counter_next;
    assign counter = counter_reg;


    reg enable;
    reg double;
    reg operation;
    reg [3:0] operand;

    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            data_out_reg <= 4'h0;
            counter_reg <= 8'h00;
        end
        else begin
            data_out_reg <= data_out_next;
            counter_reg <= counter_next;
        end
    end 

    always @(*) begin
        data_out_next = data_out_reg;
        counter_next = counter_reg;
    
        enable = control[0];
        double = control[1];
        operation = control[2];

        if(enable == 1'b1) begin
            if(operation == 1'b1) begin
                data_out_next = data_out_reg + 4'h1;
                counter_next = counter_reg + 8'h01;
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