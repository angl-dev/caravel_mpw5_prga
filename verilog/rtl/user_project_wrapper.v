// SPDX-FileCopyrightText: (c) 2022 Princeton University
// SPDX-License-Identifier: BSD-3-Clause
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived from
//    this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

   // Ground not used ouputs
   assign wbs_ack_o   =   1'b0;
   assign wbs_dat_o   =  32'b0;
   assign user_irq    =   3'b0;
   assign la_data_out = 128'b0;

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

// auto-generated configuration
`define MPRJ_IO_37_I
`define MPRJ_IO_37_CONN prog_clk

`define MPRJ_IO_36_I
`define MPRJ_IO_36_CONN ipin_x0y1_0

`define MPRJ_IO_35_I
`define MPRJ_IO_35_CONN prog_din

`define MPRJ_IO_34_I
`define MPRJ_IO_34_CONN prog_done

`define MPRJ_IO_33_I
`define MPRJ_IO_33_CONN prog_rst

`define MPRJ_IO_32_I
`define MPRJ_IO_32_CONN prog_we

`define MPRJ_IO_1_O
`define MPRJ_IO_1_CONN  prog_dout

`define MPRJ_IO_0_O
`define MPRJ_IO_0_CONN  prog_we_o

`define MPRJ_IO_31_IO
`define MPRJ_IO_31_CONN x0y1_1

`define MPRJ_IO_30_IO
`define MPRJ_IO_30_CONN x0y2_0

`define MPRJ_IO_29_IO
`define MPRJ_IO_29_CONN x0y3_0

`define MPRJ_IO_28_IO
`define MPRJ_IO_28_CONN x0y4_0

`define MPRJ_IO_27_IO
`define MPRJ_IO_27_CONN x0y5_0

`define MPRJ_IO_26_IO
`define MPRJ_IO_26_CONN x0y6_0

`define MPRJ_IO_25_IO
`define MPRJ_IO_25_CONN x0y7_0

`define MPRJ_IO_24_IO
`define MPRJ_IO_24_CONN x0y8_0

`define MPRJ_IO_23_IO
`define MPRJ_IO_23_CONN x1y9_0

`define MPRJ_IO_22_IO
`define MPRJ_IO_22_CONN x2y9_0

`define MPRJ_IO_21_IO
`define MPRJ_IO_21_CONN x2y9_1

`define MPRJ_IO_20_IO
`define MPRJ_IO_20_CONN x3y9_0

`define MPRJ_IO_19_IO
`define MPRJ_IO_19_CONN x4y9_0

`define MPRJ_IO_18_IO
`define MPRJ_IO_18_CONN x5y9_0

`define MPRJ_IO_17_IO
`define MPRJ_IO_17_CONN x6y9_0

`define MPRJ_IO_16_IO
`define MPRJ_IO_16_CONN x7y9_0

`define MPRJ_IO_15_IO
`define MPRJ_IO_15_CONN x8y9_1

`define MPRJ_IO_14_IO
`define MPRJ_IO_14_CONN x9y8_0

`define MPRJ_IO_13_IO
`define MPRJ_IO_13_CONN x9y7_1

`define MPRJ_IO_12_IO
`define MPRJ_IO_12_CONN x9y7_0

`define MPRJ_IO_11_IO
`define MPRJ_IO_11_CONN x9y6_0

`define MPRJ_IO_10_IO
`define MPRJ_IO_10_CONN x9y5_1

`define MPRJ_IO_9_IO
`define MPRJ_IO_9_CONN x9y5_0

`define MPRJ_IO_8_IO
`define MPRJ_IO_8_CONN x9y4_0

`define MPRJ_IO_7_IO
`define MPRJ_IO_7_CONN x9y3_1

`define MPRJ_IO_6_IO
`define MPRJ_IO_6_CONN x9y3_0

`define MPRJ_IO_5_IO
`define MPRJ_IO_5_CONN x9y2_1

`define MPRJ_IO_4_IO
`define MPRJ_IO_4_CONN x9y2_0

`define MPRJ_IO_3_IO
`define MPRJ_IO_3_CONN x9y1_1

`define MPRJ_IO_2_IO
`define MPRJ_IO_2_CONN x9y1_0

/*---------------------*/
/* Do not change below */
/*---------------------*/
`ifdef MPRJ_IO_37_I
    assign io_out[37] = 1'b0;
    assign io_oeb[37] = 1'b0;
`else /* `ifdef MPRJ_IO_37_I */
`ifdef MPRJ_IO_37_O
    assign io_oeb[37] = 1'b1;
`endif /* `ifdef MPRJ_IO_37_O */
`endif /* `ifdef MPRJ_IO_37_I */

`ifdef MPRJ_IO_36_I
    assign io_out[36] = 1'b0;
    assign io_oeb[36] = 1'b0;
`else /* `ifdef MPRJ_IO_36_I */
`ifdef MPRJ_IO_36_O
    assign io_oeb[36] = 1'b1;
`endif /* `ifdef MPRJ_IO_36_O */
`endif /* `ifdef MPRJ_IO_36_I */

`ifdef MPRJ_IO_35_I
    assign io_out[35] = 1'b0;
    assign io_oeb[35] = 1'b0;
`else /* `ifdef MPRJ_IO_35_I */
`ifdef MPRJ_IO_35_O
    assign io_oeb[35] = 1'b1;
`endif /* `ifdef MPRJ_IO_35_O */
`endif /* `ifdef MPRJ_IO_35_I */

`ifdef MPRJ_IO_34_I
    assign io_out[34] = 1'b0;
    assign io_oeb[34] = 1'b0;
`else /* `ifdef MPRJ_IO_34_I */
`ifdef MPRJ_IO_34_O
    assign io_oeb[34] = 1'b1;
`endif /* `ifdef MPRJ_IO_34_O */
`endif /* `ifdef MPRJ_IO_34_I */

`ifdef MPRJ_IO_33_I
    assign io_out[33] = 1'b0;
    assign io_oeb[33] = 1'b0;
`else /* `ifdef MPRJ_IO_33_I */
`ifdef MPRJ_IO_33_O
    assign io_oeb[33] = 1'b1;
`endif /* `ifdef MPRJ_IO_33_O */
`endif /* `ifdef MPRJ_IO_33_I */

`ifdef MPRJ_IO_32_I
    assign io_out[32] = 1'b0;
    assign io_oeb[32] = 1'b0;
`else /* `ifdef MPRJ_IO_32_I */
`ifdef MPRJ_IO_32_O
    assign io_oeb[32] = 1'b1;
`endif /* `ifdef MPRJ_IO_32_O */
`endif /* `ifdef MPRJ_IO_32_I */

`ifdef MPRJ_IO_31_I
    assign io_out[31] = 1'b0;
    assign io_oeb[31] = 1'b0;
`else /* `ifdef MPRJ_IO_31_I */
`ifdef MPRJ_IO_31_O
    assign io_oeb[31] = 1'b1;
`endif /* `ifdef MPRJ_IO_31_O */
`endif /* `ifdef MPRJ_IO_31_I */

`ifdef MPRJ_IO_30_I
    assign io_out[30] = 1'b0;
    assign io_oeb[30] = 1'b0;
`else /* `ifdef MPRJ_IO_30_I */
`ifdef MPRJ_IO_30_O
    assign io_oeb[30] = 1'b1;
`endif /* `ifdef MPRJ_IO_30_O */
`endif /* `ifdef MPRJ_IO_30_I */

`ifdef MPRJ_IO_29_I
    assign io_out[29] = 1'b0;
    assign io_oeb[29] = 1'b0;
`else /* `ifdef MPRJ_IO_29_I */
`ifdef MPRJ_IO_29_O
    assign io_oeb[29] = 1'b1;
`endif /* `ifdef MPRJ_IO_29_O */
`endif /* `ifdef MPRJ_IO_29_I */

`ifdef MPRJ_IO_28_I
    assign io_out[28] = 1'b0;
    assign io_oeb[28] = 1'b0;
`else /* `ifdef MPRJ_IO_28_I */
`ifdef MPRJ_IO_28_O
    assign io_oeb[28] = 1'b1;
`endif /* `ifdef MPRJ_IO_28_O */
`endif /* `ifdef MPRJ_IO_28_I */

`ifdef MPRJ_IO_27_I
    assign io_out[27] = 1'b0;
    assign io_oeb[27] = 1'b0;
`else /* `ifdef MPRJ_IO_27_I */
`ifdef MPRJ_IO_27_O
    assign io_oeb[27] = 1'b1;
`endif /* `ifdef MPRJ_IO_27_O */
`endif /* `ifdef MPRJ_IO_27_I */

`ifdef MPRJ_IO_26_I
    assign io_out[26] = 1'b0;
    assign io_oeb[26] = 1'b0;
`else /* `ifdef MPRJ_IO_26_I */
`ifdef MPRJ_IO_26_O
    assign io_oeb[26] = 1'b1;
`endif /* `ifdef MPRJ_IO_26_O */
`endif /* `ifdef MPRJ_IO_26_I */

`ifdef MPRJ_IO_25_I
    assign io_out[25] = 1'b0;
    assign io_oeb[25] = 1'b0;
`else /* `ifdef MPRJ_IO_25_I */
`ifdef MPRJ_IO_25_O
    assign io_oeb[25] = 1'b1;
`endif /* `ifdef MPRJ_IO_25_O */
`endif /* `ifdef MPRJ_IO_25_I */

`ifdef MPRJ_IO_24_I
    assign io_out[24] = 1'b0;
    assign io_oeb[24] = 1'b0;
`else /* `ifdef MPRJ_IO_24_I */
`ifdef MPRJ_IO_24_O
    assign io_oeb[24] = 1'b1;
`endif /* `ifdef MPRJ_IO_24_O */
`endif /* `ifdef MPRJ_IO_24_I */

`ifdef MPRJ_IO_23_I
    assign io_out[23] = 1'b0;
    assign io_oeb[23] = 1'b0;
`else /* `ifdef MPRJ_IO_23_I */
`ifdef MPRJ_IO_23_O
    assign io_oeb[23] = 1'b1;
`endif /* `ifdef MPRJ_IO_23_O */
`endif /* `ifdef MPRJ_IO_23_I */

`ifdef MPRJ_IO_22_I
    assign io_out[22] = 1'b0;
    assign io_oeb[22] = 1'b0;
`else /* `ifdef MPRJ_IO_22_I */
`ifdef MPRJ_IO_22_O
    assign io_oeb[22] = 1'b1;
`endif /* `ifdef MPRJ_IO_22_O */
`endif /* `ifdef MPRJ_IO_22_I */

`ifdef MPRJ_IO_21_I
    assign io_out[21] = 1'b0;
    assign io_oeb[21] = 1'b0;
`else /* `ifdef MPRJ_IO_21_I */
`ifdef MPRJ_IO_21_O
    assign io_oeb[21] = 1'b1;
`endif /* `ifdef MPRJ_IO_21_O */
`endif /* `ifdef MPRJ_IO_21_I */

`ifdef MPRJ_IO_20_I
    assign io_out[20] = 1'b0;
    assign io_oeb[20] = 1'b0;
`else /* `ifdef MPRJ_IO_20_I */
`ifdef MPRJ_IO_20_O
    assign io_oeb[20] = 1'b1;
`endif /* `ifdef MPRJ_IO_20_O */
`endif /* `ifdef MPRJ_IO_20_I */

`ifdef MPRJ_IO_19_I
    assign io_out[19] = 1'b0;
    assign io_oeb[19] = 1'b0;
`else /* `ifdef MPRJ_IO_19_I */
`ifdef MPRJ_IO_19_O
    assign io_oeb[19] = 1'b1;
`endif /* `ifdef MPRJ_IO_19_O */
`endif /* `ifdef MPRJ_IO_19_I */

`ifdef MPRJ_IO_18_I
    assign io_out[18] = 1'b0;
    assign io_oeb[18] = 1'b0;
`else /* `ifdef MPRJ_IO_18_I */
`ifdef MPRJ_IO_18_O
    assign io_oeb[18] = 1'b1;
`endif /* `ifdef MPRJ_IO_18_O */
`endif /* `ifdef MPRJ_IO_18_I */

`ifdef MPRJ_IO_17_I
    assign io_out[17] = 1'b0;
    assign io_oeb[17] = 1'b0;
`else /* `ifdef MPRJ_IO_17_I */
`ifdef MPRJ_IO_17_O
    assign io_oeb[17] = 1'b1;
`endif /* `ifdef MPRJ_IO_17_O */
`endif /* `ifdef MPRJ_IO_17_I */

`ifdef MPRJ_IO_16_I
    assign io_out[16] = 1'b0;
    assign io_oeb[16] = 1'b0;
`else /* `ifdef MPRJ_IO_16_I */
`ifdef MPRJ_IO_16_O
    assign io_oeb[16] = 1'b1;
`endif /* `ifdef MPRJ_IO_16_O */
`endif /* `ifdef MPRJ_IO_16_I */

`ifdef MPRJ_IO_15_I
    assign io_out[15] = 1'b0;
    assign io_oeb[15] = 1'b0;
`else /* `ifdef MPRJ_IO_15_I */
`ifdef MPRJ_IO_15_O
    assign io_oeb[15] = 1'b1;
`endif /* `ifdef MPRJ_IO_15_O */
`endif /* `ifdef MPRJ_IO_15_I */

`ifdef MPRJ_IO_14_I
    assign io_out[14] = 1'b0;
    assign io_oeb[14] = 1'b0;
`else /* `ifdef MPRJ_IO_14_I */
`ifdef MPRJ_IO_14_O
    assign io_oeb[14] = 1'b1;
`endif /* `ifdef MPRJ_IO_14_O */
`endif /* `ifdef MPRJ_IO_14_I */

`ifdef MPRJ_IO_13_I
    assign io_out[13] = 1'b0;
    assign io_oeb[13] = 1'b0;
`else /* `ifdef MPRJ_IO_13_I */
`ifdef MPRJ_IO_13_O
    assign io_oeb[13] = 1'b1;
`endif /* `ifdef MPRJ_IO_13_O */
`endif /* `ifdef MPRJ_IO_13_I */

`ifdef MPRJ_IO_12_I
    assign io_out[12] = 1'b0;
    assign io_oeb[12] = 1'b0;
`else /* `ifdef MPRJ_IO_12_I */
`ifdef MPRJ_IO_12_O
    assign io_oeb[12] = 1'b1;
`endif /* `ifdef MPRJ_IO_12_O */
`endif /* `ifdef MPRJ_IO_12_I */

`ifdef MPRJ_IO_11_I
    assign io_out[11] = 1'b0;
    assign io_oeb[11] = 1'b0;
`else /* `ifdef MPRJ_IO_11_I */
`ifdef MPRJ_IO_11_O
    assign io_oeb[11] = 1'b1;
`endif /* `ifdef MPRJ_IO_11_O */
`endif /* `ifdef MPRJ_IO_11_I */

`ifdef MPRJ_IO_10_I
    assign io_out[10] = 1'b0;
    assign io_oeb[10] = 1'b0;
`else /* `ifdef MPRJ_IO_10_I */
`ifdef MPRJ_IO_10_O
    assign io_oeb[10] = 1'b1;
`endif /* `ifdef MPRJ_IO_10_O */
`endif /* `ifdef MPRJ_IO_10_I */

`ifdef MPRJ_IO_9_I
    assign io_out[9] = 1'b0;
    assign io_oeb[9] = 1'b0;
`else /* `ifdef MPRJ_IO_9_I */
`ifdef MPRJ_IO_9_O
    assign io_oeb[9] = 1'b1;
`endif /* `ifdef MPRJ_IO_9_O */
`endif /* `ifdef MPRJ_IO_9_I */

`ifdef MPRJ_IO_8_I
    assign io_out[8] = 1'b0;
    assign io_oeb[8] = 1'b0;
`else /* `ifdef MPRJ_IO_8_I */
`ifdef MPRJ_IO_8_O
    assign io_oeb[8] = 1'b1;
`endif /* `ifdef MPRJ_IO_8_O */
`endif /* `ifdef MPRJ_IO_8_I */

`ifdef MPRJ_IO_7_I
    assign io_out[7] = 1'b0;
    assign io_oeb[7] = 1'b0;
`else /* `ifdef MPRJ_IO_7_I */
`ifdef MPRJ_IO_7_O
    assign io_oeb[7] = 1'b1;
`endif /* `ifdef MPRJ_IO_7_O */
`endif /* `ifdef MPRJ_IO_7_I */

`ifdef MPRJ_IO_6_I
    assign io_out[6] = 1'b0;
    assign io_oeb[6] = 1'b0;
`else /* `ifdef MPRJ_IO_6_I */
`ifdef MPRJ_IO_6_O
    assign io_oeb[6] = 1'b1;
`endif /* `ifdef MPRJ_IO_6_O */
`endif /* `ifdef MPRJ_IO_6_I */

`ifdef MPRJ_IO_5_I
    assign io_out[5] = 1'b0;
    assign io_oeb[5] = 1'b0;
`else /* `ifdef MPRJ_IO_5_I */
`ifdef MPRJ_IO_5_O
    assign io_oeb[5] = 1'b1;
`endif /* `ifdef MPRJ_IO_5_O */
`endif /* `ifdef MPRJ_IO_5_I */

`ifdef MPRJ_IO_4_I
    assign io_out[4] = 1'b0;
    assign io_oeb[4] = 1'b0;
`else /* `ifdef MPRJ_IO_4_I */
`ifdef MPRJ_IO_4_O
    assign io_oeb[4] = 1'b1;
`endif /* `ifdef MPRJ_IO_4_O */
`endif /* `ifdef MPRJ_IO_4_I */

`ifdef MPRJ_IO_3_I
    assign io_out[3] = 1'b0;
    assign io_oeb[3] = 1'b0;
`else /* `ifdef MPRJ_IO_3_I */
`ifdef MPRJ_IO_3_O
    assign io_oeb[3] = 1'b1;
`endif /* `ifdef MPRJ_IO_3_O */
`endif /* `ifdef MPRJ_IO_3_I */

`ifdef MPRJ_IO_2_I
    assign io_out[2] = 1'b0;
    assign io_oeb[2] = 1'b0;
`else /* `ifdef MPRJ_IO_2_I */
`ifdef MPRJ_IO_2_O
    assign io_oeb[2] = 1'b1;
`endif /* `ifdef MPRJ_IO_2_O */
`endif /* `ifdef MPRJ_IO_2_I */

`ifdef MPRJ_IO_1_I
    assign io_out[1] = 1'b0;
    assign io_oeb[1] = 1'b0;
`else /* `ifdef MPRJ_IO_1_I */
`ifdef MPRJ_IO_1_O
    assign io_oeb[1] = 1'b1;
`endif /* `ifdef MPRJ_IO_1_O */
`endif /* `ifdef MPRJ_IO_1_I */

`ifdef MPRJ_IO_0_I
    assign io_out[0] = 1'b0;
    assign io_oeb[0] = 1'b0;
`else /* `ifdef MPRJ_IO_0_I */
`ifdef MPRJ_IO_0_O
    assign io_oeb[0] = 1'b1;
`endif /* `ifdef MPRJ_IO_0_O */
`endif /* `ifdef MPRJ_IO_0_I */

   // GPIO PINS
   localparam  PIN_PROG_CLK     = 37;
   localparam  PIN_USER_CLK     = 36;
   localparam  PIN_PROG_DIN     = 35;
   localparam  PIN_PROG_DONE    = 34;
   localparam  PIN_PROG_RST     = 33;
   localparam  PIN_PROG_WE      = 32;
   localparam  PIN_31           = 31;
   localparam  PIN_30           = 30;
   localparam  PIN_29           = 29;
   localparam  PIN_28           = 28;
   localparam  PIN_27           = 27;
   localparam  PIN_26           = 26;
   localparam  PIN_25           = 25;
   localparam  PIN_24           = 24;
   localparam  PIN_23           = 23;
   localparam  PIN_22           = 22;
   localparam  PIN_21           = 21;
   localparam  PIN_20           = 20;
   localparam  PIN_19           = 19;
   localparam  PIN_18           = 18;
   localparam  PIN_17           = 17;
   localparam  PIN_16           = 16;
   localparam  PIN_15           = 15;
   localparam  PIN_14           = 14;
   localparam  PIN_13           = 13;
   localparam  PIN_12           = 12;
   localparam  PIN_11           = 11;
   localparam  PIN_10           = 10;
   localparam  PIN_9            = 9;
   localparam  PIN_8            = 8;
   localparam  PIN_7            = 7;
   localparam  PIN_6            = 6;
   localparam  PIN_5            = 5;
   localparam  PIN_4            = 4;
   localparam  PIN_3            = 3;
   localparam  PIN_2            = 2;
   localparam  PIN_PROG_DOUT    = 1;
   localparam  PIN_PROG_WE_O    = 0;

   // 
   wire [0:0]                   prog_clk, prog_rst, prog_done, prog_we, prog_din, prog_dout, prog_we_o;
   wire [0:0]                   clk;

   // wire [1:0]                   not_used;
   
   //prog_din
   assign prog_din = io_in[PIN_PROG_DIN];
   assign io_oeb[PIN_PROG_DIN] = 1'b0;
   assign io_out[PIN_PROG_DIN] = 1'b0;
   //prog_done
   assign prog_done = io_in[PIN_PROG_DONE];
   assign io_oeb[PIN_PROG_DONE] = 1'b0;
   assign io_out[PIN_PROG_DONE] = 1'b0;
   //prog_rst
   assign prog_rst = io_in[PIN_PROG_RST];
   assign io_oeb[PIN_PROG_RST] = 1'b0;
   assign io_out[PIN_PROG_RST] = 1'b0;
   //prog_we
   assign prog_we = io_in[PIN_PROG_WE];
   assign io_oeb[PIN_PROG_WE] = 1'b0;
   assign io_out[PIN_PROG_WE] = 1'b0;

   //prog_dout
   // assign not_used = io_in[PIN_PROG_DOUT];
   assign io_oeb[PIN_PROG_DOUT] = 1'b1;
   assign io_out[PIN_PROG_DOUT] = prog_dout;
   //prog_dout
   // assign not_used = io_in[PIN_PROG_WE_O];
   assign io_oeb[PIN_PROG_WE_O] = 1'b1;
   assign io_out[PIN_PROG_WE_O] = prog_we_o;


   // Ground not used ouputs
   assign wbs_ack_o   =   1'b0;
   assign wbs_dat_o   =  32'b0;
   assign user_irq    =   3'b0;
   assign la_data_out = 128'b0;

      
   // We use user_clock2 instead of external clock through GPIO due to the reported issue with scipts and brackets in names of constraints
   // 
   assign prog_clk = user_clock2;
   assign clk = user_clock2;
   
   //~
   // FPGA instance   
   
   top dut (
`ifdef USE_POWER_PINS
	    .vccd1(vccd1),	// User area 1 1.8V power
	    .vssd1(vssd1),	// User area 1 digital ground
`endif
`ifdef MPRJ_IO_37_IO
         .ipin_`MPRJ_IO_37_CONN ( io_in[37])
        ,.opin_`MPRJ_IO_37_CONN (io_out[37])
        ,  .oe_`MPRJ_IO_37_CONN (io_oeb[37])
`else /* `ifdef MPRJ_IO_37_IO */
`ifdef MPRJ_IO_37_I
         .`MPRJ_IO_37_CONN ( io_in[37])
`else /* `ifdef MPRJ_IO_37_I */
         .`MPRJ_IO_37_CONN (io_out[37])
`endif /* `ifdef MPRJ_IO_37_I */
`endif /* `ifdef MPRJ_IO_37_IO */

`ifdef MPRJ_IO_36_IO
        ,.ipin_`MPRJ_IO_36_CONN ( io_in[36])
        ,.opin_`MPRJ_IO_36_CONN (io_out[36])
        ,  .oe_`MPRJ_IO_36_CONN (io_oeb[36])
`else /* `ifdef MPRJ_IO_36_IO */
`ifdef MPRJ_IO_36_I
        ,.`MPRJ_IO_36_CONN ( io_in[36])
`else /* `ifdef MPRJ_IO_36_I */
        ,.`MPRJ_IO_36_CONN (io_out[36])
`endif /* `ifdef MPRJ_IO_36_I */
`endif /* `ifdef MPRJ_IO_36_IO */

`ifdef MPRJ_IO_35_IO
        ,.ipin_`MPRJ_IO_35_CONN ( io_in[35])
        ,.opin_`MPRJ_IO_35_CONN (io_out[35])
        ,  .oe_`MPRJ_IO_35_CONN (io_oeb[35])
`else /* `ifdef MPRJ_IO_35_IO */
`ifdef MPRJ_IO_35_I
        ,.`MPRJ_IO_35_CONN ( io_in[35])
`else /* `ifdef MPRJ_IO_35_I */
        ,.`MPRJ_IO_35_CONN (io_out[35])
`endif /* `ifdef MPRJ_IO_35_I */
`endif /* `ifdef MPRJ_IO_35_IO */

`ifdef MPRJ_IO_34_IO
        ,.ipin_`MPRJ_IO_34_CONN ( io_in[34])
        ,.opin_`MPRJ_IO_34_CONN (io_out[34])
        ,  .oe_`MPRJ_IO_34_CONN (io_oeb[34])
`else /* `ifdef MPRJ_IO_34_IO */
`ifdef MPRJ_IO_34_I
        ,.`MPRJ_IO_34_CONN ( io_in[34])
`else /* `ifdef MPRJ_IO_34_I */
        ,.`MPRJ_IO_34_CONN (io_out[34])
`endif /* `ifdef MPRJ_IO_34_I */
`endif /* `ifdef MPRJ_IO_34_IO */

`ifdef MPRJ_IO_33_IO
        ,.ipin_`MPRJ_IO_33_CONN ( io_in[33])
        ,.opin_`MPRJ_IO_33_CONN (io_out[33])
        ,  .oe_`MPRJ_IO_33_CONN (io_oeb[33])
`else /* `ifdef MPRJ_IO_33_IO */
`ifdef MPRJ_IO_33_I
        ,.`MPRJ_IO_33_CONN ( io_in[33])
`else /* `ifdef MPRJ_IO_33_I */
        ,.`MPRJ_IO_33_CONN (io_out[33])
`endif /* `ifdef MPRJ_IO_33_I */
`endif /* `ifdef MPRJ_IO_33_IO */

`ifdef MPRJ_IO_32_IO
        ,.ipin_`MPRJ_IO_32_CONN ( io_in[32])
        ,.opin_`MPRJ_IO_32_CONN (io_out[32])
        ,  .oe_`MPRJ_IO_32_CONN (io_oeb[32])
`else /* `ifdef MPRJ_IO_32_IO */
`ifdef MPRJ_IO_32_I
        ,.`MPRJ_IO_32_CONN ( io_in[32])
`else /* `ifdef MPRJ_IO_32_I */
        ,.`MPRJ_IO_32_CONN (io_out[32])
`endif /* `ifdef MPRJ_IO_32_I */
`endif /* `ifdef MPRJ_IO_32_IO */

`ifdef MPRJ_IO_31_IO
        ,.ipin_`MPRJ_IO_31_CONN ( io_in[31])
        ,.opin_`MPRJ_IO_31_CONN (io_out[31])
        ,  .oe_`MPRJ_IO_31_CONN (io_oeb[31])
`else /* `ifdef MPRJ_IO_31_IO */
`ifdef MPRJ_IO_31_I
        ,.`MPRJ_IO_31_CONN ( io_in[31])
`else /* `ifdef MPRJ_IO_31_I */
        ,.`MPRJ_IO_31_CONN (io_out[31])
`endif /* `ifdef MPRJ_IO_31_I */
`endif /* `ifdef MPRJ_IO_31_IO */

`ifdef MPRJ_IO_30_IO
        ,.ipin_`MPRJ_IO_30_CONN ( io_in[30])
        ,.opin_`MPRJ_IO_30_CONN (io_out[30])
        ,  .oe_`MPRJ_IO_30_CONN (io_oeb[30])
`else /* `ifdef MPRJ_IO_30_IO */
`ifdef MPRJ_IO_30_I
        ,.`MPRJ_IO_30_CONN ( io_in[30])
`else /* `ifdef MPRJ_IO_30_I */
        ,.`MPRJ_IO_30_CONN (io_out[30])
`endif /* `ifdef MPRJ_IO_30_I */
`endif /* `ifdef MPRJ_IO_30_IO */

`ifdef MPRJ_IO_29_IO
        ,.ipin_`MPRJ_IO_29_CONN ( io_in[29])
        ,.opin_`MPRJ_IO_29_CONN (io_out[29])
        ,  .oe_`MPRJ_IO_29_CONN (io_oeb[29])
`else /* `ifdef MPRJ_IO_29_IO */
`ifdef MPRJ_IO_29_I
        ,.`MPRJ_IO_29_CONN ( io_in[29])
`else /* `ifdef MPRJ_IO_29_I */
        ,.`MPRJ_IO_29_CONN (io_out[29])
`endif /* `ifdef MPRJ_IO_29_I */
`endif /* `ifdef MPRJ_IO_29_IO */

`ifdef MPRJ_IO_28_IO
        ,.ipin_`MPRJ_IO_28_CONN ( io_in[28])
        ,.opin_`MPRJ_IO_28_CONN (io_out[28])
        ,  .oe_`MPRJ_IO_28_CONN (io_oeb[28])
`else /* `ifdef MPRJ_IO_28_IO */
`ifdef MPRJ_IO_28_I
        ,.`MPRJ_IO_28_CONN ( io_in[28])
`else /* `ifdef MPRJ_IO_28_I */
        ,.`MPRJ_IO_28_CONN (io_out[28])
`endif /* `ifdef MPRJ_IO_28_I */
`endif /* `ifdef MPRJ_IO_28_IO */

`ifdef MPRJ_IO_27_IO
        ,.ipin_`MPRJ_IO_27_CONN ( io_in[27])
        ,.opin_`MPRJ_IO_27_CONN (io_out[27])
        ,  .oe_`MPRJ_IO_27_CONN (io_oeb[27])
`else /* `ifdef MPRJ_IO_27_IO */
`ifdef MPRJ_IO_27_I
        ,.`MPRJ_IO_27_CONN ( io_in[27])
`else /* `ifdef MPRJ_IO_27_I */
        ,.`MPRJ_IO_27_CONN (io_out[27])
`endif /* `ifdef MPRJ_IO_27_I */
`endif /* `ifdef MPRJ_IO_27_IO */

`ifdef MPRJ_IO_26_IO
        ,.ipin_`MPRJ_IO_26_CONN ( io_in[26])
        ,.opin_`MPRJ_IO_26_CONN (io_out[26])
        ,  .oe_`MPRJ_IO_26_CONN (io_oeb[26])
`else /* `ifdef MPRJ_IO_26_IO */
`ifdef MPRJ_IO_26_I
        ,.`MPRJ_IO_26_CONN ( io_in[26])
`else /* `ifdef MPRJ_IO_26_I */
        ,.`MPRJ_IO_26_CONN (io_out[26])
`endif /* `ifdef MPRJ_IO_26_I */
`endif /* `ifdef MPRJ_IO_26_IO */

`ifdef MPRJ_IO_25_IO
        ,.ipin_`MPRJ_IO_25_CONN ( io_in[25])
        ,.opin_`MPRJ_IO_25_CONN (io_out[25])
        ,  .oe_`MPRJ_IO_25_CONN (io_oeb[25])
`else /* `ifdef MPRJ_IO_25_IO */
`ifdef MPRJ_IO_25_I
        ,.`MPRJ_IO_25_CONN ( io_in[25])
`else /* `ifdef MPRJ_IO_25_I */
        ,.`MPRJ_IO_25_CONN (io_out[25])
`endif /* `ifdef MPRJ_IO_25_I */
`endif /* `ifdef MPRJ_IO_25_IO */

`ifdef MPRJ_IO_24_IO
        ,.ipin_`MPRJ_IO_24_CONN ( io_in[24])
        ,.opin_`MPRJ_IO_24_CONN (io_out[24])
        ,  .oe_`MPRJ_IO_24_CONN (io_oeb[24])
`else /* `ifdef MPRJ_IO_24_IO */
`ifdef MPRJ_IO_24_I
        ,.`MPRJ_IO_24_CONN ( io_in[24])
`else /* `ifdef MPRJ_IO_24_I */
        ,.`MPRJ_IO_24_CONN (io_out[24])
`endif /* `ifdef MPRJ_IO_24_I */
`endif /* `ifdef MPRJ_IO_24_IO */

`ifdef MPRJ_IO_23_IO
        ,.ipin_`MPRJ_IO_23_CONN ( io_in[23])
        ,.opin_`MPRJ_IO_23_CONN (io_out[23])
        ,  .oe_`MPRJ_IO_23_CONN (io_oeb[23])
`else /* `ifdef MPRJ_IO_23_IO */
`ifdef MPRJ_IO_23_I
        ,.`MPRJ_IO_23_CONN ( io_in[23])
`else /* `ifdef MPRJ_IO_23_I */
        ,.`MPRJ_IO_23_CONN (io_out[23])
`endif /* `ifdef MPRJ_IO_23_I */
`endif /* `ifdef MPRJ_IO_23_IO */

`ifdef MPRJ_IO_22_IO
        ,.ipin_`MPRJ_IO_22_CONN ( io_in[22])
        ,.opin_`MPRJ_IO_22_CONN (io_out[22])
        ,  .oe_`MPRJ_IO_22_CONN (io_oeb[22])
`else /* `ifdef MPRJ_IO_22_IO */
`ifdef MPRJ_IO_22_I
        ,.`MPRJ_IO_22_CONN ( io_in[22])
`else /* `ifdef MPRJ_IO_22_I */
        ,.`MPRJ_IO_22_CONN (io_out[22])
`endif /* `ifdef MPRJ_IO_22_I */
`endif /* `ifdef MPRJ_IO_22_IO */

`ifdef MPRJ_IO_21_IO
        ,.ipin_`MPRJ_IO_21_CONN ( io_in[21])
        ,.opin_`MPRJ_IO_21_CONN (io_out[21])
        ,  .oe_`MPRJ_IO_21_CONN (io_oeb[21])
`else /* `ifdef MPRJ_IO_21_IO */
`ifdef MPRJ_IO_21_I
        ,.`MPRJ_IO_21_CONN ( io_in[21])
`else /* `ifdef MPRJ_IO_21_I */
        ,.`MPRJ_IO_21_CONN (io_out[21])
`endif /* `ifdef MPRJ_IO_21_I */
`endif /* `ifdef MPRJ_IO_21_IO */

`ifdef MPRJ_IO_20_IO
        ,.ipin_`MPRJ_IO_20_CONN ( io_in[20])
        ,.opin_`MPRJ_IO_20_CONN (io_out[20])
        ,  .oe_`MPRJ_IO_20_CONN (io_oeb[20])
`else /* `ifdef MPRJ_IO_20_IO */
`ifdef MPRJ_IO_20_I
        ,.`MPRJ_IO_20_CONN ( io_in[20])
`else /* `ifdef MPRJ_IO_20_I */
        ,.`MPRJ_IO_20_CONN (io_out[20])
`endif /* `ifdef MPRJ_IO_20_I */
`endif /* `ifdef MPRJ_IO_20_IO */

`ifdef MPRJ_IO_19_IO
        ,.ipin_`MPRJ_IO_19_CONN ( io_in[19])
        ,.opin_`MPRJ_IO_19_CONN (io_out[19])
        ,  .oe_`MPRJ_IO_19_CONN (io_oeb[19])
`else /* `ifdef MPRJ_IO_19_IO */
`ifdef MPRJ_IO_19_I
        ,.`MPRJ_IO_19_CONN ( io_in[19])
`else /* `ifdef MPRJ_IO_19_I */
        ,.`MPRJ_IO_19_CONN (io_out[19])
`endif /* `ifdef MPRJ_IO_19_I */
`endif /* `ifdef MPRJ_IO_19_IO */

`ifdef MPRJ_IO_18_IO
        ,.ipin_`MPRJ_IO_18_CONN ( io_in[18])
        ,.opin_`MPRJ_IO_18_CONN (io_out[18])
        ,  .oe_`MPRJ_IO_18_CONN (io_oeb[18])
`else /* `ifdef MPRJ_IO_18_IO */
`ifdef MPRJ_IO_18_I
        ,.`MPRJ_IO_18_CONN ( io_in[18])
`else /* `ifdef MPRJ_IO_18_I */
        ,.`MPRJ_IO_18_CONN (io_out[18])
`endif /* `ifdef MPRJ_IO_18_I */
`endif /* `ifdef MPRJ_IO_18_IO */

`ifdef MPRJ_IO_17_IO
        ,.ipin_`MPRJ_IO_17_CONN ( io_in[17])
        ,.opin_`MPRJ_IO_17_CONN (io_out[17])
        ,  .oe_`MPRJ_IO_17_CONN (io_oeb[17])
`else /* `ifdef MPRJ_IO_17_IO */
`ifdef MPRJ_IO_17_I
        ,.`MPRJ_IO_17_CONN ( io_in[17])
`else /* `ifdef MPRJ_IO_17_I */
        ,.`MPRJ_IO_17_CONN (io_out[17])
`endif /* `ifdef MPRJ_IO_17_I */
`endif /* `ifdef MPRJ_IO_17_IO */

`ifdef MPRJ_IO_16_IO
        ,.ipin_`MPRJ_IO_16_CONN ( io_in[16])
        ,.opin_`MPRJ_IO_16_CONN (io_out[16])
        ,  .oe_`MPRJ_IO_16_CONN (io_oeb[16])
`else /* `ifdef MPRJ_IO_16_IO */
`ifdef MPRJ_IO_16_I
        ,.`MPRJ_IO_16_CONN ( io_in[16])
`else /* `ifdef MPRJ_IO_16_I */
        ,.`MPRJ_IO_16_CONN (io_out[16])
`endif /* `ifdef MPRJ_IO_16_I */
`endif /* `ifdef MPRJ_IO_16_IO */

`ifdef MPRJ_IO_15_IO
        ,.ipin_`MPRJ_IO_15_CONN ( io_in[15])
        ,.opin_`MPRJ_IO_15_CONN (io_out[15])
        ,  .oe_`MPRJ_IO_15_CONN (io_oeb[15])
`else /* `ifdef MPRJ_IO_15_IO */
`ifdef MPRJ_IO_15_I
        ,.`MPRJ_IO_15_CONN ( io_in[15])
`else /* `ifdef MPRJ_IO_15_I */
        ,.`MPRJ_IO_15_CONN (io_out[15])
`endif /* `ifdef MPRJ_IO_15_I */
`endif /* `ifdef MPRJ_IO_15_IO */

`ifdef MPRJ_IO_14_IO
        ,.ipin_`MPRJ_IO_14_CONN ( io_in[14])
        ,.opin_`MPRJ_IO_14_CONN (io_out[14])
        ,  .oe_`MPRJ_IO_14_CONN (io_oeb[14])
`else /* `ifdef MPRJ_IO_14_IO */
`ifdef MPRJ_IO_14_I
        ,.`MPRJ_IO_14_CONN ( io_in[14])
`else /* `ifdef MPRJ_IO_14_I */
        ,.`MPRJ_IO_14_CONN (io_out[14])
`endif /* `ifdef MPRJ_IO_14_I */
`endif /* `ifdef MPRJ_IO_14_IO */

`ifdef MPRJ_IO_13_IO
        ,.ipin_`MPRJ_IO_13_CONN ( io_in[13])
        ,.opin_`MPRJ_IO_13_CONN (io_out[13])
        ,  .oe_`MPRJ_IO_13_CONN (io_oeb[13])
`else /* `ifdef MPRJ_IO_13_IO */
`ifdef MPRJ_IO_13_I
        ,.`MPRJ_IO_13_CONN ( io_in[13])
`else /* `ifdef MPRJ_IO_13_I */
        ,.`MPRJ_IO_13_CONN (io_out[13])
`endif /* `ifdef MPRJ_IO_13_I */
`endif /* `ifdef MPRJ_IO_13_IO */

`ifdef MPRJ_IO_12_IO
        ,.ipin_`MPRJ_IO_12_CONN ( io_in[12])
        ,.opin_`MPRJ_IO_12_CONN (io_out[12])
        ,  .oe_`MPRJ_IO_12_CONN (io_oeb[12])
`else /* `ifdef MPRJ_IO_12_IO */
`ifdef MPRJ_IO_12_I
        ,.`MPRJ_IO_12_CONN ( io_in[12])
`else /* `ifdef MPRJ_IO_12_I */
        ,.`MPRJ_IO_12_CONN (io_out[12])
`endif /* `ifdef MPRJ_IO_12_I */
`endif /* `ifdef MPRJ_IO_12_IO */

`ifdef MPRJ_IO_11_IO
        ,.ipin_`MPRJ_IO_11_CONN ( io_in[11])
        ,.opin_`MPRJ_IO_11_CONN (io_out[11])
        ,  .oe_`MPRJ_IO_11_CONN (io_oeb[11])
`else /* `ifdef MPRJ_IO_11_IO */
`ifdef MPRJ_IO_11_I
        ,.`MPRJ_IO_11_CONN ( io_in[11])
`else /* `ifdef MPRJ_IO_11_I */
        ,.`MPRJ_IO_11_CONN (io_out[11])
`endif /* `ifdef MPRJ_IO_11_I */
`endif /* `ifdef MPRJ_IO_11_IO */

`ifdef MPRJ_IO_10_IO
        ,.ipin_`MPRJ_IO_10_CONN ( io_in[10])
        ,.opin_`MPRJ_IO_10_CONN (io_out[10])
        ,  .oe_`MPRJ_IO_10_CONN (io_oeb[10])
`else /* `ifdef MPRJ_IO_10_IO */
`ifdef MPRJ_IO_10_I
        ,.`MPRJ_IO_10_CONN ( io_in[10])
`else /* `ifdef MPRJ_IO_10_I */
        ,.`MPRJ_IO_10_CONN (io_out[10])
`endif /* `ifdef MPRJ_IO_10_I */
`endif /* `ifdef MPRJ_IO_10_IO */

`ifdef MPRJ_IO_9_IO
        ,.ipin_`MPRJ_IO_9_CONN ( io_in[9])
        ,.opin_`MPRJ_IO_9_CONN (io_out[9])
        ,  .oe_`MPRJ_IO_9_CONN (io_oeb[9])
`else /* `ifdef MPRJ_IO_9_IO */
`ifdef MPRJ_IO_9_I
        ,.`MPRJ_IO_9_CONN ( io_in[9])
`else /* `ifdef MPRJ_IO_9_I */
        ,.`MPRJ_IO_9_CONN (io_out[9])
`endif /* `ifdef MPRJ_IO_9_I */
`endif /* `ifdef MPRJ_IO_9_IO */

`ifdef MPRJ_IO_8_IO
        ,.ipin_`MPRJ_IO_8_CONN ( io_in[8])
        ,.opin_`MPRJ_IO_8_CONN (io_out[8])
        ,  .oe_`MPRJ_IO_8_CONN (io_oeb[8])
`else /* `ifdef MPRJ_IO_8_IO */
`ifdef MPRJ_IO_8_I
        ,.`MPRJ_IO_8_CONN ( io_in[8])
`else /* `ifdef MPRJ_IO_8_I */
        ,.`MPRJ_IO_8_CONN (io_out[8])
`endif /* `ifdef MPRJ_IO_8_I */
`endif /* `ifdef MPRJ_IO_8_IO */

`ifdef MPRJ_IO_7_IO
        ,.ipin_`MPRJ_IO_7_CONN ( io_in[7])
        ,.opin_`MPRJ_IO_7_CONN (io_out[7])
        ,  .oe_`MPRJ_IO_7_CONN (io_oeb[7])
`else /* `ifdef MPRJ_IO_7_IO */
`ifdef MPRJ_IO_7_I
        ,.`MPRJ_IO_7_CONN ( io_in[7])
`else /* `ifdef MPRJ_IO_7_I */
        ,.`MPRJ_IO_7_CONN (io_out[7])
`endif /* `ifdef MPRJ_IO_7_I */
`endif /* `ifdef MPRJ_IO_7_IO */

`ifdef MPRJ_IO_6_IO
        ,.ipin_`MPRJ_IO_6_CONN ( io_in[6])
        ,.opin_`MPRJ_IO_6_CONN (io_out[6])
        ,  .oe_`MPRJ_IO_6_CONN (io_oeb[6])
`else /* `ifdef MPRJ_IO_6_IO */
`ifdef MPRJ_IO_6_I
        ,.`MPRJ_IO_6_CONN ( io_in[6])
`else /* `ifdef MPRJ_IO_6_I */
        ,.`MPRJ_IO_6_CONN (io_out[6])
`endif /* `ifdef MPRJ_IO_6_I */
`endif /* `ifdef MPRJ_IO_6_IO */

`ifdef MPRJ_IO_5_IO
        ,.ipin_`MPRJ_IO_5_CONN ( io_in[5])
        ,.opin_`MPRJ_IO_5_CONN (io_out[5])
        ,  .oe_`MPRJ_IO_5_CONN (io_oeb[5])
`else /* `ifdef MPRJ_IO_5_IO */
`ifdef MPRJ_IO_5_I
        ,.`MPRJ_IO_5_CONN ( io_in[5])
`else /* `ifdef MPRJ_IO_5_I */
        ,.`MPRJ_IO_5_CONN (io_out[5])
`endif /* `ifdef MPRJ_IO_5_I */
`endif /* `ifdef MPRJ_IO_5_IO */

`ifdef MPRJ_IO_4_IO
        ,.ipin_`MPRJ_IO_4_CONN ( io_in[4])
        ,.opin_`MPRJ_IO_4_CONN (io_out[4])
        ,  .oe_`MPRJ_IO_4_CONN (io_oeb[4])
`else /* `ifdef MPRJ_IO_4_IO */
`ifdef MPRJ_IO_4_I
        ,.`MPRJ_IO_4_CONN ( io_in[4])
`else /* `ifdef MPRJ_IO_4_I */
        ,.`MPRJ_IO_4_CONN (io_out[4])
`endif /* `ifdef MPRJ_IO_4_I */
`endif /* `ifdef MPRJ_IO_4_IO */

`ifdef MPRJ_IO_3_IO
        ,.ipin_`MPRJ_IO_3_CONN ( io_in[3])
        ,.opin_`MPRJ_IO_3_CONN (io_out[3])
        ,  .oe_`MPRJ_IO_3_CONN (io_oeb[3])
`else /* `ifdef MPRJ_IO_3_IO */
`ifdef MPRJ_IO_3_I
        ,.`MPRJ_IO_3_CONN ( io_in[3])
`else /* `ifdef MPRJ_IO_3_I */
        ,.`MPRJ_IO_3_CONN (io_out[3])
`endif /* `ifdef MPRJ_IO_3_I */
`endif /* `ifdef MPRJ_IO_3_IO */

`ifdef MPRJ_IO_2_IO
        ,.ipin_`MPRJ_IO_2_CONN ( io_in[2])
        ,.opin_`MPRJ_IO_2_CONN (io_out[2])
        ,  .oe_`MPRJ_IO_2_CONN (io_oeb[2])
`else /* `ifdef MPRJ_IO_2_IO */
`ifdef MPRJ_IO_2_I
        ,.`MPRJ_IO_2_CONN ( io_in[2])
`else /* `ifdef MPRJ_IO_2_I */
        ,.`MPRJ_IO_2_CONN (io_out[2])
`endif /* `ifdef MPRJ_IO_2_I */
`endif /* `ifdef MPRJ_IO_2_IO */

`ifdef MPRJ_IO_1_IO
        ,.ipin_`MPRJ_IO_1_CONN ( io_in[1])
        ,.opin_`MPRJ_IO_1_CONN (io_out[1])
        ,  .oe_`MPRJ_IO_1_CONN (io_oeb[1])
`else /* `ifdef MPRJ_IO_1_IO */
`ifdef MPRJ_IO_1_I
        ,.`MPRJ_IO_1_CONN ( io_in[1])
`else /* `ifdef MPRJ_IO_1_I */
        ,.`MPRJ_IO_1_CONN (io_out[1])
`endif /* `ifdef MPRJ_IO_1_I */
`endif /* `ifdef MPRJ_IO_1_IO */

`ifdef MPRJ_IO_0_IO
        ,.ipin_`MPRJ_IO_0_CONN ( io_in[0])
        ,.opin_`MPRJ_IO_0_CONN (io_out[0])
        ,  .oe_`MPRJ_IO_0_CONN (io_oeb[0])
`else /* `ifdef MPRJ_IO_0_IO */
`ifdef MPRJ_IO_0_I
        ,.`MPRJ_IO_0_CONN ( io_in[0])
`else /* `ifdef MPRJ_IO_0_I */
        ,.`MPRJ_IO_0_CONN (io_out[0])
`endif /* `ifdef MPRJ_IO_0_I */
`endif /* `ifdef MPRJ_IO_0_IO */
   );
   
endmodule	// user_project_wrapper

`default_nettype wire
