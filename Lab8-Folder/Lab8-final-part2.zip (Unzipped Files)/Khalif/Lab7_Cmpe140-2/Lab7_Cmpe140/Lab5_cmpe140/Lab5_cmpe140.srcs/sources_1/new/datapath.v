`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2017 06:29:15 PM
// Design Name: 
// Module Name: datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// .
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module datapath
(input clk, rst, pc_src, jump, JReturn, writeHilo, we_reg, alu_src, branch, we_dm, [1:0] dm2reg, reg_dst,  selJal,  [2:0] alu_ctrl, [4:0] ra3, [31:0] instr, rd_dm, output equalD, we_dmM, [31:0] pc_current, alu_out_M, forwardBe_dm, rd3, instr_D);
    wire [4:0]  RdE, RsD, RtD, RsE, RtE, rf_wa_M, raW, rf_wa;
    wire [1:0] forwardAe, forwardBe, dm2regE, dm2regM, dm2regW, reg_dstE, selJalE, selJalM, selJalW;
    wire [2:0] alu_ctrlE;
    wire flushE, pcClr, forwardAD, forwardBD, StallD, alu_srcE, we_regE, we_regM, we_regW, writeHiloE, writeHiloM, writeHiloW;   
    wire [31:0] pc_plus4, pc_plus4_E, pc_plus4_D, pc_plus4_M, instr_E, rd_dm_w, pc_plus4_W, pc_pre, pc_next, sext_imm, sext_immE, ba, bta, 
    jta, mulHi_q, mulHi_w, mulLo_q, mulLo_w, alu_pa, alupa_q, alu_pb, mulHi, mulLo, q_mulHi, q_mulLo, wd_rf, data_out, 
    pc_jump, sllout, srlout, srlout_M, sllout_M, srlout_W, sllout_W, alu_imm, wd_dm, wd_dm_q, forwardAe_muxOut, forwardBe_muxOut, alu_out, alu_out_E, compareA, compareB;
    assign ba = {sext_imm[29:0], 2'b00};
    assign jta = {pc_plus4[31:28], instr[25:0], 2'b00};
    
    // --- PC Logic --- //
    idReg       id_reg (clk, (pc_src || rst), StallD, instr, instr_D);
    idReg       pcPlus_reg (clk, (pc_src || rst), StallD, pc_plus4, pc_plus4_D);
    
    adder      pc_plus_4  (pc_current, 4, pc_plus4);
    adder      pc_plus_br (pc_plus4, ba, bta);
    
    pcReg       pc_reg     (clk, rst, pcClr, pc_next, pc_current);
    mux2 #(32) pc_src_mux (pc_src, pc_plus4, bta, pc_pre);
    mux2 #(32) pc_jmp_mux (jump, pc_pre, jta, pc_jump);
    mux2 #(32) pc_jr_mux  (JReturn, pc_jump, wd_rf, pc_next);
    
    mux2 #(32) forwardADmux (forwardAD, alu_pa, alu_out_M, compareA);
    mux2 #(32) forwardBDmux (forwardBD, wd_dm, alu_out_M,  compareB);
    // --- RF Logic --- //
    
    regfile    rf         (clk, we_reg, instr_D[25:21], instr_D[20:16], ra3, raW, wd_rf, alu_pa, wd_dm, rd3);
    signext    se         (instr_D[15:0], sext_imm);
    
     //----- IF Stage ---- //
     ifComparator comp (compareA, compareB, equalD);
     assign RsD = instr_D [25:21];
     assign RtD = instr_D [20:16];
     
     ifReg #(2)  if_reg_dm2regE (clk, (flushE || rst), dm2reg, dm2regE);
     ifReg #(1)  if_reg_we_regE (clk, (flushE || rst), we_reg, we_regE);
     ifReg #(3)  if_reg_alucrtl_regE (clk, (flushE || rst), alu_ctrl, alu_ctrlE);
     ifReg #(1)  if_reg_aluSrc_regE (clk, (flushE || rst), alu_src, alu_srcE);
     ifReg #(2)  if_reg_reg_dstE    (clk, (flushE || rst), reg_dst, reg_dstE);
     ifReg #(1)  if_reg_we_dmE (clk, (flushE || rst), we_dm, we_dmE);
     ifReg #(2)  if_reg_setJal_E (clk, (flushE || rst), selJal, selJalE);
     ifReg #(1)  if_reg_writeHilo_E (clk, (flushE || rst), writeHilo, writeHiloE);
     
     ifReg #(32) if_reg_alu_pa (clk, (flushE || rst), alu_pa, alupa_q);
     ifReg #(32) if_reg_rf_wd_dm (clk, (flushE || rst), wd_dm, wd_dm_q);
     ifReg #(5)  if_reg_RsE (clk, (flushE || rst), RsD, RsE);
     ifReg #(5)  if_reg_RtE (clk, (flushE || rst), RtD, RtE);
     ifReg #(5)  if_reg_RdE (clk, (flushE || rst), instr_D[15:11], RdE);
     ifReg #(32)  if_reg_sextE (clk, (flushE || rst), sext_imm, sext_immE);
     ifReg #(32)  if_reg_pc_plus4_E (clk, (flushE || rst), pc_plus4_D, pc_plus4_E);
     ifReg #(32) if_reg_instr_E (clk, (flushE || rst), instr_D, instr_E);
     
     // --- ID stage ---- //
     mux4 #(5)  rf_wa_mux  (reg_dstE, RtE, RdE, 31, 0, rf_wa);
     mux4 #(32) forward_Ae_mux (forwardAe, alupa_q, wd_rf, alu_out_M, 0, forwardAe_muxOut);
     mux4 #(32) forward_Be_mux (forwardBe, wd_dm_q, wd_rf, alu_out_M, 0, forwardBe_muxOut);
     
     iMReg #(2) dm2reg_m (clk, rst, dm2regE, dm2regM);
     iMReg #(1) we_reg_m (clk, rst, we_regE, we_regM);
     iMReg #(1) we_dm_m (clk, rst, we_dmE, we_dmM);
     iMReg #(2) setJal_m (clk, rst, selJalE, selJalM);
     iMReg #(1) writeHilo_m (clk, rst, writeHiloE, writeHiloM);
     
     iMReg #(32) alu_reg_m (clk, rst, alu_out_E, alu_out_M);
     iMReg #(32) wd_dm_reg_m (clk, rst, forwardBe_muxOut, forwardBe_dm);
     iMReg #(32) mul_outHi_m (clk, rst, mulHi, mulHi_q);
     iMReg #(32) mul_outLo_m (clk, rst, mulLo, mulLo_q);
     iMReg #(32) if_reg_pc_plus4_M (clk, rst, pc_plus4_E, pc_plus4_M);
     iMReg #(5) if_rf_wa_reg (clk, rst, rf_wa, rf_wa_M);
     iMReg #(32) if_rf_sll_M (clk, rst, sllout, sllout_M);
     iMReg #(32) if_rf_srl_M (clk, rst, srlout, srlout_M);
     // --- IM stage --- //
       iMReg #(2) dm2reg_w (clk, rst, dm2regM, dm2regW);
     iMReg #(1) we_reg_w (clk, rst, we_regM, we_regW);
     iMReg #(1) writeHilo_w (clk, rst, writeHiloM, writeHiloW);
     iMReg #(2) setJal_w (clk, rst, selJalM, selJalW);
     
     iMReg #(32) if_rf_sll_W (clk, rst, sllout_M, sllout_W);
     iMReg #(32) if_rf_srl_W (clk, rst, srlout_M, srlout_W);
     iMReg #(32) mul_outHi_w(clk, rst, mulHi_q, mulHi_w);
     iMReg #(32) mul_outLo_w(clk, rst, mulLo_q, mulLo_w);
     iMReg #(32) alu_out_w(clk, rst, alu_out_M, alu_out);
     iMReg #(32) if_reg_pc_plus4_W(clk, rst, pc_plus4_M, pc_plus4_W);
     iMReg #(5) if_rf_wa_reg_w (clk, rst, rf_wa_M, raW);
     iMReg #(32) if_rd_dm (clk, rst, rd_dm, rd_dm_w);
    // --- ALU Logic --- //
    mux2 #(32) alu_pb_mux (alu_srcE, forwardBe_muxOut, sext_immE, alu_pb);
    alu        alu        (alu_ctrlE, forwardAe_muxOut, alu_pb, alu_out_E);
    //--- MUL Logic ---//
    mul        mulOp      (forwardAe_muxOut, alu_pb, mulHi, mulLo);
    en_dreg    mul_hi_reg (writeHiloW, rst, mulHi_w, q_mulHi);
    en_dreg    mul_lo_reg (writeHiloW, rst,  mulLo_w, q_mulLo);
    // --- MEM Logic --- //
    mux4 #(32) rf_data_mux  (dm2regW, alu_out, rd_dm_w, q_mulHi, q_mulLo, data_out);
    mux4 #(32) rf_wd_mux    (.sel(selJalW), .a(data_out), .b(pc_plus4_W), .c(sllout_W), .d(srlout_W), .y(wd_rf));
    //---- Shift logic --- //
    //muxShift mux_shift (instr_E, forwardBe_muxOut, alu_imm, alu_out_E);
    sl4 sll (forwardBe_muxOut, sllout);
    sr1 srl (forwardBe_muxOut, srlout);
    //mux4 #(32) alu_mux  (isShiftE, alu_imm, sllout, srlout, 0, alu_out_E); 
            
    HazardUnit hazardUnit (.RsD(RsD), .RtD(RtD), .RsE(RsE), .RtE(RtE), .WriteRegE(rf_wa), .WriteRegM(rf_wa_M), .WriteRegW(raW), .RegWriteE(we_regE), .RegWriteM(we_regM), .MemtoRegE(dm2regE), .MemtoRegM(dm2regM),
    .RegWriteW(we_reg), .BranchD(branch), .StallIF(pcClr), .StallID(StallD), .FlushE(flushE), .ForwardAD(forwardAD), .ForwardBD(forwardBD), .ForwardAE(forwardAe), .ForwardBE(forwardBe));
endmodule