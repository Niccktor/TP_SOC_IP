# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Workspace\TP_SOC_IP\ublaze_systeme_wrapper_SegIP\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Workspace\TP_SOC_IP\ublaze_systeme_wrapper_SegIP\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {ublaze_systeme_wrapper_SegIP}\
-hw {C:\Workspace\TP_SOC_IP\TP_ublaze_3DN\ublaze_system_wrapper.xsa}\
-proc {microblaze_0} -os {standalone} -out {C:/Workspace/TP_SOC_IP}

platform write
platform generate -domains 
platform active {ublaze_systeme_wrapper_SegIP}
bsp reload
bsp reload
platform active {ublaze_systeme_wrapper_SegIP}
bsp setdriver -ip Seg7IP_0 -driver generic -ver 3.0 3.1
bsp write
bsp reload
catch {bsp regenerate}
platform generate
platform config -updatehw {C:/Workspace/TP_SOC_IP/TP_ublaze_3DN/ublaze_system_wrapper.xsa}
platform clean
platform generate
platform clean
platform generate
