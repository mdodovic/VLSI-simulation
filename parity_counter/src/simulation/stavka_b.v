module stavka_b;

    reg [6:0] data_in;
    reg control;
    wire [7:0] data_out;

    stavka_b_test parity_bit_checker(.data_in(data_in), .control(control), .data_out(data_out));

    integer i;

    initial begin

        for (i = 0; i < 2 ** 8; i = i + 1) begin
            {data_in, control} = i;
            #5;
        end        

        $finish;

    end

    always @(data_out) begin
        $display("time = %4d, dut_data_in = %b, dut_control = %b, dut_data_out = %b", $time, data_in, control, data_out);
    end

endmodule