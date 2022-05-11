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

# Assesses whether the deisgn is the core of the chip or not based on the 
# value of $::env(DESIGN_IS_CORE) and uses the appropriate stdcell section
define_pdn_grid -name stdcell_grid -starts_with POWER -voltage_domain CORE -pins {"met2"}
add_pdn_stripe -grid stdcell_grid -layer "met2" -width 0.28 -pitch 51.52 -offset 5.29 -starts_with POWER

# Adds the standard cell rails
add_pdn_stripe -grid stdcell_grid -layer $::env(FP_PDN_RAILS_LAYER) -width $::env(FP_PDN_RAIL_WIDTH) -followpins -starts_with POWER
add_pdn_connect -grid stdcell_grid -layers [subst {$::env(FP_PDN_RAILS_LAYER) "met2"}]


# POWER or GROUND #Std. cell rails starting with power or ground rails at the bottom of the core area
set ::rails_start_with "POWER" ;

# POWER or GROUND #Upper metal stripes starting with power or ground rails at the left/bottom of the core area
set ::stripes_start_with "POWER" ;
