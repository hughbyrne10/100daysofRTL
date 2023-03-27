`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// simple testbench for half-adder
//////////////////////////////////////////////////////////////////////////////////


module day1_half_adder_tb();

logic a_i;
logic b_i;
logic sum_o;
logic cout_o;

day1_half_adder DAY1_HALF_ADDER(.*);

initial begin

a_i = 0;
b_i = 0;
#10;
a_i = 0;
b_i = 1;
#10;
a_i = 1;
b_i = 0;
#10;
a_i = 1;
b_i = 1;
#10;
$finish();

end

endmodule
