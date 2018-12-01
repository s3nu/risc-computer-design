@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim soc_top_tb_behav -key {Behavioral:sim_1:Functional:soc_top_tb} -tclbatch soc_top_tb.tcl -view C:/Users/Josie/Desktop/Khalif/Lab7_Cmpe140-2/Lab7_Cmpe140/Lab5_cmpe140/soc_top_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
