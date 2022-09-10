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

set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) rvj1_caravel_soc

set ::env(VERILOG_INCLUDE_DIRS) [glob $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/inc] 

set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/inc/rvj1_defines.v \
	$script_dir/../../verilog/rtl/rvj1_caravel_soc.v \
	$script_dir/../../verilog/rtl/instr_ram_mux.v \
	$script_dir/../../verilog/rtl/data_ram_mux.v \
	$script_dir/../../verilog/rtl/wishbone_mux.v \
	$script_dir/../../verilog/rtl/gpio.v \
	$script_dir/../../verilog/rtl/timer.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/inc/jedro_1_defines.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/jedro_1_ifu.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/jedro_1_decoder.v \ 
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/jedro_1_regfile.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/jedro_1_csr.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/jedro_1_alu.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/jedro_1_lsu.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/jedro_1_top.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/alu/adder/full_adder_1b.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/alu/adder/ripple_carry_adder_Nb.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/alu/compare/equality_Nb.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/alu/compare/less_than_sign_Nb.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/alu/compare/less_than_unsign_Nb.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/alu/shift/barrel_shifter_left_32b.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/alu/shift/barrel_shifter_right_32b.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/alu/shift/mux2x1.v \
    $script_dir/../../verilog/rtl/riscv-jedro-1/rtl/alu/sign_extension/sign_extender.v" 



#set ::env(VERILOG_FILES_BLACKBOX) " \
#    $::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_sram_macros/verilog/sky130_sram_2kbyte_1rw1r_32x512_8.v \
#    $::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_sram_macros/verilog/sky130_sram_1kbyte_1rw1r_32x256_8.v"

#set ::env(EXTRA_LEFS) " \
#    $::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_sram_macros/lef/sky130_sram_2kbyte_1rw1r_32x512_8.lef \
#    $::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_sram_macros/lef/sky130_sram_1kbyte_1rw1r_32x256_8.lef"

#set ::env(EXTRA_GDS_FILES) " \
#    $::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_sram_macros/gds/sky130_sram_2kbyte_1rw1r_32x512_8.gds \
#    $::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_sram_macros/gds/sky130_sram_1kbyte_1rw1r_32x256_8.gds"


# Enable openram macros
set ::env(SYNTH_READ_BLACKBOX_LIB) 0

set ::env(DESIGN_IS_CORE) 0

set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "wb_clk_i"
set ::env(CLOCK_PERIOD) "100"

#set ::env(FP_SIZING) absolute
#set ::env(DIE_AREA) "0 0 900 600"

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

set ::env(SYNTH_STRATEGY) "AREA 2"
set ::env(PL_BASIC_PLACEMENT) 0
#set ::env(FP_CORE_UTIL) 35
#set ::env(PL_TARGET_DENSITY) 0.37
set ::env(FP_CORE_UTIL) 31
set ::env(PL_TARGET_DENSITY) 0.33
set ::env(PL_ROUTABILITY_DRIVEN) 1

# Maximum layer used for routing is metal 4.
# This is because this macro will be inserted in a top level (user_project_wrapper) 
# where the PDN is planned on metal 5. So, to avoid having shorts between routes
# in this macro and the top level metal 5 stripes, we have to restrict routes to metal4.  
# 
# set ::env(GLB_RT_MAXLAYER) 5

set ::env(RT_MAX_LAYER) {met4}

# You can draw more power domains if you need to 
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

set ::env(DIODE_INSERTION_STRATEGY) 4
set ::env(GLB_RT_ANT_ITERS) 5
set ::env(GLB_RT_MAX_DIODE_INS_ITERS) 5

# If you're going to use multiple power domains, then disable cvc run.
set ::env(RUN_CVC) 1

set ::env(CELL_PAD) 2


#set ::env(FP_PDN_CHECK_NODES) 0

set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 1                                                                          
                                                                                                                        
#set ::env(GLB_RT_ADJUSTMENT) 0.25 

set ::env(DETAILED_ROUTER) tritonroute

set ::env(PL_RESIZER_ALLOW_SETUP_VIOS) 1
set ::env(GLB_RESIZER_ALLOW_SETUP_VIOS) 1
