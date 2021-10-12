module m21_gate (
    I0,
    I1,
    S0,
    Y
);

    input I0, I1, S0;
    output Y;

    wire notS0, temp0, temp1;

    not(notS0, S0);
    and(temp0, I0, notS0);
    and(temp1, I1, S0);
    or(Y, temp0, temp1);
    
endmodule