module testbench;

	reg clk, rst_n, j, k;
    wire q;

    dut jkff(clk, rst_n, j, k, q);

    initial begin
        clk = 1'b0;
        rst_n = 1'b1;
        {j, k} = 2'b00;

        #5;
        rst_n = 1'b0;
        #1;
        rst_n = 1'b1;

        #7;
        k = 1;                
        #7;
        j = 1;                
        #7;
        k = 0;                
        #7;
        j = 1;
        k = 1;                
        #7;
        j = 1;
        k = 0;                

        #3;
        $finish;    

    end

    always begin
        #5;
        clk = ~clk;
    end

endmodule
