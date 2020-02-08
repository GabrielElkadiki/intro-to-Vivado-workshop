`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 12:50:54 AM
// Design Name: 
// Module Name: behavioural_example
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

// Not a great example of behavioral modelling but demonstrates how to use it instead of data-flow
module behavioural_example(
    input a,
    input b,
    input c,
    input d,
    output reg out // Behavioral modelling requires the use of registers but doesn't always synthesize any registers
    );
    // Any values set within a procedural block like below must be registers
    always @(a, b, c, d) begin          // The procedural block declaration, notice the begin & end statements
        out = ~(((a & b) | (~c)) & d);  // Looks very similar to data-flow
    end
endmodule
