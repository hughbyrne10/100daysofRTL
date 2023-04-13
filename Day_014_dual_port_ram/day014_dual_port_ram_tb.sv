`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module day014_dual_port_ram_tb();

function integer clogb2;
    input integer depth;
        for (clogb2=0; depth>0; clogb2=clogb2+1)
            depth = depth >> 1;
endfunction

parameter DATA_WIDTH = 8;
parameter DEPTH = 8;
parameter VAL = 4;
localparam integer ADDR_WIDTH = clogb2(DEPTH-1);

logic clk_i;
logic [DATA_WIDTH-1:0] data_in_a_i;
logic [DATA_WIDTH-1:0] data_in_b_i;
logic [ADDR_WIDTH-1:0] addr_a_i;
logic [ADDR_WIDTH-1:0] addr_b_i;
logic we_a_i;
logic we_b_i;

logic [DATA_WIDTH-1:0] data_out_a_o;
logic [DATA_WIDTH-1:0] data_out_b_o;


day014_dual_port_ram DAY014_DUAL_PORT_RAM(.*);

always #5 clk_i = ~clk_i;

// Write and read operations
initial begin
        // Write data to the RAM module
        we_a_i = 1;
        clk_i = 0;
        data_in_a_i = 0;
        addr_a_i = 0;
        we_b_i = 1;
        data_in_b_i = 0;
        addr_b_i = 0;
        #10;
        for (int i = 1; i < VAL+1; i++) begin
            data_in_a_i = i;
            addr_a_i = i-1;
            data_in_b_i = i+VAL;
            addr_b_i = (i+VAL) -1;
            #10;  // Wait for one clock cycle
        end
        we_a_i = 0;
        we_b_i = 0;
            
        // Read data from the RAM module (different addresses)
        for (int i = 0; i < VAL; i++) begin
            addr_a_i = i;
            addr_b_i = i +VAL;
            #10;  // Wait for one clock cycle
            $display("Data at address %0d: %0d", addr_a_i, data_out_a_o);
            $display("Data at address %0d: %0d", addr_b_i, data_out_b_o);
        end
        #5;
        // Read from the same memory locations
        for (int i = 0; i < DEPTH; i++) begin
            addr_a_i = i;
            addr_b_i = i;
            #10;  // Wait for one clock cycle
            $display("Data at address %0d: %0d", addr_a_i, data_out_a_o);
            $display("Data at address %0d: %0d", addr_b_i, data_out_b_o);
        end 
        // Write to the same memory locations
        we_a_i = 1;
        we_b_i = 1;
        for (int i = 1; i < DEPTH; i++) begin
            data_in_a_i = 15;
            addr_a_i = i-1;
            data_in_b_i = 10;
            addr_b_i = i -1;
            #10;  // Wait for one clock cycle
        end       
        $finish();    
end


endmodule

