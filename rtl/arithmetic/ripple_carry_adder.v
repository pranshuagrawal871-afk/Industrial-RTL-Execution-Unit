`timescale 1ns/1ps

module ripple_carry_adder #(
    parameter WIDTH = 32
)(
    input  [WIDTH-1:0] A,
    input  [WIDTH-1:0] B,
    input              Cin,

    output [WIDTH-1:0] Sum,
    output             Cout,
    output             Overflow
);

wire [WIDTH:0] C;

assign C[0] = Cin;

genvar i;

generate
    for(i=0; i<WIDTH; i=i+1)
    begin : RCA

        assign Sum[i] = A[i] ^ B[i] ^ C[i];

        assign C[i+1] = (A[i] & B[i]) |
                        (A[i] & C[i]) |
                        (B[i] & C[i]);

    end
endgenerate

assign Cout = C[WIDTH];

assign Overflow = C[WIDTH] ^ C[WIDTH-1];

endmodule