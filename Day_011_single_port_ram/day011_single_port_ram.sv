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
parameter ADDR_WIDTH = clogb2(DEPTH-1);

module day011_single_port_ram(
    input logic clk_i,
    input logic [DATA_WIDTH-1:0] data_in_i,
    input logic [ADDR_WIDTH-1:0] addr_i,
    input logic wr_en_i,
    
    output logic [DATA_WIDTH-1:0] data_out_o
    
    );
    
   
logic [DATA_WIDTH-1:0] ram [DEPTH-1:0];


initial 
    begin
        integer i;
        for (i = 0; i < DEPTH; i = i + 1)
            ram[i] = {DATA_WIDTH{1'b0}};
    end
    
always @ (posedge clk_i)
    begin
        // Write
        if (wr_en_i == 1'b1)
            ram[addr_i] <= data_in_i;
    end    

assign data_out_o = ram[addr_i];

endmodule



