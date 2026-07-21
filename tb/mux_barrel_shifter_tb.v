`timescale 1ns/1ps

module mux_barrel_shifter_tb;

reg [3:0] w;
reg [1:0] s;
wire [3:0] y;

mux_barrel_shifter DUT(
    .w(w),
    .s(s),
    .y(y)
);

initial begin

    $dumpfile("waveforms/mux_barrel_shifter.vcd");
    $dumpvars(0, mux_barrel_shifter_tb);

    w = 4'b1101;

    s = 2'b00; #5;
    s = 2'b01; #5;
    s = 2'b10; #5;
    s = 2'b11; #5;

    $finish;

end

endmodule