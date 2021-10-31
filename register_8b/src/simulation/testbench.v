module testbench;

    reg clk, rst_n, ld, inc;
    reg [7:0] in;
    wire [7:0] out;

    dut register(clk, rst_n, ld, inc, in, out);

    initial begin
        clk = 1'b0;
        rst_n = 1'b0; 

        ld = 1'b0;
        inc = 1'b0;
        in = 8'h00;

        #2 rst_n = 1'b1;
        repeat (1000) begin
            // how much time repeat inner actions
            #5;
            ld = {$random} % 2; // $random gives random number, that can be both positive and negative; 
            // {} removes sign, % 2 is mod by 2, so we use last binary digit
            inc = $urandom %2; // $urandom - unsigned random, which are authomatically positive
            in = $urandom_range(255); // $urandom_range return random number from 0 to 255.
        end

        #10 
        $finish;

    end

    always begin
        #5
        clk = ~clk;
    end

endmodule
