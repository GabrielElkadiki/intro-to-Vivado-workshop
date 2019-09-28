`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2019 10:17:30 PM
// Design Name: 
// Module Name: display_mux
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


module mux #(parameter size = 16) ( // Parameters are set like this, the default size here is 16
    input sel,      // Our select switch, we can use this to select which output we want to display
    input [size-1:0] A, // Our first input, we can assign this to the flash led output
    input [size-1:0] B, // Our second input, we can assign this to the shift led output
    output [size-1:0] out    // Our seleced output
    );

    // MUXs can be synthesized using multiple methods, this is the most compact way to create a 2 to 1 MUX
    assign out = sel ? A : B; // condition ? if true : if false

endmodule
