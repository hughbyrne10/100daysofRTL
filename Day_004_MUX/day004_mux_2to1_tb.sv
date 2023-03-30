`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module day004_mux_2to1_tb();

logic [7:0] a_i;
logic [7:0] b_i;
logic       sel_i;
logic [7:0] y_o;

day004_mux_2to1 DAY004_MUX_2TO1(.*);

initial
    begin
        for(int i = 0; i < 16; i++)
            begin
                a_i = $urandom_range (0, 8'hFF);
                b_i = $urandom_range (0, 8'hFF);
                sel_i = $random%2;
                #10;
            end
        $finish();       
    end

endmodule
