`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////

module day023_pulse_generator#(parameter WIDTH = 4)(
    input logic clk_i, 
    input logic n_rst_i,
    input logic [WIDTH-1:0] enable_val_i,
    output logic pulse_o
);

logic [WIDTH-1:0] count;

always@(posedge clk_i, negedge n_rst_i)
    begin
        if(n_rst_i == 1'b0)
            begin
                count <= {WIDTH{1'b0}};
            end
        else
            begin
                count <= (count < enable_val_i) ? count + 1 : 0;
            end   
    end

assign pulse_o = (count == enable_val_i) ? 1 : 0;

endmodule