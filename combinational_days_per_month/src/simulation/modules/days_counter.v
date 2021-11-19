module days_counter (
    x1, x2, x3, x4, x5, m28, m29, m30, m31
);

    input x1, x2, x3, x4, x5;
    output reg m28, m29, m30, m31;

    reg [2:0] month_number;

    always @(*) begin
        
        month_number = {x1, x2, x3, x4};
        m28 = 1'b0;
        m29 = 1'b0;
        m30 = 1'b0;
        m31 = 1'b0;

        case (month_number)
            4'h1: begin
                m31 = 1'b1;                
            end
            4'h2: begin
                if(x5 == 1'b1)
                    m29 = 1'b1;
                else
                    m28 = 1'b1;
            end
            4'h3: begin
                m31 = 1'b1;                                
            end
            4'h4: begin
                m30 = 1'b1;                                
            end
            4'h5: begin
                m31 = 1'b1;                                
            end
            4'h6: begin
                m30 = 1'b1;                                
            end
            4'h7: begin
                m31 = 1'b1;                                
            end
            4'h8: begin
                m31 = 1'b1;                                
            end
            4'h9: begin
                m30 = 1'b1;                                
            end
            4'hA: begin
                m31 = 1'b1;                                
            end
            4'hB: begin
                m30 = 1'b1;                                
            end
            4'hC: begin
                m31 = 1'b1;                                
            end
        endcase

    end

    
endmodule