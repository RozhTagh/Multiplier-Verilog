`include "DP.v"
`include "CU.v"
`define width 32

module circuit (clk, rst, S, A, B, C, R, out, R1_out, R2_out);

parameter width = `width;
input clk, rst, S;
input signed [width-1:0] A, B, C;
output R;
output signed [width-1:0] out, R1_out, R2_out;

DP datapath (clk, A, B, C, 
             L_R1, L_R2, L_R3, L_R4, L_R5, 
             R_R3, Inc_R1, Dec_R1, Sel_R1, Sel_R2, Sel_R5, S_R, R_R,
             Sign_R1, CMP_R1_R2, OR_R1, CMP_R3_R4, R, out, R1_out, R2_out);

CU controlUnit (clk, rst, S, Sign_R1, CMP_R1_R2, OR_R1, CMP_R3_R4,
                L_R1, L_R2, L_R3, L_R4, L_R5, 
                R_R3, Inc_R1, Dec_R1, Sel_R1, Sel_R2, Sel_R5, S_R, R_R);

endmodule