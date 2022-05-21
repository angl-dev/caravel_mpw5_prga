module prga_bitstream_loader (
    input wire tb_clk
    , input wire tb_rst
    , input wire [31:0] tb_cycle_cnt
    , output reg tb_prog_done

    , output wire prog_clk
    , output wire prog_rst
    , output wire prog_done
    , output reg prog_we
    , output reg prog_din
    , input wire prog_dout
    , input wire prog_we_o
    );

    // Bitstream stuff
    localparam  BS_NUM_QWORDS       = 422,
                BS_WORD_SIZE        = 1;

    // Programming protocol
    localparam  INIT            = 3'd0,
                RESET           = 3'd1,
                PROG_WAIT       = 3'd2,
                PROGRAMMING     = 3'd3,
                PROG_STABLIZING = 3'd4,
                PROG_DONE       = 3'd5;

    reg [2:0]                   state;
    reg [31:0]                  wait_cnt;
    reg [63:0]                  bs_data [0:BS_NUM_QWORDS];

    reg                         prog_we_prev, prog_we_o_prev;
    reg [63:0]                  prog_progress;
    reg [31:0]                  prog_fragments;

    // Load bitstream
    initial begin
        tb_prog_done = 1'b0;

        state = INIT;
        wait_cnt = 0;
        prog_we = 1'b0;
        prog_we_prev = 1'b0;
        prog_we_o_prev = 1'b0;
        prog_din = {BS_WORD_SIZE {1'b0} };
        prog_progress = 64'b0;
        prog_fragments = 32'b0;

        $display("[INFO] Bitstream: %s", "bitgen.out");

        $readmemh("bitgen.out", bs_data);
        bs_data[BS_NUM_QWORDS] = 64'b0;
    end

    // Programming FSM
    always @(posedge tb_clk) begin
        if (tb_rst) begin
            state <= RESET;
            prog_progress <= 64'b0;
            wait_cnt <= 0;
            prog_we <= 1'b0;
        end else begin
            case (state)
                RESET: begin
                    state <= PROG_WAIT;
                end
                PROG_WAIT: begin
                    if (wait_cnt == 100) begin
                        state <= PROGRAMMING;
                    end else begin
                        wait_cnt <= wait_cnt + 1;
                    end
                end
                PROGRAMMING: begin
                    if (prog_we) begin
                        if (prog_progress + BS_WORD_SIZE >= BS_NUM_QWORDS * 64) begin
                            $display("[INFO] [Cycle %04d] Bitstream writing completed", tb_cycle_cnt);
                            prog_we <= 1'b0;
                            state <= PROG_STABLIZING;
                        end else begin
                            prog_we <= {$random} % 100 > 2 ? 1'b1 : 1'b0;   // 2% chance to turn off prog_we
                            prog_progress <= prog_progress + BS_WORD_SIZE;
                        end
                    end else begin
                        prog_we <= {$random} % 100 > 2 ? 1'b1 : 1'b0;   // 2% chance to turn off prog_we
                    end
                end
                PROG_STABLIZING: begin
                    if (prog_fragments == 0) begin
                        $display("[INFO] [Cycle %04d] Bitstream loading completed", tb_cycle_cnt);
                        state <= PROG_DONE;
                    end
                end
            endcase
        end
    end

    // track "we" toggling
    always @(posedge tb_clk) begin
        if (tb_rst) begin
            prog_we_prev <= 1'b0;
            prog_we_o_prev <= 1'b0;
            prog_fragments <= 32'b0;
        end else begin
            prog_we_prev <= prog_we;
            prog_we_o_prev <= prog_we_o;

            if ((prog_we_prev && ~prog_we) && ~(prog_we_o_prev && ~prog_we_o)) begin
                prog_fragments <= prog_fragments + 1;
            end else if (~(prog_we_prev && ~prog_we) && (prog_we_o_prev && ~prog_we_o)) begin
                prog_fragments <= prog_fragments - 1;
            end
        end
    end

    // Programming data
    always @* begin
        prog_din = {bs_data[prog_progress / 64], bs_data[prog_progress / 64 + 1]} >> (128 - BS_WORD_SIZE - prog_progress % 64);
    end

    // Progress tracking
    reg [7:0]   prog_percentage;

    always @(posedge tb_clk) begin
        if (tb_rst) begin
            prog_percentage <= 8'b0;
        end else begin
            if (prog_progress * 100 / BS_NUM_QWORDS / 64 > prog_percentage) begin
                prog_percentage <= prog_percentage + 1;
                $display("[INFO] Programming progress: %02d%%", prog_percentage + 1);
            end
        end
    end

    // Magic checker
    prga_magic_bitstream_checker i_checker ();

    // tb prog_done
    reg [31:0]  prog_done_cnt;

    always @(posedge tb_clk) begin
        if (tb_rst) begin
            prog_done_cnt <= 100;
            tb_prog_done <= 1'b0;
        end else if (state == PROG_DONE && prog_done_cnt > 0) begin
            prog_done_cnt <= prog_done_cnt - 1;

            if (prog_done_cnt == 1)
                tb_prog_done <= 1'b1;
        end
    end

    assign prog_clk = tb_clk;
    assign prog_rst = tb_rst;
    assign prog_done = state == PROG_DONE;

endmodule
