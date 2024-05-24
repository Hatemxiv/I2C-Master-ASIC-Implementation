

reset_design
create_clock -name wb_clk_i -period 1.7 [get_ports wb_clk_i]
set_input_delay -max 0.1 -clock [get_clocks wb_clk_i] [remove_from_collection [all_inputs] [get_ports wb_clk_i]]
set_output_delay -max 0.1 -clock [get_clocks wb_clk_i] [all_outputs]
set_clock_uncertainty 0.3 [get_clocks]
set_clock_latency      0.25  [get_clocks wb_clk_i]

set_false_path -hold -from [remove_from_collection [all_inputs] [get_ports wb_clk_i]]
set_false_path -hold -to [all_outputs]


set_min_library  saed90nm_max_lth.db -min_version saed90nm_min_nt.db 
set_wire_load_model -name "8000" -library saed90nm_max_lth


set_wire_load_mode enclosed



set_load -max [expr {2 * [load_of saed90nm_max_lth/NBUFFX8/INP]}] [all_outputs]


set_driving_cell -no_design_rule -max -lib_cell TNBUFFX1 [remove_from_collection [all_inputs] [get_ports wb_clk_i]]

group_path -name INPUTS -from [remove_from_collection [all_inputs] [get_ports wb_clk_i]]
group_path -name OUTPUTS -to [all_outputs]
group_path -name COMB -from [all_inputs] -to [all_outputs]
set_max_delay 0

