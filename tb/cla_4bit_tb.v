`timescale 1ns/1ps

module cla_4bit_tb;

reg [3:0] A;
reg [3:0] B;
reg Cin;

wire [3:0] Sum;
wire Cout;
wire Overflow;

cla_4bit DUT(

    .A(A),
    .B(B),
    .Cin(Cin),

    .Sum(Sum),
    .Cout(Cout),
    .Overflow(Overflow)

);

initial begin

    $dumpfile("cla4.vcd");
    $dumpvars(0,cla_4bit_tb);

    A=4'd5;
    B=4'd7;
    Cin=0;
    #10;

    A=4'd15;
    B=4'd1;
    Cin=0;
    #10;

    A=4'd8;
    B=4'd8;
    Cin=0;
    #10;

    A=4'd3;
    B=4'd9;
    Cin=1;
    #10;

    $finish;

end

endmodule