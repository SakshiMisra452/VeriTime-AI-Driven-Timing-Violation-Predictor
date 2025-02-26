
module test_module_NOR (
    input wire clk,
    input wire rst,
    input wire enable,
    output reg [3:0] count
);

wire nor_enable;
assign nor_enable = ~(clk | enable);  // NOR gate

always @(posedge nor_enable or posedge rst) begin
    if (rst)
        count <= 0;
    else
        count <= count + 1;
end

endmodule
