

`define width 32

module MUX (in0, in1, select, out);

parameter width = `width;
input wire [width-1:0] in0, in1;
input wire select;
output wire [width-1:0] out;

assign out = select ? in1 : in0;

endmodule