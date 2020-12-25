global adc_clk_freq

# Create xlslice
# Trigger slice on Bit 1 (RX pulse)
cell xilinx.com:ip:xlslice:1.0 slice_0 {
  DIN_WIDTH 8 DIN_FROM 1 DIN_TO 1 DOUT_WIDTH 1
}

# Create xlslice
cell xilinx.com:ip:xlslice:1.0 rate_slice {
  DIN_WIDTH 64 DIN_FROM 47 DIN_TO 32 DOUT_WIDTH 16
}

# Create axis_lfsr
cell pavel-demin:user:axis_lfsr:1.0 lfsr_0 {} {
  aclk /pll_0/clk_out1
  aresetn /rst_0/peripheral_aresetn
}

# Create cmpy
cell xilinx.com:ip:cmpy:6.0 mult_0 {
  FLOWCONTROL Blocking
  APORTWIDTH.VALUE_SRC USER
  BPORTWIDTH.VALUE_SRC USER
  APORTWIDTH 16
  BPORTWIDTH 24
  ROUNDMODE Random_Rounding
  OUTPUTWIDTH 26
} {
  S_AXIS_CTRL lfsr_0/M_AXIS
}

# Create axis_broadcaster
cell xilinx.com:ip:axis_broadcaster:1.1 bcast_0 {
  S_TDATA_NUM_BYTES.VALUE_SRC USER
  M_TDATA_NUM_BYTES.VALUE_SRC USER
  S_TDATA_NUM_BYTES 8
  M_TDATA_NUM_BYTES 3
  M00_TDATA_REMAP {tdata[23:0]}
  M01_TDATA_REMAP {tdata[55:32]}
} {
  S_AXIS mult_0/M_AXIS_DOUT
  aclk /pll_0/clk_out1
  aresetn /rst_0/peripheral_aresetn
}

# Create axis_variable
cell pavel-demin:user:axis_variable:1.0 rate_0 {
  AXIS_TDATA_WIDTH 16
} {
  cfg_data rate_slice/Dout
  aclk /pll_0/clk_out1
  aresetn /rst_0/peripheral_aresetn
}

# Create axis_variable
cell pavel-demin:user:axis_variable:1.0 rate_1 {
  AXIS_TDATA_WIDTH 16
} {
  cfg_data rate_slice/Dout
  aclk /pll_0/clk_out1
  aresetn /rst_0/peripheral_aresetn
}

# Create cic_compiler
cell xilinx.com:ip:cic_compiler:4.0 cic_0 {
  INPUT_DATA_WIDTH.VALUE_SRC USER
  FILTER_TYPE Decimation
  NUMBER_OF_STAGES 6
  SAMPLE_RATE_CHANGES Programmable
  MINIMUM_RATE 25
  MAXIMUM_RATE 8192
  FIXED_OR_INITIAL_RATE 625
  INPUT_SAMPLE_FREQUENCY $adc_clk_freq
  CLOCK_FREQUENCY $adc_clk_freq
  INPUT_DATA_WIDTH 24
  QUANTIZATION Truncation
  OUTPUT_DATA_WIDTH 32
  USE_XTREME_DSP_SLICE false
  HAS_DOUT_TREADY true
  HAS_ARESETN true
} {
  S_AXIS_DATA bcast_0/M00_AXIS
  S_AXIS_CONFIG rate_0/M_AXIS
  aclk /pll_0/clk_out1
  aresetn /rst_0/peripheral_aresetn
}

# Create cic_compiler
cell xilinx.com:ip:cic_compiler:4.0 cic_1 {
  INPUT_DATA_WIDTH.VALUE_SRC USER
  FILTER_TYPE Decimation
  NUMBER_OF_STAGES 6
  SAMPLE_RATE_CHANGES Programmable
  MINIMUM_RATE 25
  MAXIMUM_RATE 8192
  FIXED_OR_INITIAL_RATE 625
  INPUT_SAMPLE_FREQUENCY $adc_clk_freq
  CLOCK_FREQUENCY $adc_clk_freq
  INPUT_DATA_WIDTH 24
  QUANTIZATION Truncation
  OUTPUT_DATA_WIDTH 32
  USE_XTREME_DSP_SLICE false
  HAS_DOUT_TREADY true
  HAS_ARESETN true
} {
  S_AXIS_DATA bcast_0/M01_AXIS
  S_AXIS_CONFIG rate_1/M_AXIS
  aclk /pll_0/clk_out1
  aresetn /rst_0/peripheral_aresetn
}

# Create axis_combiner
cell  xilinx.com:ip:axis_combiner:1.1 comb_0 {
  TDATA_NUM_BYTES.VALUE_SRC USER
  TDATA_NUM_BYTES 4
} {
  S00_AXIS cic_1/M_AXIS_DATA
  S01_AXIS cic_0/M_AXIS_DATA
  aclk /pll_0/clk_out1
  aresetn /rst_0/peripheral_aresetn
}

# Create fifo_generator
cell xilinx.com:ip:fifo_generator:13.2 fifo_generator_0 {
  PERFORMANCE_OPTIONS First_Word_Fall_Through
  INPUT_DATA_WIDTH 64
  INPUT_DEPTH 8192
  OUTPUT_DATA_WIDTH 32
  OUTPUT_DEPTH 16384
  READ_DATA_COUNT true
  READ_DATA_COUNT_WIDTH 15
} {
  clk /pll_0/clk_out1
  srst slice_0/Dout
}

# Create axis_fifo
cell pavel-demin:user:axis_fifo:1.0 fifo_1 {
  S_AXIS_TDATA_WIDTH 64
  M_AXIS_TDATA_WIDTH 32
} {
  S_AXIS comb_0/M_AXIS
  FIFO_READ fifo_generator_0/FIFO_READ
  FIFO_WRITE fifo_generator_0/FIFO_WRITE
  aclk /pll_0/clk_out1
}

# Create axi_axis_reader
cell pavel-demin:user:axi_axis_reader:1.0 reader_0 {
  AXI_DATA_WIDTH 32
} {
  S_AXIS fifo_1/M_AXIS
  aclk /pll_0/clk_out1
  aresetn /rst_0/peripheral_aresetn
}
