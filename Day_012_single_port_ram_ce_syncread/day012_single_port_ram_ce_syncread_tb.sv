`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module day012_single_port_ram_ce_syncread_tb();

function integer clogb2;
    input integer depth;
        for (clogb2=0; depth>0; clogb2=clogb2+1)
            depth = depth >> 1;
endfunction

parameter DATA_WIDTH = 8;
parameter DEPTH = 8;
localparam integer ADDR_WIDTH = clogb2(DEPTH-1);

logic clk_i;
logic [DATA_WIDTH-1:0] data_in_i;
logic [ADDR_WIDTH-1:0] addr_i;
logic we_i;
logic ce_i;
logic n_rst_i;

logic [DATA_WIDTH-1:0] data_out_o;


day012_single_port_ram_ce_syncread DAY012_SINGLE_PORT_RAM_CE_SYNCREAD(.*);

always #5 clk_i = ~clk_i;

// Write and read operations
initial begin
    n_rst_i = 0;
    for(int j = 1; j > -1; j--)
        begin
            // Write data to the RAM module
            we_i = 1;
            ce_i = j;
            clk_i = 0;
            data_in_i = 0;
            addr_i = 0;
            #10;
            n_rst_i =1;
            #10;
            for (int i = 1; i < DEPTH+1; i++) begin
                data_in_i = i;
                addr_i = i-1;
                #10;  // Wait for one clock cycle
            end
            we_i = 0;
                
            // Read data from the RAM module
            for (int i = 0; i < DEPTH; i++) begin
                addr_i = i;
                #10;  // Wait for one clock cycle
                $display("Data at address %0d: %0d", addr_i, data_out_o);
            end
            #5;
        end
        $finish();    
end


endmodule

