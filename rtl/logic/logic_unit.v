`timescale 1ns/1ps

module logic_unit #(
    parameter WIDTH = 32
)(
    input  [WIDTH-1:0] A,
    input  [WIDTH-1:0] B,
    input  [2:0] LogicSel,

    output reg [WIDTH-1:0] Result
);

always @(*) begin

    case(LogicSel)

        3'b000: Result = A & B;

        3'b001: Result = A | B;

        3'b010: Result = A ^ B;

        3'b011: Result = ~(A ^ B);

        3'b100: Result = ~(A & B);

        3'b101: Result = ~(A | B);

        3'b110: Result = ~A;

        default: Result = 0;

    endcase

end

endmodule