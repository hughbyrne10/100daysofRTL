`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Clock Divider
//////////////////////////////////////////////////////////////////////////////////

module day007_clock_divider#(parameter divisor = 2)(
    input logic clk_i,
    input logic n_rst_i,
    output logic div_clk_o
);

localparam width = 2;

logic [width-1:0] cnt;

// Up Counter
always_ff@(posedge clk_i, negedge n_rst_i)
    begin
        if(~n_rst_i)
            begin 
                cnt <= 32'b0;
            end
        else if (cnt == divisor -1)
            begin
                cnt <= 32'b0;
            end
        else 
            begin
                cnt <= cnt + 1;
            end
    end

// Toggle div_clk_o when cnt reaches limit
always_ff@(posedge clk_i, negedge n_rst_i)
    begin
        if (n_rst_i == 1'b0)
            begin
                div_clk_o <= 1'b0;
            end    
        else if (cnt == divisor - 1)
            begin
                div_clk_o <= ~div_clk_o;
            end   
        else
            begin
                div_clk_o <= div_clk_o;
            end 
        end

endmodule