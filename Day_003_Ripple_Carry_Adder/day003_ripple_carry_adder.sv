`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////

module day003_ripple_carry_adder#(parameter width = 4)(
    input logic [width-1:0] a_i,
    input logic [width-1:0] b_i,
    input logic cin_i,
    output logic [width-1:0] sum_o,
    output logic cout_o
    );

wire [width-2:0] c_w;

full_adder inst_full_adder_0(a_i[0],b_i[0],cin_i,sum_o[0],c_w[0]);

genvar i;
generate
    for(i = 1; i < width-1; i++)
        begin
            full_adder inst_full_adder(a_i[i],b_i[i],c_w[i-1],sum_o[i],c_w[i]);
        end    
endgenerate            

full_adder inst_full_adder_final(a_i[width-1],b_i[width-1],c_w[width-2],sum_o[width-1],cout_o);
    
endmodule
