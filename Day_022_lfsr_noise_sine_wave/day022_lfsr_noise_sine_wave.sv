`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
//////////////////////////////////////////////////////////////////////////////////


module day022_lfsr_noise_sine_wave_tb();

logic clk_i;
logic n_rst_i;
logic enable_i;

// LFSR
logic [11:0] lfsr_o;

// Sine Wave Signals
logic [16:0] wave_sample_o;


day022_lfsr_noise_sine_wave DAY022_LFSR_NOISE_SINE_WAVE(.*);

always #5 clk_i = ~clk_i;

integer i;
initial begin
    clk_i = 0;
    n_rst_i = 0;
    enable_i = 0;
    #10;
    n_rst_i = 1;
    #10;
    enable_i = 1;
    #20;
    for(i = 0; i < i+1; i++)
        begin
            #10;
        end
    
end

endmodule