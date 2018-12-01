`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2017 05:56:22 PM
// Design Name: 
// Module Name: acc_mux
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


module acc_mux(input sel, [31:0] a, b, output reg [31:0] y);

always @(sel, a, b)
begin
    if(sel) y <= b;
    else y <= a;
end
endmodule
