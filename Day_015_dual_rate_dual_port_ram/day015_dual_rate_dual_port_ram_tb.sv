`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module day015_dual_rate_dual_port_ram_tb();

function integer clogb2;
    input integer depth;
        for (clogb2=0; depth>0; clogb2=clogb2+1)
            depth = depth >> 1;
endfunction

parameter CYCLE_A = 10;
parameter CYCLE_B = 14;

parameter DATA_WIDTH = 8;
parameter DEPTH = 8;
parameter VAL = 4;
localparam integer ADDR_WIDTH = clogb2(DEPTH-1);

logic clk_a_i;
logic clk_b_i;
logic [DATA_WIDTH-1:0] data_in_a_i;
logic [DATA_WIDTH-1:0] data_in_b_i;
logic [ADDR_WIDTH-1:0] addr_a_i;
logic [ADDR_WIDTH-1:0] addr_b_i;
logic we_a_i;
logic we_b_i;
logic en_a_i;
logic en_b_i;
logic n_rst_a_i;
logic n_rst_b_i;

logic [DATA_WIDTH-1:0] data_out_a_o;
logic [DATA_WIDTH-1:0] data_out_b_o;


day015_dual_rate_dual_port_ram DAY015_DUAL_RATE_DUAL_PORT_RAM(.*);

always #(CYCLE_A/2) clk_a_i = ~clk_a_i;

always #(CYCLE_B/2) clk_b_i = ~clk_b_i;

// Write and read operations
initial begin
        // Write data to the RAM module
        en_a_i = 1;
        we_a_i = 1;
        clk_a_i = 0;
        data_in_a_i = 0;
        addr_a_i = 0;
        
        
        n_rst_a_i = 0;
        #CYCLE_A;
        n_rst_a_i = 1;
        #CYCLE_A;
        for (int i = 1; i < VAL+1; i++) begin
            data_in_a_i = i;
            addr_a_i = i-1;
            #CYCLE_A;  // Wait for one clock cycle
        end
        we_a_i = 0;            
        // Read data from the RAM module (different addresses)
        for (int i = 0; i < VAL; i++) begin
            addr_a_i = i;
            #CYCLE_A;  // Wait for one clock cycle
            $display("Data at address %0d: %0d", addr_a_i, data_out_a_o);
        end
        #(CYCLE_A/2);
        // Read from the same memory locations
        for (int i = 0; i < DEPTH; i++) begin
            addr_a_i = i;
            #CYCLE_A;  // Wait for one clock cycle
            $display("Data at address %0d: %0d", addr_a_i, data_out_a_o);
        end 
        // Write to the same memory locations
        we_a_i = 1;
        for (int i = 1; i < DEPTH; i++) begin
            data_in_a_i = 15;
            addr_a_i = i-1;
            #CYCLE_A;  // Wait for one clock cycle
        end           
        we_a_i = 0;
        #CYCLE_A;
end

// Write and read operations
initial begin
        // Write data to the RAM module
        en_b_i = 1;
        we_b_i = 1;
        clk_b_i = 0;
        
        data_in_b_i = 0;
        addr_b_i = 0;
        
        n_rst_b_i = 0;
        #CYCLE_B;
        n_rst_b_i = 1;
        #CYCLE_B;
        for (int i = 1; i < VAL+1; i++) begin
            data_in_b_i = i+VAL;
            addr_b_i = (i+VAL) -1;
            #CYCLE_B;  // Wait for one clock cycle
        end
        we_b_i = 0;
            
        // Read data from the RAM module (different addresses)
        for (int i = 0; i < VAL; i++) begin
            addr_b_i = i +VAL;
            #CYCLE_B;  // Wait for one clock cycle
            $display("Data at address %0d: %0d", addr_b_i, data_out_b_o);
        end
        #(CYCLE_B/2);
        // Read from the same memory locations
        for (int i = 0; i < DEPTH; i++) begin
            addr_b_i = i;
            #CYCLE_B;  // Wait for one clock cycle
            $display("Data at address %0d: %0d", addr_b_i, data_out_b_o);
        end 
        // Write to the same memory locations
        we_b_i = 1;
        for (int i = 1; i < DEPTH; i++) begin
            data_in_b_i = 10;
            addr_b_i = i -1;
            #CYCLE_B;  // Wait for one clock cycle
        end
        we_b_i = 0;
        #CYCLE_B;       
        $finish();    
end
endmodule

