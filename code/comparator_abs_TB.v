`define width 32

module comparator_abs_TB ();

parameter width = `width;
reg [width-1:0] A, B;
wire L, E, G;

comparator_abs comparator_abs_1 (A, B, L, E, G);

initial begin
    A = 32'd28;
    B = 32'd103;
    #5 $display("L:%b    E:%b    G:%b", L, E, G);

    A = 32'd87;
    B = 32'd87;
    #5 $display("L:%b    E:%b    G:%b", L, E, G);

    A = 32'h00000234;
    B = 32'h80000457;
    #5 $display("L:%b    E:%b    G:%b", L, E, G);

    A = 32'h00000034;
    B = 32'hffffffc1;
    #5 $display("L:%b    E:%b    G:%b", L, E, G);
end

endmodule