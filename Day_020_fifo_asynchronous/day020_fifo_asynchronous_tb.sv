`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
//////////////////////////////////////////////////////////////////////////////////


module day020_fifo_asynchronous_tb();

// ROM


// FIFO
logic clk_wr_i;
logic clk_rd_i;
logic we_i;
logic re_i;
logic [15:0] data_in_i;

logic [15:0] data_out_o;
logic full_o;
logic empty_o;



// All
logic n_rst_i;

day020_fifo_asynchronous DAY020_FIFO_ASYNCHRONOUS(.*);

sine_generator #(16,10,1000)
    SINE_GENERATOR(clk_wr_i,~full_o,n_rst_i,data_in_i);

always #5 clk_wr_i = ~clk_wr_i;
always #15 clk_rd_i = ~clk_rd_i;

initial begin
    we_i = 0;
    re_i = 0;
    n_rst_i = 0;
    #10;
    n_rst_i = 1;
    #10;
end

// Write and Read from FIFO simultaneously
initial begin
    clk_wr_i = 0;
    #20;
    for(int i = 0; i < i+1; i++)
        begin
            we_i = 1;
            #10;
        end
     #10;
end    
initial begin
    clk_rd_i = 0;
    #30;
    for(int i = 0; i < i+1; i++)
        begin
            re_i = 1;
            #30;
        end
     #30;    
     $finish();
end



endmodule