`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2017 10:43:42 AM
// Design Name: 
// Module Name: fact_cu
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


module fact_cu(input clk, rst, go, Is_Gt, Error, output reg Done, Err, output reg [5:0] ctrl);

reg [3:0] ns, cs;
//{ld1, ud, ce, sel1, ld2, sel2} = ctrl;
parameter
    IDLE = 6'b0_0_0_0_0_0,
    S1 =   6'b1_0_1_0_1_0,
    S2 =   6'b0_0_0_1_0_0,
    S3 =   6'b0_0_0_1_0_1,
    S4 =   6'b0_0_1_1_1_0;
    

always @(go, Is_Gt, Done, ns, cs, Error, Err)
begin
        case(cs)
            4'd0:
                begin
                    Done = 0;
                    Err = 0;
                    if(go) begin ns = 4'd1; end
                    else begin ns = 4'd0; end
                end
            4'd1:   begin Done = 0; ns = 4'd2; Err = 0;end
            4'd2: 
                begin
                    if(Error) begin ns = 4'd0; Done = 1; Err = 1;end
                    else if(Is_Gt) begin ns = 4'd4; Done = 0; Err = 0; end
                    else begin ns = 4'd3; Done = 0; Err = 0; end 
                end
            4'd3:   
                begin 
                    Done = 1;
                    Err = 0; 
                    ns = 4'd0; 
                end
            4'd4: 
                begin 
                    Done = 0;
                    Err = 0; 
                    ns = 4'd2; 
                end
            default: ns = 4'd0;                 
        endcase
end
always @(posedge clk, posedge rst)
begin
         if(rst)
             cs <= 0;
         else
             cs <= ns;
end

always @(cs, ctrl) //{ld1, ud, ce, sel1, ld2, sel2, ld3} = ctrl;
begin
        case(cs)
            4'd0:   ctrl = IDLE;
            4'd1:   ctrl = S1;
            4'd2:   ctrl = S2;
            4'd3:   ctrl = S3;
            4'd4:   ctrl = S4; 
        endcase
end        
endmodule
