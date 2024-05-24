# Prime Time Setup
# Change the directories acc. to your project loaction

set Design_name i2c_master_top

set search_path /home/vlsi/Desktop/I2C/standardCell/SAED90nm_EDK_10072017/SAED90_EDK/SAED_EDK90nm

set target_library $search_path/Digital_Standard_cell_Library/synopsys/models/saed90nm_max_lth.db

set link_path "* $target_library"

set Netlist_files  ../scripts/output/i2c_master_top.v

set SPEF_files     ../scripts/output/i2c_master_top.out.spef.spef_scenario

set constrains_file ../scripts/output/i2c_master_top.out.sdc


