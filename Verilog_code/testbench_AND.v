
`timescale 1ns / 1ps

module testbench_AND;
    reg clk, rst, enable;
    wire [3:0] count;

    // Instantiate the DUT (Device Under Test)
    test_module_AND DUT (
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
        rst = 1; enable = 0;
        #10 rst = 0;  // De-assert reset after 10ns
        
        // Apply test cases
        #10 enable = 1;  // Enable counter -> should start counting
        #50 enable = 0;  // Disable counter -> should stop counting
        #20 enable = 1;  // Enable again -> should resume counting

        #1000 $finish; // End simulation after 100ns
    end
endmodule
