`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2017 01:17:21 PM
// Design Name: 
// Module Name: convert_to_signed
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// R4evision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module convert_to_signed(input [3:0] a, output reg signed [4:0] out);
reg signed [4:0] temp;
always @(a, out, temp)
begin
temp = a;
temp = out;
end
endmodule
