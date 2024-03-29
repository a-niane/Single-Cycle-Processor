`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Astou Niane
// 
// Create Date: 01/13/2021 12:41:34 PM
// Design Name: 
// Module Name: mux2
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


module mux2 #(parameter mux_width= 32) 
(   input [mux_width-1:0] a,b,
    input sel,
    output [mux_width-1:0] y
    );

    assign y = sel ? b : a; //picks A for 0, B for 1
endmodule
