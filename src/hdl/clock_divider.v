`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2019 10:17:30 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input CLK_5_MHZ,        // Our input clock, good practice to name your clocks after their frequency
    input reset,            // Reset for resetting, in case you need to reset
    output reg CLK_2_HZ = 0 // Our output clock, notice its in Hz not MHz
    );
    integer count_2_HZ = 0;    // This is our count integer
    always @(posedge CLK_5_MHZ, posedge reset) begin // This is the start of our behavioral logic
        if(reset) begin                              // The logic below happens every positive edge
            count_2_HZ <= 0;                         // The reset is asynchronous
            CLK_2_HZ <= 0;
        end
        else begin
            if(count_2_HZ == 2500000) begin     // This is how we control the output clock's frequency
                count_2_HZ <= 0;                // count must equal to (input_clock)/(desired_output_clock)
                CLK_2_HZ <= ~CLK_2_HZ;          // Here's where we invert our output clock
            end
            else
                count_2_HZ <= count_2_HZ + 1;   // Don't forget this line, I've forgetten this many times
        end
    end
endmodule