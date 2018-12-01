`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2017 02:46:52 PM
// Design Name: 
// Module Name: gpio_Ad
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


module gpio_Ad(input we, [1:0] a, output reg we1, we2, output reg [1:0] rdSel);
always @(we, a, we1, we2)
begin
    if(we)
    begin
        case(a)
            2'b00:
            begin
                we1 <= 0;
                we2 <= 0;
                rdSel <= 2'b00;
            end
            2'b01:
            begin
                we1 <= 0;
                we2 <= 0;
                rdSel <= 2'b01;
            end
            2'b10:
            begin
                we1 <= 1;
                we2 <= 0;
                rdSel <= 2'b10;
            end
            2'b11:
            begin
                we1 <= 0;
                we2 <= 1;
                rdSel <= 2'b11;
            end
            default:
            begin
                we1 <= 1'bz;
                we2 <= 1'bz;
                rdSel <= 2'bzz;
            end
        endcase
       end
       else
       begin
           we1 <= 1'bz;
           we2 <= 1'bz;
           rdSel <= 2'bzz;
       end
end
endmodule
