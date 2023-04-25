`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////

module day021_lfsr#(parameter SEED = 4'hF)(
    input logic clk_i,
    input logic n_rst_i,
    input logic enable_i,
    output logic [3:0] lfsr_o
);

reg [3:0] lfsr;
initial begin
lfsr = SEED;
end
always @(posedge clk_i)
    if (n_rst_i == 1'b0)
        lfsr <= SEED;
    else if (enable_i)
        begin
            lfsr[3:1] <= lfsr[2:0];
            lfsr[0] <= ^lfsr[3:2];
        end
        
assign lfsr_o = lfsr;

endmodule