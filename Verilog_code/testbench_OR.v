`timescale 1ns / 1ps

module testbench_OR;
    reg clk, rst, load;
    reg [3:0] load_val;
    wire [3:0] count;

    // Instantiate the DUT (Device Under Test)
    test_module_OR DUT (
        .clk(clk),
        .rst(rst),
        .load(load),
        .load_val(load_val),
        .count(count)
    );

    // Clock Generation (50 MHz -> 10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1; load = 0; load_val = 4'b0000;
        #10 rst = 0;  // De-assert reset after 10ns
        
        // Apply test cases
        #10 load = 1; load_val = 4'b0101;  // Load custom value (5)
        #10 load = 0;  // Disable load -> count should increment
        #50 rst = 1;   // Reset counter
        #10 rst = 0;   // Remove reset
        #10 load = 1; load_val = 4'b1010;  // Load custom value (10)
        #10 load = 0;  // Continue counting

        #100 $finish; // End simulation after 100ns
    end
endmodule

