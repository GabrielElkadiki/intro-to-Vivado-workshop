`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2019 10:17:30 PM
// Design Name: 
// Module Name: left_shift
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


module flash(
    input clk,              // This expects our slowed down 2Hz clock
    input reset,            // Another reset..
    output reg [15:0] led = 0   // This is a 16 bit output for all 16 LEDs
    );
    
    integer flash_delay = 0;    // We will use this like the clock divider counter to slow down the 2Hz signal a bit
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            flash_delay <= 0;   // Always make sure all values are reset in reset blocks
            led <= 0;
        end
        else begin
            if(flash_delay >= 3) begin  // Similar to the clock divider, the led is inverted at a slower rate
                flash_delay <= 0;       // thanks to the flash_delay
                led <= ~led;
            end
            else begin
                flash_delay <= flash_delay + 1;     // Again, don't forget this line
            end
        end
    end
endmodule
