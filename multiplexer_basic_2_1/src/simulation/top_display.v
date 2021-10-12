module top_display; 

    reg i0, i1, s0; 
    wire out; 
    
    m21_gate m21(i0, i1, s0, out);
    
    initial begin
        i0 = 1'b0;
        i1 = 1'b0;
        s0 = 1'b0;
        $display("Time: %d, Out: %d", $time, out);
        #10
        i0 = 1'b1;
        $display("Time: %d, Out: %d", $time, out);
        #10
        s0 = 1'b1;
        $display("Time: %d, Out: %d", $time, out);
        #10
        i1 = 1'b1;
        $display("Time: %d, Out: %d", $time, out);
        #10
        $stop;
    end



endmodule
