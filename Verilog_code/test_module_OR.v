module test_module_OR (
    input wire clk,
    input wire rst,
    input wire load,
    input wire [3:0] load_val,  // Loadable value
    output reg [3:0] count
);

wire rst_or_load;
assign rst_or_load = rst | load;  // OR gate

always @(posedge clk or posedge rst_or_load) begin
    if (rst)
        count <= 0;
    else if (load)
        count <= load_val;  // Load custom value
    else
        count <= count + 1;
end

endmodule

