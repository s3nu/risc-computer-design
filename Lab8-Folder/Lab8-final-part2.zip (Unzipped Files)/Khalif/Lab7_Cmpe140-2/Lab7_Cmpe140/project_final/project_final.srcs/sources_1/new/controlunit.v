`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2017 06:10:01 PM
// Design Name: 
// Module Name: controlunit
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

module controlunit
(input clk, rst, equalD, [5:0] opcode, funct, output pc_src, jump, we_reg, alu_src, we_dm, JReturn, writeHilo, branch,[1:0] dm2reg, reg_dst, selJal,  [2:0] alu_ctrl);
    wire [1:0] alu_op;
    assign pc_src = branch & equalD;
    maindec md (opcode, funct, branch, jump, writeHilo, we_reg, alu_src, we_dm, dm2reg, reg_dst, alu_op, selJal);
    auxdec  ad (alu_op, funct, JReturn, alu_ctrl);
endmodule