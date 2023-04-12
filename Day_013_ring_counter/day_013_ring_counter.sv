`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// n-bit Ring Counter
//////////////////////////////////////////////////////////////////////////////////

module day_013_ring_counter#(parameter WIDTH = 4)(  
    input logic clk_i,
    input logic ori_i,
    output logic [WIDTH-1:0] cnt_o 
);


always@(posedge clk_i, negedge ori_i)
    begin
        if(ori_i == 1'b0)
            begin
                cnt_o [WIDTH-1:1] = {WIDTH-1{1'b0}};
                cnt_o [0] = 1'b1;
            end
        else 
            begin
                cnt_o = {cnt_o[WIDTH-2:0], cnt_o[WIDTH-1]};
            end
    end
endmodule



