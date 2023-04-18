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

module day017_fifo_synchronous(
    input logic clk_i,
    input logic we_i,
    input logic re_i,
    input logic [DATA_WIDTH-1:0] data_in_i,
    input logic n_rst_i,
    output logic [DATA_WIDTH-1:0] data_out_o,
    output logic full_o,
    output logic empty_o
    );

// Write signals    
logic we_w;
logic [ADDR_WIDTH:0] wptr_w;

// Read Signals
logic re_w;
logic [ADDR_WIDTH:0] rptr_w;

// Simple Dual Port RAM Instantiation 
simple_dual_port_ram #(DATA_WIDTH, RAM_WIDTH, DEPTH, ADDR_WIDTH) 
    inst1(clk_i,re_w, we_w, n_rst_i, wptr_w[ADDR_WIDTH-1:0], rptr_w[ADDR_WIDTH-1:0], data_in_i, data_out_o);

// Write Pointer
always @(posedge clk_i, negedge n_rst_i)    
    begin 
        if(n_rst_i == 1'b0)
            begin
                wptr_w <= {ADDR_WIDTH+1{1'b0}};
            end
        else if (we_w == 1'b1)
            begin 
                wptr_w <= wptr_w + 1'b1;   
            end 
        else
            begin
                wptr_w <= wptr_w;
            end     
    end
// Write Logic
assign we_w = we_i & ~full_o;
assign full_o = (wptr_w[ADDR_WIDTH] ^ rptr_w[ADDR_WIDTH]) & (wptr_w[ADDR_WIDTH-1:0] == rptr_w[ADDR_WIDTH-1:0]);

    
// Read Pointer
always @(posedge clk_i, negedge n_rst_i)  
    begin  
        if(n_rst_i == 1'b0)
            begin
                rptr_w <= {ADDR_WIDTH+1{1'b0}};
            end  
        else if(re_w)  
            begin
                rptr_w <= rptr_w + 1'b1;  
            end    
        else    
            begin
                rptr_w <= rptr_w;  
            end    
    end
// Read Logic    
assign re_w = re_i & ~empty_o;
assign empty_o = wptr_w == rptr_w;

endmodule