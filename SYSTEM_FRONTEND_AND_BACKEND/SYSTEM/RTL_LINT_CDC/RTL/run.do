vlib work
vlog +define+SIMULATION -f src_files.list
vsim -voptargs=+acc work.tb_SYS_TOP
#do wave.do
run -all
