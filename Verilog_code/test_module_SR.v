module test_module_SR (
    input wire clk,
    input wire rst,
    input wire set,  // Added set signal
    output reg [3:0] count
);

reg sr_latch;

always @(posedge clk or posedge rst) begin
    if (rst)
        sr_latch <= 0;
    else if (set)
        sr_latch <= 1;  // Set the latch
end

always @(posedge sr_latch) begin
    count <= count + 1;
end

endmodule

