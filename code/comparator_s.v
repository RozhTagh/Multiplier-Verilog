`define width 32

module comparator_s (A, B, L, E, G);

parameter width = `width;
input wire signed [width-1:0] A, B;
output wire L, E, G;

assign L = A < B;
assign E = A == B;
assign G = A > B;

endmodule