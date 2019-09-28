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


module shift(   // Pretty similar to flash.v with only one extra input
    input sel,  // This will be our switch to control direction
    input clk,  // This design expects a 2Hz clock
    input reset,    // More reset, cool
    output reg [15:0] led = 0   // Our output LED
    );
    
    reg [3:0] shift_count = 0; // This counter watches controls which LED is on at any given moment
    always @(posedge clk, posedge reset) begin
        if (reset) begin        // Reset block
            shift_count <= 0;
            led <= 0;
        end
        else begin
        if(shift_count >= 15) begin // Resets the shift count when it gets too big
            shift_count <= 0;
        end
        // This is where the magic happens, the led output is either binary shifted to the left or right
        // starting at 1 if binary shifting left, starting at 2^15 if shifting from the right
        // and controlled by the 'sel' switch 
        led <= sel ? 1 << shift_count : 2**15 >> shift_count; // condition ? if true : if false
                                                              
        shift_count <= shift_count + 1;                // this line again
        end
    end
endmodule
