`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Astou Niane
// 
// Create Date: 01/13/2021 12:43:51 PM
// Design Name: 
// Module Name: ALU
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

module ALU(
    input [31:0] a,  
    input [31:0] b, 
    input [3:0] alu_control,
    output zero, 
    output reg [31:0] alu_result);  
    
    wire signed [31:0] signed_a;
    assign signed_a = a;
    
 always @(*)
 begin   
      case(alu_control) //implement the rest from alu_control on table 4  
      4'b0000: alu_result = a & b; // and, andi  
      4'b0001: alu_result = a | b; // or  
      4'b0010: alu_result = a + b; // add, addi, lw, sw  
      4'b0100: alu_result = a ^ b; //xor
      4'b0101: alu_result = a * b; //mult
      4'b0110: alu_result = a - b; // sub, beq 
      4'b0111: alu_result = (a < b) ? 32'b1 : 32'b0; //slt
      4'b1000: alu_result = a << b[10:6]; //sll 
      4'b1001: alu_result = a >> b[10:6]; //srl 
      4'b1010: alu_result = signed_a >>> b[10:6]; //sra 
      4'b1011: alu_result = a / b; //div
      4'b1100: alu_result = ~(a | b); //nor
      default: alu_result = a + b; // add  
      endcase  
 end  
 assign zero = (alu_result==32'd0) ? 1'b1: 1'b0;

endmodule
