module comparator #(parameter WIDTH=32)(

input [WIDTH-1:0] A,
input [WIDTH-1:0] B,

output reg GT,
output reg EQ,
output reg LT

);

always @(*) begin

    if(A>B) begin
        GT = 1'b1;
        EQ = 1'b0;
        LT = 1'b0;
    end
    else if(A<B) begin
        GT = 1'b0;
        EQ = 1'b0;
        LT = 1'b1;
    end
    else begin
        GT = 1'b0;
        EQ = 1'b1;
        LT = 1'b0;
    end

end

endmodule