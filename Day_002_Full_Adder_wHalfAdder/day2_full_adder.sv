`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////

module day2_full_adder(
    input logic a_i,
    input logic b_i,
    input logic cin_i,
    output logic sum_o,
    output logic cout_o
    );
    
    wire ha_sum_w;
    wire ha_c_zero_w;
    wire ha_c_one_w;    
    half_adder half_adder_0(a_i,b_i,ha_sum_w,ha_c_zero_w);
    half_adder half_adder_1(cin_i, ha_sum_w, sum_o, ha_c_one_w);
    
    assign cout_o = ha_c_zero_w | ha_c_one_w;
    
endmodule
