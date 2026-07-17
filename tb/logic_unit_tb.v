`timescale 1ns/1ps

module logic_unit_tb;
parameter WIDTH=32;

reg  [WIDTH-1:0] A;
reg  [WIDTH-1:0] B;
reg  [2:0] LogicSel;

wire [WIDTH-1:0] Result;

logic_unit #(WIDTH) DUT(
    .A(A),
    .B(B),
    .LogicSel(LogicSel),

    .Result(Result)
);

initial
begin

    $dumpfile("logicunit.vcd");
    $dumpvars(0,logic_unit_tb);

    A=32'd12345;
    B=32'd54321;

    LogicSel=3'b000;#10;
    LogicSel=3'b001;#10;
    LogicSel=3'b010;#10;
    LogicSel=3'b011;#10;
    LogicSel=3'b100;#10;
    LogicSel=3'b101;#10;
    LogicSel=3'b110;#10;

    $finish;

end
endmodule



