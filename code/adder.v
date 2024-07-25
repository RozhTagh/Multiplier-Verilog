`define width 32

module adder (in1, in2, sign, sum);

parameter width = `width;
input wire signed [width-1:0] in1, in2;
input wire sign;
output wire signed [width-1:0] sum;
assign sum = sign ? in1 - in2 : (in1 + in2);

endmodule