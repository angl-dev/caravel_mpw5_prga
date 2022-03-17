set_units -time ns
create_clock [get_ports ipin_x0y1_0]  -name CLK  -period 400 -waveform {0 200}
create_clock [get_ports prog_clk]  -name PROG_CLK  -period 1000 -waveform {0 500}

set_clock_groups -asynchronous -group PROG_CLK -group CLK
set_false_path -from CLK -to PROG_CLK
set_false_path -from PROG_CLK -to CLK

#set_case_analysis 0 tile_clb/i_blk/cluster_i0/i_prog_data_i_sw_o/prog_data_reg[0]/Q
#set_case_analysis 0 tile_clb/i_blk/cluster_i1/i_prog_data_i_sw_o/prog_data_reg[0]/Q
#set_case_analysis 0 tile_clb/i_blk/cluster_i2/i_prog_data_i_sw_o/prog_data_reg[0]/Q
#set_case_analysis 0 tile_clb/i_blk/cluster_i3/i_prog_data_i_sw_o/prog_data_reg[0]/Q
