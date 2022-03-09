set_units -time ns
create_clock [get_ports clk]  -name CLK  -period 100 -waveform {0 50}
create_clock [get_ports prog_clk]  -name PROG_CLK  -period 1000 -waveform {0 500}

set_case_analysis 0 _2636_/Q
set_case_analysis 0 _2656_/Q
set_case_analysis 0 _2676_/Q
set_case_analysis 0 _2696_/Q
set_case_analysis 0 _2716_/Q
set_case_analysis 0 _2736_/Q
set_case_analysis 0 _2756_/Q
set_case_analysis 0 _2776_/Q

set_clock_groups -asynchronous -group PROG_CLK -group CLK
set_false_path -from CLK -to PROG_CLK
set_false_path -from PROG_CLK -to CLK
