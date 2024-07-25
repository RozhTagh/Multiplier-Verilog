module CU (input clk, rst, S, Sign_R1, CMP_R1_R2, OR_R1, CMP_R3_R4,
           output reg L_R1, L_R2, L_R3, L_R4, L_R5, R_R3, Inc_R1, Dec_R1, Sel_R1, Sel_R2, Sel_R5, S_R, R_R);

reg [1:0] p_state, n_state;
localparam[1:0] init = 2'b00, cmp = 2'b01, mul = 2'b10;

always @(p_state or S or CMP_R1_R2 or OR_R1 or CMP_R3_R4) begin:combinational
    n_state = init;
    L_R1 <= 0;
    L_R2 <= 0;
    L_R3 <= 0;
    L_R4 <= 0;
    L_R5 <= 0;
    R_R3 <= 0;
    Inc_R1 <= 0;
    Dec_R1 <= 0;
    Sel_R1 <= 0;
    Sel_R2 <= 0;
    Sel_R5 <= 0;
    S_R <= 0;
    R_R <= 0;

    case (p_state)
        init: begin
            if(S == 1) begin
                n_state = cmp;
                L_R1 <= 1;
                L_R2 <= 1;
                R_R3 <= 1;
                L_R4 <= 1;
                Sel_R1 <= 0;
                Sel_R2 <= 0;
                S_R <= 0;
                R_R <= 1;
            end

            else begin
                n_state = init;
            end
        end 

        cmp: begin
            if(CMP_R1_R2 == 0) begin
                L_R1 <= 1;
                L_R2 <= 1;
                Sel_R1 <= 1;
                Sel_R2 <= 1;
            end
            n_state = mul;
        end

        mul: begin
            if(OR_R1 == 0) begin
                if(CMP_R3_R4 == 1)
                    Sel_R5 <= 0;
                else
                    Sel_R5 <= 1;
                
                L_R5 <= 1;    
                S_R <= 1;
                R_R <= 0;
                n_state = init;
            end

            else begin
                if(CMP_R3_R4 == 0) begin
                    L_R5 <= 1;
                    Sel_R5 <= 1;
                    S_R <= 1;
                    R_R <= 0;
                    n_state = init;
                end
                
                else begin
                    if(Sign_R1)
                        Inc_R1 <= 1;

                    else if(~Sign_R1)
                        Dec_R1 <= 1;
                    L_R3 <= 1;
                    n_state = mul;
                end
            end
        end
    endcase
end

always @(posedge clk) begin:sequential
    if(rst) begin
        S_R <= 0;
        R_R <= 1;
        p_state = init;
    end
    else
        p_state = n_state;
end

endmodule