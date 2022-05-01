catch {::common::set_param -quiet hls.xocc.mode csynth};
catch {::common::set_param -quiet hls.enable_scout_hidden_option_error false};
# 
# HLS run script generated by v++ compiler
# 

open_project color_detect
set_top color_detect
# v++ -g, -D, -I, --advanced.prop kernel.color_detect.kernel_flags
add_files "/users/course/2022S/HLS17000000/g110061575/HLS/Lab_C/02_partition_1_4k/vision/L3/examples/colordetect/xf_colordetect_accel.cpp" -cflags " -I /users/course/2022S/HLS17000000/g110061575/HLS/Lab_C/02_partition_1_4k/vision/L3/examples/colordetect -I /users/course/2022S/HLS17000000/g110061575/HLS/Lab_C/02_partition_1_4k/vision/L1/include -I /users/course/2022S/HLS17000000/g110061575/HLS/Lab_C/02_partition_1_4k/vision/L3/examples/colordetect "
open_solution -flow_target vitis solution
set_part xcu50-fsvh2104-2-e
create_clock -period 300.000000MHz -name default
# v++ --advanced.param compiler.hlsDataflowStrictMode
config_dataflow -strict_mode warning
# v++ --advanced.param compiler.deadlockDetection
config_export -deadlock_detection none
# v++ --advanced.param compiler.axiDeadLockFree
config_interface -m_axi_conservative_mode=1
config_interface -m_axi_addr64
# v++ --hls.max_memory_ports
config_interface -m_axi_auto_max_ports=0
config_export -format xo -ipname color_detect
catch {::common::set_param -quiet hls.enable_synthesis_check_sw_only true};
csynth_design -synthesis_check
close_project
puts "HLS completed successfully"
exit
