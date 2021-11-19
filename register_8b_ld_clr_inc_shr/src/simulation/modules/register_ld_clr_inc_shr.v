module register_ld_clr_inc_shr (rst_n, clk, clr, ld, inc, shr, data_in, data_out, right_carry);

    input rst_n;
    input clk;
                // priorities
    input clr;  // 1 
    input ld;   // 2
    input inc;  // 3
    input shr;  // 4

    input [3:0] data_in;

    output [3:0] data_out;
    reg [3:0] data_out_reg;
    reg [3:0] data_out_next;
    assign data_out = data_out_reg;

    output right_carry;
    reg right_carry_reg;
    reg right_carry_next;
    assign right_carry = right_carry_reg;

    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            data_out_reg <= 4'h0;
            right_carry_reg <= 1'b0;            
        end
        else begin
            data_out_reg <= data_out_next;
            right_carry_reg <= right_carry_next;                        
        end
    end

    always @(*) begin
        data_out_next = data_out_reg;
        right_carry_next = right_carry_reg; 

            if(clr == 1'b1) begin
                // 1
                data_out_next = 4'h0;
                right_carry_reg = 1'b0; 
            end  
            else begin
                if(ld == 1'b1) begin
                    // 2 
                    data_out_next = data_in;
                    right_carry_reg = 1'b0; 
                end    
                else begin
                    if(inc == 1'b1) begin
                        // 3
                        data_out_next = data_out_reg + 8'h01;
                        right_carry_reg = 1'b0; 
                    end                    
                    else begin
                        if(shr == 1'b1) begin
                            // 4
                            right_carry_reg = data_out_reg[0];                             
                            data_out_next = data_out_reg >> 1;
                        end
                    end
                    
                end
            end
    end


endmodule