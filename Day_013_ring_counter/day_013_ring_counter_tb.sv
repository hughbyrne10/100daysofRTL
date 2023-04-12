`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module day_013_ring_counter_tb;

parameter WIDTH=4;

logic clk_i;
logic ori_i;

logic [WIDTH-1:0] cnt_o;

// Instantiate the Unit Under Test (UUT)
day_013_ring_counter DAY_013_RING_COUNTER(.*);

always #5 clk_i = ~clk_i;

initial begin
    // Initialize Inputs
    clk_i = 0;
    ori_i = 0;
    #10; 
    ori_i = 1;
    #195;
    $finish();

end
      
endmodule

