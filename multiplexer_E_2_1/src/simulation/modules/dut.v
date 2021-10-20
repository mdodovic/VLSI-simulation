// design under testing
module dut (
    input I0,
    input I1,
    input S0,
    input E,
    output Y
);

    wire notS0, T0, T1;

    not(notS0, S0);
    and(T0, I0, notS0, E);
    and(T1, I1, S0, E);
    or(Y, T0, T1);


endmodule