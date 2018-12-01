`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2017 09:48:29 AM
// Design Name: 
// Module Name: Factorial_Accelerator
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


module Factorial_Accelerator(input clk, rst, Go, [3:0] n, output Done, Err, [31:0] nf);
wire Is_GT, Error;
wire [5:0] ctrl;
fact_cu u1(clk, rst, Go, Is_GT, Error, Done, Err, ctrl);
fact_dp u2 (clk, rst, ctrl[5], ctrl[4], ctrl[3], ctrl[2], ctrl[1], ctrl[0], n, Error, Is_GT, nf);
endmodule
