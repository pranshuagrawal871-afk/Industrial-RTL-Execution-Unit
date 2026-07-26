`timescale 1ns/1ps

module carry_select_adder(

    input  [3:0] A,
    input  [3:0] B,
    input        Cin,

    output [3:0] Sum,
    output       Cout

);


// Lower 2-bit Ripple Carry Adder


wire C1;

ripple_carry_adder #(2) RCA0(

    .A(A[1:0]),
    .B(B[1:0]),
    .Cin(Cin),

    .Sum(Sum[1:0]),
    .Cout(C1)

);


// Upper 2-bit RCA assuming Cin = 0


wire [1:0] Sum0;
wire Cout0;

ripple_carry_adder #(2) RCA1(

    .A(A[3:2]),
    .B(B[3:2]),
    .Cin(1'b0),

    .Sum(Sum0),
    .Cout(Cout0)

);


// Upper 2-bit RCA assuming Cin = 1


wire [1:0] Sum1;
wire Cout1;

ripple_carry_adder #(2) RCA2(

    .A(A[3:2]),
    .B(B[3:2]),
    .Cin(1'b1),

    .Sum(Sum1),
    .Cout(Cout1)

);


// Multiplexers


assign Sum[3:2] = (C1) ? Sum1 : Sum0;

assign Cout = (C1) ? Cout1 : Cout0;

endmodule