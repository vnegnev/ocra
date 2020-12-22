This project still has many shortcomings and is therefor not continued here.
The last thing that has been fixed is a jitter issue that was caused by the hf chain being not properly reset

Remaining issues are:
- can only run very short sequences
- sometimes samples get lost, because sequencer can only be programmed to sample for a certain duration

Ocra development won't continue here. We switched to a stream based sequencer.

To get the latest version running do:

git clone -b hf_chain_reset https://github.com/catkira/ocra.git

cd ocra

git submodule update --recursive --remote

cd ..

git clone -b reset_instruction https://github.com/catkira/ocra-pulseq

git clone -b shim-interface https://github.com/catkira/marcos_client

git clone -b hf_chain_reset https://github.com/catkira/marcos_extras.git


To compile the HDL sources do: (not necessary if bit files from marcos_extras are used)
- install Vivado on Linux (at least 2019.2)
- go into ocra/HDL
- parse settings64-Vitis.sh
- type "make", this will create a .bit file for the fpga

To run the loopback test do:
- go into marcos_extras
- run marcos_setup_bm.sh with correct arguments
- install python3 your host pc
- edit marcos_client/local_config.py 
- run loopback_test.py
