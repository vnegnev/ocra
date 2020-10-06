
# set_property CFGBVS VCCO [current_design]
# set_property CONFIG_VOLTAGE 3.3 [current_design]

### ADC

# data

set_property IOSTANDARD LVCMOS18 [get_ports {adc_dat_a_i[*]}]
set_property IOB TRUE [get_ports {adc_dat_a_i[*]}]

set_property PACKAGE_PIN V17 [get_ports {adc_dat_a_i[0]}]
set_property PACKAGE_PIN U17 [get_ports {adc_dat_a_i[1]}]
set_property PACKAGE_PIN Y17 [get_ports {adc_dat_a_i[2]}]
set_property PACKAGE_PIN W16 [get_ports {adc_dat_a_i[3]}]
set_property PACKAGE_PIN Y16 [get_ports {adc_dat_a_i[4]}]
set_property PACKAGE_PIN W15 [get_ports {adc_dat_a_i[5]}]
set_property PACKAGE_PIN W14 [get_ports {adc_dat_a_i[6]}]
set_property PACKAGE_PIN Y14 [get_ports {adc_dat_a_i[7]}]
set_property PACKAGE_PIN W13 [get_ports {adc_dat_a_i[8]}]
set_property PACKAGE_PIN V12 [get_ports {adc_dat_a_i[9]}]
set_property PACKAGE_PIN V13 [get_ports {adc_dat_a_i[10]}]
set_property PACKAGE_PIN T14 [get_ports {adc_dat_a_i[11]}]
set_property PACKAGE_PIN T15 [get_ports {adc_dat_a_i[12]}]
set_property PACKAGE_PIN V15 [get_ports {adc_dat_a_i[13]}]
set_property PACKAGE_PIN T16 [get_ports {adc_dat_a_i[14]}]
set_property PACKAGE_PIN V16 [get_ports {adc_dat_a_i[15]}]

set_property IOSTANDARD LVCMOS18 [get_ports {adc_dat_b_i[*]}]
set_property IOB TRUE [get_ports {adc_dat_b_i[*]}]

set_property PACKAGE_PIN T17 [get_ports {adc_dat_b_i[0]}]
set_property PACKAGE_PIN R16 [get_ports {adc_dat_b_i[1]}]
set_property PACKAGE_PIN R18 [get_ports {adc_dat_b_i[2]}]
set_property PACKAGE_PIN P16 [get_ports {adc_dat_b_i[3]}]
set_property PACKAGE_PIN P18 [get_ports {adc_dat_b_i[4]}]
set_property PACKAGE_PIN N17 [get_ports {adc_dat_b_i[5]}]
set_property PACKAGE_PIN R19 [get_ports {adc_dat_b_i[6]}]
set_property PACKAGE_PIN T20 [get_ports {adc_dat_b_i[7]}]
set_property PACKAGE_PIN T19 [get_ports {adc_dat_b_i[8]}]
set_property PACKAGE_PIN U20 [get_ports {adc_dat_b_i[9]}]
set_property PACKAGE_PIN V20 [get_ports {adc_dat_b_i[10]}]
set_property PACKAGE_PIN W20 [get_ports {adc_dat_b_i[11]}]
set_property PACKAGE_PIN W19 [get_ports {adc_dat_b_i[12]}]
set_property PACKAGE_PIN Y19 [get_ports {adc_dat_b_i[13]}]
set_property PACKAGE_PIN W18 [get_ports {adc_dat_b_i[14]}]
set_property PACKAGE_PIN Y18 [get_ports {adc_dat_b_i[15]}]

# clock input


# clock output





# clock duty cycle stabilizer (CSn)


### DAC

# data

set_property IOSTANDARD LVCMOS33 [get_ports {dac_dat_o[*]}]
set_property SLEW FAST [get_ports {dac_dat_o[*]}]
set_property DRIVE 8 [get_ports {dac_dat_o[*]}]
# set_property IOB TRUE [get_ports {dac_dat_o[*]}]


# control

set_property SLEW FAST [get_ports dac_*_o]
# set_property IOB TRUE [get_ports {dac_*_o}]


### PWM

set_property IOSTANDARD LVCMOS18 [get_ports {dac_pwm_o[*]}]
set_property SLEW FAST [get_ports {dac_pwm_o[*]}]
set_property DRIVE 12 [get_ports {dac_pwm_o[*]}]
# set_property IOB TRUE [get_ports {dac_pwm_o[*]}]


### XADC

set_property IOSTANDARD LVCMOS33 [get_ports Vp_Vn_v_p]
set_property IOSTANDARD LVCMOS33 [get_ports Vp_Vn_v_n]
set_property IOSTANDARD LVCMOS33 [get_ports Vaux0_v_p]
set_property IOSTANDARD LVCMOS33 [get_ports Vaux0_v_n]
set_property IOSTANDARD LVCMOS33 [get_ports Vaux1_v_p]
set_property IOSTANDARD LVCMOS33 [get_ports Vaux1_v_n]
set_property IOSTANDARD LVCMOS33 [get_ports Vaux8_v_p]
set_property IOSTANDARD LVCMOS33 [get_ports Vaux8_v_n]
set_property IOSTANDARD LVCMOS33 [get_ports Vaux9_v_p]
set_property IOSTANDARD LVCMOS33 [get_ports Vaux9_v_n]

set_property PACKAGE_PIN K9  [get_ports Vp_Vn_v_p]
set_property PACKAGE_PIN L10 [get_ports Vp_Vn_v_n]
set_property PACKAGE_PIN C20 [get_ports Vaux0_v_p]
set_property PACKAGE_PIN B20 [get_ports Vaux0_v_n]
set_property PACKAGE_PIN E17 [get_ports Vaux1_v_p]
set_property PACKAGE_PIN D18 [get_ports Vaux1_v_n]
set_property PACKAGE_PIN B19 [get_ports Vaux8_v_p]
set_property PACKAGE_PIN A20 [get_ports Vaux8_v_n]
set_property PACKAGE_PIN E18 [get_ports Vaux9_v_p]
set_property PACKAGE_PIN E19 [get_ports Vaux9_v_n]

### Expansion connector

set_property IOSTANDARD LVCMOS33 [get_ports {exp_p_tri_io[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {exp_n_tri_io[*]}]
set_property SLEW FAST [get_ports {exp_p_tri_io[*]}]
set_property SLEW FAST [get_ports {exp_n_tri_io[*]}]
set_property DRIVE 8 [get_ports {exp_p_tri_io[*]}]
set_property DRIVE 8 [get_ports {exp_n_tri_io[*]}]

set_property PACKAGE_PIN K17 [get_ports {exp_p_tri_io[3]}]
set_property PACKAGE_PIN L14 [get_ports {exp_p_tri_io[4]}]
set_property PACKAGE_PIN L16 [get_ports {exp_p_tri_io[5]}]
set_property PACKAGE_PIN K16 [get_ports {exp_p_tri_io[6]}]
set_property PACKAGE_PIN M14 [get_ports {exp_p_tri_io[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports exp_p_trg]
set_property SLEW FAST [get_ports exp_p_trg]
set_property DRIVE 8 [get_ports exp_p_trg]

set_property PACKAGE_PIN M14 [get_ports exp_p_trg]

set_property IOSTANDARD LVCMOS33 [get_ports {exp_n_alex[*]}]
set_property SLEW FAST [get_ports {exp_n_alex[*]}]
set_property DRIVE 8 [get_ports {exp_n_alex[*]}]

set_property PACKAGE_PIN L15 [get_ports {exp_n_alex[0]}]
set_property PACKAGE_PIN L17 [get_ports {exp_n_alex[1]}]
set_property PACKAGE_PIN J16 [get_ports {exp_n_alex[2]}]
set_property PACKAGE_PIN M15 [get_ports {exp_n_alex[3]}]

### SATA connector

set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports daisy_p_o[*]]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports daisy_n_o[*]]

set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports daisy_p_i[*]]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports daisy_n_i[*]]

set_property PACKAGE_PIN T12 [get_ports {daisy_p_o[0]}]
set_property PACKAGE_PIN U12 [get_ports {daisy_n_o[0]}]

set_property PACKAGE_PIN U14 [get_ports {daisy_p_o[1]}]
set_property PACKAGE_PIN U15 [get_ports {daisy_n_o[1]}]

set_property PACKAGE_PIN P14 [get_ports {daisy_p_i[0]}]
set_property PACKAGE_PIN R14 [get_ports {daisy_n_i[0]}]

set_property PACKAGE_PIN N18 [get_ports {daisy_p_i[1]}]
set_property PACKAGE_PIN P19 [get_ports {daisy_n_i[1]}]

### LED

set_property IOSTANDARD LVCMOS33 [get_ports {led_o[*]}]
set_property SLEW SLOW [get_ports {led_o[*]}]
set_property DRIVE 8 [get_ports {led_o[*]}]


