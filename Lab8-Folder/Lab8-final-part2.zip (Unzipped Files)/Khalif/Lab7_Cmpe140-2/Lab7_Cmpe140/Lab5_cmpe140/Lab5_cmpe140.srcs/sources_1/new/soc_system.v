`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2017 02:08:03 AM
// Design Name: 
// Module Name: soc_system
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


module soc_system(input clk, rst, [31:0] gp0, gp1, output [31:0] gpio0, gpio1);
    wire [31:0] DONT_USE,fact_rd, gpioData, data_out,  pc_current, instr, alu_out, wd_dm, rd_dm;
    wire we_dm, we1, we2, weM;
    wire [1:0] rdSel;
    mips mips (clk, rst, 0, instr, rd_dm, we_dm, pc_current, alu_out, wd_dm, DONT_USE);
    imem imem (pc_current[7:2], instr);
    dmem dmem (clk, weM, alu_out[7:2], wd_dm, data_out);
    Soc_mux mux (rdSel, data_out, data_out, fact_rd, gpioData, rd_dm);
    topDecoder decoder (we_dm, alu_out, we1, we2, weM, rdSel);
    top_Factorial_Accelerator u0 (we1, clk, rst, alu_out[3:2], wd_dm[3:0], fact_rd);
    top_GPIO u1 (we2, clk, rst, alu_out[3:2], gp0, gp1, wd_dm, gpioData, gpio0, gpio1);
endmodule
