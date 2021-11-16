module testbench;

    reg clk, rst_n, t;
    wire q;

    dut tff(.clk(clk), .rst_n(rst_n), .t(t), .q(q));

    initial begin
        clk = 1'b0;
        rst_n = 1'b1;
        t = 1'b0;

        #5;
        rst_n = 1'b0;
        #1;
        rst_n = 1'b1;

        #42;
        rst_n = 1'b0;
        #1;
        rst_n = 1'b1;

        #44;
        $finish;


    end

    always begin
        #5;
        clk = ~clk;
    end

    always begin
        repeat(1000) begin
            #3;
            t = ~t;
        end
    end

endmodule
