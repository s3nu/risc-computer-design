`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2017 07:52:53 AM
// Design Name: 
// Module Name: fact_result_reg
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


module fact_result_reg(input clk, rst, goPulseCmb, done, output reg resDone    );
always @(posedge clk, posedge rst)
begin
    if(rst)
        resDone <= 1'b0;
    else
        resDone <= (~goPulseCmb) & (done | resDone);
end
endmodule
