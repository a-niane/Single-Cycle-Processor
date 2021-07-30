# Single-Cycle-Processor
Implemented Verilog on Vivado 2019.

The overall objective is to modify a set of given MIPS modules and complete a Single-Cycle processor with all of the available instructions. Additionally, we add on to the given datapath in order to fit two new instruction types, branch and jump, and modify the control signals for them. Afterwards, we create our own instructions to add into one of the modules and test our implementation using the teacher-assigned testbench. 

There are ten modules that are related to the single-cycle processor:
1. Mips_32: Inputs clock and reset into the three main parts of the processor: Control, ALU_Control, and Datapath.
2. Control: Activates certain signals to work other modules in the datapath for different processes
3. ALU_Control: Decides based on opcode and function what kind of operation
4. Datapath: Arranges all other modules and signals together for operations such as computing a memory address, an arithmetic result, or an equality check.
5. Instruction_Memory: Uses address from program counter to initiate instructions
6. Register_File: Contains data from register operands, and either delivers the information to other modules, or writes back new information
7. Sign_Extend: Mainly for I-Format functions, extends the sign of a 16-bit instruction to a 32-bit input
8. ALU: Performs arithmetic operations for all 18 instruction types
9. Multiplexer: Uses a selector to choose between two inputs to pass as a signal
10. Data Memory: Writes or reads information into/from the memory
