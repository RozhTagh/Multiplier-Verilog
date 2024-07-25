module SRFF_TB ();

reg clk = 0, S, R;
wire Q, Q_not;

SR_FF sr_ff1 (clk, S, R, Q, Q_not);

always
    #5 clk <= ~clk;

initial begin
    S = 1;
    R = 0;
    #10 $display($time, "\tQ:%b    Q_not:%b", Q, Q_not);

    S = 0;
    R = 0;
    #10 $display($time, "\tQ:%b    Q_not:%b", Q, Q_not);

    S = 0;
    R = 1;
    #10 $display($time, "\tQ:%b    Q_not:%b", Q, Q_not);

    S = 0;
    R = 0;
    #10 $display($time, "\tQ:%b    Q_not:%b", Q, Q_not);
    $finish;
end

endmodule