########################### Define Top Module ############################
set top_module SYS_TOP_DFT

######################### Formality Setup File ###########################
set synopsys_auto_setup true
set_svf "../../DFT/$top_module.svf"

set SSLIB "/home/ICer/SYSTEM/Backend/std_cells/libs/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/ICer/SYSTEM/Backend/std_cells/libs/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/ICer/SYSTEM/Backend/std_cells/libs/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

######################### Reference Container ############################
## Read Reference technology libraries
read_db -container r [list $SSLIB $TTLIB $FFLIB]

## Read Reference Design Files (the RTL)
set fh [open "../../DFT/system.lst" r]
set rtl_files [split [string trim [read $fh]] "\n"]
close $fh
set rtl_files [lsearch -all -inline -not -exact $rtl_files ""]

read_verilog -container r $rtl_files

## set the top Reference Design
set_top $top_module

######################## Implementation Container #########################
## Read Implementation technology libraries
read_db -container i [list $SSLIB $TTLIB $FFLIB]

## Read Implementation Design Files (the scan netlist)
read_verilog -container i -netlist "../../DFT/netlists/$top_module.v"

## set the top Implementation Design
set_top $top_module

############################### Don't verify #################################
# scan ports exist only after synthesis, not in the RTL logic
#scan in

foreach i {0 1 2} {
    set_dont_verify_points -type port "r:/WORK/$top_module/SI\[$i\]"
    set_dont_verify_points -type port "i:/WORK/$top_module/SI\[$i\]"
    set_dont_verify_points -type port "r:/WORK/$top_module/SO\[$i\]"
    set_dont_verify_points -type port "i:/WORK/$top_module/SO\[$i\]"
}

############################### constants #####################################
# all ATPG enables are zero during formal compare

# test_mode
set_constant -type port i:/WORK/$top_module/test_mode 0
set_constant -type port r:/WORK/$top_module/test_mode 0

# scan_enable
set_constant -type port i:/WORK/$top_module/SE 0
set_constant -type port r:/WORK/$top_module/SE 0

########################### matching Compare points ##########################
match

################################# verify #####################################
set successful [verify]
if {!$successful} {
    diagnose
    analyze_points -failing
}

report_passing_points    > "reports/passing_points.rpt"
report_failing_points    > "reports/failing_points.rpt"
report_aborted_points    > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"

#start_gui
exit
