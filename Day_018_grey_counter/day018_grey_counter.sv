`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////

module day018_grey_counter#(parameter WIDTH = 4)(
    input logic clk_i,
    input logic n_rst_i,
    input logic enable_i,
    
    output logic [WIDTH-1:0] grey_cnt_o
);

logic [WIDTH-1:0] bin_cnt;


always@(posedge clk_i, negedge n_rst_i)
    begin
        if(n_rst_i == 1'b0)
            begin
                bin_cnt <= {{WIDTH-1{1'b0}}, {1'b1}};
                grey_cnt_o <= {WIDTH{1'b0}};
            end
        else if(enable_i == 1'b1)   
            begin
                bin_cnt <= bin_cnt + 1'b1;
                grey_cnt_o <= {bin_cnt[WIDTH-1], bin_cnt[WIDTH-2:0]^bin_cnt[WIDTH-1:1]};
            end  
        else  
            begin  
                bin_cnt <= bin_cnt;
                grey_cnt_o <= grey_cnt_o;
            end   
    end

endmodule