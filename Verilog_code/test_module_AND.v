module test_module_AND (
    input wire clk,
    input wire rst,
    input wire enable,  // Added enable signal
    output reg [3:0] count
);

wire clk_and_en;
assign clk_and_en = clk & enable;  // AND gate

always @(posedge clk_and_en or posedge rst) begin
    if (rst)
        count <= 0;
    else
        count <= count + 1;
end

endmodule

