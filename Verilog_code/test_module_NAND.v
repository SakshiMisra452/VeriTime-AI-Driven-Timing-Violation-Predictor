
module test_module_NAND (
    input wire clk,
    input wire rst,
    output reg [3:0] count
);

wire nand_clk_rst;
assign nand_clk_rst = ~(clk & rst);  // NAND gate

always @(posedge nand_clk_rst) begin
    if (rst)
        count <= 0;
    else
        count <= count + 1;
end

endmodule
