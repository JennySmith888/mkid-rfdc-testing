# Set project origin
set origin_dir "."

# Set IP repo dir
set ip_dir "/home/jpsmith/Gen3/mkidgen3_blocks"

# Set project name
set _xil_proj_name_ "adc_snap_test"

# Create project
 create_project ${_xil_proj_name_} ./${_xil_proj_name_} -part xczu28dr-ffvg1517-2-e

# Set project properties
 set obj [current_project]
 set_property -name "board_part" -value "xilinx.com:zcu111:part0:1.2" -objects $obj

# Set IP repository paths
 set obj [get_filesets sources_1]
 if { $obj != {} } {
    set_property "ip_repo_paths" "[file normalize "$ip_dir"]" $obj
    update_ip_catalog -rebuild
    }
# Build block design
source ${origin_dir}/bd/clkw_no_lock.tcl


# Generate HDL Wrapper
make_wrapper -files [get_files ${origin_dir}/${_xil_proj_name_}/${_xil_proj_name_}.srcs/sources_1/bd/${design_name}/${design_name}.bd] -top
add_files -norecurse ${origin_dir}/${_xil_proj_name_}/${_xil_proj_name_}.srcs/sources_1/bd/${design_name}/hdl/${design_name}_wrapper.v

update_compile_order -fileset sources_1

#Uncomment below to run through bitstream generation
#update_compile_order -fileset sources_1
#launch_runs impl_1 -to_step write_bitstream -jobs 16
#wait_on_run impl_1

