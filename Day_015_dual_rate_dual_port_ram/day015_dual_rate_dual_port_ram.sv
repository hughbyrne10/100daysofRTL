`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Dual Rate Dual Port RAM
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


module day015_dual_rate_dual_port_ram(
    input logic clk_a_i,
    input logic clk_b_i,
    
    input logic [ADDR_WIDTH-1:0] addr_a_i,
    input logic [DATA_WIDTH-1:0] data_in_a_i,
    input logic we_a_i,
    input logic en_a_i,
    input logic n_rst_a_i,
    
    input logic [ADDR_WIDTH-1:0] addr_b_i,
    input logic [DATA_WIDTH-1:0] data_in_b_i,
    input logic we_b_i,
    input logic en_b_i,
    input logic n_rst_b_i,
    

    output logic [DATA_WIDTH-1:0] data_out_a_o,

    output logic [DATA_WIDTH-1:0] data_out_b_o
);

reg [RAM_WIDTH-1:0] ram [DEPTH-1:0];

initial 
    begin
        integer i;
        for (i = 0; i < DEPTH; i = i + 1)
            ram[i] = {RAM_WIDTH{1'b0}};    
    end



/// Port A
always_ff@(posedge clk_a_i)
    begin
        if(n_rst_a_i == 1'b0)
            begin
                data_out_a_o <= {DATA_WIDTH{1'b0}};
            end
        else if (en_a_i == 1'b1)
            begin
                // Write
                if (we_a_i == 1'b1)
                    ram[addr_a_i] <= data_in_a_i;
                else
                    data_out_a_o <= ram[addr_a_i];             
            end
        
    end    



/// Port B
always_ff@(posedge clk_b_i)
    begin
        if(n_rst_b_i == 1'b0)
            begin
                data_out_b_o <= {DATA_WIDTH{1'b0}};
            end
        else if (en_b_i == 1'b1)
            begin
                // Write
                if (we_b_i == 1'b1)
                    ram[addr_b_i] <= data_in_b_i;
                else
                    data_out_b_o <= ram[addr_b_i];    
            end
    end

endmodule