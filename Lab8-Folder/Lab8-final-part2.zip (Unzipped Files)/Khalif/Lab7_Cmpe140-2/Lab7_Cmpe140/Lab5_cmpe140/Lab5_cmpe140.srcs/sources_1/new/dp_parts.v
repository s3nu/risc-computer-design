`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2017 06:29:59 PM
// Design Name: 
// Module Name: dp_parts
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


module mux2 #(parameter wide = 8)
(input sel, [wide-1:0] a, b, output [wide-1:0] y);
    assign y = (sel) ? b : a;
endmodule

module mux4 #(parameter wide = 8)
(input [1:0] sel, [wide-1:0] a, b, c, d, output reg [wide-1:0] y);
    always@ (*)
    begin
        case(sel)
            2'b00: y <= a;
            2'b01: y <= b;
            2'b10: y <= c;
            2'b11: y <= d;
        endcase
    end
endmodule

module muxShift #(parameter wide = 32)
(input [31:0] instr, input [31:0] alu_in, a, output reg [wide-1:0] out);
    always@ (*)
    begin
        if(instr != 32'd0)
        begin
            if((instr [31:26] == 0) && (instr [5:0] == 0))
            begin
                out <= {a[27:0], 4'b0000};
            end
            else if((instr [31:26] == 0) && (instr [5:0] == 6'd2))
            begin
                out <= { 1'b0,a[31:1]};
            end
            else
                out <= alu_in;
        end
        //else out <= alu_in;
    end
endmodule

module mux32 #(parameter wide = 32)
(input [1:0] sel, [wide-1:0] a, b, c, d, output reg [wide-1:0] y);
    always@ (*)
    begin
        casez (sel)
            2'b00: y <= a;
            2'b01: y <= b;
            2'b10: y <= c;
            2'b11: y <= d;
        endcase
    end
endmodule

module adder
(input [31:0] a, b, output [31:0] y);
    assign y = a + b;
endmodule

module signext
(input [15:0] a, output [31:0] y);
    assign y = {{16{a[15]}}, a};
endmodule

module alu
(input [2:0] op, [31:0] a, b, output reg [31:0] y);
    //assign zero = (y == 0);
    always @ (*)
    begin
        case (op)
            3'b000: y <= a & b;
            3'b001: y <= a | b;
            3'b010: y <= a + b;
            3'b011: y <= a + 0;
            3'b110: y <= a - b;
            3'b111: y <= (a < b) ? 1 : 0;
        endcase
    end
endmodule

module mul
(input [31:0] x, y, output reg [31:0] outHi, outLo);
    reg [63:0] out;
    always @ (x, y)
    begin
        out <= x * y;
        outHi <= out[63:32];
        outLo <= out[31:0];
    end
endmodule

module mul_acc
(input [31:0] x, y, output reg [31:0] out);
    always @ (x, y)
    begin
        out <= x * y;
    end
endmodule

module dreg
(input clk, rst, [31:0] d, output reg [31:0] q);
    always @ (posedge clk, posedge rst)
    begin
        if (rst) q <= 0;
        else     q <= d;
    end
endmodule

module en_dreg
(input en, rst, [31:0] d, output reg [31:0] q);
    always @ (en, rst, d)
    begin
        if (rst) q <= 0;
        else if(en) 
            q <= d;
        else q <= q;
    end
endmodule

module regfile
(input clk, we, [4:0] ra1, ra2, ra3, wa, [31:0] wd, output [31:0] rd1, rd2, rd3);
    reg [31:0] rf [0:31];
    integer n;
    initial begin
        for (n = 0; n < 32; n = n + 1) rf[n] = 32'h0;
    end
    always @ (negedge clk)
    begin
        if (we) rf[wa] <= wd;
    end
    assign rd1 = (ra1 == 0) ? 0 : rf[ra1];
    assign rd2 = (ra2 == 0) ? 0 : rf[ra2];
    assign rd3 = (ra3 == 0) ? 0 : rf[ra3];
endmodule

module sl4(
	input	[31:0]	a,
	output	[31:0]	y );

	// shift left by 4
	assign y = {a[27:0], 4'b0000};
endmodule

module sr1(
	input	[31:0]	a,
	output	[31:0]	y );

	// shift left by 1
	assign y = { 1'b0,a[31:1]};
endmodule

module pcReg
(input clk, rst, clr, [31:0] d, output reg [31:0] q);
    always @ (posedge clk, posedge rst)
    begin
        if (rst) q <= 0;
        else if(!clr) q <= d;
        else     q <= q;
    end
endmodule

module idReg (input clk, rst, en, [31:0] d, output reg [31:0] q);
    always @(posedge clk, posedge rst)
    begin
        if(rst) q <= 0;
        else
        begin
            if(!en) q <= d;
            else q <= q;
        end
    end
endmodule

module ifComparator(input [31:0] alu_pa, alu_pb, output reg equalD);
    always@(alu_pa, alu_pb)
    begin
        if(alu_pa == alu_pb) equalD <= 1;
        else equalD <= 0;
    end
endmodule

module ifReg  #(parameter wide = 32)
(input clk, rst, [wide-1:0] d, output reg [wide-1:0] q);
    always @(posedge clk, posedge rst)
    begin
        if(rst) q <= 0;
        else
        begin
            q <= d;
        end
    end
endmodule

module iMReg  #(parameter wide = 32)
(input clk, rst, [wide-1:0] d, output reg [wide-1:0] q);
    always @(posedge clk, posedge rst)
    begin
        if(rst) q <= 0;
        else
        begin
            q <= d;
        end
    end
endmodule

