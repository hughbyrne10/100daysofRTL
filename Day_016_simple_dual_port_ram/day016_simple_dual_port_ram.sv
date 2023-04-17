`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////
function integer clogb2;
    input integer depth;
        for (clogb2=0; depth>0; clogb2=clogb2+1)
            depth = depth >> 1;
endfunction

parameter RAM_WIDTH = 8;
parameter DATA_WIDTH = 8;
parameter DEPTH = 8;
parameter integer ADDR_WIDTH = clogb2(DEPTH-1);


module day016_simple_dual_port_ram(
    input logic clk_i,
    input logic re_i,
    input logic we_i,
    input logic n_rst_i,
    input logic [ADDR_WIDTH-1:0] addr_a_i,
    input logic [ADDR_WIDTH-1:0] addr_b_i,
    input logic [DATA_WIDTH-1:0] data_in_i,
    output logic [DATA_WIDTH-1:0] data_out_o
    );

logic [RAM_WIDTH-1:0] ram [DEPTH-1:0];

initial 
    begin
        integer i;
        for (i = 0; i < DEPTH; i = i + 1)
            ram[i] = {RAM_WIDTH{1'b0}};    
    end



always @(posedge clk_i) 
    begin 
        if (we_i)
            begin
                ram[addr_a_i] <= data_in_i;
            end         
    end

always @(posedge clk_i, negedge n_rst_i)
    begin
        if(n_rst_i == 1'b0)
            begin
                data_out_o <= {DATA_WIDTH{1'b0}};
            end         
        else if (re_i)
            begin
                data_out_o <= ram[addr_b_i];  
            end             
    end

endmodule