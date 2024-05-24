#placement

copy_block -from_block I2C.dlib:power_plan.design -to_block placement
current_block placement.design

report_qor -summary
report_design -summary
report_utilization

check_design -checks pre_placement_stage

report_lib saed90nm_max_lth

set_voltage 1.08

set_parasitic_parameters -early_spec maxTLU -late_spec minTLU


# Run 5 stages of placement : .coarse placement  .initial_drc-HFS .running initial optimization .final_place
#  . final_optomization
place_opt


#View congestion map
#report_congestion -rerun_global_router

# check legalizaation of all cells [no overlapping cells ....]
check_legality -verbose

report_utilization

report_qor

save_block




