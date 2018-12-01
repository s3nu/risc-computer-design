`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2017 06:31:30 PM
// Design Name: 
// Module Name: mips
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

module mips
(input clk, rst, [4:0] ra3, [31:0] instr, rd_dm, output we_dmM, [31:0] pc_current, alu_out, wd_dm, rd3);
    wire       pc_src, jump, we_reg, alu_src, we_dm, JReturn, writeHilo,   equalD, flushE, pcClr, branch;
    wire [2:0] alu_ctrl;
    wire [1:0] reg_dst, dm2reg, selJal, forwardAe, forwardBe, dm2regE, dm2regM;
    wire [4:0] RsD, RtD, RsE, RtE, rf_wa_M, raW, rf_wa;
    wire [31:0] instr_D;
    datapath    dp (.clk(clk), .rst(rst), .pc_src(pc_src), .jump(jump), .JReturn(JReturn), .writeHilo(writeHilo), .selJal(selJal), .we_reg(we_reg), .alu_src(alu_src), .branch(branch), .we_dm(we_dm), .dm2reg(dm2reg), .reg_dst(reg_dst),  
    .alu_ctrl(alu_ctrl), .ra3(ra3), .instr(instr), .rd_dm(rd_dm), .equalD(equalD), .we_dmM(we_dmM), .pc_current(pc_current), .alu_out_M(alu_out), .forwardBe_dm(wd_dm), .rd3(rd3), .instr_D(instr_D));
    controlunit cu (.clk(clk), .rst(rst), .equalD(equalD), .opcode(instr_D [31:26]), .funct(instr_D[5:0]), .pc_src(pc_src), .jump(jump), .we_reg(we_reg), .alu_src(alu_src), .we_dm(we_dm), .JReturn(JReturn), .writeHilo(writeHilo), 
    .selJal(selJal),  .branch(branch), .dm2reg(dm2reg), .reg_dst(reg_dst), .alu_ctrl(alu_ctrl));
    
    
 endmodule
