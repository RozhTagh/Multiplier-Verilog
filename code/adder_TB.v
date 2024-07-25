

`define width 32

module adder_TB();

parameter width = `width;
reg signed [width-1:0] in1, in2;
reg sign;
wire signed [width-1:0] sum;

adder adder1(in1, in2, sign, sum);

initial begin
    in1 = 32'd67;
    in2 = 32'd8;
    sign = 1;
    #5 $display("\n\n\tsum = %d", sum);

    in1 = 32'd67;
    in2 = 32'd8;
    sign = 0;
    #5 $display("\tsum = %d", sum);

    in1 = 32'hFFFFFFFF;
    in2 = 32'd9;
    sign = 1;
    #5 $display("\tsum = %d", sum);

    in1 = 32'hFFFFFFFF;
    in2 = 32'd9;
    sign = 0;
    #5 $display("\tsum = %d\n\n", sum);
end

endmodule