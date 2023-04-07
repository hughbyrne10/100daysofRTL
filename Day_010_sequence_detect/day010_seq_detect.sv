`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  sequence detect 0110
//////////////////////////////////////////////////////////////////////////////////


module day010_seq_detect(
  input logic clk_i,
  input logic n_rst_i,
  input logic data_i,
  output logic seq_detected_o
);

parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b101;

// Define the state register and current state variable



logic [2:0] current_state, state_next;
  
// Define the state transition logic
always_ff@(posedge clk_i, negedge n_rst_i)
    begin
        if (n_rst_i == 1'b0) 
            begin
                current_state <= S0;
            end 
        else 
            begin
                current_state <= state_next;
            end
    end

// Define the state machine logic
always_comb
    begin       
        case (current_state)
            S0:
            if (data_i == 1'b0) 
                begin
                    state_next = S1;
                end 
            else 
                begin
                    state_next = S0;
                end
            S1:
            if (data_i == 1'b1) 
                begin
                    state_next = S2;
                end 
            else 
                begin
                    state_next = S1;
                end   
            S2:
            if (data_i == 1'b1) 
                begin
                    state_next = S3;
                end 
            else 
                begin
                    state_next = S1;
                end
            S3:
            if (data_i == 1'b0) 
                begin
                    state_next = S4;
                end 
            else 
                begin
                    state_next = S1;
                end     
            S4:
            if (data_i == 1'b0) 
            begin
                state_next = S1;
            end 
        else 
            begin
                state_next = S0;
            end        
        endcase
    end

// Define the output logic
always_comb
    begin
        if (current_state == S4) 
            begin
                seq_detected_o = 1;
            end 
        else 
            begin
                seq_detected_o = 0;
            end
    end
  
endmodule