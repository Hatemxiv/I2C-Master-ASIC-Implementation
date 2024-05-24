
# put the search path directory of the technology 
set_app_var search_path /home/vlsi/Desktop/I2C/standardCell/SAED90nm_EDK_10072017/SAED90_EDK/SAED_EDK90nm

set TECH_FILE $search_path/Digital_Standard_cell_Library/process/astro/tech/astroTechFile.tf 

# put the directory of your ndm created from the library manager
set reference_library /home/vlsi/Desktop/I2C/ndm/saed90nm_max_lth.ndm

#create design library from technology file & ndm

create_lib -technology $TECH_FILE -ref_libs $reference_library I2C.dlib

#read gate level netlist output from synthesis
read_verilog -top i2c_master_top /home/vlsi/Desktop/I2C/syn/output/i2c_master_top.v

link_block

set Tech $search_path/Technology_Kit/starrcxt
#read TLU+ files
read_parasitic_tech -layermap $Tech/tech2itf.map -tlup $Tech/tluplus/saed90nm_1p9m_1t_Cmax.tluplus  -name maxTLU

read_parasitic_tech -layermap $Tech/tech2itf.map -tlup $Tech/tluplus/saed90nm_1p9m_1t_Cmin.tluplus  -name minTLU

#put the sdc file output from synthesis
read_sdc /home/vlsi/Desktop/I2C/syn/output/i2c_master_top.sdc
get_site_defs

set_attribute [get_site_defs unit] symmetry y

set_attribute [get_layers {M1 M3 M5 M7 M9} ] routing_direction horizontal

set_attribute [get_layers {M2 M4 M6 M8 } ] routing_direction vertical

get_attribute [get_layers M7] routing_direction

report_ignored_layers

set_ignored_layers -max_routing_layer M8

report_ignored_layers







###############################

initialize_floorplan -core_utilization 0.6 -side_ratio {1 1} -core_offset {10}
set_app_options -name place.coarse.fix_hard_macros -value false
set_app_options -name plan.place.auto_create_blockages -value auto
create_placement -floorplan
create_block_pin_constraint -allowed_layers {M6 M5 M4 M3}
set_app_options -name plan.pins.incremental -value false -block [current_block]
place_pins -self

# copy block to a new block to work on it
copy_block -from_block I2C.dlib:i2c_master_top.design -to_block power_plan
current_block power_plan.design

# remove ignored layer M8
report_ignored_layers
remove_ignored_layers -all -max_routing_layer -min_routing_layer
report_ignored_layers

set_app_option -name plan.pgroute.auto_connect_pg_net -value true
#set_app_option -name plan.pgroute.connect_user_route_shapes -value true
#set_app_option -name plan.pgroute.disable_floating_removal -value true
#set_app_option -name plan.pgroute.disable_trimming -value true

create_net -power GVDD
create_net -ground GVSS

# hierarchical [include top module + sub modules]
connect_pg_net -net GVDD [get_pins -hierarchical "*/VDD"]
connect_pg_net -net GVSS [get_pins -hierarchical "*/VSS"]

# P G   R I N G   C R E A T I O N

create_pg_ring_pattern ring_pattern -horizontal_layer M9    -horizontal_width {3} -horizontal_spacing {1}     -vertical_layer M8 -vertical_width {3}     -vertical_spacing {1} 

set_pg_strategy core_ring -core -pattern \
    {{pattern: ring_pattern}{nets: {GVDD GVSS}}{offset: {0.5 0.5}}} \
    -extension {{stop: innermost_ring}}

compile_pg -strategies core_ring


# PG MESH CREATION

create_pg_mesh_pattern pg_mesh1    -parameters {w1 p1 w2 p2 f t}    -layers {{{vertical_layer: M8} {width: @w1} {spacing: interleaving}         {pitch: @p1} {offset: @f} {trim: @t}}            {{horizontal_layer: M9 } {width: @w2} {spacing: interleaving}         {pitch: @p2} {offset: @f} {trim: @t}}}


set_pg_strategy s_mesh1 \
   -pattern {{pattern: pg_mesh1} {nets: {GVDD GVSS GVSS GVDD}} \
{offset_start: 5 5} {parameters: 3 30 3 30 5 false}} \
   -core -extension {{stop: outermost_ring}}


compile_pg -strategies s_mesh1


# S T A N D A R D    C E L L    R A I L    I N S E R T I O N
create_pg_std_cell_conn_pattern     std_cell_rail      -layers {M1}     -rail_width 0.06

set_pg_strategy rail_strat -core \
    -pattern {{name: std_cell_rail} {nets: GVDD GVSS} }
    
compile_pg -strategies rail_strat    

save_block


##########################################

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
################################


# CTS

copy_block -from_block I2C.dlib:placement.design -to_block placement -to_block CTS
current_block CTS.design

report_clock_qor -type structure
derive_clock_cell_references -output cts_leg_set.tcl > /dev/null


set CTS_CELLS [get_lib_cells "*/NBUFFX2 */NBUFFX4 */NBUFFX8 "]





#NDR

set CTS_NDR_MIN_ROUTING_LAYER	"M4"
set CTS_NDR_MAX_ROUTING_LAYER	"M5"
set CTS_LEAF_NDR_MIN_ROUTING_LAYER	"M1"
set CTS_LEAF_NDR_MAX_ROUTING_LAYER	"M5"
set CTS_NDR_RULE_NAME 		"cts_w2_s2_vlg"
#set CTS_LEAF_NDR_RULE_NAME	"cts_w1_s2"

create_routing_rule $CTS_NDR_RULE_NAME\
		-default_reference_rule \
		-taper_distance 0.4 \
		-driver_taper_distance 0.4 \
  	 	-widths   {M3 0.16 M4 0.32 M5 0.32} \
  	 	-spacings {M3 0.16 M4 0.32 M5 0.32}
                

set_clock_routing_rules -rules $CTS_NDR_RULE_NAME \
		-min_routing_layer $CTS_NDR_MIN_ROUTING_LAYER \
		-max_routing_layer $CTS_NDR_MAX_ROUTING_LAYER
		
report_routing_rules -verbose

report_clock_routing_rules

#Sink pins will not follows NDRs
set_clock_routing_rules -net_type sink -default_rule -min_routing_layer M1 -max_routing_layer M2

#DRC 
report_ports -verbose [get_ports *wb_clk_i*]
set_driving_cell -scenarios [all_scenarios] -lib_cell NBUFFX4 [get_ports *wb_clk_i*]


set_app_options -name time.remove_clock_reconvergence_pessimism -value true
report_clock_settings

#
set_clock_tree_options -target_skew 0.5 -clock [get_clocks *]
set_clock_tree_options -target_latency 0.1  -clock [get_clocks *]

clock_opt



################################
# 1.routing

copy_block -from_block I2C.dlib:CTS.design -to_block routing
current_block routing.design

#  check for any issues that might cause problems during routing
report_qor -summary
check_design -checks pre_route_stage


#antenna rules (change the directory according to your project)
source /home/vlsi/Desktop/I2C/standardCell/SAED90nm_EDK_10072017/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/process/astro/tech/saed90nm_1p9m_antenna.tcl



## Routing  (Performs all routing stages in one step the command runs global routing, track assignment, and detail routing )

route_auto


# Routing Optimization
route_opt 

#Final Check
check_routes

#Routing is Finished 

# 2.Filler Cells Insertion

set FillerCells " SHFILL128 SHFILL64 SHFILL1 "
create_stdcell_fillers -lib_cells $FillerCells
connect_pg_net -automatic

remove_stdcell_fillers_with_violation

check_legality

# 3.Checks & Output
# First Create new directory called output in pnr folder

set DESIGN_NAME pit_top

# Netlist after physical synthesis
write_verilog  ./output/${DESIGN_NAME}_for_pt_v.v

#SDC_OUT
write_sdc -output ./output/${DESIGN_NAME}.out.sdc

# SPEF_OUT
write_parasitics -format SPEF -output ./output/${DESIGN_NAME}.out.spef

######DEF_OUT
write_def ./output/${DESIGN_NAME}.out.def


##########GDS_OUT

set GDS_MAP_FILE /home/vlsi/Desktop/I2C/standardCell/SAED90nm_EDK_10072017/SAED90_EDK/SAED_EDK90nm/Technology_Kit/milkyway/saed90nm.gdsout.map

set STD_CELL_GDS /home/vlsi/Desktop/I2C/standardCell/SAED90nm_EDK_10072017/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/layout/gds/saed90nm.gds

write_gds \
-view design \
-lib_cell_view frame \
-output_pin all \
-fill include \
-exclude_empty_block \
-long_names \
-layer_map "$GDS_MAP_FILE" \
-keep_data_type \
-merge_files "$STD_CELL_GDS" \
./output/${DESIGN_NAME}.gds


save_block










