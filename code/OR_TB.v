`define width 32

module OR_TB ();

parameter width = `width;
reg [width-1:0] in;
wire out;
OR_nbit OR_nbit1(in, out);

initial begin
    in = 32'h80192039;
    #5 $display("out = %b", out);

    in = 32'h12345678;
    #5 $display("out = %b", out);

    in = 32'h00129348;
    #5 $display("out = %b", out);

    in = 32'h00000000;
    #5 $display("out = %b", out);
end

endmodule