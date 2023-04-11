`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Single Port RAM 
//////////////////////////////////////////////////////////////////////////////////

function integer clogb2;
    input integer depth;
        for (clogb2=0; depth>0; clogb2=clogb2+1)
            depth = depth >> 1;
endfunction

parameter DATA_WIDTH = 8;
parameter DEPTH = 8;
parameter integer ADDR_WIDTH = clogb2(DEPTH-1);

module day012_single_port_ram_ce_syncread(
    input logic clk_i,
    input logic [DATA_WIDTH-1:0] data_in_i,
    input logic [ADDR_WIDTH-1:0] addr_i,
    input logic we_i,
    input logic ce_i,
    input logic n_rst_i,
    
    output logic [DATA_WIDTH-1:0] data_out_o
    
    );
    
   
logic [DATA_WIDTH-1:0] ram [DEPTH-1:0];

initial 
    begin
        integer i;
        for (i = 0; i < DEPTH; i = i + 1)
            ram[i] = {DATA_WIDTH{1'b0}};
    end

    
always @ (posedge clk_i, negedge n_rst_i)
    begin
        if(n_rst_i == 1'b0)
            begin
                data_out_o <= {DATA_WIDTH{1'b0}};
            end
        else if(ce_i == 1'b1)
            begin
                // Write
                if (we_i == 1'b1)
                    begin
                        ram[addr_i] <= data_in_i;
                    end
                                     
                // Read
                else
                    begin
                        data_out_o <= ram[addr_i];       
                    end         
            end             
    end    

endmodule



