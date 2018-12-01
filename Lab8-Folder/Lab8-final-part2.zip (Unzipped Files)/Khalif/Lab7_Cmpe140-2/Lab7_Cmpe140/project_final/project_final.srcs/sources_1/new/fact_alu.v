`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2017 07:51:03 AM
// Design Name: 
// Module Name: fact_alu
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


module fact_alu(input [31:0] in1, in2, [1:0] c, output reg [31:0] aluout);
always @(in1, in2, c)
begin
    case(c)
        2'b00:
        begin
            if(in2 == 0) begin aluout = 1; end
            else begin aluout = in1 * in2; end
        end
        default: aluout = in2;
    endcase
end
endmodule
