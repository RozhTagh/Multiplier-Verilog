`define width 32

module register (clk, rst, ld, inc, dec, in, out);

parameter width = `width;
input wire clk, rst, ld, inc, dec;
input wire signed [width-1:0] in;
output reg signed [width-1:0] out;

always @(posedge clk) begin
    if (rst)
        out <= 0;
    else if (ld)
        out <= in;
    else if (inc)
        out <= out+1;
    else if (dec)
        out <= out-1;
end

endmodule