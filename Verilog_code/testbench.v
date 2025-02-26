`timescale 1ns / 1ps

module testbench;

// Declare testbench signals
reg clk;
reg rst;
wire [3:0] count;
integer expected_time;

// Instantiate the test module
test_module uut (
    .clk(clk),
    .rst(rst),
    .count(count)
);

// Clock generation: Ensure clock toggles every 10ns
initial clk = 0;
always #5 clk = ~clk;  // Toggle clock every 5 ns (Period = 10 ns)

// Test sequence
initial begin
    // Display signal values for debugging
    $monitor("Time = %0t | clk = %b | rst = %b | count = %b", $time, clk, rst, count);

    // Initialize signals
    rst = 1; // Apply reset
    expected_time = 20; // First expected update time (Reset at 15ns, next update at 20ns)
    #15;     // Hold reset high for 15 ns
    rst = 0; // Release reset

    // Let the counter run for a while
    #100;

    // Apply reset again
    rst = 1;
    #10 rst = 0; 

    // Let it run again
    #100;
    
    // End simulation
    $stop;
end

// **Predict_time violation check**
always @(posedge clk) begin
    if ($time < expected_time) begin
        $display("? Predict_Time Violation at time = %t (Expected %t)", $time, expected_time);
    end
    expected_time = $time + 10;  // Update next expected time (assuming the counter updates every clock cycle)
end

endmodule

