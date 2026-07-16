`timescale 1ns/1ps

module ripple_carry_adder_tb;

parameter WIDTH = 32;

reg  [WIDTH-1:0] A;
reg  [WIDTH-1:0] B;
reg              Cin;

wire [WIDTH-1:0] Sum;
wire             Cout;
wire             Overflow;

ripple_carry_adder #(WIDTH) DUT
(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout),
    .Overflow(Overflow)
);

initial
begin

    $dumpfile("rca.vcd");
    $dumpvars(0,ripple_carry_adder_tb);

    A=32'd10; B=32'd20; Cin=0;
    #10;

    A=32'd100; B=32'd50; Cin=0;
    #10;

    A=32'hFFFFFFFF;
    B=32'd1;
    Cin=0;
    #10;

    A=32'd500;
    B=32'd250;
    Cin=0;
    #10;

    A=32'd12345;
    B=32'd54321;
    Cin=0;
    #10;

    $finish;

end

endmodule