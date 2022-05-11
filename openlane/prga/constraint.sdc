set_units -time ns
create_clock [get_ports ipin_x0y1_0]  -name CLK  -period 500 -waveform {0 250}
create_clock [get_ports prog_clk]  -name PROG_CLK  -period 1500 -waveform {0 750}

set_clock_groups -asynchronous -group PROG_CLK -group CLK
set_false_path -from CLK -to PROG_CLK
set_false_path -from PROG_CLK -to CLK

#set_case_analysis 0 tile_clb/i_blk/cluster_i0/i_prog_data_i_sw_o/prog_data_reg[0]/Q
#set_case_analysis 0 tile_clb/i_blk/cluster_i1/i_prog_data_i_sw_o/prog_data_reg[0]/Q
#set_case_analysis 0 tile_clb/i_blk/cluster_i2/i_prog_data_i_sw_o/prog_data_reg[0]/Q
#set_case_analysis 0 tile_clb/i_blk/cluster_i3/i_prog_data_i_sw_o/prog_data_reg[0]/Q
