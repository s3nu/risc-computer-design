`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2017 02:21:18 PM
// Design Name: 
// Module Name: top_Factorial_Accelerator
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


module top_Factorial_Accelerator(input we, clk, rst, [1:0] a, [3:0] wd, output [31:0] rd);
wire we1, we2, Go, GoPulse, Done, Err, resErr, resDone;
wire [1:0] rdSel;
wire [3:0] wd_q;
wire [31:0] result, result_q, resDone_q;
wire wd_And;
assign wd_And = we2 & wd[0];
fact_ad u0 ( we, a, we1, we2, rdSel);
fact_dff4 u1 (we1, clk, rst, wd, wd_q);
fact_dff u2(we2, clk, rst, wd[0], Go);
fact_dff u3(1, clk, rst, wd_And, GoPulse);
Factorial_Accelerator u4 (clk, rst, GoPulse, wd_q, Done, Err, result);
fact_error_reg u5 (clk, rst, wd_And, Err, resErr );
fact_result_reg u6 (clk, rst, wd_And, Done, resDone );
fact_reg u7 (clk, rst, Done, result, result_q);
fact_mux u8 (Go, resErr, resDone, rdSel, wd_q, result_q, rd);

endmodule
