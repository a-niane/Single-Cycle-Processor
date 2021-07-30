`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Astou Niane
// 
// Create Date: 01/13/2021 12:39:01 PM
// Design Name: 
// Module Name: control
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


module control(
    input reset,
    input[5:0] opcode,  
    output reg reg_dst, mem_to_reg, 
    output reg [1:0] alu_op,  
    output reg mem_read, mem_write, alu_src, reg_write, branch, jump 
    );
    
always @(*)  
begin  
   if(reset == 1'b1) 
   begin  
      reg_dst = 1'b0;  
      mem_to_reg = 1'b0;  
      alu_op = 2'b10;  //why is reset 10?
      mem_read = 1'b0;  
      mem_write = 1'b0;  
      alu_src = 1'b0;  
      reg_write = 1'b0;   
      //adding jump and branch  
      branch = 1'b0;
      jump = 1'b0;   
   end  
   else 
   begin  
      case(opcode) 
      6'b000000: 
      begin // add, and, or, sub, nor, mult, div, slt, xor (all R-types)
            reg_dst = 1'b1;  //1
            mem_to_reg = 1'b0;  
            alu_op = 2'b10; //all of them share 10 as ALU_op 
            mem_read = 1'b0;  
            mem_write = 1'b0;  
            alu_src = 1'b0;  
            reg_write = 1'b1; //1
            branch = 1'b0;
            jump = 1'b0;  
            
      end     
      6'b000010: 
      begin //jump
            reg_dst = 1'bx; //x  
            mem_to_reg = 1'bx; //x 
            alu_op = 2'bxx; //jump has no ALU_op 
            mem_read = 1'b0;  
            mem_write = 1'b0;  
            alu_src = 1'bx; //x  
            reg_write = 1'b0; 
            branch = 1'b0;
            jump = 1'b1;  //1
            
      end 
      6'b000100: 
      begin //beq
            reg_dst = 1'bx; //x  
            mem_to_reg = 1'bx; //x 
            alu_op = 2'b01;  //01
            mem_read = 1'b0;  
            mem_write = 1'b0;  
            alu_src = 1'b0;  
            reg_write = 1'b0; 
            branch = 1'b1; //1
            jump = 1'b0;  
            
      end       
      6'b001000: 
      begin // addi 
            reg_dst = 1'b0;  
            mem_to_reg = 1'b0;  
            alu_op = 2'b00; //00  
            mem_read = 1'b0;  
            mem_write = 1'b0;  
            alu_src = 1'b1;  //1 
            reg_write = 1'b1; //1
            branch = 1'b0;
            jump = 1'b0;    
      end 
      6'b001100: 
      begin // andi 
            reg_dst = 1'b0;  
            mem_to_reg = 1'b0;  
            alu_op = 2'b11; //11
            mem_read = 1'b0;  
            mem_write = 1'b0;  
            alu_src = 1'b1; //1 
            reg_write = 1'b1; //1
            branch = 1'b0;
            jump = 1'b0;    
      end 
      6'b100011: 
      begin // lw  
            reg_dst = 1'b0;  
            mem_to_reg = 1'b1;//1  
            alu_op = 2'b00;   //00 
            mem_read = 1'b1; //1 
            mem_write = 1'b0;  
            alu_src = 1'b1;  //1
            reg_write = 1'b1; //1
            branch = 1'b0;
            jump = 1'b0;   
       end   
      6'b101011: 
      begin // sw  
            reg_dst = 1'bx; //x
            mem_to_reg = 1'bx;  //x
            alu_op = 2'b00;  //00 
            mem_read = 1'b0;  
            mem_write = 1'b1; //1 
            alu_src = 1'b1;  //1
            reg_write = 1'b0; 
            branch = 1'b0;
            jump = 1'b0;  
      end  
      6'b110000: 
      begin // sll, srl, sra  (R-type, different opcode)
            reg_dst = 1'b1;  //1
            mem_to_reg = 1'b0;  
            alu_op = 2'b10; //all of them share 10 as ALU_op 
            mem_read = 1'b0;  
            mem_write = 1'b0;  
            alu_src = 1'b1;  //1 (shifting A B times, after B's sign extend)
            reg_write = 1'b1; //1
            branch = 1'b0;
            jump = 1'b0;  
      end  
      default: //added default
      begin
          reg_dst = 1'b0;  
          mem_to_reg = 1'b0;  
          alu_op = 2'b00;  
          mem_read = 1'b0;  
          mem_write = 1'b0;  
          alu_src = 1'b0;  
          reg_write = 1'b0;     
          branch = 1'b0;
          jump = 1'b0;   
      end
      endcase  
   end  
 end 
 endmodule 
