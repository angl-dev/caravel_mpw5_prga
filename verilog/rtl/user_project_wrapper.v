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

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

   // GPIO PINS
   localparam  PIN_PROG_DIN     = 37;
   localparam  PIN_PROG_DONE    = 36;
   localparam  PIN_PROG_RST     = 35;
   localparam  PIN_PROG_WE      = 34;
   localparam  PIN_33           = 33;
   localparam  PIN_32           = 32;
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
   wire [0:0]                   prog_clk, prog_rst, prog_done, prog_we, prog_din, prog_dout, prog_we_o, not_used;
   wire [0:0]                   clk;
   
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
   assign not_used = io_in[PIN_PROG_DOUT];
   assign io_oeb[PIN_PROG_DOUT] = 1'b1;
   assign io_out[PIN_PROG_DOUT] = prog_dout;
   //prog_dout
   assign not_used = io_in[PIN_PROG_WE_O];
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
            .prog_clk(prog_clk)//
            ,.prog_rst(prog_rst)//
            ,.prog_done(prog_done)//
            ,.prog_we(prog_we)//
            ,.prog_we_o(prog_we_o)//
            ,.prog_din(prog_din)//
            ,.prog_dout(prog_dout)//
            // PIN_CLK;
            ,.ipin_x0y1_0(clk)
            ,.opin_x0y1_0()
            ,  .oe_x0y1_0()
            // PIN_33
            ,.ipin_x0y1_1( io_in[PIN_33])
            ,.opin_x0y1_1(io_out[PIN_33])
            ,  .oe_x0y1_1(io_oeb[PIN_33])
            // PIN_32
            ,.ipin_x0y2_0( io_in[PIN_32])
            ,.opin_x0y2_0(io_out[PIN_32])
            ,  .oe_x0y2_0(io_oeb[PIN_32])
            // PIN_31
            ,.ipin_x0y2_1( io_in[PIN_31])
            ,.opin_x0y2_1(io_out[PIN_31])
            ,  .oe_x0y2_1(io_oeb[PIN_31])
            // PIN_30
            ,.ipin_x0y3_0( io_in[PIN_30])
            ,.opin_x0y3_0(io_out[PIN_30])
            ,  .oe_x0y3_0(io_oeb[PIN_30])
            // PIN_29
            ,.ipin_x0y4_0( io_in[PIN_29])
            ,.opin_x0y4_0(io_out[PIN_29])
            ,  .oe_x0y4_0(io_oeb[PIN_29])
            // PIN_28
            ,.ipin_x0y5_0( io_in[PIN_28])
            ,.opin_x0y5_0(io_out[PIN_28])
            ,  .oe_x0y5_0(io_oeb[PIN_28])
            // PIN_27
            ,.ipin_x0y6_0( io_in[PIN_27])
            ,.opin_x0y6_0(io_out[PIN_27])
            ,  .oe_x0y6_0(io_oeb[PIN_27])
            // PIN_26
            ,.ipin_x0y6_1( io_in[PIN_26])
            ,.opin_x0y6_1(io_out[PIN_26])
            ,  .oe_x0y6_1(io_oeb[PIN_26])
            // PIN_25
            ,.ipin_x0y7_0( io_in[PIN_25])
            ,.opin_x0y7_0(io_out[PIN_25])
            ,  .oe_x0y7_0(io_oeb[PIN_25])
            // PIN_24
            ,.ipin_x0y8_0( io_in[PIN_24])
            ,.opin_x0y8_0(io_out[PIN_24])
            ,  .oe_x0y8_0(io_oeb[PIN_24])
            // PIN_23
            ,.ipin_x1y9_0( io_in[PIN_23])
            ,.opin_x1y9_0(io_out[PIN_23])
            ,  .oe_x1y9_0(io_oeb[PIN_23])
            // PIN_22
            ,.ipin_x2y9_0( io_in[PIN_22])
            ,.opin_x2y9_0(io_out[PIN_22])
            ,  .oe_x2y9_0(io_oeb[PIN_22])
            // PIN_21
            ,.ipin_x2y9_1( io_in[PIN_21])
            ,.opin_x2y9_1(io_out[PIN_21])
            ,  .oe_x2y9_1(io_oeb[PIN_21])
            // PIN_20
            ,.ipin_x3y9_0( io_in[PIN_20])
            ,.opin_x3y9_0(io_out[PIN_20])
            ,  .oe_x3y9_0(io_oeb[PIN_20])
            // PIN_19
            ,.ipin_x4y9_0( io_in[PIN_19])
            ,.opin_x4y9_0(io_out[PIN_19])
            ,  .oe_x4y9_0(io_oeb[PIN_19])
            // PIN_18
            ,.ipin_x5y9_0( io_in[PIN_18])
            ,.opin_x5y9_0(io_out[PIN_18])
            ,  .oe_x5y9_0(io_oeb[PIN_18])
            // PIN_17
            ,.ipin_x6y9_0( io_in[PIN_17])
            ,.opin_x6y9_0(io_out[PIN_17])
            ,  .oe_x6y9_0(io_oeb[PIN_17])
            // PIN_16
            ,.ipin_x7y9_0( io_in[PIN_16])
            ,.opin_x7y9_0(io_out[PIN_16])
            ,  .oe_x7y9_0(io_oeb[PIN_16])
            // PIN_15
            ,.ipin_x7y9_1( io_in[PIN_15])
            ,.opin_x7y9_1(io_out[PIN_15])
            ,  .oe_x7y9_1(io_oeb[PIN_15])
            // PIN_14
            ,.ipin_x8y9_1( io_in[PIN_14])
            ,.opin_x8y9_1(io_out[PIN_14])
            ,  .oe_x8y9_1(io_oeb[PIN_14])
            // PIN_13
            ,.ipin_x9y8_0( io_in[PIN_13])
            ,.opin_x9y8_0(io_out[PIN_13])
            ,  .oe_x9y8_0(io_oeb[PIN_13])
            // PIN_12
            ,.ipin_x9y7_1( io_in[PIN_12])
            ,.opin_x9y7_1(io_out[PIN_12])
            ,  .oe_x9y7_1(io_oeb[PIN_12])
            // PIN_11
            ,.ipin_x9y7_0( io_in[PIN_11])
            ,.opin_x9y7_0(io_out[PIN_11])
            ,  .oe_x9y7_0(io_oeb[PIN_11])
            // PIN_10
            ,.ipin_x9y6_0( io_in[PIN_10])
            ,.opin_x9y6_0(io_out[PIN_10])
            ,  .oe_x9y6_0(io_oeb[PIN_10])
            // PIN_9
            ,.ipin_x9y5_1( io_in[PIN_9])
            ,.opin_x9y5_1(io_out[PIN_9])
            ,  .oe_x9y5_1(io_oeb[PIN_9])
            // PIN_8
            ,.ipin_x9y5_0( io_in[PIN_8])
            ,.opin_x9y5_0(io_out[PIN_8])
            ,  .oe_x9y5_0(io_oeb[PIN_8])
            // PIN_7
            ,.ipin_x9y4_0( io_in[PIN_7])
            ,.opin_x9y4_0(io_out[PIN_7])
            ,  .oe_x9y4_0(io_oeb[PIN_7])
            // PIN_6
            ,.ipin_x9y3_0( io_in[PIN_6])
            ,.opin_x9y3_0(io_out[PIN_6])
            ,  .oe_x9y3_0(io_oeb[PIN_6])
            // PIN_5
            ,.ipin_x9y2_1( io_in[PIN_5])
            ,.opin_x9y2_1(io_out[PIN_5])
            ,  .oe_x9y2_1(io_oeb[PIN_5])
            // PIN_4
            ,.ipin_x9y2_0( io_in[PIN_4])
            ,.opin_x9y2_0(io_out[PIN_4])
            ,  .oe_x9y2_0(io_oeb[PIN_4])
            // PIN_3
            ,.ipin_x9y1_0( io_in[PIN_3])
            ,.opin_x9y1_0(io_out[PIN_3])
            ,  .oe_x9y1_0(io_oeb[PIN_3])
            );
   
endmodule	// user_project_wrapper

`default_nettype wire
