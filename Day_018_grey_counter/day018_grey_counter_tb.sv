`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////


module day018_grey_counter_tb();

parameter WIDTH = 4;

logic enable_i;
logic clk_i;
logic n_rst_i;
logic [WIDTH-1:0] grey_cnt_o;

day018_grey_counter DAY018_GREY_COUNTER();

always #5 clk_i = ~clk_i;

initial begin
    clk_i = 0;
    enable_i = 0;
    n_rst_i = 0;
    #10;
    n_rst_i = 1;
    enable_i = 1;
    #10;
    
end

endmodule