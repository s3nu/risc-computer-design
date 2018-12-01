`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2017 09:16:17 AM
// Design Name: 
// Module Name: fact_dp
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


module fact_dp(input clk, rst, ld1, ud, ce, sel1, ld2, sel2, [3:0] n, output Error, is_GT, [31:0] result);
wire [3:0] Cnt_Reg;
wire [31:0] mul_out, mux_out1, reg_out1, reg_out2;

acc_mux u1 (sel1, 1, reg_out2, mux_out1);
Ud_Cnt_4 u2(n,ld1, ud, ce, clk, rst, Cnt_Reg);
fact_comparator u3 (Cnt_Reg, 1, is_GT, Error);
acc_reg u4 (clk, ld2, rst, mux_out1, reg_out1);
fact_alu u5 (reg_out1, {28'd0, Cnt_Reg}, 2'b00, reg_out2);
acc_mux2 u6 (sel2, 0, reg_out2, result);

endmodule
