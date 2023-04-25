`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
//////////////////////////////////////////////////////////////////////////////////


module day021_lfsr_tb();

logic clk_i;
logic n_rst_i;
logic enable_i;
logic [3:0] lfsr_o;

day021_lfsr DAY021_LFSR(.*);

always #5 clk_i = ~clk_i;

initial begin
    clk_i = 0;
    n_rst_i = 0;
    enable_i = 0;
    #10;
    n_rst_i = 1;
    #10;
    enable_i = 1;
    #295;
    $finish();
    
end

endmodule