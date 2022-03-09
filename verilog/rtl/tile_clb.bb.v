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
