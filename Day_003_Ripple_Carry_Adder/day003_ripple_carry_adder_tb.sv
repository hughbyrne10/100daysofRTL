`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module day003_ripple_carry_adder_tb();

localparam width = 4;

logic [width-1:0] a_i;
logic [width-1:0] b_i;
logic cin_i;

logic [width-1:0] sum_o;
logic cout_o;

day003_ripple_carry_adder DAY003_RIPPLE_CARRY_ADDER(.*);


initial begin
for(int i=0;i<16;i=i+1) begin
      a_i=$urandom_range(4'b0000,4'b1111);
      b_i=$urandom_range(4'b0000,4'b1111);
      cin_i = $random();
      #10;
end
$finish();
end


endmodule
