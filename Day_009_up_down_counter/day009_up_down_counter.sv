`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// up down counter
//////////////////////////////////////////////////////////////////////////////////

module day009_up_down_counter#(parameter width = 4)(
    input logic clk_i,         
    input logic n_rst_i,         
    input logic up_down_i,     
    input logic enable_i,      
    output logic [width-1:0] cnt_o 
);

always @(posedge clk_i, negedge n_rst_i) 
    begin
        if (n_rst_i == 1'b0) 
            begin
                cnt_o <= 'b0; // reset counter to zero
            end
        else if (enable_i) 
            begin
                if (up_down_i) 
                    begin // up mode
                        cnt_o <= cnt_o + 1;
                    end
                else 
                    begin // down mode
                        cnt_o <= cnt_o - 1;
                    end
            end
    end 

endmodule
