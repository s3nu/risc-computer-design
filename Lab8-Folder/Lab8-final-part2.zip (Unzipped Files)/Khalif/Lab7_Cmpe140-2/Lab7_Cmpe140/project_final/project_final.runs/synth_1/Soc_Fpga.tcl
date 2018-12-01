# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.cache/wt [current_project]
set_property parent.project_path C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
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
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/constrs_1/new/mips_fpga.xdc
set_property used_in_implementation false [get_files C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/constrs_1/new/mips_fpga.xdc]

read_xdc C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/constrs_1/new/Soc_Fpga.xdc
set_property used_in_implementation false [get_files C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/project_final/project_final.srcs/constrs_1/new/Soc_Fpga.xdc]


synth_design -top Soc_Fpga -part xc7a100tcsg324-1


write_checkpoint -force -noxdef Soc_Fpga.dcp

catch { report_utilization -file Soc_Fpga_utilization_synth.rpt -pb Soc_Fpga_utilization_synth.pb }
