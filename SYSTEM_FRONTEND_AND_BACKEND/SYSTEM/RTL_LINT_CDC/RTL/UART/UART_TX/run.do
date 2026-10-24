vlib work
vlog *.v
vsim -voptargs=+acc work.uart_tb
do wave.do
run -all
