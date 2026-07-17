`timescale 1ns/1ps

module operator_barrel_shifter_tb;

parameter WIDTH = 32;

reg  [WIDTH-1:0] data_in;
reg  [$clog2(WIDTH)-1:0] shift_amt;
reg  [2:0] shift_op;

wire [WIDTH-1:0] data_out;

operator_barrel_shifter #(WIDTH) DUT
(
    .data_in(data_in),
    .shift_amt(shift_amt),
    .shift_op(shift_op),
    .data_out(data_out)
);

initial
begin

    $dumpfile("operator_barrel.vcd");
    $dumpvars(0, operator_barrel_shifter_tb);

    data_in = 32'h12345678;

    // Logical Left Shift
    shift_amt = 4;
    shift_op  = 3'b000;
    #10;

    // Logical Right Shift
    shift_op  = 3'b001;
    #10;

    // Arithmetic Right Shift
    data_in = 32'hF2345678;
    shift_op = 3'b010;
    #10;

    // Rotate Left
    data_in = 32'h12345678;
    shift_op = 3'b011;
    #10;

    // Rotate Right
    shift_op = 3'b100;
    #10;

    $finish;

end

endmodule