module testbench;

    reg clk, rst_n, d;
    wire q;

    dut dff(clk, rst_n, d, q);

    initial begin

        clk = 1'b0;        
        rst_n = 1'b1;
        d = 1'b0;


        # 42 // after 42 ticks
        rst_n = 1'b0;

        // # 0 // delay to be sure in the order of instructions
        # 1 // to be sure
        rst_n = 1'b1;

        #7 $finish;
    end

    always begin
        #5 
        clk = ~clk;
    end

    always begin
        #4 
        d = ~d;
    end

endmodule