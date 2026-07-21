`timescale 1ns/1ps

module mux4to1(
    input i0,
    input i1,
    input i2,
    input i3,
    input [1:0] s,
    output reg y
);

always @(*) begin
    case(s)
        2'b00: y = i0;
        2'b01: y = i1;
        2'b10: y = i2;
        2'b11: y = i3;
    endcase
end

endmodule


module mux_barrel_shifter(
    input [3:0] w,
    input [1:0] s,
    output [3:0] y
);

    mux4to1 m1(
        w[2], w[3], 1'b0, w[2],
        s,
        y[3]
    );

    mux4to1 m2(
        w[1], w[3], w[3], w[1],
        s,
        y[2]
    );

    mux4to1 m3(
        w[0], w[2], w[2], w[0],
        s,
        y[1]
    );

    mux4to1 m4(
        w[3], w[1], w[1], 1'b0,
        s,
        y[0]
    );

endmodule