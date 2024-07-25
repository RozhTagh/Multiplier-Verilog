`define width 32

module comparator_abs (A, B, L, E, G);

parameter width = `width;
input wire clk;
input wire [width-1:0] A, B;
output wire L, E, G;

wire [width-1:0] A_abs, B_abs;
assign A_abs = A[width-1] ? -A : A;
assign B_abs = B[width-1] ? -B : B;

assign L = A_abs < B_abs;
assign E = A_abs == B_abs;
assign G = A_abs > B_abs;

endmodule