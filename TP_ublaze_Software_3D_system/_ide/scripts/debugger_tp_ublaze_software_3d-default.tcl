# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Workspace\TP_SOC_IP\TP_ublaze_Software_3D_system\_ide\scripts\debugger_tp_ublaze_software_3d-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Workspace\TP_SOC_IP\TP_ublaze_Software_3D_system\_ide\scripts\debugger_tp_ublaze_software_3d-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Basys3 210183A8A8F6A" && level==0 && jtag_device_ctx=="jsn-Basys3-210183A8A8F6A-0362d093-0"}
fpga -file C:/Workspace/TP_SOC_IP/TP_ublaze_3DN/TP_ublaze_3DN.runs/impl_1/ublaze_system_wrapper.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw C:/Workspace/TP_SOC_IP/ublaze_system_wrapper/export/ublaze_system_wrapper/hw/ublaze_system_wrapper.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow C:/Workspace/TP_SOC_IP/TP_ublaze_Software_3D/Debug/TP_ublaze_Software_3D.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
