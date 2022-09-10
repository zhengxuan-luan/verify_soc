# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# Base Configurations. Don't Touch
# section begin

set ::env(PDK) $::env(PDK)
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

# YOU ARE NOT ALLOWED TO CHANGE ANY VARIABLES DEFINED IN THE FIXED WRAPPER CFGS 
source $::env(DESIGN_DIR)/fixed_dont_change/fixed_wrapper_cfgs.tcl

# YOU CAN CHANGE ANY VARIABLES DEFINED IN THE DEFAULT WRAPPER CFGS BY OVERRIDING THEM IN THIS CONFIG.TCL
source $::env(DESIGN_DIR)/fixed_dont_change/default_wrapper_cfgs.tcl

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) user_project_wrapper
#section end

# User Configurations

set ::env(RUN_KLAYOUT_XOR) 0
set ::env(RUN_KLAYOUT_DRC) 0
# no point in running DRC with magic once openram is in because it will find 3M issues
# try to turn off all DRC checking so the flow completes and use precheck for DRC instead.
set ::env(MAGIC_DRC_USE_GDS) 0
set ::env(RUN_MAGIC_DRC) 0
set ::env(QUIT_ON_MAGIC_DRC) 0

#set ::env(FP_PDN_CORE_RING_VOFFSET) 12.45
#set ::env(FP_PDN_CORE_RING_HOFFSET) 12.45

set ::env(VERILOG_INCLUDE_DIRS) [glob  $::env(CARAVEL_ROOT)/verilog/rtl/ ]
## Source Verilog Files
set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/user_project_wrapper.v \
	$script_dir/../../verilog/rtl/inc/rvj1_defines.v"

## Clock configurations
set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "wb_clk_i"

set ::env(CLOCK_PERIOD) "10"

# Internal Macros
## Macro PDN Connections
set ::env(FP_PDN_MACRO_HOOKS) "\
	iram_inst_A vccd1 vssd1 vccd1 vssd1, \
	iram_inst_B vccd1 vssd1 vccd1 vssd1, \
	rvj1_soc vccd1 vssd1 vccd1 vssd1, \
	dram_inst vccd1 vssd1 vccd1 vssd1"

### Macro Placement
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg

set ::env(GLB_RT_OBS)  "met1 500   800  1183.1  1216.54, \
                        met2 500   800  1183.1  1216.54, \
                        met3 500   800  1183.1  1216.54, \
                        met4 500   800  1183.1  1216.54, \
						met1 1500  800  2183.1  1216.54, \
                        met2 1500  800  2183.1  1216.54, \
                        met3 1500  800  2183.1  1216.54, \
                        met4 1500  800  2183.1  1216.54, \
                        met1 1100  2400 1783.1  2816.54, \
                        met2 1100  2400 1783.1  2816.54, \
                        met3 1100  2400 1783.1  2816.54, \
                        met4 1100  2400 1783.1  2816.54, \
                        met5 0     0    2920    3520"


### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_sram_macros/verilog/sky130_sram_2kbyte_1rw1r_32x512_8.v \
	$script_dir/../../verilog/rtl/rvj1_caravel_soc.v"

set ::env(EXTRA_LEFS) "\
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_sram_macros/lef/sky130_sram_2kbyte_1rw1r_32x512_8.lef \
	$script_dir/../../lef/rvj1_caravel_soc.lef"

set ::env(EXTRA_GDS_FILES) "\
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_sram_macros/gds/sky130_sram_2kbyte_1rw1r_32x512_8.gds \
	$script_dir/../../gds/rvj1_caravel_soc.gds"

#set ::env(GLB_RT_MAXLAYER) 5
set ::env(RT_MAX_LAYER) {met4}

# disable pdn check nodes becuase it hangs with multiple power domains.
# any issue with pdn connections will be flagged with LVS so it is not a critical check.
set ::env(FP_PDN_CHECK_NODES) 0

# The following is because there are no std cells in the example wrapper project.
set ::env(SYNTH_TOP_LEVEL) 1
set ::env(PL_RANDOM_GLB_PLACEMENT) 1

set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 0
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

set ::env(FP_PDN_ENABLE_RAILS) 0

set ::env(DIODE_INSERTION_STRATEGY) 0
set ::env(FILL_INSERTION) 0
set ::env(TAP_DECAP_INSERTION) 0
set ::env(CLOCK_TREE_SYNTH) 0
