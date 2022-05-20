// SPDX-FileCopyrightText: 2020 Efabless Corporation
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

`default_nettype none

`timescale 1 ns / 1 ps

module prga_tb;
	reg clock;
	reg RSTB;
	reg CSB;
	reg power1, power2;
	reg power3, power4;

	wire gpio;
	wire [37:0] mprj_io;

	assign mprj_io[3] = (CSB == 1'b1) ? 1'b1 : 1'bz;

	// External clock is used by default.  Make this artificially fast for the
	// simulation.  Normally this would be a slow clock and the digital PLL
	// would be the fast clock.

	always #12.5 clock <= (clock === 1'b0);

	initial begin
		clock = 0;
	end

	initial begin
		$dumpfile("prga.vcd");
		$dumpvars(0, prga_tb);

		// Repeat cycles of 1000 clock edges as needed to complete testbench
		repeat (100) begin
			repeat (1000) @(posedge clock);
			// $display("+1000 cycles");
		end

		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Timeout, Test Mega-Project IO Ports (GL) Failed");
		`else
			$display ("Monitor: Timeout, Test Mega-Project IO Ports (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end

	initial begin
		RSTB = 1'b0;
		CSB  = 1'b1;		// Force CSB high
		#2000;
		RSTB = 1'b1;	    	// Release reset
		#300000;
		CSB = 1'b0;		// CSB can be released
	end

	initial begin		// Power-up sequence
		power1 = 1'b0;
		power2 = 1'b0;
		power3 = 1'b0;
		power4 = 1'b0;
		#100;
		power1 = 1'b1;
		#100;
		power2 = 1'b1;
		#100;
		power3 = 1'b1;
		#100;
		power4 = 1'b1;
	end

	wire flash_csb;
	wire flash_clk;
	wire flash_io0;
	wire flash_io1;

	wire VDD3V3;
	wire VDD1V8;
	wire VSS;
	
	assign VDD3V3 = power1;
	assign VDD1V8 = power2;
	assign VSS = 1'b0;

	caravel uut (
		.vddio	  (VDD3V3),
		.vddio_2  (VDD3V3),
		.vssio	  (VSS),
		.vssio_2  (VSS),
		.vdda	  (VDD3V3),
		.vssa	  (VSS),
		.vccd	  (VDD1V8),
		.vssd	  (VSS),
		.vdda1    (VDD3V3),
		.vdda1_2  (VDD3V3),
		.vdda2    (VDD3V3),
		.vssa1	  (VSS),
		.vssa1_2  (VSS),
		.vssa2	  (VSS),
		.vccd1	  (VDD1V8),
		.vccd2	  (VDD1V8),
		.vssd1	  (VSS),
		.vssd2	  (VSS),
		.clock    (clock),
		.gpio     (gpio),
		.mprj_io  (mprj_io),
		.flash_csb(flash_csb),
		.flash_clk(flash_clk),
		.flash_io0(flash_io0),
		.flash_io1(flash_io1),
		.resetb	  (RSTB)
	);

	spiflash #(
		.FILENAME("prga.hex")
	) spiflash (
		.csb(flash_csb),
		.clk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1),
		.io2(),			// not used
		.io3()			// not used
	);

    // -----------------------------------------------------------------------
    // -- PRGA Testing -------------------------------------------------------
    // -----------------------------------------------------------------------
    wire f_tb_rst;
    assign f_tb_rst = CSB || !gpio;

    wire w_tb_pass, w_tb_fail, w_tb_prog_done;
    assign w_tb_prog_done = 1'b1;

    // Logging
    wire [31:0] f_tb_verbosity;
    reg [31:0] f_tb_cycle_cnt;

    assign f_tb_verbosity = 1;

    always @(posedge clock) begin
        if (f_tb_rst) begin
            f_tb_cycle_cnt <= 0;
        end else begin
            f_tb_cycle_cnt <= f_tb_cycle_cnt + 1;

            if (w_tb_fail) begin
                $display();
                $display("[INFO] ++=========================++");
                $display("[INFO] ||       TEST FAILED       ||");
                $display("[INFO] ++=========================++");
                $display();
                $finish;
            end else if (w_tb_pass) begin
                $display();
                $display("[INFO] ++=========================++");
                $display("[INFO] ||       TEST PASSED       ||");
                $display("[INFO] ++=========================++");
                $display();
                $finish;
            end
        end
    end

    // -- Test ---------------------------------------------------------------
    // Signals
    wire w_test_clk;
    wire w_test_reset;
    wire w_test_start;
    wire [3:0] w_test_bcd1;
    wire [3:0] w_test_bcd0;
    wire w_test_ready;
    wire w_test_done_tick;
    wire [6:0] w_test_bin;

    // Tester
    basic i_tester (
        .tb_clk(clock)
        ,.tb_rst(f_tb_rst)
        ,.tb_pass(w_tb_pass)
        ,.tb_fail(w_tb_fail)
        ,.tb_prog_done(w_tb_prog_done)
        ,.tb_verbosity(f_tb_verbosity)
        ,.tb_cycle_cnt(f_tb_cycle_cnt)
        ,.clk(w_test_clk)
        ,.reset(w_test_reset)
        ,.start(w_test_start)
        ,.bcd1(w_test_bcd1)
        ,.bcd0(w_test_bcd0)
        ,.ready(w_test_ready)
        ,.done_tick(w_test_done_tick)
        ,.bin(w_test_bin)
        );

    // -- Behavioral Model ---------------------------------------------------
    // Signals
    wire w_behav_ready;
    wire w_behav_done_tick;
    wire [6:0] w_behav_bin;

    // DUT
    bcd2bin i_behav (
        .clk(w_test_clk)
        ,.reset(w_test_reset)
        ,.start(w_test_start)
        ,.bcd1(w_test_bcd1)
        ,.bcd0(w_test_bcd0)
        ,.ready(w_behav_ready)
        ,.done_tick(w_behav_done_tick)
        ,.bin(w_behav_bin)
        );

    // -- Bitstream Loading --------------------------------------------------

    // -----------------------------------------------------------------------
    // -- Wiring -------------------------------------------------------------
    // -----------------------------------------------------------------------
    assign w_test_ready = w_behav_ready;
    assign w_test_done_tick = w_behav_done_tick;
    assign w_test_bin = w_behav_bin;

endmodule
`default_nettype wire
