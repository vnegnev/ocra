This project still has many shortcomings and is therefor not continued here.
The last thing that has been fixed is a jitter issue that was caused by the hf chain being not properly reset

Remaining issues are:
- can only run very short sequences
- sometimes samples get lost, because sequencer can only be programmed to sample for a certain duration

Ocra development won't continue here. We switched to a stream based sequencer.

To get the latest version running do:

git clone https://github.com/catkira/ocra.git

cd ocra

git checkout hf_chain_reset

git submodule update --recursive --remote

cd ..

git clone https://github.com/catkira/ocra-pulseq

git checkout reset_instruction

cd ..

git clone https://github.com/catkira/marcos_client

git checkout shim-interface

cd ..

git clone https://github.com/catkira/marcos_extras.git

git checkout vn/scratch

To compile the HDL sources do:
- install Vivado on Linux
- go into ocra/HDL
- type "make", this will create a .bit file for the fpga

To run the loopback test do:
- go into marcos_extras
- run marcos_setup_bm.sh with correct arguments
- install python3 your host pc
- edit marcos_client/local_config.py 
- run loopback_test.py
