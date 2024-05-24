# PT script

source ./PrimeTimeSetup.tcl

# Netlist Reading from ICC2
read_verilog $Netlist_files
link_design

# Reading parasitics & constrains
read_parasitics  $SPEF_files
read_sdc $constrains_file
update_timing

# Checks 

report_timing
report_analysis_coverage
report_global_timing
report_clocks

