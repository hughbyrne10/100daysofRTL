`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module day2_full_adder_tb();

logic a_i;
logic b_i;
logic cin_i;
logic sum_o;
logic cout_o;

logic [2:0] test_bus;

day2_full_adder DAY2_FULL_ADDER(.*);

initial begin
    test_bus = 3'b000;
    for(int i = 0; i<8; i++)
        begin
            {a_i,b_i,cin_i} = test_bus;
            #10;
            test_bus = test_bus + 1;     
        end
    $finish();
end

endmodule
