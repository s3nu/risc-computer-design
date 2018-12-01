`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2017 08:01:54 AM
// Design Name: 
// Module Name: fact_mux
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


module fact_mux(input go, resErr, resDone,[1:0] rdSel,[3:0] n, [31:0] result, output reg [31:0] rd);
always @(go, resErr, resDone, rdSel, n, result)
begin
    case(rdSel)
        2'b00: rd <= {{(32 - 4){1'b0}}, n};
        2'b01: rd <= {{31{1'b0}}, go};
        2'b10: rd <= {{30{1'b0}}, resErr, resDone};
        2'b11: rd <= result;
        default: rd = 1;
     endcase
end
endmodule
