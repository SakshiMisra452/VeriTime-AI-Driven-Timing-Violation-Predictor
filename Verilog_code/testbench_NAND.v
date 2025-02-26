
`timescale 1ns / 1ps

module testbench_NAND;
    reg clk, rst;
    wire [3:0] count;

    // Instantiate the DUT (Device Under Test)
    test_module_NAND DUT (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Clock Generation (50 MHz -> 10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        #10 rst = 0;  // De-assert reset after 10ns

        // Let the counter run for a few clock cycles
        #50 rst = 1;  // Apply reset again
        #10 rst = 0;  // Remove reset
        
        #100 $finish; // End simulation after 100ns
    end
endmodule
