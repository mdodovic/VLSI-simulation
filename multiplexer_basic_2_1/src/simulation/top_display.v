module top_display; 

    reg i0, i1, s0; 
    wire out; 
    
    m21_dataflow m21(i0, i1, s0, out);
    
    initial begin
        i0 = 1'b0;
        i1 = 1'b0;
        s0 = 1'b0;
        
        #10
        i0 = 1'b1;
        
        #10
        s0 = 1'b1;
        
        #10
        i1 = 1'b1;
        
        #10
        $stop;
    end

    always @(out) begin
        $display("Time: %d, Out: %d", $time, out);
    end

endmodule
