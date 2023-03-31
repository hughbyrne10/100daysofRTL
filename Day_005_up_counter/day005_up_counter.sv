`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// simple up counter 
//////////////////////////////////////////////////////////////////////////////////

module day005_counter#(parameter width = 4)(
    input logic clk_i, 
    input logic n_rst_i, 
    output logic [width-1:0] cnt_o
);

always_ff@(posedge clk_i or negedge n_rst_i)
    begin
        if(~n_rst_i)
            begin 
                cnt_o <= 0;
            end
        else
            begin
                cnt_o <= cnt_o + 1;
            end
    end

endmodule
