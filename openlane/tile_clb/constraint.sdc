set_units -time ns
create_clock [get_ports clk]  -name CLK  -period 100 -waveform {0 50}
create_clock [get_ports prog_clk]  -name PROG_CLK  -period 1000 -waveform {0 500}

set_case_analysis 0 _1692_/Q
set_case_analysis 0 _1712_/Q
set_case_analysis 0 _1732_/Q
set_case_analysis 0 _1752_/Q

set_clock_groups -asynchronous -group PROG_CLK -group CLK
set_false_path -from CLK -to PROG_CLK
set_false_path -from PROG_CLK -to CLK
