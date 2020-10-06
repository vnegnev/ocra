

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list system_i/ps_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe0]
set_property port_width 14 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {system_i/grad_bram_offset_slice_Dout[0]} {system_i/grad_bram_offset_slice_Dout[1]} {system_i/grad_bram_offset_slice_Dout[2]} {system_i/grad_bram_offset_slice_Dout[3]} {system_i/grad_bram_offset_slice_Dout[4]} {system_i/grad_bram_offset_slice_Dout[5]} {system_i/grad_bram_offset_slice_Dout[6]} {system_i/grad_bram_offset_slice_Dout[7]} {system_i/grad_bram_offset_slice_Dout[8]} {system_i/grad_bram_offset_slice_Dout[9]} {system_i/grad_bram_offset_slice_Dout[10]} {system_i/grad_bram_offset_slice_Dout[11]} {system_i/grad_bram_offset_slice_Dout[12]} {system_i/grad_bram_offset_slice_Dout[13]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {exp_n_tri_io_OBUF[0]} {exp_n_tri_io_OBUF[1]} {exp_n_tri_io_OBUF[2]} {exp_n_tri_io_OBUF[3]} {exp_n_tri_io_OBUF[4]} {exp_n_tri_io_OBUF[5]} {exp_n_tri_io_OBUF[6]} {exp_n_tri_io_OBUF[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 3 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {exp_p_tri_io_OBUF[0]} {exp_p_tri_io_OBUF[1]} {exp_p_tri_io_OBUF[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list system_i/grad_bram_enb_slice_Dout]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
