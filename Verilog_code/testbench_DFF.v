
`timescale 1ns / 1ps

module testbench_DFF;
    reg clk, rst;
    wire [3:0] count;

    // Instantiate the DUT (Device Under Test)
    test_module_DFF DUT (
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

        // Run for 100ns with normal operation
        #100;
        
        // Apply reset mid-simulation
        #10 rst = 1;
        #10 rst = 0;

        #100 $finish; // End simulation after 100ns
    end
endmodule
