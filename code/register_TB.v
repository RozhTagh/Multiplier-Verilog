`define width 32

module register_TB ();

parameter width = `width;
reg clk = 0, rst = 0, ld = 0, inc = 0, dec = 0;
reg [width-1:0] in;
wire [width-1:0] out;

register register1 (clk, rst, ld, inc, dec, in, out);

always
    #5 clk <= ~clk;

initial begin
    in = 32'd1834;

    ld = 1;
    #10 $display($time, "\tout = %d", out);
    ld = 0;

    inc = 1;
    #10 $display($time, "\tout = %d", out);
    inc = 0;

    rst = 1;
    #10 $display($time, "\tout = %d", out);
    rst = 0;

    in = 32'd9267;

    ld = 1;
    #10 $display($time, "\tout = %d", out);
    ld = 0;

    dec = 1;
    #10 $display($time, "\tout = %d", out);
    dec = 0;
    $finish;
end

endmodule