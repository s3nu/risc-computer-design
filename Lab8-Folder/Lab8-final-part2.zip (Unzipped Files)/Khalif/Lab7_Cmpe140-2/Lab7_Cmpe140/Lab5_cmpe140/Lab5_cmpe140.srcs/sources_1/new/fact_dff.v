`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2017 02:26:03 PM
// Design Name: 
// Module Name: fact_dff
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


module fact_dff(input en, clk, rst, d, output reg q);
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
