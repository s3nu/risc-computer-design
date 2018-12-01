`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2017 04:22:00 PM
// Design Name: 
// Module Name: topDecoder
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


module topDecoder(input we, [31:0] a, output we1, we2, weM, [1:0] rdSel);
reg [4:0] ctrl;
assign {we1, we2, weM, rdSel} = ctrl;
always @(*)
    if(we)
    begin
        casez(a)
            32'h000000??: ctrl = 5'b00100;
            32'h000008??: ctrl = 5'b10010;
            32'h000009??: ctrl = 5'b01011;
        endcase
    end
    else
    begin
        casez(a)
            32'h000000?? : ctrl = 5'b00000;
            32'h000008?? : ctrl = 5'b00010;
            32'h000009?? : ctrl = 5'b00011;
        endcase
    end

endmodule
