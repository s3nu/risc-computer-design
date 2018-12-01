`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2017 11:29:10 PM
// Design Name: 
// Module Name: soc_fpga_tb
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


module soc_fpga_tb();
reg clk, rst;
reg [4:0] switches;
wire [7:0] LEDSEL, LEDOUT;
wire [4:0] LED;
Soc_Fpga DUT (clk, rst, button, switches, LEDSEL, LEDOUT, LED);
task tick; begin #5 clk = 1; #5 clk = 0; end endtask
    task rest; begin #5 rst = 1; #5 rst = 0; end endtask
initial
begin
    //clk = 0;
    //rest;
    switches = 5;
    tick;
    while (1)
    begin
        tick;
    end    
end
endmodule
