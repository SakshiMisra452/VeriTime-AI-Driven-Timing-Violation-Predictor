
module test_module_DFF (
    input wire clk,
    input wire rst,
    output reg [3:0] count
);

reg dff_out;

always @(posedge clk or posedge rst) begin
    if (rst)
        dff_out <= 0;
    else
        dff_out <= ~dff_out;  // Flip-Flop toggles each clock cycle
end

always @(posedge dff_out) begin
    count <= count + 1;
end

endmodule
