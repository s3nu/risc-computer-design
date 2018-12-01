`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2017 02:02:53 AM
// Design Name: 
// Module Name: Soc_Fpga
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


module Soc_Fpga(input clk, rst, button, [4:0] switches, output [7:0] LEDSEL, LEDOUT, [4:0] LED);
wire        clk_sec, clk_5KHz;
wire [31:0] gpio0, gpio1;
wire [7:0]  digit0, digit1, digit2, digit3, digit4, digit5, digit6, digit7;
//wire  [15:0] reg_hex;
clk_gen     clk_gen (clk, rst, clk_sec, clk_5KHz);
 bdebouncer  bd      (clk_5KHz, button, clk_pb);
 soc_system soc_system (clk_pb, rst, {27'd0,switches[4], switches[3], switches[2], switches[1], switches[0]}, gpio0, gpio0, gpio1);
 bcd_to_7seg bcd7    (gpio1[31:28], digit7);
     bcd_to_7seg bcd6    (gpio1[27:24], digit6);
     bcd_to_7seg bcd5    (gpio1[23:20], digit5);
     bcd_to_7seg bcd4    (gpio1[19:16], digit4);
     bcd_to_7seg bcd3    (gpio1[15:12], digit3);
     bcd_to_7seg bcd2    (gpio1[11:8], digit2);
     bcd_to_7seg bcd1    (gpio1[7:4], digit1);
     bcd_to_7seg bcd0    (gpio1[3:0], digit0);
     led_mux     led_mux (clk_5KHz, rst, digit0, digit1, digit2, digit3, digit4, digit5, digit6, digit7, LEDSEL, LEDOUT);  
     //mux2 #(16)  soc_mux (gpio0[1], gpio0[15:0], gpio1[15:0], reg_hex);
     assign LED[0] = gpio0[0];
     assign LED[1] = gpio0[0];
     assign LED[2] = gpio0[0];
     assign LED[3] = gpio0[0];
     assign LED[4] = gpio0[1];
endmodule
