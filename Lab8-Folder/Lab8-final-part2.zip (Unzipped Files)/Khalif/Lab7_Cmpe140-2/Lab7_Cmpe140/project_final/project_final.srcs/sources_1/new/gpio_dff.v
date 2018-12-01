`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2017 02:49:45 PM
// Design Name: 
// Module Name: gpio_dff
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


module gpio_dff(input en, clk, rst, [31:0] d, output reg [31:0] q);
always @(posedge clk, posedge rst)
begin
        if(rst)
            q <= 0;
        else 
        begin
        if(en)
            q <= d;
        else
            q <= q;
        end
end
endmodule
