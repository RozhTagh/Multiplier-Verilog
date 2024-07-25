

`define width 32

module circuit_TB();

parameter width = `width;
reg clk = 0, rst = 0, S = 0;
reg signed [width-1:0] A, B, C;
reg sign_A, sign_B, sign_C;
wire R;
wire signed [width-1:0] out, R1_out, R2_out;

circuit circuit1(clk, rst, S, A, B, C, R, out, R1_out, R2_out);

always begin
    #5 clk <= ~clk;
end

initial begin
    forever begin
        A = $urandom_range(100);
        B = $urandom_range(100);
        C = $urandom_range(10000);
        sign_A = $urandom_range(2);
        sign_B = $urandom_range(2);
        sign_C = $urandom_range(2);
        if(sign_A) A = -A;
        if(sign_B) B = -B;
        if(sign_C) C = -C;

        S = 1;
        wait(R);
        $display("\tA = %d, \tB = %d, \tC = %d, \tout = %d\n\n", A, B, C, out);

        rst = 1;
        #15 rst = 0;
    end
end

initial
    #10000 $finish;

endmodule