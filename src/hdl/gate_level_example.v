`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 12:50:54 AM
// Design Name: 
// Module Name: gate_level_example
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


module gate_level_example(
    input a,
    input b,
    input c,
    input d,
    output out
    );
    
    wire net1;  // Instansiate all the nets as wires
    wire net2;  // Nets are simply the outputs of each logic gate
    wire net3;  // Easiest way to organize gate level designs is to number all nets on a diagram
    wire net4;
    // Syntax GATE GATE_NAME(OUTPUT, INPUT1, INPUT2, INPUT3, etc..)
    and A1(net1, a, b);      // AND gate with a & b being assigned to net1
    not N1(net2, c);         // NOT gate with c being assigned to net2
    or O1(net3, net1, net2); // OR gate with net1 & net2 being assigned to net3
    and A2(net4, net3, d);   // AND gate with net3 & d being assigned to net4
    not(out, net4);          // NOT gate with net4 finally being assigned to out 
    
endmodule
