onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TESTBENCH /uart_rx_tb/clk_tb
add wave -noupdate -expand -group TESTBENCH /uart_rx_tb/rst_n_tb
add wave -noupdate -expand -group TESTBENCH /uart_rx_tb/data_valid_tb
add wave -noupdate -expand -group TESTBENCH -radix binary /uart_rx_tb/frame
add wave -noupdate -expand -group TESTBENCH -radix binary /uart_rx_tb/p_data_tb
add wave -noupdate -expand -group TESTBENCH /uart_rx_tb/frame_parity
add wave -noupdate -expand -group TESTBENCH -radix unsigned /uart_rx_tb/DUT/u_edge_counter/bit_cnt
add wave -noupdate -expand -group TESTBENCH /uart_rx_tb/par_en_tb
add wave -noupdate -expand -group TESTBENCH -radix unsigned /uart_rx_tb/DUT/u_fsm/edge_cnt
add wave -noupdate -expand -group TESTBENCH -color Magenta /uart_rx_tb/rx_in_tb
add wave -noupdate -expand -group TESTBENCH -radix binary /uart_rx_tb/DUT/u_parity_check/data
add wave -noupdate -expand -group TESTBENCH /uart_rx_tb/par_type_tb
add wave -noupdate -expand -group TESTBENCH -radix decimal /uart_rx_tb/i
add wave -noupdate -expand -group TESTBENCH /uart_rx_tb/j
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/cs
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/ns
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/rst_n
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/rx_in
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/prescale
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/par_en
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/par_err
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/strt_glitch
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/stp_error
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/bit_cnt
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/edge_cnt
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/enable
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/dat_samp_en
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/data_valid
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/deser_en
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/strt_chk_en
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/par_chk_en
add wave -noupdate -expand -group FSM /uart_rx_tb/DUT/u_fsm/stp_chk_en
add wave -noupdate -expand -group {START CHECKER} /uart_rx_tb/DUT/u_start_check/clk
add wave -noupdate -expand -group {START CHECKER} /uart_rx_tb/DUT/u_start_check/rst_n
add wave -noupdate -expand -group {START CHECKER} /uart_rx_tb/DUT/u_start_check/sampled_bit
add wave -noupdate -expand -group {START CHECKER} /uart_rx_tb/DUT/u_start_check/strt_chk_en
add wave -noupdate -expand -group {START CHECKER} /uart_rx_tb/DUT/u_start_check/prescale
add wave -noupdate -expand -group {START CHECKER} /uart_rx_tb/DUT/u_start_check/edge_cnt
add wave -noupdate -expand -group {START CHECKER} /uart_rx_tb/DUT/u_start_check/strt_glitch
add wave -noupdate -expand -group {START CHECKER} /uart_rx_tb/DUT/u_start_check/correct_counter
add wave -noupdate -expand -group {START CHECKER} /uart_rx_tb/DUT/u_start_check/error_counter
add wave -noupdate -expand -group DESERIALIZER /uart_rx_tb/DUT/u_deserializer/clk
add wave -noupdate -expand -group DESERIALIZER /uart_rx_tb/DUT/u_deserializer/rst_n
add wave -noupdate -expand -group DESERIALIZER /uart_rx_tb/DUT/u_deserializer/deser_en
add wave -noupdate -expand -group DESERIALIZER /uart_rx_tb/DUT/u_deserializer/sampled_bit
add wave -noupdate -expand -group DESERIALIZER /uart_rx_tb/DUT/u_deserializer/p_data
add wave -noupdate -group {EDGE COUNTER} /uart_rx_tb/DUT/u_edge_counter/clk
add wave -noupdate -group {EDGE COUNTER} /uart_rx_tb/DUT/u_edge_counter/rst_n
add wave -noupdate -group {EDGE COUNTER} /uart_rx_tb/DUT/u_edge_counter/enable
add wave -noupdate -group {EDGE COUNTER} /uart_rx_tb/DUT/u_edge_counter/par_en
add wave -noupdate -group {EDGE COUNTER} /uart_rx_tb/DUT/u_edge_counter/prescale
add wave -noupdate -group {EDGE COUNTER} /uart_rx_tb/DUT/u_edge_counter/edge_cnt
add wave -noupdate -group {EDGE COUNTER} /uart_rx_tb/DUT/u_edge_counter/bit_cnt
add wave -noupdate -group {PARITY CHECKER} /uart_rx_tb/DUT/u_parity_check/clk
add wave -noupdate -group {PARITY CHECKER} /uart_rx_tb/DUT/u_parity_check/rst_n
add wave -noupdate -group {PARITY CHECKER} /uart_rx_tb/DUT/u_parity_check/par_chk_en
add wave -noupdate -group {PARITY CHECKER} /uart_rx_tb/DUT/u_parity_check/sampled_bit
add wave -noupdate -group {PARITY CHECKER} /uart_rx_tb/DUT/u_parity_check/par_type
add wave -noupdate -group {PARITY CHECKER} /uart_rx_tb/DUT/u_parity_check/bit_cnt
add wave -noupdate -group {PARITY CHECKER} /uart_rx_tb/DUT/u_parity_check/prescale
add wave -noupdate -group {PARITY CHECKER} /uart_rx_tb/DUT/u_parity_check/edge_cnt
add wave -noupdate -group {PARITY CHECKER} /uart_rx_tb/DUT/u_parity_check/par_err
add wave -noupdate -group {PARITY CHECKER} /uart_rx_tb/DUT/u_parity_check/data
add wave -noupdate -group {PARITY CHECKER} /uart_rx_tb/DUT/u_parity_check/correct_counter
add wave -noupdate -group {PARITY CHECKER} /uart_rx_tb/DUT/u_parity_check/error_counter
add wave -noupdate -expand -group {STOP CHECKER} /uart_rx_tb/DUT/u_stop_check/clk
add wave -noupdate -expand -group {STOP CHECKER} /uart_rx_tb/DUT/u_stop_check/rst_n
add wave -noupdate -expand -group {STOP CHECKER} /uart_rx_tb/DUT/u_stop_check/sampled_bit
add wave -noupdate -expand -group {STOP CHECKER} /uart_rx_tb/DUT/u_stop_check/stp_chk_en
add wave -noupdate -expand -group {STOP CHECKER} /uart_rx_tb/DUT/u_stop_check/prescale
add wave -noupdate -expand -group {STOP CHECKER} /uart_rx_tb/DUT/u_stop_check/edge_cnt
add wave -noupdate -expand -group {STOP CHECKER} /uart_rx_tb/DUT/u_stop_check/stp_error
add wave -noupdate -expand -group {STOP CHECKER} /uart_rx_tb/DUT/u_stop_check/correct_counter
add wave -noupdate -expand -group {STOP CHECKER} /uart_rx_tb/DUT/u_stop_check/error_counter
add wave -noupdate -group SAMPLING /uart_rx_tb/DUT/u_sample/clk
add wave -noupdate -group SAMPLING /uart_rx_tb/DUT/u_sample/rst_n
add wave -noupdate -group SAMPLING /uart_rx_tb/DUT/u_sample/dat_samp_en
add wave -noupdate -group SAMPLING /uart_rx_tb/DUT/u_sample/rx_in
add wave -noupdate -group SAMPLING -radix unsigned /uart_rx_tb/DUT/u_sample/edge_cnt
add wave -noupdate -group SAMPLING /uart_rx_tb/DUT/u_sample/prescale
add wave -noupdate -group SAMPLING /uart_rx_tb/DUT/u_sample/sampled_bit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1144708 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 152
configure wave -valuecolwidth 100
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
WaveRestoreZoom {1139474 ns} {1149694 ns}
