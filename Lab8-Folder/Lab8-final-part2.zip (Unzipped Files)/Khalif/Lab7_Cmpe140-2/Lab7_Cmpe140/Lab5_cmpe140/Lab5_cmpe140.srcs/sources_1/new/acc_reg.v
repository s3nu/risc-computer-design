`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2017 05:58:12 PM
// Design Name: 
// Module Name: acc_reg
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


module acc_reg(input clk, en, rst, [31:0] d, output reg [31:0] q);
always @(posedge clk, posedge rst)
begin
    if(rst) q <= 0;
    else 
    begin
        if(en) q <= d;
        else q <= q;
    end
end
endmodule
