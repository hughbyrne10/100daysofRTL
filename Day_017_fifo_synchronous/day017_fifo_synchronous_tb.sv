`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2023 15:09:50
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module day017_fifo_synchronous_tb();

logic clk_i;
logic we_i;
logic re_i;
logic [7:0] data_in_i;
logic n_rst_i;
logic [7:0] data_out_o;
logic full_o;
logic empty_o;

day017_fifo_synchronous DAY017_FIFO_SYNCHRONOUS(.*);

always #5 clk_i = ~clk_i;

initial begin
    clk_i = 0;
    n_rst_i = 0;
    we_i = 0;
    re_i = 0;
    data_in_i = 8'hFF;
    #10;
    n_rst_i = 1;
    #10;
    for(int i = 0; i < 9; i++)
        begin
            we_i = 1;
            #10;
            we_i = 0;
            data_in_i = data_in_i - 8'h11;
            #10;
        end
     #10;
     for(int i = 0; i < 9; i++)
        begin
            re_i = 1;
            #10;
            re_i = 0;
            #10;
        end
     #10;
     $finish();   
end



endmodule