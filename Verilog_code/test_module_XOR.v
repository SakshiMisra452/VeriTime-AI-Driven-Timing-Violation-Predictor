module test_module_XOR (
    input wire clk,
    input wire rst,
    output reg [3:0] count
);

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 0;
    else
        count <= count ^ 4'b0001;  // XOR with 1
end

endmodule

