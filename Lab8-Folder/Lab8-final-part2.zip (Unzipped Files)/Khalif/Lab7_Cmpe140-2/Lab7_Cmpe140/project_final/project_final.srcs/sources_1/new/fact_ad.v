`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2017 07:34:54 AM
// Design Name: 
// Module Name: fact_ad
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


module fact_ad(input we, [1:0] a, output reg we1, we2, output reg [1:0] rdSel);
always @(*)
begin  
    case(a)
        2'b00:
        begin
            we1 <= we;
            we2 <= 1'b0;
            rdSel <= 2'b00;
        end
        2'b01:
        begin
            we1 <= 1'b0;
            we2 <= we;
            rdSel <= 2'b00;
        end
        2'b10:
        begin
            we1 <= 1'b0;
            we2 <= 1'b0;
            rdSel <= 2'b10;
        end
        2'b11:
        begin
            we1 <= 1'b0;
            we2 <= 1'b0;
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

endmodule
