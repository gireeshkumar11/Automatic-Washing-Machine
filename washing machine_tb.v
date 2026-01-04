module wm_tb;

    reg clk, reset, start;
    wire wash, rinse, spin;

    wm dut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .wash(wash),
        .rinse(rinse),
        .spin(spin)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        start = 0;

        #10 reset = 0;
        #10 start = 1;
        #10 start = 0;

        #80 $stop;
    end

endmodule
