`define width 32

module OR_nbit (in, out);

parameter width = `width;
input wire [width-1:0] in;
output wire out;

assign out = |in;

endmodule