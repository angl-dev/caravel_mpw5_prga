set_units -time ns
create_clock [get_ports clk]  -name CLK  -period 100 -waveform {0 50}
create_clock [get_ports prog_clk]  -name PROG_CLK  -period 100 -waveform {0 50}


set_case_analysis 0 _2132_/Q
set_case_analysis 0 _2152_/Q
set_case_analysis 0 _2172_/Q
set_case_analysis 0 _2192_/Q

#set_case_analysis 0 tile_clb/i_blk/cluster_i0/i_prog_data_i_sw_o/prog_data_reg[0]/Q
#set_case_analysis 0 tile_clb/i_blk/cluster_i1/i_prog_data_i_sw_o/prog_data_reg[0]/Q
#set_case_analysis 0 tile_clb/i_blk/cluster_i2/i_prog_data_i_sw_o/prog_data_reg[0]/Q
#set_case_analysis 0 tile_clb/i_blk/cluster_i3/i_prog_data_i_sw_o/prog_data_reg[0]/Q