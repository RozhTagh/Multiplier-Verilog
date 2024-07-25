module SR_FF (input clk, S, R, output reg Q, Q_not);

always @(posedge clk) begin
    if (S & ~R) begin
        Q <= 1;
        Q_not <= 0;
    end
    else if (~S & R) begin
        Q <= 0;
        Q_not <= 1;
    end
end

endmodule