########################### Define Top Module ############################

set top_module SYS_TOP

######################### Paths ##########################################

set LIB_DIR /home/ICer/SYSTEM/Backend/std_cells/libs
set SYN_DIR /home/ICer/SYSTEM/Backend/Synthesis

set SSLIB "$LIB_DIR/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "$LIB_DIR/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "$LIB_DIR/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

######################### Formality Setup File ###########################

set synopsys_auto_setup true

# SVF must be set BEFORE reading any design
set_svf "../../Synthesis/$top_module.svf"

######################### Reference Container ############################

## Read Reference technology libraries
read_db -container r [list $SSLIB $TTLIB $FFLIB]

## Read Reference Design Files (RTL)
set fh  [open $SYN_DIR/system.lst r]
set rtl [read $fh]
close $fh
set rtl_files [regsub -all "\n" [string trim $rtl] " "]

read_verilog -container r $rtl_files

## set the top Reference Design
set_top $top_module

######################## Implementation Container #########################

## Read Implementation technology libraries
read_db -container i [list $SSLIB $TTLIB $FFLIB]

## Read Implementation Design Files (synthesized gate-level netlist)
read_verilog -container i -netlist "/home/ICer/SYSTEM/Backend/Synthesis/netlists/SYS_TOP.v"

## set the top Implementation Design
set_top $top_module

######################## Matching Compare points ##########################

match

######################## Verify ###########################################

set successful [verify]

if {!$successful} {
    diagnose
    analyze_points -failing
}

######################## Reports ##########################################

report_passing_points    > "reports/passing_points.rpt"
report_failing_points    > "reports/failing_points.rpt"
report_aborted_points    > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"

#start_gui
exit
