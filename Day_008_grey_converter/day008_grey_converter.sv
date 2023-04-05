`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Grey Converter
//////////////////////////////////////////////////////////////////////////////////

module day008_grey_converter #(parameter width = 3) (
    input logic [width-1:0] bin,
    output logic [width-1:0] grey
);

genvar i;
generate
    for (i = 0; i < width; i++) begin
        assign grey[i] = (i == (width - 1)) ? bin[i] : (bin[i] ^ bin[i+1]);
    end
endgenerate

endmodule