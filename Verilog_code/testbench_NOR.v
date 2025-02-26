
`timescale 1ns / 1ps

module testbench_NOR;
    reg clk, rst, enable;
    wire [3:0] count;

    // Instantiate the DUT (Device Under Test)
    test_module_NOR DUT (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .count(count)
    );

    // Clock Generation (50 MHz -> 10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        enable = 0;
        #10 rst = 0;  // De-assert reset after 10ns

        // Enable counting
        #10 enable = 1;
        #50 enable = 0;  // Disable counting
        #30 enable = 1;  // Enable again

        // Apply reset in between
        #20 rst = 1;
        #10 rst = 0;

        #100 $finish; // End simulation after 100ns
    end
endmodule
