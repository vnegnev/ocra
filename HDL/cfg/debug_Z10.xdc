

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 1 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list system_i/ps_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 64 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {system_i/micro_sequencer_pulse[0]} {system_i/micro_sequencer_pulse[1]} {system_i/micro_sequencer_pulse[2]} {system_i/micro_sequencer_pulse[3]} {system_i/micro_sequencer_pulse[4]} {system_i/micro_sequencer_pulse[5]} {system_i/micro_sequencer_pulse[6]} {system_i/micro_sequencer_pulse[7]} {system_i/micro_sequencer_pulse[8]} {system_i/micro_sequencer_pulse[9]} {system_i/micro_sequencer_pulse[10]} {system_i/micro_sequencer_pulse[11]} {system_i/micro_sequencer_pulse[12]} {system_i/micro_sequencer_pulse[13]} {system_i/micro_sequencer_pulse[14]} {system_i/micro_sequencer_pulse[15]} {system_i/micro_sequencer_pulse[16]} {system_i/micro_sequencer_pulse[17]} {system_i/micro_sequencer_pulse[18]} {system_i/micro_sequencer_pulse[19]} {system_i/micro_sequencer_pulse[20]} {system_i/micro_sequencer_pulse[21]} {system_i/micro_sequencer_pulse[22]} {system_i/micro_sequencer_pulse[23]} {system_i/micro_sequencer_pulse[24]} {system_i/micro_sequencer_pulse[25]} {system_i/micro_sequencer_pulse[26]} {system_i/micro_sequencer_pulse[27]} {system_i/micro_sequencer_pulse[28]} {system_i/micro_sequencer_pulse[29]} {system_i/micro_sequencer_pulse[30]} {system_i/micro_sequencer_pulse[31]} {system_i/micro_sequencer_pulse[32]} {system_i/micro_sequencer_pulse[33]} {system_i/micro_sequencer_pulse[34]} {system_i/micro_sequencer_pulse[35]} {system_i/micro_sequencer_pulse[36]} {system_i/micro_sequencer_pulse[37]} {system_i/micro_sequencer_pulse[38]} {system_i/micro_sequencer_pulse[39]} {system_i/micro_sequencer_pulse[40]} {system_i/micro_sequencer_pulse[41]} {system_i/micro_sequencer_pulse[42]} {system_i/micro_sequencer_pulse[43]} {system_i/micro_sequencer_pulse[44]} {system_i/micro_sequencer_pulse[45]} {system_i/micro_sequencer_pulse[46]} {system_i/micro_sequencer_pulse[47]} {system_i/micro_sequencer_pulse[48]} {system_i/micro_sequencer_pulse[49]} {system_i/micro_sequencer_pulse[50]} {system_i/micro_sequencer_pulse[51]} {system_i/micro_sequencer_pulse[52]} {system_i/micro_sequencer_pulse[53]} {system_i/micro_sequencer_pulse[54]} {system_i/micro_sequencer_pulse[55]} {system_i/micro_sequencer_pulse[56]} {system_i/micro_sequencer_pulse[57]} {system_i/micro_sequencer_pulse[58]} {system_i/micro_sequencer_pulse[59]} {system_i/micro_sequencer_pulse[60]} {system_i/micro_sequencer_pulse[61]} {system_i/micro_sequencer_pulse[62]} {system_i/micro_sequencer_pulse[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {exp_n_tri_io_OBUF[0]} {exp_n_tri_io_OBUF[1]} {exp_n_tri_io_OBUF[2]} {exp_n_tri_io_OBUF[3]} {exp_n_tri_io_OBUF[4]} {exp_n_tri_io_OBUF[5]} {exp_n_tri_io_OBUF[6]} {exp_n_tri_io_OBUF[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 7 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {exp_p_tri_io_OBUF[0]} {exp_p_tri_io_OBUF[1]} {exp_p_tri_io_OBUF[2]} {exp_p_tri_io_OBUF[3]} {exp_p_tri_io_OBUF[4]} {exp_p_tri_io_OBUF[5]} {exp_p_tri_io_OBUF[6]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
