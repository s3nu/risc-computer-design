`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2017 06:03:13 PM
// Design Name: 
// Module Name: fact_comparator
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


module fact_comparator(input [3:0] a, b, output reg is_gt, error);
always @(a, b)
begin
    if(a > 4'b1010) begin error = 1; is_gt = 0; end
    else if(a > b) begin error = 0; is_gt = 1; end
    else begin error = 0; is_gt = 0; end
end
endmodule
