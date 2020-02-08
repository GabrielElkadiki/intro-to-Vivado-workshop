`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 12:50:54 AM
// Design Name: 
// Module Name: data_flow_example
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


module data_flow_example(
    input a,
    input b,
    input c,
    input d,
    output out
    );
    
    assign out = ~(((a & b) | (~c)) & d);
endmodule
