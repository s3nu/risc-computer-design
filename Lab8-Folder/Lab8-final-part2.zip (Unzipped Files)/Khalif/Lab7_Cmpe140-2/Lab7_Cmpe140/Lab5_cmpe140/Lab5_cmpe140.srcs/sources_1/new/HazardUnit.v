`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2017 12:58:37 PM
// Design Name: 
// Module Name: HazardUnit
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
module HarzardControlFAE(RsE,RegWriteM, RegWriteW, WriteRegM, WriteRegW, ForwardAE);
input[4:0] RsE,WriteRegM, WriteRegW;
input RegWriteM, RegWriteW;
output reg[1:0] ForwardAE;
always@(*)begin 
if(  (RsE !=0 ) && (RsE==WriteRegM) && RegWriteM ) ForwardAE =2'b10;
else if(  (RsE !=0 ) && (RsE==WriteRegW) && RegWriteW ) ForwardAE =2'b01;
else ForwardAE = 2'b00;
end
endmodule

module HarzardControlFBE(RtE,RegWriteM, RegWriteW, WriteRegM, WriteRegW, ForwardBE);
input[4:0] RtE,WriteRegM, WriteRegW;
input RegWriteM, RegWriteW;
output reg[1:0] ForwardBE;
always@(*)begin 
if(  (RtE !=0 ) && (RtE==WriteRegM) && RegWriteM ) ForwardBE =2'b10;
else if(  (RtE !=0 ) && (RtE==WriteRegW) && RegWriteW ) ForwardBE =2'b01;
else ForwardBE = 2'b00;
end
endmodule

module HarzardStall(RsD,RtD,RtE,MemtoRegE, lwstall);
input [4:0]RsD,RtE,RtD;
input [1:0] MemtoRegE;
output lwstall;
assign lwstall=(   ( (RsD==RtE) || (RtD==RtE) ) && MemtoRegE[0]    );
endmodule

module HarzardControlAD(RsD,WriteRegM, RegWriteM, ForwardAD);
input[4:0] RsD,WriteRegM;
input RegWriteM;
output ForwardAD;
assign ForwardAD = ((RsD!=0) && (RsD==WriteRegM) && RegWriteM);
endmodule

module HarzardControlBD(RtD,WriteRegM, RegWriteM, ForwardBD);
input[4:0] RtD,WriteRegM;
input RegWriteM;
output ForwardBD;
assign ForwardBD = ((RtD!=0) && (RtD==WriteRegM) && RegWriteM);
endmodule

module HarzardStallBranch(BranchD, RegWriteE, MemtoRegM , WriteRegE, WriteRegM, RsD,RtD, branchstall);
input BranchD,RegWriteE; 
input [1:0] MemtoRegM ;
input[4:0] WriteRegE,WriteRegM, RsD, RtD;
output branchstall;
assign branchstall = ( 
(   BranchD && RegWriteE && (   (WriteRegE==RsD) || (WriteRegE==RtD)   )) || 
( BranchD && MemtoRegM[0] && ((WriteRegM==RsD) || (WriteRegM==RtD)))
);
endmodule

module HazardUnit(RsD,RtD,RsE,RtE, MemtoRegE,MemtoRegM, RegWriteE, RegWriteM, WriteRegM,
WriteRegW,  WriteRegE, RegWriteW ,BranchD, StallIF,StallID, FlushE,ForwardAD,ForwardBD,ForwardAE,ForwardBE);

input[4:0] RsD,RtD,RsE,RtE,WriteRegM, WriteRegW, WriteRegE ;
input  RegWriteE, RegWriteM, RegWriteW, BranchD;
input  [1:0] MemtoRegM, MemtoRegE;
output StallIF,StallID,FlushE, ForwardAD,ForwardBD;
output [1:0]ForwardAE,ForwardBE;


wire lwstall,branchstall;


HarzardControlFAE  har1(RsE,RegWriteM, RegWriteW, WriteRegM, WriteRegW, ForwardAE);
HarzardControlFBE  har2(RtE,RegWriteM, RegWriteW, WriteRegM, WriteRegW, ForwardBE);
HarzardStall       har3(RsD,RtD,RtE, MemtoRegE, lwstall);
HarzardControlAD   har4(RsD,WriteRegM, RegWriteM, ForwardAD); 
HarzardControlBD   har5(RtD,WriteRegM, RegWriteM, ForwardBD);
HarzardStallBranch har6(BranchD, RegWriteE, MemtoRegM , WriteRegE, WriteRegM, RsD,RtD, branchstall);

assign StallIF = lwstall || branchstall;
assign StallID = lwstall || branchstall;
assign FlushE  = lwstall || branchstall;
 
endmodule
