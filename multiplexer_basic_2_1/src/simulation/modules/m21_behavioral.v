module m21_behavioral (
    I0, 
    I1, 
    S0, 
    Y
);

    input I0, I1, S0;
    output reg Y;

    always @(I0, I1, S0) begin
        if (S0) begin
            Y = I1;
        end
        else begin
            Y = I0;
        end
    end

endmodule