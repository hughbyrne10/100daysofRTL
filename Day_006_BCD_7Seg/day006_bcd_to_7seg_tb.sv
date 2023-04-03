`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module day006_bcd_to_7seg_tb;

logic [3:0] bcd_i;

logic ca_o;
logic cb_o;
logic cc_o;
logic cd_o;
logic ce_o;
logic cf_o;
logic cg_o;

// Instantiate the module under test
day006_bcd_to_7seg DAY006_BCD_TO_7SEG(.*); 

// Stimulus generation
initial begin
    bcd_i = 4'b0000;
    #10;
    bcd_i = 4'b0001;
    #10;
    bcd_i = 4'b0010;
    #10;
    bcd_i = 4'b0011;
    #10;
    bcd_i = 4'b0100;
    #10;
    bcd_i = 4'b0101;
    #10;
    bcd_i = 4'b0110;
    #10;
    bcd_i = 4'b0111;
    #10;
    bcd_i = 4'b1000;
    #10;
    bcd_i = 4'b1001;
    #10;
    bcd_i = 4'b1010;
    #10;
    bcd_i = 4'b1011;
    #10;
    bcd_i = 4'b1100;
    #10;
    bcd_i = 4'b1101;
    #10;
    bcd_i = 4'b1110;
    #10;
    bcd_i = 4'b1111;
    #10;
    
    $finish();
end

endmodule

