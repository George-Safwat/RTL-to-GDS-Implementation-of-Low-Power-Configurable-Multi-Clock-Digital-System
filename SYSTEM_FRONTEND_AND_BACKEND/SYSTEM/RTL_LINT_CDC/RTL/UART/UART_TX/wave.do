onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TESTBENCH /uart_tb/clk_tb
add wave -noupdate -expand -group TESTBENCH /uart_tb/busy_tb
add wave -noupdate -expand -group TESTBENCH /uart_tb/data_valid_tb
add wave -noupdate -expand -group TESTBENCH -radix binary /uart_tb/expected_data_no_parity
add wave -noupdate -expand -group TESTBENCH -radix binary /uart_tb/p_data_tb
add wave -noupdate -expand -group TESTBENCH -color {Medium Orchid} -radix binary /uart_tb/expected_data_parity
add wave -noupdate -expand -group TESTBENCH /uart_tb/i
add wave -noupdate -expand -group TESTBENCH /uart_tb/parity_en_tb
add wave -noupdate -expand -group TESTBENCH /uart_tb/parity_type_tb
add wave -noupdate -expand -group TESTBENCH /uart_tb/rst_n_tb
add wave -noupdate -expand -group TESTBENCH -color Magenta /uart_tb/tx_out_tb
add wave -noupdate -group SERIALIZER /uart_tb/DUT/m1/clk
add wave -noupdate -group SERIALIZER -radix binary /uart_tb/DUT/m1/p_data
add wave -noupdate -group SERIALIZER /uart_tb/DUT/m1/rst_n
add wave -noupdate -group SERIALIZER /uart_tb/DUT/m1/ser_data
add wave -noupdate -group SERIALIZER /uart_tb/DUT/m1/ser_done
add wave -noupdate -group SERIALIZER /uart_tb/DUT/m1/ser_en
add wave -noupdate -group FSM /uart_tb/DUT/m2/clk
add wave -noupdate -group FSM /uart_tb/DUT/m2/busy
add wave -noupdate -group FSM /uart_tb/DUT/m2/cs
add wave -noupdate -group FSM /uart_tb/DUT/m2/ns
add wave -noupdate -group FSM /uart_tb/DUT/m2/data_valid
add wave -noupdate -group FSM /uart_tb/DUT/m2/mux_sel
add wave -noupdate -group FSM /uart_tb/DUT/m2/parity_en
add wave -noupdate -group FSM /uart_tb/DUT/m2/rst_n
add wave -noupdate -group FSM /uart_tb/DUT/m2/ser_done
add wave -noupdate -group FSM /uart_tb/DUT/m2/ser_en
add wave -noupdate -group {PARITY CALC} /uart_tb/DUT/m3/data_valid
add wave -noupdate -group {PARITY CALC} /uart_tb/DUT/m3/p_data
add wave -noupdate -group {PARITY CALC} /uart_tb/DUT/m3/parity_bit
add wave -noupdate -group {PARITY CALC} /uart_tb/DUT/m3/parity_type
add wave -noupdate -group {PARITY CALC} /uart_tb/DUT/m3/WIDTH
add wave -noupdate -expand -group MUX /uart_tb/DUT/m4/clk
add wave -noupdate -expand -group MUX /uart_tb/DUT/m4/mux_sel
add wave -noupdate -expand -group MUX /uart_tb/DUT/m4/rst_n
add wave -noupdate -expand -group MUX /uart_tb/DUT/m4/parity_bit
add wave -noupdate -expand -group MUX /uart_tb/DUT/m4/ser_data
add wave -noupdate -expand -group MUX /uart_tb/DUT/m4/start_bit
add wave -noupdate -expand -group MUX /uart_tb/DUT/m4/stop_bit
add wave -noupdate -expand -group MUX /uart_tb/DUT/m4/tx_out
add wave -noupdate /uart_tb/DUT/m4/tx_out_int
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {110 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 201
configure wave -valuecolwidth 96
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {975 ns} {1054 ns}
