

`include "MUX.v"
`include "register.v"
`include "OR_nbit.v"
`include "comparator_abs.v"
`include "comparator_s.v"
`include "adder.v"
`include "SR_FF.v"
`define width 32

module DP (clk, A, B, C, 
           ld_1, ld_2, ld_3, ld_4, ld_5,
           rst_3, inc_1, dec_1, select_R1, select_R2, select_R5, S_R, R_R,
           SIGN_R1, CMP_R1_R2, OR_R1, CMP_R3_R4, Q, R5_out, R1_out, R2_out);

parameter width = `width;
input clk;
input signed [width-1:0] A, B, C;
input ld_1, ld_2, ld_3, ld_4, ld_5;
input rst_3, inc_1, dec_1, select_R1, select_R2, select_R5, S_R, R_R;
output SIGN_R1, CMP_R1_R2, OR_R1, CMP_R3_R4, Q;
output signed [width-1:0] R5_out, R1_out, R2_out;

wire signed [width-1:0] R1_out, R2_out, R3_out, R4_out;
wire signed [width-1:0] mux_R1_out, mux_R2_out, mux_R5_out, adder_out;
wire rst_1, rst_2, rst_4, rst_5;
wire dec_2, dec_3, dec_4, dec_5;
wire inc_2, inc_3, inc_4, inc_5;
wire eq_1, gr_1, eq_2, gr_2;
wire Q_not;

assign SIGN_R1 = R1_out[width-1];

MUX mux1(A, R2_out, select_R1, mux_R1_out);
MUX mux2(B, R1_out, select_R2, mux_R2_out);
MUX mux5(R3_out, R4_out, select_R5, mux_R5_out);

register R1(clk, rst_1, ld_1, inc_1, dec_1, mux_R1_out, R1_out);
register R2(clk, rst_2, ld_2, inc_2, dec_2, mux_R2_out, R2_out);
register R3(clk, rst_3, ld_3, inc_3, dec_3, adder_out, R3_out);
register R4(clk, rst_4, ld_4, inc_4, dec_4, C, R4_out);
register R5(clk, rst_5, ld_5, inc_5, dec_5, mux_R5_out, R5_out);

adder adder1(R3_out, R2_out, SIGN_R1, adder_out);
OR_nbit OR_nbit1 (R1_out, OR_R1);
comparator_abs cmp_R1_R2 (R1_out, R2_out, CMP_R1_R2, eq_1, gr_1);
comparator_s cmp_R3_R4 (R3_out, R4_out, CMP_R3_R4, eq_2, gr_2);
SR_FF SR_FF1 (clk, S_R, R_R, Q, Q_not);

endmodule