`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2017 10:04:18 AM
// Design Name: 
// Module Name: Factorial_Accerlerator_tb
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


module Factorial_Accerlerator_tb();
reg clk, rst, Go;
reg[3:0] n;
wire Done, Err;
wire [31:0] nf_tb;

Factorial_Accelerator DUT (clk, rst, Go, n, Done, Err, nf_tb);
task tick; begin #5 clk = 1; #5 clk = 0; end endtask
task rest; begin #5 rst = 1; #5 rst = 0; end endtask
initial begin

rest;
tick;
n = 0;
Go = 1;
while(!Done)
begin
    tick;
end
if(nf_tb != 1) $display("Error with Factorial 0");

Go = 0;
rest;
tick;
Go = 1;
n = -1;
while(!Done)
begin
    tick;
end
if(!Err) $display("Error with Error button");

Go = 0;
rest;
tick;
Go = 1;
n = 3;
while(!Done)
begin
    tick;
end
if(nf_tb != 6) $display("Error with Factorial 3");
rest;

$display("End of Simulation");
$finish;
end
endmodule 
