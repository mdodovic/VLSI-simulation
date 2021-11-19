module testbench;

    reg rst_n;
    reg clk;
    reg clr;
    reg ld;
    reg inc;
    reg shr;
    reg [3:0] data_in;
    
    wire [3:0] data_out;
    wire right_carry;


    register_ld_clr_inc_shr r(rst_n, clk, clr, ld, inc, shr, data_in, data_out, right_carry);

    initial begin
        rst_n = 1'b1;
        clk = 1'b0;
        clr = 1'b0;
        ld = 1'b0;
        inc = 1'b0;
        shr = 1'b0;
        data_in = 4'h0;
        
        #6;
        rst_n = 1'b0;
        #1; 
        rst_n = 1'b1;

        repeat(100) begin
            clr     = $urandom_range(1);
            ld      = $urandom_range(1);
            inc     = $urandom_range(1);
            shr     = $urandom_range(1);
            data_in = $urandom_range(16);            
            #10;
        end

        $finish;
    end

    always begin
        #5;
        clk = ~clk;
    end
    
endmodule