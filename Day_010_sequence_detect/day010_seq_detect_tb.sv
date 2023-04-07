`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////

module day010_seq_detect_tb();

logic clk_i;
logic n_rst_i;
logic data_i;
logic seq_detected_o;


day010_seq_detect DAY010_SEQ_DETECT(.*);

always #5 clk_i = ~clk_i;

initial begin
    clk_i = 0;
    n_rst_i = 0;
    data_i = 1;
    #10;
    n_rst_i = 1;
    #10; 
    data_i = 1;
    #10;
    for(int i = 0; i < 3; i++)
        begin
            data_i = 0;
            #10;
            data_i = 1;
            #10;
            data_i = 1;
            #10;
            data_i = 0;
            #10;
        end
    for(int i = 0; i < 4; i++)
        begin
           data_i = ~data_i;
           #10;
        end
   $finish(); 
    
end


endmodule


