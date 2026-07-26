module halfadder(input a,b,
output sum,cout);
assign sum=a^b;
assign cout=a&b;
endmodule

module array_multiplier(input [1:0]a,
input [1:0]b,
output [3:0]p);
wire q1,q2,q3,c1; //q1=a0b1 , q2= a1b0 , q3=a1b1

and A1(p[0],a[0],b[0]);
and A2(q1,a[0],b[1]);
and A3(q2,a[1],b[0]);
and A4(q3,a[1],b[1]);

halfadder h1(q1,q2,p[1],c1);
halfadder h2(q3,c1,p[2],p[3]);

endmodule
