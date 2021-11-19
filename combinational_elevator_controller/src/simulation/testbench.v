module testbench;

    reg [3:0] input_floor;
    wire [1:0] output_description;

    controller elevator(input_floor, output_description);
    
    integer i;

    initial begin
        for (i = -4; i < 12 ; i = i + 1) begin
            input_floor = i;
            #5;
        end
        $finish;
    end
/*
    always @(input_floor, output_description) begin
        $display("time = %3d, input_floor = %d, output_description = %b", $time, input_floor, output_description);
    end
*/  
endmodule