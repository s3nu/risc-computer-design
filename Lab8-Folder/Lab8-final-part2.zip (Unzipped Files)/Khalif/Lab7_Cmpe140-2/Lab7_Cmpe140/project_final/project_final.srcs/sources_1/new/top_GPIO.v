`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2017 02:43:15 PM
// Design Name: 
// Module Name: top_GPIO
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


module top_GPIO(input we, clk, rst, [1:0] a, [31:0] gp0, gp1, wd, output [31:0] rd, gpio0, gpio1);
wire we1, we2;
wire [1:0] rdSel;
 gpio_Ad u0 ( we, a, we1, we2, rdSel);
 gpio_dff u1 (we1, clk, rst, wd, gpio0);
 gpio_dff u2 (we2, clk, rst, wd, gpio1);
 mux32 u3 (rdSel, gp0, gp1, gpio0, gpio1, rd);
endmodule
