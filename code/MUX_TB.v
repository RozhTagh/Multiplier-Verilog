`define width 32

module MUX_TB ();

parameter width = `width;
reg [width-1:0] in0, in1;
reg select;
wire [width-1:0] out;

MUX mux1 (in0, in1, select, out);

initial begin
    in0 = 32'h81290734;
    in1 = 32'h01627903;

    select = 1;
    #5 $display("out = %h", out);
    select = 0;
    #5 $display("out = %h", out);
end

endmodule