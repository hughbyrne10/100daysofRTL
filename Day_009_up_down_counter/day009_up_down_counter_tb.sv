`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module day009_up_down_counter_tb();

parameter width = 4;

logic clk_i;         // clock input
logic n_rst_i;         // reset input
logic up_down_i;     // up/down mode input
logic enable_i;      // enable input

logic [width-1:0] cnt_o; // 8-bit output counter


day009_up_down_counter DAY009_UP_DOWN_COUNTER(.*);

always #5 clk_i = ~clk_i;

initial begin
    clk_i = 0;
    n_rst_i = 0;
    enable_i = 0;
    up_down_i = 0;
    #10;
    n_rst_i = 1;
    #10;
    enable_i = 1;
    #50;
    up_down_i = 1;
    #70;
    $finish();
end


endmodule

