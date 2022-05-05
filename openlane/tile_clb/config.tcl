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

set ::env(DESIGN_NAME) "tile_clb"

set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/tile_clb.pickled.v"

# Specifies the base sdc file to source before running Static Timing Analysis. (Default: $::env(OPENLANE_ROOT)/scripts/base.sdc)
set ::env(BASE_SDC_FILE) $::env(DESIGN_DIR)/constraint.sdc

set ::env(DESIGN_IS_CORE) 0
# [Ang]: We don't need to create PDN ring for each CLB
# set ::env(FP_PDN_CORE_RING) 0

set ::env(CLOCK_PORT) "prog_clk clk"
set ::env(CLOCK_NET) "prog_clk clk"
set ::env(CLOCK_PERIOD) "1000"

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 165.60 217.60"

set ::env(FP_CORE_UTIL) 42

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg
set ::env(FP_IO_HLAYER) met1
set ::env(FP_IO_VLAYER) met2

set ::env(BOTTOM_MARGIN_MULT) 2
set ::env(TOP_MARGIN_MULT)    2
# Can go down to mult = 9 but increased back to 12 (default) to minimize min hold violations
# If needed, it can go down back to 9 since it does not help much with hold violations
set ::env(LEFT_MARGIN_MULT)   12 
set ::env(RIGHT_MARGIN_MULT)  12

set ::env(PDN_CFG) $script_dir/pdn_cfg.tcl

# set ::env(PL_BASIC_PLACEMENT) 1
set ::env(PL_TARGET_DENSITY) 0.57
set ::env(PL_RESIZER_HOLD_MAX_BUFFER_PERCENT) 80


set ::env(CTS_CLK_MAX_WIRE_LENGTH) 140
# Maximum layer used for routing is metal 4.
# This is because this macro will be inserted in a top level (user_project_wrapper) 
# where the PDN is planned on metal 5. So, to avoid having shorts between routes
# in this macro and the top level metal 5 stripes, we have to restrict routes to metal4.  
set ::env(GLB_RESIZER_HOLD_MAX_BUFFER_PERCENT) 80
set ::env(RT_MIN_LAYER) met1
set ::env(RT_MAX_LAYER) met2
set ::env(DRT_MIN_LAYER) li1
set ::env(DRT_MAX_LAYER) met2


# You can draw more power domains if you need to 
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

set ::env(DIODE_INSERTION_STRATEGY) 3
# If you're going to use multiple power domains, then disable cvc run.
set ::env(RUN_CVC) 0
