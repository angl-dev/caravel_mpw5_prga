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

set ::env(DESIGN_NAME) "top"

set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/top.pickled.v"

set ::env(VERILOG_FILES_BLACKBOX) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/tile_clb.bb.v"

set ::env(EXTRA_LEFS) "\
	$script_dir/../../lef/tile_clb.lef"

set ::env(EXTRA_GDS_FILES) "\
	$script_dir/../../gds/tile_clb.gds"

# Specifies the base sdc file to source before running Static Timing Analysis. (Default: $::env(OPENLANE_ROOT)/scripts/base.sdc)
set ::env(BASE_SDC_FILE) $::env(DESIGN_DIR)/constraint.sdc

set ::env(DESIGN_IS_CORE) 0
# set ::env(FP_PDN_CORE_RING) 0

set ::env(CLOCK_PORT) "prog_clk ipin_x0y1_0"
set ::env(CLOCK_NET) "prog_clk ipin_x0y1_0"
set ::env(CLOCK_PERIOD) "1500"

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 2600 3200"
set ::env(FP_CORE_UTIL) 40

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg
set ::env(FP_TAP_HORIZONTAL_HALO) 5
set ::env(FP_PDN_HORIZONTAL_HALO) 5
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro_placement.cfg

# PDN Pitch decreased from 153.6 -> 51.2 which is 153.6 / 3
set ::env(FP_PDN_VPITCH) 51.2

# Density increased from 0.135 to 0.180 per OpenLANE's recommendation
set ::env(PL_TARGET_DENSITY)            0.180

# Decreased from 250 to 115 to increase slack to avoid min hold violations
# Under 115 does not work -> fails at global routing
set ::env(PL_RESIZER_MAX_WIRE_LENGTH)   115
# Timing Closure doc suggested to increase max buffer percentage and decrease
# core flow util but over this percentage and lower core flow util does not
# help increasing slack
set ::env(PL_RESIZER_HOLD_MAX_BUFFER_PERCENT) 85
set ::env(GLB_RESIZER_HOLD_MAX_BUFFER_PERCENT) 85

# Timing Closure doc suggested to increase margin if there is 
# timing violations at the DRC stage
# Currently being tested to see if it actually helps
set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) 0.3
set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) 0.3

# Increased to 350 and it is verified to help slack but DOES NOT HELP OVER THIS
set ::env(CTS_CLK_MAX_WIRE_LENGTH)      350

# Maximum layer used for routing is metal 4.
# This is because this macro will be inserted in a top level (user_project_wrapper) 
# where the PDN is planned on metal 5. So, to avoid having shorts between routes
# in this macro and the top level metal 5 stripes, we have to restrict routes to metal4.  
set ::env(RT_MIN_LAYER) met1
set ::env(RT_MAX_LAYER) met4
set ::env(DRT_MIN_LAYER) li1
set ::env(DRT_MAX_LAYER) met4

# You can draw more power domains if you need to 
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

# custom PDN
set ::env(FP_PDN_ENABLE_MACROS_GRID) 1
set ::env(PDN_CFG) $script_dir/pdn_cfg.tcl

# Specifies the number of threads to be used in TritonRoute. Can be overriden via environment variable. (Default: 2)
set ::env(ROUTING_CORES) 8

# Specifies the maximum number of optimization iterations during Detailed Routing in TritonRoute. (Default: 64)
# set ::env(DRT_OPT_ITERS) 20

set ::env(DIODE_INSERTION_STRATEGY)         3
set ::env(GLB_RT_MAX_DIODE_INS_ITERS)       10
set ::env(GLB_RT_ANT_ITERS)                 10

# set ::env(DECAP_CELL) "\
#     sky130_fd_sc_hd__decap_3 \
#     sky130_fd_sc_hd__decap_4 \
#     sky130_fd_sc_hd__decap_6 \
#     sky130_fd_sc_hd__decap_8 \
#     sky130_ef_sc_hd__decap_12"

# If you're going to use multiple power domains, then disable cvc run.
set ::env(RUN_CVC) 1
