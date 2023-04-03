`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// BCD to 7-Seg
//////////////////////////////////////////////////////////////////////////////////

module day006_bcd_to_7seg(
    input logic[3:0] bcd_i,
    output logic ca_o,
    output logic cb_o,
    output logic cc_o,
    output logic cd_o,
    output logic ce_o,
    output logic cf_o,
    output logic cg_o
);

logic [6:0] segments;

assign {cg_o,cf_o,ce_o,cd_o,cc_o,cb_o,ca_o} = segments;

always @(*) begin
    case (bcd_i)
        4'b0000: segments = 7'b1000000; // 0
        4'b0001: segments = 7'b1111001; // 1
        4'b0010: segments = 7'b0100100; // 2
        4'b0011: segments = 7'b0110000; // 3
        4'b0100: segments = 7'b0011001; // 4
        4'b0101: segments = 7'b0010010; // 5
        4'b0110: segments = 7'b0000010; // 6
        4'b0111: segments = 7'b1111000; // 7
        4'b1000: segments = 7'b0000000; // 8
        4'b1001: segments = 7'b0011000; // 9
        default: segments = 7'b0111111; // display unique symbol for all values outside of binary 0000 to 1001
    endcase
end

endmodule