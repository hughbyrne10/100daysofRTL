`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module day007_clock_divider_tb;

logic clk_i;
logic n_rst_i;

logic div_clk_o;

day007_clock_divider DAY007_CLOCK_DIVIDER(.*);

always #5 clk_i = ~clk_i;

initial begin
    clk_i = 0;
    n_rst_i = 0;
    #10
    n_rst_i = 1;
    #115;
    $finish();
end


endmodule

