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
`define MPRJ_IO_23_CONN x1y10_0

`define MPRJ_IO_22_IO
`define MPRJ_IO_22_CONN x2y10_0

`define MPRJ_IO_21_IO
`define MPRJ_IO_21_CONN x2y10_1

`define MPRJ_IO_20_IO
`define MPRJ_IO_20_CONN x3y10_0

`define MPRJ_IO_19_IO
`define MPRJ_IO_19_CONN x4y10_0

`define MPRJ_IO_18_IO
`define MPRJ_IO_18_CONN x5y10_0

`define MPRJ_IO_17_IO
`define MPRJ_IO_17_CONN x6y10_0

`define MPRJ_IO_16_IO
`define MPRJ_IO_16_CONN x7y10_0

`define MPRJ_IO_15_IO
`define MPRJ_IO_15_CONN x8y10_1

`define MPRJ_IO_14_IO
`define MPRJ_IO_14_CONN x10y8_0

`define MPRJ_IO_13_IO
`define MPRJ_IO_13_CONN x10y7_1

`define MPRJ_IO_12_IO
`define MPRJ_IO_12_CONN x10y7_0

`define MPRJ_IO_11_IO
`define MPRJ_IO_11_CONN x10y6_0

`define MPRJ_IO_10_IO
`define MPRJ_IO_10_CONN x10y5_1

`define MPRJ_IO_9_IO
`define MPRJ_IO_9_CONN x10y5_0

`define MPRJ_IO_8_IO
`define MPRJ_IO_8_CONN x10y4_0

`define MPRJ_IO_7_IO
`define MPRJ_IO_7_CONN x10y3_1

`define MPRJ_IO_6_IO
`define MPRJ_IO_6_CONN x10y3_0

`define MPRJ_IO_5_IO
`define MPRJ_IO_5_CONN x10y2_1

`define MPRJ_IO_4_IO
`define MPRJ_IO_4_CONN x10y2_0

`define MPRJ_IO_3_IO
`define MPRJ_IO_3_CONN x10y1_1

`define MPRJ_IO_2_IO
`define MPRJ_IO_2_CONN x10y1_0

/*---------------------*/
/* Do not change below */
/*---------------------*/
`ifdef MPRJ_IO_37_IO
`else /* `ifdef MPRJ_IO_37_IO */
`ifdef MPRJ_IO_37_I
    assign io_out[37] = 1'b0;
    assign io_oeb[37] = 1'b1;
`else /* `ifdef MPRJ_IO_37_I */
    assign io_oeb[37] = 1'b0;
`endif /* `ifdef MPRJ_IO_37_I */
`endif /* `ifdef MPRJ_IO_37_IO */
    
`ifdef MPRJ_IO_36_IO
`else /* `ifdef MPRJ_IO_36_IO */
`ifdef MPRJ_IO_36_I
    assign io_out[36] = 1'b0;
    assign io_oeb[36] = 1'b1;
`else /* `ifdef MPRJ_IO_36_I */
    assign io_oeb[36] = 1'b0;
`endif /* `ifdef MPRJ_IO_36_I */
`endif /* `ifdef MPRJ_IO_36_IO */
    
`ifdef MPRJ_IO_35_IO
`else /* `ifdef MPRJ_IO_35_IO */
`ifdef MPRJ_IO_35_I
    assign io_out[35] = 1'b0;
    assign io_oeb[35] = 1'b1;
`else /* `ifdef MPRJ_IO_35_I */
    assign io_oeb[35] = 1'b0;
`endif /* `ifdef MPRJ_IO_35_I */
`endif /* `ifdef MPRJ_IO_35_IO */
    
`ifdef MPRJ_IO_34_IO
`else /* `ifdef MPRJ_IO_34_IO */
`ifdef MPRJ_IO_34_I
    assign io_out[34] = 1'b0;
    assign io_oeb[34] = 1'b1;
`else /* `ifdef MPRJ_IO_34_I */
    assign io_oeb[34] = 1'b0;
`endif /* `ifdef MPRJ_IO_34_I */
`endif /* `ifdef MPRJ_IO_34_IO */
    
`ifdef MPRJ_IO_33_IO
`else /* `ifdef MPRJ_IO_33_IO */
`ifdef MPRJ_IO_33_I
    assign io_out[33] = 1'b0;
    assign io_oeb[33] = 1'b1;
`else /* `ifdef MPRJ_IO_33_I */
    assign io_oeb[33] = 1'b0;
`endif /* `ifdef MPRJ_IO_33_I */
`endif /* `ifdef MPRJ_IO_33_IO */
    
`ifdef MPRJ_IO_32_IO
`else /* `ifdef MPRJ_IO_32_IO */
`ifdef MPRJ_IO_32_I
    assign io_out[32] = 1'b0;
    assign io_oeb[32] = 1'b1;
`else /* `ifdef MPRJ_IO_32_I */
    assign io_oeb[32] = 1'b0;
`endif /* `ifdef MPRJ_IO_32_I */
`endif /* `ifdef MPRJ_IO_32_IO */
    
`ifdef MPRJ_IO_31_IO
`else /* `ifdef MPRJ_IO_31_IO */
`ifdef MPRJ_IO_31_I
    assign io_out[31] = 1'b0;
    assign io_oeb[31] = 1'b1;
`else /* `ifdef MPRJ_IO_31_I */
    assign io_oeb[31] = 1'b0;
`endif /* `ifdef MPRJ_IO_31_I */
`endif /* `ifdef MPRJ_IO_31_IO */
    
`ifdef MPRJ_IO_30_IO
`else /* `ifdef MPRJ_IO_30_IO */
`ifdef MPRJ_IO_30_I
    assign io_out[30] = 1'b0;
    assign io_oeb[30] = 1'b1;
`else /* `ifdef MPRJ_IO_30_I */
    assign io_oeb[30] = 1'b0;
`endif /* `ifdef MPRJ_IO_30_I */
`endif /* `ifdef MPRJ_IO_30_IO */
    
`ifdef MPRJ_IO_29_IO
`else /* `ifdef MPRJ_IO_29_IO */
`ifdef MPRJ_IO_29_I
    assign io_out[29] = 1'b0;
    assign io_oeb[29] = 1'b1;
`else /* `ifdef MPRJ_IO_29_I */
    assign io_oeb[29] = 1'b0;
`endif /* `ifdef MPRJ_IO_29_I */
`endif /* `ifdef MPRJ_IO_29_IO */
    
`ifdef MPRJ_IO_28_IO
`else /* `ifdef MPRJ_IO_28_IO */
`ifdef MPRJ_IO_28_I
    assign io_out[28] = 1'b0;
    assign io_oeb[28] = 1'b1;
`else /* `ifdef MPRJ_IO_28_I */
    assign io_oeb[28] = 1'b0;
`endif /* `ifdef MPRJ_IO_28_I */
`endif /* `ifdef MPRJ_IO_28_IO */
    
`ifdef MPRJ_IO_27_IO
`else /* `ifdef MPRJ_IO_27_IO */
`ifdef MPRJ_IO_27_I
    assign io_out[27] = 1'b0;
    assign io_oeb[27] = 1'b1;
`else /* `ifdef MPRJ_IO_27_I */
    assign io_oeb[27] = 1'b0;
`endif /* `ifdef MPRJ_IO_27_I */
`endif /* `ifdef MPRJ_IO_27_IO */
    
`ifdef MPRJ_IO_26_IO
`else /* `ifdef MPRJ_IO_26_IO */
`ifdef MPRJ_IO_26_I
    assign io_out[26] = 1'b0;
    assign io_oeb[26] = 1'b1;
`else /* `ifdef MPRJ_IO_26_I */
    assign io_oeb[26] = 1'b0;
`endif /* `ifdef MPRJ_IO_26_I */
`endif /* `ifdef MPRJ_IO_26_IO */
    
`ifdef MPRJ_IO_25_IO
`else /* `ifdef MPRJ_IO_25_IO */
`ifdef MPRJ_IO_25_I
    assign io_out[25] = 1'b0;
    assign io_oeb[25] = 1'b1;
`else /* `ifdef MPRJ_IO_25_I */
    assign io_oeb[25] = 1'b0;
`endif /* `ifdef MPRJ_IO_25_I */
`endif /* `ifdef MPRJ_IO_25_IO */
    
`ifdef MPRJ_IO_24_IO
`else /* `ifdef MPRJ_IO_24_IO */
`ifdef MPRJ_IO_24_I
    assign io_out[24] = 1'b0;
    assign io_oeb[24] = 1'b1;
`else /* `ifdef MPRJ_IO_24_I */
    assign io_oeb[24] = 1'b0;
`endif /* `ifdef MPRJ_IO_24_I */
`endif /* `ifdef MPRJ_IO_24_IO */
    
`ifdef MPRJ_IO_23_IO
`else /* `ifdef MPRJ_IO_23_IO */
`ifdef MPRJ_IO_23_I
    assign io_out[23] = 1'b0;
    assign io_oeb[23] = 1'b1;
`else /* `ifdef MPRJ_IO_23_I */
    assign io_oeb[23] = 1'b0;
`endif /* `ifdef MPRJ_IO_23_I */
`endif /* `ifdef MPRJ_IO_23_IO */
    
`ifdef MPRJ_IO_22_IO
`else /* `ifdef MPRJ_IO_22_IO */
`ifdef MPRJ_IO_22_I
    assign io_out[22] = 1'b0;
    assign io_oeb[22] = 1'b1;
`else /* `ifdef MPRJ_IO_22_I */
    assign io_oeb[22] = 1'b0;
`endif /* `ifdef MPRJ_IO_22_I */
`endif /* `ifdef MPRJ_IO_22_IO */
    
`ifdef MPRJ_IO_21_IO
`else /* `ifdef MPRJ_IO_21_IO */
`ifdef MPRJ_IO_21_I
    assign io_out[21] = 1'b0;
    assign io_oeb[21] = 1'b1;
`else /* `ifdef MPRJ_IO_21_I */
    assign io_oeb[21] = 1'b0;
`endif /* `ifdef MPRJ_IO_21_I */
`endif /* `ifdef MPRJ_IO_21_IO */
    
`ifdef MPRJ_IO_20_IO
`else /* `ifdef MPRJ_IO_20_IO */
`ifdef MPRJ_IO_20_I
    assign io_out[20] = 1'b0;
    assign io_oeb[20] = 1'b1;
`else /* `ifdef MPRJ_IO_20_I */
    assign io_oeb[20] = 1'b0;
`endif /* `ifdef MPRJ_IO_20_I */
`endif /* `ifdef MPRJ_IO_20_IO */
    
`ifdef MPRJ_IO_19_IO
`else /* `ifdef MPRJ_IO_19_IO */
`ifdef MPRJ_IO_19_I
    assign io_out[19] = 1'b0;
    assign io_oeb[19] = 1'b1;
`else /* `ifdef MPRJ_IO_19_I */
    assign io_oeb[19] = 1'b0;
`endif /* `ifdef MPRJ_IO_19_I */
`endif /* `ifdef MPRJ_IO_19_IO */
    
`ifdef MPRJ_IO_18_IO
`else /* `ifdef MPRJ_IO_18_IO */
`ifdef MPRJ_IO_18_I
    assign io_out[18] = 1'b0;
    assign io_oeb[18] = 1'b1;
`else /* `ifdef MPRJ_IO_18_I */
    assign io_oeb[18] = 1'b0;
`endif /* `ifdef MPRJ_IO_18_I */
`endif /* `ifdef MPRJ_IO_18_IO */
    
`ifdef MPRJ_IO_17_IO
`else /* `ifdef MPRJ_IO_17_IO */
`ifdef MPRJ_IO_17_I
    assign io_out[17] = 1'b0;
    assign io_oeb[17] = 1'b1;
`else /* `ifdef MPRJ_IO_17_I */
    assign io_oeb[17] = 1'b0;
`endif /* `ifdef MPRJ_IO_17_I */
`endif /* `ifdef MPRJ_IO_17_IO */
    
`ifdef MPRJ_IO_16_IO
`else /* `ifdef MPRJ_IO_16_IO */
`ifdef MPRJ_IO_16_I
    assign io_out[16] = 1'b0;
    assign io_oeb[16] = 1'b1;
`else /* `ifdef MPRJ_IO_16_I */
    assign io_oeb[16] = 1'b0;
`endif /* `ifdef MPRJ_IO_16_I */
`endif /* `ifdef MPRJ_IO_16_IO */
    
`ifdef MPRJ_IO_15_IO
`else /* `ifdef MPRJ_IO_15_IO */
`ifdef MPRJ_IO_15_I
    assign io_out[15] = 1'b0;
    assign io_oeb[15] = 1'b1;
`else /* `ifdef MPRJ_IO_15_I */
    assign io_oeb[15] = 1'b0;
`endif /* `ifdef MPRJ_IO_15_I */
`endif /* `ifdef MPRJ_IO_15_IO */
    
`ifdef MPRJ_IO_14_IO
`else /* `ifdef MPRJ_IO_14_IO */
`ifdef MPRJ_IO_14_I
    assign io_out[14] = 1'b0;
    assign io_oeb[14] = 1'b1;
`else /* `ifdef MPRJ_IO_14_I */
    assign io_oeb[14] = 1'b0;
`endif /* `ifdef MPRJ_IO_14_I */
`endif /* `ifdef MPRJ_IO_14_IO */
    
`ifdef MPRJ_IO_13_IO
`else /* `ifdef MPRJ_IO_13_IO */
`ifdef MPRJ_IO_13_I
    assign io_out[13] = 1'b0;
    assign io_oeb[13] = 1'b1;
`else /* `ifdef MPRJ_IO_13_I */
    assign io_oeb[13] = 1'b0;
`endif /* `ifdef MPRJ_IO_13_I */
`endif /* `ifdef MPRJ_IO_13_IO */
    
`ifdef MPRJ_IO_12_IO
`else /* `ifdef MPRJ_IO_12_IO */
`ifdef MPRJ_IO_12_I
    assign io_out[12] = 1'b0;
    assign io_oeb[12] = 1'b1;
`else /* `ifdef MPRJ_IO_12_I */
    assign io_oeb[12] = 1'b0;
`endif /* `ifdef MPRJ_IO_12_I */
`endif /* `ifdef MPRJ_IO_12_IO */
    
`ifdef MPRJ_IO_11_IO
`else /* `ifdef MPRJ_IO_11_IO */
`ifdef MPRJ_IO_11_I
    assign io_out[11] = 1'b0;
    assign io_oeb[11] = 1'b1;
`else /* `ifdef MPRJ_IO_11_I */
    assign io_oeb[11] = 1'b0;
`endif /* `ifdef MPRJ_IO_11_I */
`endif /* `ifdef MPRJ_IO_11_IO */
    
`ifdef MPRJ_IO_10_IO
`else /* `ifdef MPRJ_IO_10_IO */
`ifdef MPRJ_IO_10_I
    assign io_out[10] = 1'b0;
    assign io_oeb[10] = 1'b1;
`else /* `ifdef MPRJ_IO_10_I */
    assign io_oeb[10] = 1'b0;
`endif /* `ifdef MPRJ_IO_10_I */
`endif /* `ifdef MPRJ_IO_10_IO */
    
`ifdef MPRJ_IO_9_IO
`else /* `ifdef MPRJ_IO_9_IO */
`ifdef MPRJ_IO_9_I
    assign io_out[9] = 1'b0;
    assign io_oeb[9] = 1'b1;
`else /* `ifdef MPRJ_IO_9_I */
    assign io_oeb[9] = 1'b0;
`endif /* `ifdef MPRJ_IO_9_I */
`endif /* `ifdef MPRJ_IO_9_IO */
    
`ifdef MPRJ_IO_8_IO
`else /* `ifdef MPRJ_IO_8_IO */
`ifdef MPRJ_IO_8_I
    assign io_out[8] = 1'b0;
    assign io_oeb[8] = 1'b1;
`else /* `ifdef MPRJ_IO_8_I */
    assign io_oeb[8] = 1'b0;
`endif /* `ifdef MPRJ_IO_8_I */
`endif /* `ifdef MPRJ_IO_8_IO */
    
`ifdef MPRJ_IO_7_IO
`else /* `ifdef MPRJ_IO_7_IO */
`ifdef MPRJ_IO_7_I
    assign io_out[7] = 1'b0;
    assign io_oeb[7] = 1'b1;
`else /* `ifdef MPRJ_IO_7_I */
    assign io_oeb[7] = 1'b0;
`endif /* `ifdef MPRJ_IO_7_I */
`endif /* `ifdef MPRJ_IO_7_IO */
    
`ifdef MPRJ_IO_6_IO
`else /* `ifdef MPRJ_IO_6_IO */
`ifdef MPRJ_IO_6_I
    assign io_out[6] = 1'b0;
    assign io_oeb[6] = 1'b1;
`else /* `ifdef MPRJ_IO_6_I */
    assign io_oeb[6] = 1'b0;
`endif /* `ifdef MPRJ_IO_6_I */
`endif /* `ifdef MPRJ_IO_6_IO */
    
`ifdef MPRJ_IO_5_IO
`else /* `ifdef MPRJ_IO_5_IO */
`ifdef MPRJ_IO_5_I
    assign io_out[5] = 1'b0;
    assign io_oeb[5] = 1'b1;
`else /* `ifdef MPRJ_IO_5_I */
    assign io_oeb[5] = 1'b0;
`endif /* `ifdef MPRJ_IO_5_I */
`endif /* `ifdef MPRJ_IO_5_IO */
    
`ifdef MPRJ_IO_4_IO
`else /* `ifdef MPRJ_IO_4_IO */
`ifdef MPRJ_IO_4_I
    assign io_out[4] = 1'b0;
    assign io_oeb[4] = 1'b1;
`else /* `ifdef MPRJ_IO_4_I */
    assign io_oeb[4] = 1'b0;
`endif /* `ifdef MPRJ_IO_4_I */
`endif /* `ifdef MPRJ_IO_4_IO */
    
`ifdef MPRJ_IO_3_IO
`else /* `ifdef MPRJ_IO_3_IO */
`ifdef MPRJ_IO_3_I
    assign io_out[3] = 1'b0;
    assign io_oeb[3] = 1'b1;
`else /* `ifdef MPRJ_IO_3_I */
    assign io_oeb[3] = 1'b0;
`endif /* `ifdef MPRJ_IO_3_I */
`endif /* `ifdef MPRJ_IO_3_IO */
    
`ifdef MPRJ_IO_2_IO
`else /* `ifdef MPRJ_IO_2_IO */
`ifdef MPRJ_IO_2_I
    assign io_out[2] = 1'b0;
    assign io_oeb[2] = 1'b1;
`else /* `ifdef MPRJ_IO_2_I */
    assign io_oeb[2] = 1'b0;
`endif /* `ifdef MPRJ_IO_2_I */
`endif /* `ifdef MPRJ_IO_2_IO */
    
`ifdef MPRJ_IO_1_IO
`else /* `ifdef MPRJ_IO_1_IO */
`ifdef MPRJ_IO_1_I
    assign io_out[1] = 1'b0;
    assign io_oeb[1] = 1'b1;
`else /* `ifdef MPRJ_IO_1_I */
    assign io_oeb[1] = 1'b0;
`endif /* `ifdef MPRJ_IO_1_I */
`endif /* `ifdef MPRJ_IO_1_IO */
    
`ifdef MPRJ_IO_0_IO
`else /* `ifdef MPRJ_IO_0_IO */
`ifdef MPRJ_IO_0_I
    assign io_out[0] = 1'b0;
    assign io_oeb[0] = 1'b1;
`else /* `ifdef MPRJ_IO_0_I */
    assign io_oeb[0] = 1'b0;
`endif /* `ifdef MPRJ_IO_0_I */
`endif /* `ifdef MPRJ_IO_0_IO */
   
   //~
   // FPGA instance   
`define IPIN(x) ipin_``x``
`define OPIN(x) opin_``x``
`define OEB(x)   oeb_``x``
   
   top dut (
`ifdef USE_POWER_PINS
	    .vccd1(vccd1),	// User area 1 1.8V power
	    .vssd1(vssd1),	// User area 1 digital ground
`endif

`ifdef MPRJ_IO_37_IO
         .`IPIN(`MPRJ_IO_37_CONN) ( io_in[37])
        ,.`OPIN(`MPRJ_IO_37_CONN) (io_out[37])
        , .`OEB(`MPRJ_IO_37_CONN) (io_oeb[37])
`else /* `ifdef MPRJ_IO_37_IO */
`ifdef MPRJ_IO_37_I
         .`MPRJ_IO_37_CONN ( io_in[37])
`else /* `ifdef MPRJ_IO_37_I */
         .`MPRJ_IO_37_CONN (io_out[37])
`endif /* `ifdef MPRJ_IO_37_I */
`endif /* `ifdef MPRJ_IO_37_IO */
    
`ifdef MPRJ_IO_36_IO
        ,.`IPIN(`MPRJ_IO_36_CONN) ( io_in[36])
        ,.`OPIN(`MPRJ_IO_36_CONN) (io_out[36])
        , .`OEB(`MPRJ_IO_36_CONN) (io_oeb[36])
`else /* `ifdef MPRJ_IO_36_IO */
`ifdef MPRJ_IO_36_I
        ,.`MPRJ_IO_36_CONN ( io_in[36])
`else /* `ifdef MPRJ_IO_36_I */
        ,.`MPRJ_IO_36_CONN (io_out[36])
`endif /* `ifdef MPRJ_IO_36_I */
`endif /* `ifdef MPRJ_IO_36_IO */
    
`ifdef MPRJ_IO_35_IO
        ,.`IPIN(`MPRJ_IO_35_CONN) ( io_in[35])
        ,.`OPIN(`MPRJ_IO_35_CONN) (io_out[35])
        , .`OEB(`MPRJ_IO_35_CONN) (io_oeb[35])
`else /* `ifdef MPRJ_IO_35_IO */
`ifdef MPRJ_IO_35_I
        ,.`MPRJ_IO_35_CONN ( io_in[35])
`else /* `ifdef MPRJ_IO_35_I */
        ,.`MPRJ_IO_35_CONN (io_out[35])
`endif /* `ifdef MPRJ_IO_35_I */
`endif /* `ifdef MPRJ_IO_35_IO */
    
`ifdef MPRJ_IO_34_IO
        ,.`IPIN(`MPRJ_IO_34_CONN) ( io_in[34])
        ,.`OPIN(`MPRJ_IO_34_CONN) (io_out[34])
        , .`OEB(`MPRJ_IO_34_CONN) (io_oeb[34])
`else /* `ifdef MPRJ_IO_34_IO */
`ifdef MPRJ_IO_34_I
        ,.`MPRJ_IO_34_CONN ( io_in[34])
`else /* `ifdef MPRJ_IO_34_I */
        ,.`MPRJ_IO_34_CONN (io_out[34])
`endif /* `ifdef MPRJ_IO_34_I */
`endif /* `ifdef MPRJ_IO_34_IO */
    
`ifdef MPRJ_IO_33_IO
        ,.`IPIN(`MPRJ_IO_33_CONN) ( io_in[33])
        ,.`OPIN(`MPRJ_IO_33_CONN) (io_out[33])
        , .`OEB(`MPRJ_IO_33_CONN) (io_oeb[33])
`else /* `ifdef MPRJ_IO_33_IO */
`ifdef MPRJ_IO_33_I
        ,.`MPRJ_IO_33_CONN ( io_in[33])
`else /* `ifdef MPRJ_IO_33_I */
        ,.`MPRJ_IO_33_CONN (io_out[33])
`endif /* `ifdef MPRJ_IO_33_I */
`endif /* `ifdef MPRJ_IO_33_IO */
    
`ifdef MPRJ_IO_32_IO
        ,.`IPIN(`MPRJ_IO_32_CONN) ( io_in[32])
        ,.`OPIN(`MPRJ_IO_32_CONN) (io_out[32])
        , .`OEB(`MPRJ_IO_32_CONN) (io_oeb[32])
`else /* `ifdef MPRJ_IO_32_IO */
`ifdef MPRJ_IO_32_I
        ,.`MPRJ_IO_32_CONN ( io_in[32])
`else /* `ifdef MPRJ_IO_32_I */
        ,.`MPRJ_IO_32_CONN (io_out[32])
`endif /* `ifdef MPRJ_IO_32_I */
`endif /* `ifdef MPRJ_IO_32_IO */
    
`ifdef MPRJ_IO_31_IO
        ,.`IPIN(`MPRJ_IO_31_CONN) ( io_in[31])
        ,.`OPIN(`MPRJ_IO_31_CONN) (io_out[31])
        , .`OEB(`MPRJ_IO_31_CONN) (io_oeb[31])
`else /* `ifdef MPRJ_IO_31_IO */
`ifdef MPRJ_IO_31_I
        ,.`MPRJ_IO_31_CONN ( io_in[31])
`else /* `ifdef MPRJ_IO_31_I */
        ,.`MPRJ_IO_31_CONN (io_out[31])
`endif /* `ifdef MPRJ_IO_31_I */
`endif /* `ifdef MPRJ_IO_31_IO */
    
`ifdef MPRJ_IO_30_IO
        ,.`IPIN(`MPRJ_IO_30_CONN) ( io_in[30])
        ,.`OPIN(`MPRJ_IO_30_CONN) (io_out[30])
        , .`OEB(`MPRJ_IO_30_CONN) (io_oeb[30])
`else /* `ifdef MPRJ_IO_30_IO */
`ifdef MPRJ_IO_30_I
        ,.`MPRJ_IO_30_CONN ( io_in[30])
`else /* `ifdef MPRJ_IO_30_I */
        ,.`MPRJ_IO_30_CONN (io_out[30])
`endif /* `ifdef MPRJ_IO_30_I */
`endif /* `ifdef MPRJ_IO_30_IO */
    
`ifdef MPRJ_IO_29_IO
        ,.`IPIN(`MPRJ_IO_29_CONN) ( io_in[29])
        ,.`OPIN(`MPRJ_IO_29_CONN) (io_out[29])
        , .`OEB(`MPRJ_IO_29_CONN) (io_oeb[29])
`else /* `ifdef MPRJ_IO_29_IO */
`ifdef MPRJ_IO_29_I
        ,.`MPRJ_IO_29_CONN ( io_in[29])
`else /* `ifdef MPRJ_IO_29_I */
        ,.`MPRJ_IO_29_CONN (io_out[29])
`endif /* `ifdef MPRJ_IO_29_I */
`endif /* `ifdef MPRJ_IO_29_IO */
    
`ifdef MPRJ_IO_28_IO
        ,.`IPIN(`MPRJ_IO_28_CONN) ( io_in[28])
        ,.`OPIN(`MPRJ_IO_28_CONN) (io_out[28])
        , .`OEB(`MPRJ_IO_28_CONN) (io_oeb[28])
`else /* `ifdef MPRJ_IO_28_IO */
`ifdef MPRJ_IO_28_I
        ,.`MPRJ_IO_28_CONN ( io_in[28])
`else /* `ifdef MPRJ_IO_28_I */
        ,.`MPRJ_IO_28_CONN (io_out[28])
`endif /* `ifdef MPRJ_IO_28_I */
`endif /* `ifdef MPRJ_IO_28_IO */
    
`ifdef MPRJ_IO_27_IO
        ,.`IPIN(`MPRJ_IO_27_CONN) ( io_in[27])
        ,.`OPIN(`MPRJ_IO_27_CONN) (io_out[27])
        , .`OEB(`MPRJ_IO_27_CONN) (io_oeb[27])
`else /* `ifdef MPRJ_IO_27_IO */
`ifdef MPRJ_IO_27_I
        ,.`MPRJ_IO_27_CONN ( io_in[27])
`else /* `ifdef MPRJ_IO_27_I */
        ,.`MPRJ_IO_27_CONN (io_out[27])
`endif /* `ifdef MPRJ_IO_27_I */
`endif /* `ifdef MPRJ_IO_27_IO */
    
`ifdef MPRJ_IO_26_IO
        ,.`IPIN(`MPRJ_IO_26_CONN) ( io_in[26])
        ,.`OPIN(`MPRJ_IO_26_CONN) (io_out[26])
        , .`OEB(`MPRJ_IO_26_CONN) (io_oeb[26])
`else /* `ifdef MPRJ_IO_26_IO */
`ifdef MPRJ_IO_26_I
        ,.`MPRJ_IO_26_CONN ( io_in[26])
`else /* `ifdef MPRJ_IO_26_I */
        ,.`MPRJ_IO_26_CONN (io_out[26])
`endif /* `ifdef MPRJ_IO_26_I */
`endif /* `ifdef MPRJ_IO_26_IO */
    
`ifdef MPRJ_IO_25_IO
        ,.`IPIN(`MPRJ_IO_25_CONN) ( io_in[25])
        ,.`OPIN(`MPRJ_IO_25_CONN) (io_out[25])
        , .`OEB(`MPRJ_IO_25_CONN) (io_oeb[25])
`else /* `ifdef MPRJ_IO_25_IO */
`ifdef MPRJ_IO_25_I
        ,.`MPRJ_IO_25_CONN ( io_in[25])
`else /* `ifdef MPRJ_IO_25_I */
        ,.`MPRJ_IO_25_CONN (io_out[25])
`endif /* `ifdef MPRJ_IO_25_I */
`endif /* `ifdef MPRJ_IO_25_IO */
    
`ifdef MPRJ_IO_24_IO
        ,.`IPIN(`MPRJ_IO_24_CONN) ( io_in[24])
        ,.`OPIN(`MPRJ_IO_24_CONN) (io_out[24])
        , .`OEB(`MPRJ_IO_24_CONN) (io_oeb[24])
`else /* `ifdef MPRJ_IO_24_IO */
`ifdef MPRJ_IO_24_I
        ,.`MPRJ_IO_24_CONN ( io_in[24])
`else /* `ifdef MPRJ_IO_24_I */
        ,.`MPRJ_IO_24_CONN (io_out[24])
`endif /* `ifdef MPRJ_IO_24_I */
`endif /* `ifdef MPRJ_IO_24_IO */
    
`ifdef MPRJ_IO_23_IO
        ,.`IPIN(`MPRJ_IO_23_CONN) ( io_in[23])
        ,.`OPIN(`MPRJ_IO_23_CONN) (io_out[23])
        , .`OEB(`MPRJ_IO_23_CONN) (io_oeb[23])
`else /* `ifdef MPRJ_IO_23_IO */
`ifdef MPRJ_IO_23_I
        ,.`MPRJ_IO_23_CONN ( io_in[23])
`else /* `ifdef MPRJ_IO_23_I */
        ,.`MPRJ_IO_23_CONN (io_out[23])
`endif /* `ifdef MPRJ_IO_23_I */
`endif /* `ifdef MPRJ_IO_23_IO */
    
`ifdef MPRJ_IO_22_IO
        ,.`IPIN(`MPRJ_IO_22_CONN) ( io_in[22])
        ,.`OPIN(`MPRJ_IO_22_CONN) (io_out[22])
        , .`OEB(`MPRJ_IO_22_CONN) (io_oeb[22])
`else /* `ifdef MPRJ_IO_22_IO */
`ifdef MPRJ_IO_22_I
        ,.`MPRJ_IO_22_CONN ( io_in[22])
`else /* `ifdef MPRJ_IO_22_I */
        ,.`MPRJ_IO_22_CONN (io_out[22])
`endif /* `ifdef MPRJ_IO_22_I */
`endif /* `ifdef MPRJ_IO_22_IO */
    
`ifdef MPRJ_IO_21_IO
        ,.`IPIN(`MPRJ_IO_21_CONN) ( io_in[21])
        ,.`OPIN(`MPRJ_IO_21_CONN) (io_out[21])
        , .`OEB(`MPRJ_IO_21_CONN) (io_oeb[21])
`else /* `ifdef MPRJ_IO_21_IO */
`ifdef MPRJ_IO_21_I
        ,.`MPRJ_IO_21_CONN ( io_in[21])
`else /* `ifdef MPRJ_IO_21_I */
        ,.`MPRJ_IO_21_CONN (io_out[21])
`endif /* `ifdef MPRJ_IO_21_I */
`endif /* `ifdef MPRJ_IO_21_IO */
    
`ifdef MPRJ_IO_20_IO
        ,.`IPIN(`MPRJ_IO_20_CONN) ( io_in[20])
        ,.`OPIN(`MPRJ_IO_20_CONN) (io_out[20])
        , .`OEB(`MPRJ_IO_20_CONN) (io_oeb[20])
`else /* `ifdef MPRJ_IO_20_IO */
`ifdef MPRJ_IO_20_I
        ,.`MPRJ_IO_20_CONN ( io_in[20])
`else /* `ifdef MPRJ_IO_20_I */
        ,.`MPRJ_IO_20_CONN (io_out[20])
`endif /* `ifdef MPRJ_IO_20_I */
`endif /* `ifdef MPRJ_IO_20_IO */
    
`ifdef MPRJ_IO_19_IO
        ,.`IPIN(`MPRJ_IO_19_CONN) ( io_in[19])
        ,.`OPIN(`MPRJ_IO_19_CONN) (io_out[19])
        , .`OEB(`MPRJ_IO_19_CONN) (io_oeb[19])
`else /* `ifdef MPRJ_IO_19_IO */
`ifdef MPRJ_IO_19_I
        ,.`MPRJ_IO_19_CONN ( io_in[19])
`else /* `ifdef MPRJ_IO_19_I */
        ,.`MPRJ_IO_19_CONN (io_out[19])
`endif /* `ifdef MPRJ_IO_19_I */
`endif /* `ifdef MPRJ_IO_19_IO */
    
`ifdef MPRJ_IO_18_IO
        ,.`IPIN(`MPRJ_IO_18_CONN) ( io_in[18])
        ,.`OPIN(`MPRJ_IO_18_CONN) (io_out[18])
        , .`OEB(`MPRJ_IO_18_CONN) (io_oeb[18])
`else /* `ifdef MPRJ_IO_18_IO */
`ifdef MPRJ_IO_18_I
        ,.`MPRJ_IO_18_CONN ( io_in[18])
`else /* `ifdef MPRJ_IO_18_I */
        ,.`MPRJ_IO_18_CONN (io_out[18])
`endif /* `ifdef MPRJ_IO_18_I */
`endif /* `ifdef MPRJ_IO_18_IO */
    
`ifdef MPRJ_IO_17_IO
        ,.`IPIN(`MPRJ_IO_17_CONN) ( io_in[17])
        ,.`OPIN(`MPRJ_IO_17_CONN) (io_out[17])
        , .`OEB(`MPRJ_IO_17_CONN) (io_oeb[17])
`else /* `ifdef MPRJ_IO_17_IO */
`ifdef MPRJ_IO_17_I
        ,.`MPRJ_IO_17_CONN ( io_in[17])
`else /* `ifdef MPRJ_IO_17_I */
        ,.`MPRJ_IO_17_CONN (io_out[17])
`endif /* `ifdef MPRJ_IO_17_I */
`endif /* `ifdef MPRJ_IO_17_IO */
    
`ifdef MPRJ_IO_16_IO
        ,.`IPIN(`MPRJ_IO_16_CONN) ( io_in[16])
        ,.`OPIN(`MPRJ_IO_16_CONN) (io_out[16])
        , .`OEB(`MPRJ_IO_16_CONN) (io_oeb[16])
`else /* `ifdef MPRJ_IO_16_IO */
`ifdef MPRJ_IO_16_I
        ,.`MPRJ_IO_16_CONN ( io_in[16])
`else /* `ifdef MPRJ_IO_16_I */
        ,.`MPRJ_IO_16_CONN (io_out[16])
`endif /* `ifdef MPRJ_IO_16_I */
`endif /* `ifdef MPRJ_IO_16_IO */
    
`ifdef MPRJ_IO_15_IO
        ,.`IPIN(`MPRJ_IO_15_CONN) ( io_in[15])
        ,.`OPIN(`MPRJ_IO_15_CONN) (io_out[15])
        , .`OEB(`MPRJ_IO_15_CONN) (io_oeb[15])
`else /* `ifdef MPRJ_IO_15_IO */
`ifdef MPRJ_IO_15_I
        ,.`MPRJ_IO_15_CONN ( io_in[15])
`else /* `ifdef MPRJ_IO_15_I */
        ,.`MPRJ_IO_15_CONN (io_out[15])
`endif /* `ifdef MPRJ_IO_15_I */
`endif /* `ifdef MPRJ_IO_15_IO */
    
`ifdef MPRJ_IO_14_IO
        ,.`IPIN(`MPRJ_IO_14_CONN) ( io_in[14])
        ,.`OPIN(`MPRJ_IO_14_CONN) (io_out[14])
        , .`OEB(`MPRJ_IO_14_CONN) (io_oeb[14])
`else /* `ifdef MPRJ_IO_14_IO */
`ifdef MPRJ_IO_14_I
        ,.`MPRJ_IO_14_CONN ( io_in[14])
`else /* `ifdef MPRJ_IO_14_I */
        ,.`MPRJ_IO_14_CONN (io_out[14])
`endif /* `ifdef MPRJ_IO_14_I */
`endif /* `ifdef MPRJ_IO_14_IO */
    
`ifdef MPRJ_IO_13_IO
        ,.`IPIN(`MPRJ_IO_13_CONN) ( io_in[13])
        ,.`OPIN(`MPRJ_IO_13_CONN) (io_out[13])
        , .`OEB(`MPRJ_IO_13_CONN) (io_oeb[13])
`else /* `ifdef MPRJ_IO_13_IO */
`ifdef MPRJ_IO_13_I
        ,.`MPRJ_IO_13_CONN ( io_in[13])
`else /* `ifdef MPRJ_IO_13_I */
        ,.`MPRJ_IO_13_CONN (io_out[13])
`endif /* `ifdef MPRJ_IO_13_I */
`endif /* `ifdef MPRJ_IO_13_IO */
    
`ifdef MPRJ_IO_12_IO
        ,.`IPIN(`MPRJ_IO_12_CONN) ( io_in[12])
        ,.`OPIN(`MPRJ_IO_12_CONN) (io_out[12])
        , .`OEB(`MPRJ_IO_12_CONN) (io_oeb[12])
`else /* `ifdef MPRJ_IO_12_IO */
`ifdef MPRJ_IO_12_I
        ,.`MPRJ_IO_12_CONN ( io_in[12])
`else /* `ifdef MPRJ_IO_12_I */
        ,.`MPRJ_IO_12_CONN (io_out[12])
`endif /* `ifdef MPRJ_IO_12_I */
`endif /* `ifdef MPRJ_IO_12_IO */
    
`ifdef MPRJ_IO_11_IO
        ,.`IPIN(`MPRJ_IO_11_CONN) ( io_in[11])
        ,.`OPIN(`MPRJ_IO_11_CONN) (io_out[11])
        , .`OEB(`MPRJ_IO_11_CONN) (io_oeb[11])
`else /* `ifdef MPRJ_IO_11_IO */
`ifdef MPRJ_IO_11_I
        ,.`MPRJ_IO_11_CONN ( io_in[11])
`else /* `ifdef MPRJ_IO_11_I */
        ,.`MPRJ_IO_11_CONN (io_out[11])
`endif /* `ifdef MPRJ_IO_11_I */
`endif /* `ifdef MPRJ_IO_11_IO */
    
`ifdef MPRJ_IO_10_IO
        ,.`IPIN(`MPRJ_IO_10_CONN) ( io_in[10])
        ,.`OPIN(`MPRJ_IO_10_CONN) (io_out[10])
        , .`OEB(`MPRJ_IO_10_CONN) (io_oeb[10])
`else /* `ifdef MPRJ_IO_10_IO */
`ifdef MPRJ_IO_10_I
        ,.`MPRJ_IO_10_CONN ( io_in[10])
`else /* `ifdef MPRJ_IO_10_I */
        ,.`MPRJ_IO_10_CONN (io_out[10])
`endif /* `ifdef MPRJ_IO_10_I */
`endif /* `ifdef MPRJ_IO_10_IO */
    
`ifdef MPRJ_IO_9_IO
        ,.`IPIN(`MPRJ_IO_9_CONN) ( io_in[9])
        ,.`OPIN(`MPRJ_IO_9_CONN) (io_out[9])
        , .`OEB(`MPRJ_IO_9_CONN) (io_oeb[9])
`else /* `ifdef MPRJ_IO_9_IO */
`ifdef MPRJ_IO_9_I
        ,.`MPRJ_IO_9_CONN ( io_in[9])
`else /* `ifdef MPRJ_IO_9_I */
        ,.`MPRJ_IO_9_CONN (io_out[9])
`endif /* `ifdef MPRJ_IO_9_I */
`endif /* `ifdef MPRJ_IO_9_IO */
    
`ifdef MPRJ_IO_8_IO
        ,.`IPIN(`MPRJ_IO_8_CONN) ( io_in[8])
        ,.`OPIN(`MPRJ_IO_8_CONN) (io_out[8])
        , .`OEB(`MPRJ_IO_8_CONN) (io_oeb[8])
`else /* `ifdef MPRJ_IO_8_IO */
`ifdef MPRJ_IO_8_I
        ,.`MPRJ_IO_8_CONN ( io_in[8])
`else /* `ifdef MPRJ_IO_8_I */
        ,.`MPRJ_IO_8_CONN (io_out[8])
`endif /* `ifdef MPRJ_IO_8_I */
`endif /* `ifdef MPRJ_IO_8_IO */
    
`ifdef MPRJ_IO_7_IO
        ,.`IPIN(`MPRJ_IO_7_CONN) ( io_in[7])
        ,.`OPIN(`MPRJ_IO_7_CONN) (io_out[7])
        , .`OEB(`MPRJ_IO_7_CONN) (io_oeb[7])
`else /* `ifdef MPRJ_IO_7_IO */
`ifdef MPRJ_IO_7_I
        ,.`MPRJ_IO_7_CONN ( io_in[7])
`else /* `ifdef MPRJ_IO_7_I */
        ,.`MPRJ_IO_7_CONN (io_out[7])
`endif /* `ifdef MPRJ_IO_7_I */
`endif /* `ifdef MPRJ_IO_7_IO */
    
`ifdef MPRJ_IO_6_IO
        ,.`IPIN(`MPRJ_IO_6_CONN) ( io_in[6])
        ,.`OPIN(`MPRJ_IO_6_CONN) (io_out[6])
        , .`OEB(`MPRJ_IO_6_CONN) (io_oeb[6])
`else /* `ifdef MPRJ_IO_6_IO */
`ifdef MPRJ_IO_6_I
        ,.`MPRJ_IO_6_CONN ( io_in[6])
`else /* `ifdef MPRJ_IO_6_I */
        ,.`MPRJ_IO_6_CONN (io_out[6])
`endif /* `ifdef MPRJ_IO_6_I */
`endif /* `ifdef MPRJ_IO_6_IO */
    
`ifdef MPRJ_IO_5_IO
        ,.`IPIN(`MPRJ_IO_5_CONN) ( io_in[5])
        ,.`OPIN(`MPRJ_IO_5_CONN) (io_out[5])
        , .`OEB(`MPRJ_IO_5_CONN) (io_oeb[5])
`else /* `ifdef MPRJ_IO_5_IO */
`ifdef MPRJ_IO_5_I
        ,.`MPRJ_IO_5_CONN ( io_in[5])
`else /* `ifdef MPRJ_IO_5_I */
        ,.`MPRJ_IO_5_CONN (io_out[5])
`endif /* `ifdef MPRJ_IO_5_I */
`endif /* `ifdef MPRJ_IO_5_IO */
    
`ifdef MPRJ_IO_4_IO
        ,.`IPIN(`MPRJ_IO_4_CONN) ( io_in[4])
        ,.`OPIN(`MPRJ_IO_4_CONN) (io_out[4])
        , .`OEB(`MPRJ_IO_4_CONN) (io_oeb[4])
`else /* `ifdef MPRJ_IO_4_IO */
`ifdef MPRJ_IO_4_I
        ,.`MPRJ_IO_4_CONN ( io_in[4])
`else /* `ifdef MPRJ_IO_4_I */
        ,.`MPRJ_IO_4_CONN (io_out[4])
`endif /* `ifdef MPRJ_IO_4_I */
`endif /* `ifdef MPRJ_IO_4_IO */
    
`ifdef MPRJ_IO_3_IO
        ,.`IPIN(`MPRJ_IO_3_CONN) ( io_in[3])
        ,.`OPIN(`MPRJ_IO_3_CONN) (io_out[3])
        , .`OEB(`MPRJ_IO_3_CONN) (io_oeb[3])
`else /* `ifdef MPRJ_IO_3_IO */
`ifdef MPRJ_IO_3_I
        ,.`MPRJ_IO_3_CONN ( io_in[3])
`else /* `ifdef MPRJ_IO_3_I */
        ,.`MPRJ_IO_3_CONN (io_out[3])
`endif /* `ifdef MPRJ_IO_3_I */
`endif /* `ifdef MPRJ_IO_3_IO */
    
`ifdef MPRJ_IO_2_IO
        ,.`IPIN(`MPRJ_IO_2_CONN) ( io_in[2])
        ,.`OPIN(`MPRJ_IO_2_CONN) (io_out[2])
        , .`OEB(`MPRJ_IO_2_CONN) (io_oeb[2])
`else /* `ifdef MPRJ_IO_2_IO */
`ifdef MPRJ_IO_2_I
        ,.`MPRJ_IO_2_CONN ( io_in[2])
`else /* `ifdef MPRJ_IO_2_I */
        ,.`MPRJ_IO_2_CONN (io_out[2])
`endif /* `ifdef MPRJ_IO_2_I */
`endif /* `ifdef MPRJ_IO_2_IO */
    
`ifdef MPRJ_IO_1_IO
        ,.`IPIN(`MPRJ_IO_1_CONN) ( io_in[1])
        ,.`OPIN(`MPRJ_IO_1_CONN) (io_out[1])
        , .`OEB(`MPRJ_IO_1_CONN) (io_oeb[1])
`else /* `ifdef MPRJ_IO_1_IO */
`ifdef MPRJ_IO_1_I
        ,.`MPRJ_IO_1_CONN ( io_in[1])
`else /* `ifdef MPRJ_IO_1_I */
        ,.`MPRJ_IO_1_CONN (io_out[1])
`endif /* `ifdef MPRJ_IO_1_I */
`endif /* `ifdef MPRJ_IO_1_IO */
    
`ifdef MPRJ_IO_0_IO
        ,.`IPIN(`MPRJ_IO_0_CONN) ( io_in[0])
        ,.`OPIN(`MPRJ_IO_0_CONN) (io_out[0])
        , .`OEB(`MPRJ_IO_0_CONN) (io_oeb[0])
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
