`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2017 09:28:37 AM
// Design Name: 
// Module Name: Comparator_GT
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


module Comparator_GT(input [31:0] a, b, output reg greater);
always @(*)
begin
if(a > b) greater = 1;
else greater = 0;
end
endmodule
