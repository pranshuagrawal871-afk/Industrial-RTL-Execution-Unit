`timescale 1ns/1ps

module carry_select_adder_tb;

reg [3:0] A;
reg [3:0] B;
reg Cin;

wire [3:0] Sum;
wire Cout;

carry_select_adder DUT(

    .A(A),
    .B(B),
    .Cin(Cin),

    .Sum(Sum),
    .Cout(Cout)

);

initial begin

    $dumpfile("waveforms/carry_select_adder.vcd");
    $dumpvars(0, carry_select_adder_tb);

    A = 4'd5;
    B = 4'd3;
    Cin = 0;
    #10;

    A = 4'd7;
    B = 4'd8;
    Cin = 0;
    #10;

    A = 4'd9;
    B = 4'd6;
    Cin = 1;
    #10;

    A = 4'd15;
    B = 4'd15;
    Cin = 0;
    #10;

    $finish;

end

endmodule