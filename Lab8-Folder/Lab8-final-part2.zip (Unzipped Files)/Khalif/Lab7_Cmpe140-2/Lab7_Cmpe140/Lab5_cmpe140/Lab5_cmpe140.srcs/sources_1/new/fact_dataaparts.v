`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2017 10:45:13 AM
// Design Name: 
// Module Name: fact_dataaparts
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

module fact_mux1 #(parameter wide = 4)
(input sel, [wide-1:0] a, b, output reg [31:0] y);
     always@(*)
  begin
       if(sel) y = b;
       else y = a;
  end
endmodule

module fact_mux2 #(parameter wide = 32)
(input sel, [wide-1:0] a, b, output [wide-1:0] y);
    assign y = (sel) ? b : a;
endmodule

module fact_reg #(parameter wide = 32)
(input clk, en, rst, [wide-1:0] d, output reg [wide-1:0] q);
    always @(posedge clk, posedge en, posedge rst)
    begin
        if(rst) q <= 0;
        else if(en) q <= d;
        else q <= q;
    end
endmodule


module Ud_Cnt_4(input [3:0] D,
                input LD, UD, CE, CLK, RST,
                output reg [3:0] Q);
always @(posedge CLK, posedge RST)
begin
    if(RST) Q <= 4'd0;
    else if(CE)
        begin
            if(LD) Q <= D;
            else
                begin
                    case(UD)
                        1: Q <= Q + 1;
                        0: Q <= Q - 1;
                    endcase
                end
        end
    else Q <= Q;
end
endmodule

module fact_comparator(input [3:0] a, b, output reg greater, error);
always @(a, b, greater, error)
begin
    if(a > 4'b1100) 
    begin
        greater = 0;
        error = 1;
    end
    else if(a > b) 
    begin
        error = 0;
        greater = 1;
    end
    else 
    begin
        greater = 0;
        error = 0;
    end
end
endmodule

module fact_mul(input [31:0] a, b, output reg [31:0] mul_out);
always@(a, b, mul_out)
begin
    if(b == 0) mul_out = a;
    else mul_out = a * b;
end
endmodule