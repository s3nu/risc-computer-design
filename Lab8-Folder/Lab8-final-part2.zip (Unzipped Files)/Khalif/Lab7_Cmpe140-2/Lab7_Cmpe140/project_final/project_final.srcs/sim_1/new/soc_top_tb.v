`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2017 05:13:54 PM
// Design Name: 
// Module Name: soc_top_tb
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


module soc_top_tb();
reg clk, rst;
reg [31:0] gp0, gp1;
wire [31:0] gpio0, gpio1;
integer i;
 soc_system DUT ( clk, rst, gp0, gpio0, gpio0, gpio1);
    task tick; begin #5 clk = 1; #5 clk = 0; end endtask
    task rest; begin #5 rst = 1; #5 rst = 0; end endtask
    
    initial begin
       i = 0;
        //tick;
        
        while( i != 14)
        begin
            rest;
            //tick;
            gp0 = i;
            while(gpio0 < 1) 
            begin
                tick;
            end
            tick;
            case(i)
             4'd0: if(gpio1 != 1) $display("Error with fact 0");
             4'd1: if(gpio1 != 1) $display("Error with fact 1");
             4'd2: if(gpio1 != 2) $display("Error with fact 2");
             4'd3: if(gpio1 != 6) $display("Error with fact 3");
             4'd4: if(gpio1 != 24) $display("Error with fact 4");
             4'd5: if(gpio1 != 120) $display("Error with fact 5");
             4'd6: if(gpio1 != 720) $display("Error with fact 6");
             4'd7: if(gpio1 != 5040) $display("Error with fact 7");
             4'd8: if(gpio1 != 40320) $display("Error with fact 8");
             4'd9: if(gpio1 != 362880) $display("Error with fact 9");
             4'd10: if(gpio1 != 3628800) $display("Error with fact 10");
             4'd11: if(gpio1 != 0) $display("Error with fact 11");
             4'd12: if(gpio1 != 0) $display("Error with fact 12");
             4'd13: if(gpio1 != 0) $display("Error with fact 13");
            endcase
            i = i + 1;
        end
        $display("End of Simulation");
        $finish;
        
    end
endmodule
