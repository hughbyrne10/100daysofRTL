`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module day008_grey_converter_tb;

parameter width = 3;

logic [width-1:0] bin;

logic [width-1:0] grey;

day008_grey_converter DAY008_GREY_CONVERTER(.*);

always #5 bin = bin + 1;

initial begin
    bin = 0;
    #80;
    $finish();

end

endmodule

