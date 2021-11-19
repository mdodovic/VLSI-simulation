module stavka_d;

    reg rst_n;
    reg clk;
    reg [3:0] data_in;
    reg [2:0] control;
    wire [3:0] data_out;
    wire [7:0] counter;

    stavka_c doubler_and_shifter(rst_n, clk, data_in, control, data_out, counter);

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        data_in = 4'h0;
        control = 3'h0;

        #7;
        rst_n = 1'b1;

        repeat(100) begin
            #10;
            data_in = $urandom_range(16);
            control = $urandom_range(8);
        end

        $finish;
    end

    always begin
        #5;
        clk = ~clk;
    end

    initial begin
        $monitor("time = %3d, dut_data_in = %b, dut_control = %b, dut_data_out = %b, counter = %2d", $time, data_in, control, data_out, counter);
    end

endmodule