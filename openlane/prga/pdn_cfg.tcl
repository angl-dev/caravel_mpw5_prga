# Power nets

if { ! [info exists ::env(VDD_NET)] } {
	set ::env(VDD_NET) $::env(VDD_PIN)
}

if { ! [info exists ::env(GND_NET)] } {
	set ::env(GND_NET) $::env(GND_PIN)
}

set ::power_nets $::env(VDD_NET)
set ::ground_nets $::env(GND_NET)

if { [info exists ::env(FP_PDN_ENABLE_GLOBAL_CONNECTIONS)] } {
    if { $::env(FP_PDN_ENABLE_GLOBAL_CONNECTIONS) == 1 } {
        foreach power_pin $::env(STD_CELL_POWER_PINS) {
            add_global_connection -net $::env(VDD_NET) -inst_pattern .* -pin_pattern $power_pin -power
        }
        foreach ground_pin $::env(STD_CELL_GROUND_PINS) {
            add_global_connection -net $::env(GND_NET) -inst_pattern .* -pin_pattern $ground_pin -ground
        }
    }
}

set_voltage_domain -name CORE -power $::env(VDD_NET) -ground $::env(GND_NET)

# stdcell grid
define_pdn_grid -name stdcell_grid -starts_with POWER -voltage_domain CORE -pins $::env(FP_PDN_LOWER_LAYER)
add_pdn_stripe -grid stdcell_grid -layer $::env(FP_PDN_LOWER_LAYER) -width $::env(FP_PDN_VWIDTH) -pitch $::env(FP_PDN_VPITCH) -offset $::env(FP_PDN_VOFFSET) -starts_with POWER
add_pdn_stripe -grid stdcell_grid -layer $::env(FP_PDN_RAILS_LAYER) -width $::env(FP_PDN_RAIL_WIDTH) -followpins -starts_with POWER
add_pdn_connect -grid stdcell_grid -layers [subst {$::env(FP_PDN_RAILS_LAYER) $::env(FP_PDN_LOWER_LAYER)}]

# macro grid
set macro {
    orient {R0 R180 MX MY R90 R270 MXR90 MYR90}
    power_pins $::env(VDD_NET)
    ground_pins $::env(GND_NET)
    blockages {"li1" "met1" "met2" "met3"}
    straps {
        met3 {width 0.6 pitch 65.28 offset 5.78}
    }
    connect { {met2_PIN_ver met3} {met3 $::env(FP_PDN_LOWER_LAYER)} }
}

set ::halo [list $::env(FP_PDN_HORIZONTAL_HALO) $::env(FP_PDN_VERTICAL_HALO)]
pdngen::specify_grid macro [subst $macro]

# POWER or GROUND #Std. cell rails starting with power or ground rails at the bottom of the core area
set ::rails_start_with "POWER" ;

# POWER or GROUND #Upper metal stripes starting with power or ground rails at the left/bottom of the core area
set ::stripes_start_with "POWER" ;
