`timescale 1ns/1ps

module comparator_tb;

reg [31:0] A;
reg [31:0] B;

wire GT;
wire EQ;
wire LT;

comparator DUT(
    .A(A),
    .B(B),
    .GT(GT),
    .EQ(EQ),
    .LT(LT)
);

initial begin

    $dumpfile("waveforms/comparator.vcd");
    $dumpvars(0, comparator_tb);

    // A > B
    A = 32'd15;
    B = 32'd10;
    #10;

    // A < B
    A = 32'd8;
    B = 32'd20;
    #10;

    // A == B
    A = 32'd25;
    B = 32'd25;
    #10;

    // Large Numbers
    A = 32'd429496729;
    B = 32'd123456789;
    #10;

    // Zero Comparison
    A = 32'd0;
    B = 32'd0;
    #10;

    $finish;

end

endmodule