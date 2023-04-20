`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

function integer clogb2;
    input integer depth;
        for (clogb2=0; depth>0; clogb2=clogb2+1)
            depth = depth >> 1;
endfunction

parameter DATA_WIDTH = 16;
parameter DEPTH = 1000;

parameter integer ADDR_WIDTH = clogb2(DEPTH-1);

module day019_sine_generator(
    input logic clk_i,
    input logic enable_i,
    input logic n_rst_i,
    output logic [DATA_WIDTH-1:0] wave_sample_o
    );

// 1024 points
// 65535 max amplitude
   
logic [DATA_WIDTH-1:0] rom [DEPTH-1:0];
logic [ADDR_WIDTH-1:0] addr;

initial begin
    $readmemh("sine.mem", rom); //File with the signal
    addr = 0;
end


//At every positive edge of the clock, output a sine wave sample.
always@(posedge clk_i, negedge n_rst_i)
    begin
        if(n_rst_i == 1'b0)
            begin
                addr <= {ADDR_WIDTH{1'b0}};
                wave_sample_o <= {ADDR_WIDTH{1'b0}};
            end
        else if(enable_i == 1'b1)
            begin
                wave_sample_o <= rom[addr];
                if(addr == (DEPTH-1))
                    addr <= {ADDR_WIDTH{1'b0}};
                else 
                    addr <= addr + 1;             
            end
        else
            begin
                wave_sample_o <= wave_sample_o;
            end
    end


endmodule
