`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2017 02:28:49 PM
// Design Name: 
// Module Name: fact_dff4
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


module fact_dff4(input en, clk, rst, [3:0] d, output reg [3:0] q);
always @(posedge clk, posedge rst)
begin
    if(rst) q <= 0;
    else if(en) q <= d;
    else q <= q;
end
endmodule
