//-----------------------------------------------------------------------------
// Title         : AXI DAC SPI sequencer testbench
// Project       : ocra
//-----------------------------------------------------------------------------
// File          : axi_dac_spi_sequencer_tb.v
// Author        :   <vnegnev>
// Created       : 31.08.2019
// Last modified : 31.08.2019
//-----------------------------------------------------------------------------
// Description :
//
// Testbench for 09/2019 version of AXI DAC sequencer code, including
// a simple model of the DAC
//
// Written for use with Icarus Verilog + GTKWave but should work with
// isim
//
// TODO incorporate a BRAM model and SPI DAC models into a higher-level testbench
//------------------------------------------------------------------------------
// Modification history :
// 31.08.2019 : created
//-----------------------------------------------------------------------------

`ifndef _AXI_DAC_SPI_SEQUENCER_TB_
 `define _AXI_DAC_SPI_SEQUENCER_TB_

`ifndef _AXI_DAC_SPI_SEQUENCER_
 `include "axi_dac_spi_sequencer.v"
`endif

 `timescale 1ns/1ns

module axi_dac_spi_sequencer_tb;
   parameter C_S_AXI_DATA_WIDTH = 32;
   parameter C_S_AXI_ADDR_WIDTH = 16;
   parameter BRAM_ADDR_WIDTH = 14;
   parameter BRAM_DATA_WIDTH = 32;
   parameter CONTINUOUS = "FALSE";

   // A few definitions for convenience
   reg 			      clk;
   reg 			      rst_n;
   reg 			      err; // bus error monitoring

   // For now, clocks/resets in both clock domains are equal
   // TODO: make more realistic based on true Vivado clock/reset connections
   wire 		      S_AXI_ACLK = clk;
   wire 		      aclk = clk;
   wire 		      S_AXI_ARESETN = rst_n;
   wire 		      aresetn = rst_n;

   /*AUTOREGINPUT*/
   // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
   reg [C_S_AXI_ADDR_WIDTH-1:0] S_AXI_ARADDR;	// To UUT of axi_dac_spi_sequencer.v
   reg [2:0]		S_AXI_ARPROT;		// To UUT of axi_dac_spi_sequencer.v
   reg			S_AXI_ARVALID;		// To UUT of axi_dac_spi_sequencer.v
   reg [C_S_AXI_ADDR_WIDTH-1:0] S_AXI_AWADDR;	// To UUT of axi_dac_spi_sequencer.v
   reg [2:0]		S_AXI_AWPROT;		// To UUT of axi_dac_spi_sequencer.v
   reg			S_AXI_AWVALID;		// To UUT of axi_dac_spi_sequencer.v
   reg			S_AXI_BREADY;		// To UUT of axi_dac_spi_sequencer.v
   reg			S_AXI_RREADY;		// To UUT of axi_dac_spi_sequencer.v
   reg [C_S_AXI_DATA_WIDTH-1:0] S_AXI_WDATA;	// To UUT of axi_dac_spi_sequencer.v
   reg [(C_S_AXI_DATA_WIDTH/8)-1:0] S_AXI_WSTRB;// To UUT of axi_dac_spi_sequencer.v
   reg			S_AXI_WVALID;		// To UUT of axi_dac_spi_sequencer.v
   reg [BRAM_DATA_WIDTH-1:0] bram_portx_rddata;	// To UUT of axi_dac_spi_sequencer.v
   reg [BRAM_DATA_WIDTH-1:0] bram_porty_rddata;	// To UUT of axi_dac_spi_sequencer.v
   reg [BRAM_DATA_WIDTH-1:0] bram_portz_rddata;	// To UUT of axi_dac_spi_sequencer.v
   reg [BRAM_ADDR_WIDTH-1:0] cfg_data;		// To UUT of axi_dac_spi_sequencer.v
   reg [BRAM_ADDR_WIDTH-1:0] current_offset;	// To UUT of axi_dac_spi_sequencer.v
   // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			S_AXI_ARREADY;		// From UUT of axi_dac_spi_sequencer.v
   wire			S_AXI_AWREADY;		// From UUT of axi_dac_spi_sequencer.v
   wire [1:0]		S_AXI_BRESP;		// From UUT of axi_dac_spi_sequencer.v
   wire			S_AXI_BVALID;		// From UUT of axi_dac_spi_sequencer.v
   wire [C_S_AXI_DATA_WIDTH-1:0] S_AXI_RDATA;	// From UUT of axi_dac_spi_sequencer.v
   wire [1:0]		S_AXI_RRESP;		// From UUT of axi_dac_spi_sequencer.v
   wire			S_AXI_RVALID;		// From UUT of axi_dac_spi_sequencer.v
   wire			S_AXI_WREADY;		// From UUT of axi_dac_spi_sequencer.v
   wire [BRAM_ADDR_WIDTH-1:0] bram_portx_addr;	// From UUT of axi_dac_spi_sequencer.v
   wire			bram_portx_clk;		// From UUT of axi_dac_spi_sequencer.v
   wire			bram_portx_rst;		// From UUT of axi_dac_spi_sequencer.v
   wire [BRAM_ADDR_WIDTH-1:0] bram_porty_addr;	// From UUT of axi_dac_spi_sequencer.v
   wire			bram_porty_clk;		// From UUT of axi_dac_spi_sequencer.v
   wire			bram_porty_rst;		// From UUT of axi_dac_spi_sequencer.v
   wire [BRAM_ADDR_WIDTH-1:0] bram_portz_addr;	// From UUT of axi_dac_spi_sequencer.v
   wire			bram_portz_clk;		// From UUT of axi_dac_spi_sequencer.v
   wire			bram_portz_rst;		// From UUT of axi_dac_spi_sequencer.v
   wire			spi_clk;		// From UUT of axi_dac_spi_sequencer.v
   wire			spi_clrn;		// From UUT of axi_dac_spi_sequencer.v
   wire			spi_ldacn;		// From UUT of axi_dac_spi_sequencer.v
   wire			spi_sdox;		// From UUT of axi_dac_spi_sequencer.v
   wire			spi_sdoy;		// From UUT of axi_dac_spi_sequencer.v
   wire			spi_sdoz;		// From UUT of axi_dac_spi_sequencer.v
   wire			spi_syncn;		// From UUT of axi_dac_spi_sequencer.v
   wire [BRAM_ADDR_WIDTH-1:0] sts_data;		// From UUT of axi_dac_spi_sequencer.v
   // End of automatics

   // Clock generation (100 MHz for convenience)
   always #5 clk = !clk;

   initial begin
      $dumpfile("icarus_compile/000_axi_dac_spi_sequencer_tb.lxt");
      $dumpvars(0, axi_dac_spi_sequencer_tb);      

      // Initialising all registers
      clk = 1;
      rst_n = 1;

      S_AXI_ARADDR = 0;
      S_AXI_ARPROT = 0;
      S_AXI_ARVALID = 0;
      S_AXI_AWADDR = 0;
      S_AXI_AWPROT = 0;
      S_AXI_AWVALID = 0;
      S_AXI_BREADY = 0;
      S_AXI_RREADY = 0;
      S_AXI_WDATA = 0;
      S_AXI_WSTRB = 0;
      S_AXI_WVALID = 0;

      bram_portx_rddata = 0;
      bram_porty_rddata = 0;
      bram_portz_rddata = 0;
      cfg_data = 0;
      current_offset = 0;

      // manual reset of the core
      #7 rst_n = 0; // slight offset to occur visibly before a clock edge in simulation
      // (makes understanding what's happening on a waveform viewer easier!)
      
      #10 rst_n = 1;

      // Tests begin
      #20 bram_portx_rddata = 'h1234;
      bram_porty_rddata = 'h5678;
      bram_portz_rddata = 'h9abc;

      #100000 if (err) $display("THERE WERE ERRORS");
      else $display("Testbench detected no errors.");      
      $finish;
   end   
      

   // Tasks for reading and writing AXI bus

   task wr32; //write to bus
      input [31:0] addr;
      input [31:0] data;
      begin
         #10 S_AXI_WDATA = data;
         S_AXI_AWADDR = addr;
         S_AXI_AWVALID = 1;
         S_AXI_WVALID = 1;
         fork
         begin: wait_axi_write
            wait(S_AXI_AWREADY && S_AXI_WREADY);
            disable axi_write_timeout;
         end
         begin: axi_write_timeout
            // TODO: #10000 disable wait_axi_write;
         end
         join
         #13 S_AXI_AWVALID = 0;
         S_AXI_WVALID = 0;
      end
   endtask // wr32

   task rd32; //read from bus
      input [31:0] addr;
      input [31:0] expected;
      begin
         #10 S_AXI_ARVALID = 1;
         S_AXI_ARADDR = addr;
         wait(S_AXI_ARREADY);
         #13 S_AXI_ARVALID = 0;
         wait(S_AXI_RVALID);
         #13 if (expected !== S_AXI_RDATA) begin
            $display("%d ns: Bus read error, address %x, expected output %x, read %x.",
		     $time, addr, expected, S_AXI_RDATA);
            err <= 1'd1;
         end
         S_AXI_RREADY = 1;
         S_AXI_ARVALID = 0;
         #10 S_AXI_RREADY = 0;
      end
   endtask // rd32

   
   axi_dac_spi_sequencer #(/*AUTOINSTPARAM*/
			   // Parameters
			   .C_S_AXI_DATA_WIDTH	(C_S_AXI_DATA_WIDTH),
			   .C_S_AXI_ADDR_WIDTH	(C_S_AXI_ADDR_WIDTH),
			   .BRAM_DATA_WIDTH	(BRAM_DATA_WIDTH),
			   .BRAM_ADDR_WIDTH	(BRAM_ADDR_WIDTH),
			   .CONTINUOUS		(CONTINUOUS)) 
   UUT (/*AUTOINST*/
	// Outputs
	.sts_data			(sts_data[BRAM_ADDR_WIDTH-1:0]),
	.bram_portx_clk			(bram_portx_clk),
	.bram_portx_rst			(bram_portx_rst),
	.bram_portx_addr		(bram_portx_addr[BRAM_ADDR_WIDTH-1:0]),
	.bram_porty_clk			(bram_porty_clk),
	.bram_porty_rst			(bram_porty_rst),
	.bram_porty_addr		(bram_porty_addr[BRAM_ADDR_WIDTH-1:0]),
	.bram_portz_clk			(bram_portz_clk),
	.bram_portz_rst			(bram_portz_rst),
	.bram_portz_addr		(bram_portz_addr[BRAM_ADDR_WIDTH-1:0]),
	.spi_clk			(spi_clk),
	.spi_sdox			(spi_sdox),
	.spi_sdoy			(spi_sdoy),
	.spi_sdoz			(spi_sdoz),
	.spi_ldacn			(spi_ldacn),
	.spi_clrn			(spi_clrn),
	.spi_syncn			(spi_syncn),
	.S_AXI_AWREADY			(S_AXI_AWREADY),
	.S_AXI_WREADY			(S_AXI_WREADY),
	.S_AXI_BRESP			(S_AXI_BRESP[1:0]),
	.S_AXI_BVALID			(S_AXI_BVALID),
	.S_AXI_ARREADY			(S_AXI_ARREADY),
	.S_AXI_RDATA			(S_AXI_RDATA[C_S_AXI_DATA_WIDTH-1:0]),
	.S_AXI_RRESP			(S_AXI_RRESP[1:0]),
	.S_AXI_RVALID			(S_AXI_RVALID),
	// Inputs
	.aclk				(aclk),
	.aresetn			(aresetn),
	.cfg_data			(cfg_data[BRAM_ADDR_WIDTH-1:0]),
	.current_offset			(current_offset[BRAM_ADDR_WIDTH-1:0]),
	.bram_portx_rddata		(bram_portx_rddata[BRAM_DATA_WIDTH-1:0]),
	.bram_porty_rddata		(bram_porty_rddata[BRAM_DATA_WIDTH-1:0]),
	.bram_portz_rddata		(bram_portz_rddata[BRAM_DATA_WIDTH-1:0]),
	.S_AXI_ACLK			(S_AXI_ACLK),
	.S_AXI_ARESETN			(S_AXI_ARESETN),
	.S_AXI_AWADDR			(S_AXI_AWADDR[C_S_AXI_ADDR_WIDTH-1:0]),
	.S_AXI_AWPROT			(S_AXI_AWPROT[2:0]),
	.S_AXI_AWVALID			(S_AXI_AWVALID),
	.S_AXI_WDATA			(S_AXI_WDATA[C_S_AXI_DATA_WIDTH-1:0]),
	.S_AXI_WSTRB			(S_AXI_WSTRB[(C_S_AXI_DATA_WIDTH/8)-1:0]),
	.S_AXI_WVALID			(S_AXI_WVALID),
	.S_AXI_BREADY			(S_AXI_BREADY),
	.S_AXI_ARADDR			(S_AXI_ARADDR[C_S_AXI_ADDR_WIDTH-1:0]),
	.S_AXI_ARPROT			(S_AXI_ARPROT[2:0]),
	.S_AXI_ARVALID			(S_AXI_ARVALID),
	.S_AXI_RREADY			(S_AXI_RREADY));

endmodule // axi_dac_spi_sequencer_tb

`endif //  `ifndef _AXI_DAC_SPI_SEQUENCER_TB_
