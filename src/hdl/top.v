`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2019 10:17:30 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,          // Our master clock at 100MHz, too fast so lets divide it
    input reset,        // We will use this reset to reset our flash/shift module
    input shift_sel,    // This will be how we control the direction of the shift module
    input func_sel,     // This will be how we select flash or shift outputs
    output [15:0] led   // Our final led output based on the user's choice of switche settings
    );
        
    wire CLK_2_HZ;      // This is an important wire, it comes from the clock divider.
    clock_divider clk_div(          // This is how modules are instantiated. 
        .clk        (clk),    // They look similar to function calls but notice the '.'
        .reset      (reset),        // This is known as using named port connections, 
        .CLK_2_HZ   (CLK_2_HZ)      // you name the port you want to connect to on the left after a '.' and in brackets '()' your inputs/output wires
    );                              // The other option is using ordered port connections, I don't recommend those..
    
    wire [15:0] shift_led;      // This is the wire holding the shift led output values
    shift shifter(
        .sel    (shift_sel),
        .clk    (CLK_2_HZ),     // Good & slow 2Hz
        .led    (shift_led),    // We want to wire here
        .reset  (reset)         // Gotta have a reset
    );
    
    wire [15:0] flash_led;      // This is the wire holding the flash led output values
    flash flasher(
        .clk    (CLK_2_HZ),     // Slooow clock
        .reset  (reset),        // Reset
        .led    (flash_led)     // we will wire our flash_led here
        );

    
    mux display_mux(        // And last, and certainly least (In hardware usage) the MUX!
        .sel    (func_sel),     // We want to wire our user input for flash/shift straight here
        .A      (shift_led),    // We want to add both led outputs here and wire them as inputs
        .B      (flash_led),
        .out    (led)       // Our final led output value
    );
    
endmodule

