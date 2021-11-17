module stavka_d;

    reg rst_n, clk;
    reg [3:0] data_in;
    reg [2:0] control;
    wire [3:0] data_out;

    stavka_c register(rst_n, clk, data_in, control, data_out);
    
    initial begin
        clk = 1'b0;
        rst_n = 1'b1;
        data_in = 4'h0;
        control = 3'h0;

        #5;
        rst_n = 1'b0;
        #1;
        rst_n = 1'b1;


        repeat(100) begin
            data_in = $urandom_range(16);
            control = $urandom_range(8);
            #10;
        end

        $finish;

    end

    always begin
        #5;
        clk = ~clk;
    end

    always @(*) begin
        $display("time = %3d, dut_data_in = %b, dut_control = %b, dut_data_out = %b", $time, data_in, control, data_out);
    end

endmodule