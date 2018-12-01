# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.runs/synth_1/.Xil/Vivado-32288-Josie-VAIO/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xc7a100tcsg324-1

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common.tcl
    set rt::defaultWorkLibName xil_defaultlib

    # Skipping read_* RTL commands because this is post-elab optimize flow
    set rt::useElabCache true
    if {$rt::useElabCache == false} {
      rt::read_verilog {
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/Ud_Cnt4.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/fact_comparator.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/fact_alu.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/acc_reg.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/acc_mux2.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/acc_mux.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/HazardUnit.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/dp_parts.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/fact_dp.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/fact_cu.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/cu_parts.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/controlunit.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/datapath.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/gpio_dff.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/gpio_Ad.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/fact_result_reg.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/fact_reg.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/fact_mux.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/fact_error_reg.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/fact_dff4.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/fact_dff.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/fact_ad.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/Factorial_Accelerator.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/mips.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/mem_parts.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/top_GPIO.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/top_Factorial_Accelerator.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/topDecoder.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/Soc_mux.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/utility.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/soc_system.v
      C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/sources_1/new/Soc_Fpga.v
    }
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification true
    set rt::SDCFileList C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.runs/synth_1/.Xil/Vivado-32288-Josie-VAIO/realtime/Soc_Fpga_synth.xdc
    rt::sdcChecksum
    set rt::top Soc_Fpga
    set rt::reportTiming false
    rt::set_parameter elaborateOnly false
    rt::set_parameter elaborateRtl false
    rt::set_parameter eliminateRedundantBitOperator true
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter ramStyle auto
    rt::set_parameter merge_flipflops true
# MODE: 
    rt::set_parameter webTalkPath {C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.cache/wt}
    rt::set_parameter enableSplitFlowPath "C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.runs/synth_1/.Xil/Vivado-32288-Josie-VAIO/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
      rt::run_synthesis -module $rt::top
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    rt::HARTNDb_reportJobStats "Synthesis Optimization Runtime"
    if { $rt::flowresult == 1 } { return -code error }

    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] && [info exists rt::doParallel] && $rt::doParallel} { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] && [info exists rt::doParallel] && $rt::doParallel} { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}