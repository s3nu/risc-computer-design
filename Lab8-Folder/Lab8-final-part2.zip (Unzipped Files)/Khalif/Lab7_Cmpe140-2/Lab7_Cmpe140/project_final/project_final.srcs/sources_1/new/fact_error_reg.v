`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2017 07:57:07 AM
// Design Name: 
// Module Name: fact_error_reg
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


module fact_error_reg(input clk, rst, goPulseCmb, err, output reg resErr );
always @(posedge clk, posedge rst)
begin
    if(rst)
        resErr <= 1'b0;
    else
        resErr <= (~goPulseCmb) & (err | resErr);
end
endmodule
