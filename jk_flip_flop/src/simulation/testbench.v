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

        #85;
        rst_n = 1'b0;
        #1;
        rst_n = 1'b1;


        #67;
        $finish;    

    end

    always begin
        #5;
        clk = ~clk;
    end

    always begin
        repeat(1000) begin
            #7;
            k = ~k;                
            #7;
            j = ~j;                
            #7;
            k = ~k;                
            #7;
            j = ~j;
            k = ~k;                
            #7;
            k = ~k;                
        end
    end

endmodule
