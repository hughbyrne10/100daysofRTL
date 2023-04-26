`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
//////////////////////////////////////////////////////////////////////////////////


module day023_pulse_generator_tb();

// N controls the number of clock cycles before pulse goes high. Change WIDTH according to N.
parameter WIDTH = 4;
parameter N = 15;

// PULSE_CYCLE is to be used for waiting in the testbench
parameter PULSE_CYCLE = (10 *(N+1));

logic clk_i;
logic n_rst_i;
logic [WIDTH-1:0] enable_val_i;

logic pulse_o;


day023_pulse_generator DAY023_PULSE_GENERATOR(.*);

always #5 clk_i = ~clk_i;


initial begin
    clk_i = 0;
    n_rst_i = 0;  
    
    enable_val_i = N;
    
    #10;
    n_rst_i = 1;
    #(2 * PULSE_CYCLE);  
    $finish();
end

endmodule