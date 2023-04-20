`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////


module working_tb();

logic clk_i;
logic enable_i;
logic n_rst_i;
logic [15:0] wave_sample_o;

sine_generator SINE_GENERATOR(.*);

always #5 clk_i = ~clk_i;

initial begin
    clk_i = 0;
    n_rst_i = 0;
    enable_i = 1;
    #10;
    n_rst_i = 1;
    #10000;
    $finish();
end

endmodule
