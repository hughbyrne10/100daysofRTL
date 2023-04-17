`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////


module day016_simple_dual_port_ram_tb();

logic clk_i;
logic re_i;
logic we_i;
logic n_rst_i;
logic [2:0] addr_a_i;
logic [2:0] addr_b_i;
logic [7:0] data_in_i;
logic [7:0] data_out_o;


day016_simple_dual_port_ram DAY016_SIMPLE_DUAL_PORT_RAM(.*);

always #5 clk_i = ~clk_i;

initial begin
    clk_i = 0;
    re_i = 0;
    we_i = 1;
    addr_a_i = 0;
    addr_b_i = 0;
    data_in_i = 8'hAA;
    n_rst_i = 0;
    #10;
    n_rst_i = 1;
    #10;

    // Write operation
    we_i = 1;
    addr_a_i = 0;
    data_in_i = 8'hFF;
    #10;

    // Read operation
    we_i = 0;
    re_i = 1;
    addr_b_i = 0;
    #10;

    // Verify output
    if (data_out_o === 8'hFF)
    $display("\nRead operation successful\n");
    else
    $display("\nRead operation failed\n");

    // End simulation
    #10;
    $finish();
end

endmodule