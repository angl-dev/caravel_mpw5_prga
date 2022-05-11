set_units -time ns
create_clock [get_ports clk]  -name CLK  -period 100 -waveform {0 50}
create_clock [get_ports prog_clk]  -name PROG_CLK  -period 1000 -waveform {0 500}

set_case_analysis 0 _2659_/Q
set_case_analysis 0 _2680_/Q
set_case_analysis 0 _2701_/Q
set_case_analysis 0 _2722_/Q
set_case_analysis 0 _2743_/Q
set_case_analysis 0 _2764_/Q
set_case_analysis 0 _2785_/Q
set_case_analysis 0 _2805_/Q

set_clock_groups -asynchronous -group PROG_CLK -group CLK
set_false_path -from CLK -to PROG_CLK
set_false_path -from PROG_CLK -to CLK
