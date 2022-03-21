// SPDX-FileCopyrightText: 2022 Princeton University
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

module tile_clb (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
    output wire [11:0] cu_x0y0n_L1
    , output wire [11:0] cu_x0y0s_L1
    , input wire [11:0] bi_u1y0n_L1
    , input wire [11:0] bi_u1y0s_L1
    , input wire [0:0] clk
    , input wire [0:0] prog_clk
    , input wire [0:0] prog_rst
    , input wire [0:0] prog_done
    , input wire [0:0] prog_we
    , input wire [0:0] prog_din
    , output wire [0:0] prog_dout
    , output wire [0:0] prog_we_o
    );

endmodule
