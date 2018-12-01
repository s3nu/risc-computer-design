`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2017 05:50:34 PM
// Design Name: 
// Module Name: fact_mul
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


module fact_mul(input [3:0] a, [31:0] b, output reg [31:0] y);
always @(*)
begin
    y = a * b;
    if(!y) y = 1;
end
endmodule
