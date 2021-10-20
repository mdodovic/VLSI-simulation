module top_display; 

    reg i0, i1, s0; 
    wire out; 
    
    // m21_dataflow m21(i0, i1, s0, out);
    m21_behavioral m21(.Y(out), .I0(i0), .I1(i1), .S0(s0));
    

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
        //$stop;
        $finish;
    end

    initial begin
        $monitor("Time: %2d, Out: %d", $time, out);
    end

//    always @(out) begin
//        $display("Time: %d, Out: %d", $time, out);
//    end

endmodule
