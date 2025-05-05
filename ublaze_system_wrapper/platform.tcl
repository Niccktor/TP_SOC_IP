# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Workspace\TP_SOC_IP\ublaze_system_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Workspace\TP_SOC_IP\ublaze_system_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {ublaze_system_wrapper}\
-hw {C:\Workspace\TP_SOC_IP\TP_ublaze_3DN\ublaze_system_wrapper.xsa}\
-out {C:/Workspace/TP_SOC_IP}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {ublaze_system_wrapper}
platform generate -quick
platform generate
platform active {ublaze_system_wrapper}
platform config -updatehw {C:/Workspace/TP_SOC_IP/TP_ublaze_3DN/ublaze_system_wrapper.xsa}
platform generate
platform config -updatehw {C:/Workspace/TP_SOC_IP/TP_ublaze_3DN/ublaze_system_wrapper.xsa}
platform generate -domains 
platform config -updatehw {C:/Workspace/TP_SOC_IP/TP_ublaze_3DN/ublaze_system_wrapper.xsa}
platform generate -domains 
