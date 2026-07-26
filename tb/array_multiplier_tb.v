`timescale 1ns/1ps

module array_multiplier_tb;

reg [1:0] a;
reg [1:0] b;

wire [3:0] p;

array_multiplier DUT(
    .a(a),
    .b(b),
    .p(p)
);

initial begin

    $dumpfile("waveforms/array_multiplier.vcd");
    $dumpvars(0, array_multiplier_tb);

    // 0 × 0 = 0
    a = 2'b00;
    b = 2'b00;
    #10;

    // 1 × 1 = 1
    a = 2'b01;
    b = 2'b01;
    #10;

    // 2 × 3 = 6
    a = 2'b10;
    b = 2'b11;
    #10;

    // 3 × 2 = 6
    a = 2'b11;
    b = 2'b10;
    #10;

    // 3 × 3 = 9
    a = 2'b11;
    b = 2'b11;
    #10;

    $finish;

end

endmodule