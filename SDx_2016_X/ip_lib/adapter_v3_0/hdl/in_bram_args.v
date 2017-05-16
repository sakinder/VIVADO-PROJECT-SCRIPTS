`timescale 1ns / 1ps

module in_bram_args (
    input acc_clk,
    input dm_clk,
    //control interface
    input aresetn,
    input acc_rstn,
    input in_bram_allow_in,
    input in_bram_allow_out,
    input acc_start,
    input acc_done,
    output [C_NUM_INPUT_BRAMs-1:0] in_bram_ready,
    output [C_NUM_INPUT_BRAMs-1:0] inout_bram_ready,
    //-----------------------------------------------------------
    //input AXI-Stream to FIFO interface 0
    input s_axis_bram_0_tlast,
    input s_axis_bram_0_tvalid,
    input [C_INPUT_BRAM_0_DMWIDTH/8-1:0] s_axis_bram_0_tkeep,
    input [C_INPUT_BRAM_0_DMWIDTH/8-1:0] s_axis_bram_0_tstrb,
    input [C_INPUT_BRAM_0_DMWIDTH-1:0] s_axis_bram_0_tdata,
    output s_axis_bram_0_tready,
    input [C_INPUT_BRAM_0_ADDR_WIDTH-1:0] ap_bram_0_addr0,
    input [C_INPUT_BRAM_0_WIDTH-1:0] ap_bram_0_din0,
    output [C_INPUT_BRAM_0_WIDTH-1:0] ap_bram_0_dout0,
    input [C_INPUT_BRAM_0_WIDTH/8-1:0] ap_bram_0_we0,
    input ap_bram_0_en0,
    input [C_INPUT_BRAM_0_ADDR_WIDTH-1:0] ap_bram_0_addr1,
    input [C_INPUT_BRAM_0_WIDTH-1:0] ap_bram_0_din1,
    output [C_INPUT_BRAM_0_WIDTH-1:0] ap_bram_0_dout1,
    input [C_INPUT_BRAM_0_WIDTH/8-1:0] ap_bram_0_we1,
    input ap_bram_0_en1,
    //input AXI-Stream to FIFO interface 1
    input s_axis_bram_1_tlast,
    input s_axis_bram_1_tvalid,
    input [C_INPUT_BRAM_1_DMWIDTH/8-1:0] s_axis_bram_1_tkeep,
    input [C_INPUT_BRAM_1_DMWIDTH/8-1:0] s_axis_bram_1_tstrb,
    input [C_INPUT_BRAM_1_DMWIDTH-1:0] s_axis_bram_1_tdata,
    output s_axis_bram_1_tready,
    input [C_INPUT_BRAM_1_ADDR_WIDTH-1:0] ap_bram_1_addr0,
    input [C_INPUT_BRAM_1_WIDTH-1:0] ap_bram_1_din0,
    output [C_INPUT_BRAM_1_WIDTH-1:0] ap_bram_1_dout0,
    input [C_INPUT_BRAM_1_WIDTH/8-1:0] ap_bram_1_we0,
    input ap_bram_1_en0,
    input [C_INPUT_BRAM_1_ADDR_WIDTH-1:0] ap_bram_1_addr1,
    input [C_INPUT_BRAM_1_WIDTH-1:0] ap_bram_1_din1,
    output [C_INPUT_BRAM_1_WIDTH-1:0] ap_bram_1_dout1,
    input [C_INPUT_BRAM_1_WIDTH/8-1:0] ap_bram_1_we1,
    input ap_bram_1_en1,
    //input AXI-Stream to FIFO interface 2
    input s_axis_bram_2_tlast,
    input s_axis_bram_2_tvalid,
    input [C_INPUT_BRAM_2_DMWIDTH/8-1:0] s_axis_bram_2_tkeep,
    input [C_INPUT_BRAM_2_DMWIDTH/8-1:0] s_axis_bram_2_tstrb,
    input [C_INPUT_BRAM_2_DMWIDTH-1:0] s_axis_bram_2_tdata,
    output s_axis_bram_2_tready,
    input [C_INPUT_BRAM_2_ADDR_WIDTH-1:0] ap_bram_2_addr0,
    input [C_INPUT_BRAM_2_WIDTH-1:0] ap_bram_2_din0,
    output [C_INPUT_BRAM_2_WIDTH-1:0] ap_bram_2_dout0,
    input [C_INPUT_BRAM_2_WIDTH/8-1:0] ap_bram_2_we0,
    input ap_bram_2_en0,
    input [C_INPUT_BRAM_2_ADDR_WIDTH-1:0] ap_bram_2_addr1,
    input [C_INPUT_BRAM_2_WIDTH-1:0] ap_bram_2_din1,
    output [C_INPUT_BRAM_2_WIDTH-1:0] ap_bram_2_dout1,
    input [C_INPUT_BRAM_2_WIDTH/8-1:0] ap_bram_2_we1,
    input ap_bram_2_en1,
    //input AXI-Stream to FIFO interface 3
    input s_axis_bram_3_tlast,
    input s_axis_bram_3_tvalid,
    input [C_INPUT_BRAM_3_DMWIDTH/8-1:0] s_axis_bram_3_tkeep,
    input [C_INPUT_BRAM_3_DMWIDTH/8-1:0] s_axis_bram_3_tstrb,
    input [C_INPUT_BRAM_3_DMWIDTH-1:0] s_axis_bram_3_tdata,
    output s_axis_bram_3_tready,
    input [C_INPUT_BRAM_3_ADDR_WIDTH-1:0] ap_bram_3_addr0,
    input [C_INPUT_BRAM_3_WIDTH-1:0] ap_bram_3_din0,
    output [C_INPUT_BRAM_3_WIDTH-1:0] ap_bram_3_dout0,
    input [C_INPUT_BRAM_3_WIDTH/8-1:0] ap_bram_3_we0,
    input ap_bram_3_en0,
    input [C_INPUT_BRAM_3_ADDR_WIDTH-1:0] ap_bram_3_addr1,
    input [C_INPUT_BRAM_3_WIDTH-1:0] ap_bram_3_din1,
    output [C_INPUT_BRAM_3_WIDTH-1:0] ap_bram_3_dout1,
    input [C_INPUT_BRAM_3_WIDTH/8-1:0] ap_bram_3_we1,
    input ap_bram_3_en1,
    //input AXI-Stream to FIFO interface 4
    input s_axis_bram_4_tlast,
    input s_axis_bram_4_tvalid,
    input [C_INPUT_BRAM_4_DMWIDTH/8-1:0] s_axis_bram_4_tkeep,
    input [C_INPUT_BRAM_4_DMWIDTH/8-1:0] s_axis_bram_4_tstrb,
    input [C_INPUT_BRAM_4_DMWIDTH-1:0] s_axis_bram_4_tdata,
    output s_axis_bram_4_tready,
    input [C_INPUT_BRAM_4_ADDR_WIDTH-1:0] ap_bram_4_addr0,
    input [C_INPUT_BRAM_4_WIDTH-1:0] ap_bram_4_din0,
    output [C_INPUT_BRAM_4_WIDTH-1:0] ap_bram_4_dout0,
    input [C_INPUT_BRAM_4_WIDTH/8-1:0] ap_bram_4_we0,
    input ap_bram_4_en0,
    input [C_INPUT_BRAM_4_ADDR_WIDTH-1:0] ap_bram_4_addr1,
    input [C_INPUT_BRAM_4_WIDTH-1:0] ap_bram_4_din1,
    output [C_INPUT_BRAM_4_WIDTH-1:0] ap_bram_4_dout1,
    input [C_INPUT_BRAM_4_WIDTH/8-1:0] ap_bram_4_we1,
    input ap_bram_4_en1,
    //input AXI-Stream to FIFO interface 5
    input s_axis_bram_5_tlast,
    input s_axis_bram_5_tvalid,
    input [C_INPUT_BRAM_5_DMWIDTH/8-1:0] s_axis_bram_5_tkeep,
    input [C_INPUT_BRAM_5_DMWIDTH/8-1:0] s_axis_bram_5_tstrb,
    input [C_INPUT_BRAM_5_DMWIDTH-1:0] s_axis_bram_5_tdata,
    output s_axis_bram_5_tready,
    input [C_INPUT_BRAM_5_ADDR_WIDTH-1:0] ap_bram_5_addr0,
    input [C_INPUT_BRAM_5_WIDTH-1:0] ap_bram_5_din0,
    output [C_INPUT_BRAM_5_WIDTH-1:0] ap_bram_5_dout0,
    input [C_INPUT_BRAM_5_WIDTH/8-1:0] ap_bram_5_we0,
    input ap_bram_5_en0,
    input [C_INPUT_BRAM_5_ADDR_WIDTH-1:0] ap_bram_5_addr1,
    input [C_INPUT_BRAM_5_WIDTH-1:0] ap_bram_5_din1,
    output [C_INPUT_BRAM_5_WIDTH-1:0] ap_bram_5_dout1,
    input [C_INPUT_BRAM_5_WIDTH/8-1:0] ap_bram_5_we1,
    input ap_bram_5_en1,
    //input AXI-Stream to FIFO interface 6
    input s_axis_bram_6_tlast,
    input s_axis_bram_6_tvalid,
    input [C_INPUT_BRAM_6_DMWIDTH/8-1:0] s_axis_bram_6_tkeep,
    input [C_INPUT_BRAM_6_DMWIDTH/8-1:0] s_axis_bram_6_tstrb,
    input [C_INPUT_BRAM_6_DMWIDTH-1:0] s_axis_bram_6_tdata,
    output s_axis_bram_6_tready,
    input [C_INPUT_BRAM_6_ADDR_WIDTH-1:0] ap_bram_6_addr0,
    input [C_INPUT_BRAM_6_WIDTH-1:0] ap_bram_6_din0,
    output [C_INPUT_BRAM_6_WIDTH-1:0] ap_bram_6_dout0,
    input [C_INPUT_BRAM_6_WIDTH/8-1:0] ap_bram_6_we0,
    input ap_bram_6_en0,
    input [C_INPUT_BRAM_6_ADDR_WIDTH-1:0] ap_bram_6_addr1,
    input [C_INPUT_BRAM_6_WIDTH-1:0] ap_bram_6_din1,
    output [C_INPUT_BRAM_6_WIDTH-1:0] ap_bram_6_dout1,
    input [C_INPUT_BRAM_6_WIDTH/8-1:0] ap_bram_6_we1,
    input ap_bram_6_en1,
    //input AXI-Stream to FIFO interface 7
    input s_axis_bram_7_tlast,
    input s_axis_bram_7_tvalid,
    input [C_INPUT_BRAM_7_DMWIDTH/8-1:0] s_axis_bram_7_tkeep,
    input [C_INPUT_BRAM_7_DMWIDTH/8-1:0] s_axis_bram_7_tstrb,
    input [C_INPUT_BRAM_7_DMWIDTH-1:0] s_axis_bram_7_tdata,
    output s_axis_bram_7_tready,
    input [C_INPUT_BRAM_7_ADDR_WIDTH-1:0] ap_bram_7_addr0,
    input [C_INPUT_BRAM_7_WIDTH-1:0] ap_bram_7_din0,
    output [C_INPUT_BRAM_7_WIDTH-1:0] ap_bram_7_dout0,
    input [C_INPUT_BRAM_7_WIDTH/8-1:0] ap_bram_7_we0,
    input ap_bram_7_en0,
    input [C_INPUT_BRAM_7_ADDR_WIDTH-1:0] ap_bram_7_addr1,
    input [C_INPUT_BRAM_7_WIDTH-1:0] ap_bram_7_din1,
    output [C_INPUT_BRAM_7_WIDTH-1:0] ap_bram_7_dout1,
    input [C_INPUT_BRAM_7_WIDTH/8-1:0] ap_bram_7_we1,
    input ap_bram_7_en1,
    //input AXI-Stream to FIFO interface 8
    input s_axis_bram_8_tlast,
    input s_axis_bram_8_tvalid,
    input [C_INPUT_BRAM_8_DMWIDTH/8-1:0] s_axis_bram_8_tkeep,
    input [C_INPUT_BRAM_8_DMWIDTH/8-1:0] s_axis_bram_8_tstrb,
    input [C_INPUT_BRAM_8_DMWIDTH-1:0] s_axis_bram_8_tdata,
    output s_axis_bram_8_tready,
    input [C_INPUT_BRAM_8_ADDR_WIDTH-1:0] ap_bram_8_addr0,
    input [C_INPUT_BRAM_8_WIDTH-1:0] ap_bram_8_din0,
    output [C_INPUT_BRAM_8_WIDTH-1:0] ap_bram_8_dout0,
    input [C_INPUT_BRAM_8_WIDTH/8-1:0] ap_bram_8_we0,
    input ap_bram_8_en0,
    input [C_INPUT_BRAM_8_ADDR_WIDTH-1:0] ap_bram_8_addr1,
    input [C_INPUT_BRAM_8_WIDTH-1:0] ap_bram_8_din1,
    output [C_INPUT_BRAM_8_WIDTH-1:0] ap_bram_8_dout1,
    input [C_INPUT_BRAM_8_WIDTH/8-1:0] ap_bram_8_we1,
    input ap_bram_8_en1,
    //input AXI-Stream to FIFO interface 9
    input s_axis_bram_9_tlast,
    input s_axis_bram_9_tvalid,
    input [C_INPUT_BRAM_9_DMWIDTH/8-1:0] s_axis_bram_9_tkeep,
    input [C_INPUT_BRAM_9_DMWIDTH/8-1:0] s_axis_bram_9_tstrb,
    input [C_INPUT_BRAM_9_DMWIDTH-1:0] s_axis_bram_9_tdata,
    output s_axis_bram_9_tready,
    input [C_INPUT_BRAM_9_ADDR_WIDTH-1:0] ap_bram_9_addr0,
    input [C_INPUT_BRAM_9_WIDTH-1:0] ap_bram_9_din0,
    output [C_INPUT_BRAM_9_WIDTH-1:0] ap_bram_9_dout0,
    input [C_INPUT_BRAM_9_WIDTH/8-1:0] ap_bram_9_we0,
    input ap_bram_9_en0,
    input [C_INPUT_BRAM_9_ADDR_WIDTH-1:0] ap_bram_9_addr1,
    input [C_INPUT_BRAM_9_WIDTH-1:0] ap_bram_9_din1,
    output [C_INPUT_BRAM_9_WIDTH-1:0] ap_bram_9_dout1,
    input [C_INPUT_BRAM_9_WIDTH/8-1:0] ap_bram_9_we1,
    input ap_bram_9_en1,
    //input AXI-Stream to FIFO interface 10
    input s_axis_bram_10_tlast,
    input s_axis_bram_10_tvalid,
    input [C_INPUT_BRAM_10_DMWIDTH/8-1:0] s_axis_bram_10_tkeep,
    input [C_INPUT_BRAM_10_DMWIDTH/8-1:0] s_axis_bram_10_tstrb,
    input [C_INPUT_BRAM_10_DMWIDTH-1:0] s_axis_bram_10_tdata,
    output s_axis_bram_10_tready,
    input [C_INPUT_BRAM_10_ADDR_WIDTH-1:0] ap_bram_10_addr0,
    input [C_INPUT_BRAM_10_WIDTH-1:0] ap_bram_10_din0,
    output [C_INPUT_BRAM_10_WIDTH-1:0] ap_bram_10_dout0,
    input [C_INPUT_BRAM_10_WIDTH/8-1:0] ap_bram_10_we0,
    input ap_bram_10_en0,
    input [C_INPUT_BRAM_10_ADDR_WIDTH-1:0] ap_bram_10_addr1,
    input [C_INPUT_BRAM_10_WIDTH-1:0] ap_bram_10_din1,
    output [C_INPUT_BRAM_10_WIDTH-1:0] ap_bram_10_dout1,
    input [C_INPUT_BRAM_10_WIDTH/8-1:0] ap_bram_10_we1,
    input ap_bram_10_en1,
    //input AXI-Stream to FIFO interface 11
    input s_axis_bram_11_tlast,
    input s_axis_bram_11_tvalid,
    input [C_INPUT_BRAM_11_DMWIDTH/8-1:0] s_axis_bram_11_tkeep,
    input [C_INPUT_BRAM_11_DMWIDTH/8-1:0] s_axis_bram_11_tstrb,
    input [C_INPUT_BRAM_11_DMWIDTH-1:0] s_axis_bram_11_tdata,
    output s_axis_bram_11_tready,
    input [C_INPUT_BRAM_11_ADDR_WIDTH-1:0] ap_bram_11_addr0,
    input [C_INPUT_BRAM_11_WIDTH-1:0] ap_bram_11_din0,
    output [C_INPUT_BRAM_11_WIDTH-1:0] ap_bram_11_dout0,
    input [C_INPUT_BRAM_11_WIDTH/8-1:0] ap_bram_11_we0,
    input ap_bram_11_en0,
    input [C_INPUT_BRAM_11_ADDR_WIDTH-1:0] ap_bram_11_addr1,
    input [C_INPUT_BRAM_11_WIDTH-1:0] ap_bram_11_din1,
    output [C_INPUT_BRAM_11_WIDTH-1:0] ap_bram_11_dout1,
    input [C_INPUT_BRAM_11_WIDTH/8-1:0] ap_bram_11_we1,
    input ap_bram_11_en1,
    //input AXI-Stream to FIFO interface 12
    input s_axis_bram_12_tlast,
    input s_axis_bram_12_tvalid,
    input [C_INPUT_BRAM_12_DMWIDTH/8-1:0] s_axis_bram_12_tkeep,
    input [C_INPUT_BRAM_12_DMWIDTH/8-1:0] s_axis_bram_12_tstrb,
    input [C_INPUT_BRAM_12_DMWIDTH-1:0] s_axis_bram_12_tdata,
    output s_axis_bram_12_tready,
    input [C_INPUT_BRAM_12_ADDR_WIDTH-1:0] ap_bram_12_addr0,
    input [C_INPUT_BRAM_12_WIDTH-1:0] ap_bram_12_din0,
    output [C_INPUT_BRAM_12_WIDTH-1:0] ap_bram_12_dout0,
    input [C_INPUT_BRAM_12_WIDTH/8-1:0] ap_bram_12_we0,
    input ap_bram_12_en0,
    input [C_INPUT_BRAM_12_ADDR_WIDTH-1:0] ap_bram_12_addr1,
    input [C_INPUT_BRAM_12_WIDTH-1:0] ap_bram_12_din1,
    output [C_INPUT_BRAM_12_WIDTH-1:0] ap_bram_12_dout1,
    input [C_INPUT_BRAM_12_WIDTH/8-1:0] ap_bram_12_we1,
    input ap_bram_12_en1,
    //input AXI-Stream to FIFO interface 13
    input s_axis_bram_13_tlast,
    input s_axis_bram_13_tvalid,
    input [C_INPUT_BRAM_13_DMWIDTH/8-1:0] s_axis_bram_13_tkeep,
    input [C_INPUT_BRAM_13_DMWIDTH/8-1:0] s_axis_bram_13_tstrb,
    input [C_INPUT_BRAM_13_DMWIDTH-1:0] s_axis_bram_13_tdata,
    output s_axis_bram_13_tready,
    input [C_INPUT_BRAM_13_ADDR_WIDTH-1:0] ap_bram_13_addr0,
    input [C_INPUT_BRAM_13_WIDTH-1:0] ap_bram_13_din0,
    output [C_INPUT_BRAM_13_WIDTH-1:0] ap_bram_13_dout0,
    input [C_INPUT_BRAM_13_WIDTH/8-1:0] ap_bram_13_we0,
    input ap_bram_13_en0,
    input [C_INPUT_BRAM_13_ADDR_WIDTH-1:0] ap_bram_13_addr1,
    input [C_INPUT_BRAM_13_WIDTH-1:0] ap_bram_13_din1,
    output [C_INPUT_BRAM_13_WIDTH-1:0] ap_bram_13_dout1,
    input [C_INPUT_BRAM_13_WIDTH/8-1:0] ap_bram_13_we1,
    input ap_bram_13_en1,
    //input AXI-Stream to FIFO interface 14
    input s_axis_bram_14_tlast,
    input s_axis_bram_14_tvalid,
    input [C_INPUT_BRAM_14_DMWIDTH/8-1:0] s_axis_bram_14_tkeep,
    input [C_INPUT_BRAM_14_DMWIDTH/8-1:0] s_axis_bram_14_tstrb,
    input [C_INPUT_BRAM_14_DMWIDTH-1:0] s_axis_bram_14_tdata,
    output s_axis_bram_14_tready,
    input [C_INPUT_BRAM_14_ADDR_WIDTH-1:0] ap_bram_14_addr0,
    input [C_INPUT_BRAM_14_WIDTH-1:0] ap_bram_14_din0,
    output [C_INPUT_BRAM_14_WIDTH-1:0] ap_bram_14_dout0,
    input [C_INPUT_BRAM_14_WIDTH/8-1:0] ap_bram_14_we0,
    input ap_bram_14_en0,
    input [C_INPUT_BRAM_14_ADDR_WIDTH-1:0] ap_bram_14_addr1,
    input [C_INPUT_BRAM_14_WIDTH-1:0] ap_bram_14_din1,
    output [C_INPUT_BRAM_14_WIDTH-1:0] ap_bram_14_dout1,
    input [C_INPUT_BRAM_14_WIDTH/8-1:0] ap_bram_14_we1,
    input ap_bram_14_en1,
    //input AXI-Stream to FIFO interface 15
    input s_axis_bram_15_tlast,
    input s_axis_bram_15_tvalid,
    input [C_INPUT_BRAM_15_DMWIDTH/8-1:0] s_axis_bram_15_tkeep,
    input [C_INPUT_BRAM_15_DMWIDTH/8-1:0] s_axis_bram_15_tstrb,
    input [C_INPUT_BRAM_15_DMWIDTH-1:0] s_axis_bram_15_tdata,
    output s_axis_bram_15_tready,
    input [C_INPUT_BRAM_15_ADDR_WIDTH-1:0] ap_bram_15_addr0,
    input [C_INPUT_BRAM_15_WIDTH-1:0] ap_bram_15_din0,
    output [C_INPUT_BRAM_15_WIDTH-1:0] ap_bram_15_dout0,
    input [C_INPUT_BRAM_15_WIDTH/8-1:0] ap_bram_15_we0,
    input ap_bram_15_en0,
    input [C_INPUT_BRAM_15_ADDR_WIDTH-1:0] ap_bram_15_addr1,
    input [C_INPUT_BRAM_15_WIDTH-1:0] ap_bram_15_din1,
    output [C_INPUT_BRAM_15_WIDTH-1:0] ap_bram_15_dout1,
    input [C_INPUT_BRAM_15_WIDTH/8-1:0] ap_bram_15_we1,
    input ap_bram_15_en1,
    //input AXI-Stream to FIFO interface 16
    input s_axis_bram_16_tlast,
    input s_axis_bram_16_tvalid,
    input [C_INPUT_BRAM_16_DMWIDTH/8-1:0] s_axis_bram_16_tkeep,
    input [C_INPUT_BRAM_16_DMWIDTH/8-1:0] s_axis_bram_16_tstrb,
    input [C_INPUT_BRAM_16_DMWIDTH-1:0] s_axis_bram_16_tdata,
    output s_axis_bram_16_tready,
    input [C_INPUT_BRAM_16_ADDR_WIDTH-1:0] ap_bram_16_addr0,
    input [C_INPUT_BRAM_16_WIDTH-1:0] ap_bram_16_din0,
    output [C_INPUT_BRAM_16_WIDTH-1:0] ap_bram_16_dout0,
    input [C_INPUT_BRAM_16_WIDTH/8-1:0] ap_bram_16_we0,
    input ap_bram_16_en0,
    input [C_INPUT_BRAM_16_ADDR_WIDTH-1:0] ap_bram_16_addr1,
    input [C_INPUT_BRAM_16_WIDTH-1:0] ap_bram_16_din1,
    output [C_INPUT_BRAM_16_WIDTH-1:0] ap_bram_16_dout1,
    input [C_INPUT_BRAM_16_WIDTH/8-1:0] ap_bram_16_we1,
    input ap_bram_16_en1,
    //input AXI-Stream to FIFO interface 17
    input s_axis_bram_17_tlast,
    input s_axis_bram_17_tvalid,
    input [C_INPUT_BRAM_17_DMWIDTH/8-1:0] s_axis_bram_17_tkeep,
    input [C_INPUT_BRAM_17_DMWIDTH/8-1:0] s_axis_bram_17_tstrb,
    input [C_INPUT_BRAM_17_DMWIDTH-1:0] s_axis_bram_17_tdata,
    output s_axis_bram_17_tready,
    input [C_INPUT_BRAM_17_ADDR_WIDTH-1:0] ap_bram_17_addr0,
    input [C_INPUT_BRAM_17_WIDTH-1:0] ap_bram_17_din0,
    output [C_INPUT_BRAM_17_WIDTH-1:0] ap_bram_17_dout0,
    input [C_INPUT_BRAM_17_WIDTH/8-1:0] ap_bram_17_we0,
    input ap_bram_17_en0,
    input [C_INPUT_BRAM_17_ADDR_WIDTH-1:0] ap_bram_17_addr1,
    input [C_INPUT_BRAM_17_WIDTH-1:0] ap_bram_17_din1,
    output [C_INPUT_BRAM_17_WIDTH-1:0] ap_bram_17_dout1,
    input [C_INPUT_BRAM_17_WIDTH/8-1:0] ap_bram_17_we1,
    input ap_bram_17_en1,
    //input AXI-Stream to FIFO interface 18
    input s_axis_bram_18_tlast,
    input s_axis_bram_18_tvalid,
    input [C_INPUT_BRAM_18_DMWIDTH/8-1:0] s_axis_bram_18_tkeep,
    input [C_INPUT_BRAM_18_DMWIDTH/8-1:0] s_axis_bram_18_tstrb,
    input [C_INPUT_BRAM_18_DMWIDTH-1:0] s_axis_bram_18_tdata,
    output s_axis_bram_18_tready,
    input [C_INPUT_BRAM_18_ADDR_WIDTH-1:0] ap_bram_18_addr0,
    input [C_INPUT_BRAM_18_WIDTH-1:0] ap_bram_18_din0,
    output [C_INPUT_BRAM_18_WIDTH-1:0] ap_bram_18_dout0,
    input [C_INPUT_BRAM_18_WIDTH/8-1:0] ap_bram_18_we0,
    input ap_bram_18_en0,
    input [C_INPUT_BRAM_18_ADDR_WIDTH-1:0] ap_bram_18_addr1,
    input [C_INPUT_BRAM_18_WIDTH-1:0] ap_bram_18_din1,
    output [C_INPUT_BRAM_18_WIDTH-1:0] ap_bram_18_dout1,
    input [C_INPUT_BRAM_18_WIDTH/8-1:0] ap_bram_18_we1,
    input ap_bram_18_en1,
    //input AXI-Stream to FIFO interface 19
    input s_axis_bram_19_tlast,
    input s_axis_bram_19_tvalid,
    input [C_INPUT_BRAM_19_DMWIDTH/8-1:0] s_axis_bram_19_tkeep,
    input [C_INPUT_BRAM_19_DMWIDTH/8-1:0] s_axis_bram_19_tstrb,
    input [C_INPUT_BRAM_19_DMWIDTH-1:0] s_axis_bram_19_tdata,
    output s_axis_bram_19_tready,
    input [C_INPUT_BRAM_19_ADDR_WIDTH-1:0] ap_bram_19_addr0,
    input [C_INPUT_BRAM_19_WIDTH-1:0] ap_bram_19_din0,
    output [C_INPUT_BRAM_19_WIDTH-1:0] ap_bram_19_dout0,
    input [C_INPUT_BRAM_19_WIDTH/8-1:0] ap_bram_19_we0,
    input ap_bram_19_en0,
    input [C_INPUT_BRAM_19_ADDR_WIDTH-1:0] ap_bram_19_addr1,
    input [C_INPUT_BRAM_19_WIDTH-1:0] ap_bram_19_din1,
    output [C_INPUT_BRAM_19_WIDTH-1:0] ap_bram_19_dout1,
    input [C_INPUT_BRAM_19_WIDTH/8-1:0] ap_bram_19_we1,
    input ap_bram_19_en1,
    //input AXI-Stream to FIFO interface 20
    input s_axis_bram_20_tlast,
    input s_axis_bram_20_tvalid,
    input [C_INPUT_BRAM_20_DMWIDTH/8-1:0] s_axis_bram_20_tkeep,
    input [C_INPUT_BRAM_20_DMWIDTH/8-1:0] s_axis_bram_20_tstrb,
    input [C_INPUT_BRAM_20_DMWIDTH-1:0] s_axis_bram_20_tdata,
    output s_axis_bram_20_tready,
    input [C_INPUT_BRAM_20_ADDR_WIDTH-1:0] ap_bram_20_addr0,
    input [C_INPUT_BRAM_20_WIDTH-1:0] ap_bram_20_din0,
    output [C_INPUT_BRAM_20_WIDTH-1:0] ap_bram_20_dout0,
    input [C_INPUT_BRAM_20_WIDTH/8-1:0] ap_bram_20_we0,
    input ap_bram_20_en0,
    input [C_INPUT_BRAM_20_ADDR_WIDTH-1:0] ap_bram_20_addr1,
    input [C_INPUT_BRAM_20_WIDTH-1:0] ap_bram_20_din1,
    output [C_INPUT_BRAM_20_WIDTH-1:0] ap_bram_20_dout1,
    input [C_INPUT_BRAM_20_WIDTH/8-1:0] ap_bram_20_we1,
    input ap_bram_20_en1,
    //input AXI-Stream to FIFO interface 21
    input s_axis_bram_21_tlast,
    input s_axis_bram_21_tvalid,
    input [C_INPUT_BRAM_21_DMWIDTH/8-1:0] s_axis_bram_21_tkeep,
    input [C_INPUT_BRAM_21_DMWIDTH/8-1:0] s_axis_bram_21_tstrb,
    input [C_INPUT_BRAM_21_DMWIDTH-1:0] s_axis_bram_21_tdata,
    output s_axis_bram_21_tready,
    input [C_INPUT_BRAM_21_ADDR_WIDTH-1:0] ap_bram_21_addr0,
    input [C_INPUT_BRAM_21_WIDTH-1:0] ap_bram_21_din0,
    output [C_INPUT_BRAM_21_WIDTH-1:0] ap_bram_21_dout0,
    input [C_INPUT_BRAM_21_WIDTH/8-1:0] ap_bram_21_we0,
    input ap_bram_21_en0,
    input [C_INPUT_BRAM_21_ADDR_WIDTH-1:0] ap_bram_21_addr1,
    input [C_INPUT_BRAM_21_WIDTH-1:0] ap_bram_21_din1,
    output [C_INPUT_BRAM_21_WIDTH-1:0] ap_bram_21_dout1,
    input [C_INPUT_BRAM_21_WIDTH/8-1:0] ap_bram_21_we1,
    input ap_bram_21_en1,
    //input AXI-Stream to FIFO interface 22
    input s_axis_bram_22_tlast,
    input s_axis_bram_22_tvalid,
    input [C_INPUT_BRAM_22_DMWIDTH/8-1:0] s_axis_bram_22_tkeep,
    input [C_INPUT_BRAM_22_DMWIDTH/8-1:0] s_axis_bram_22_tstrb,
    input [C_INPUT_BRAM_22_DMWIDTH-1:0] s_axis_bram_22_tdata,
    output s_axis_bram_22_tready,
    input [C_INPUT_BRAM_22_ADDR_WIDTH-1:0] ap_bram_22_addr0,
    input [C_INPUT_BRAM_22_WIDTH-1:0] ap_bram_22_din0,
    output [C_INPUT_BRAM_22_WIDTH-1:0] ap_bram_22_dout0,
    input [C_INPUT_BRAM_22_WIDTH/8-1:0] ap_bram_22_we0,
    input ap_bram_22_en0,
    input [C_INPUT_BRAM_22_ADDR_WIDTH-1:0] ap_bram_22_addr1,
    input [C_INPUT_BRAM_22_WIDTH-1:0] ap_bram_22_din1,
    output [C_INPUT_BRAM_22_WIDTH-1:0] ap_bram_22_dout1,
    input [C_INPUT_BRAM_22_WIDTH/8-1:0] ap_bram_22_we1,
    input ap_bram_22_en1,
    //input AXI-Stream to FIFO interface 23
    input s_axis_bram_23_tlast,
    input s_axis_bram_23_tvalid,
    input [C_INPUT_BRAM_23_DMWIDTH/8-1:0] s_axis_bram_23_tkeep,
    input [C_INPUT_BRAM_23_DMWIDTH/8-1:0] s_axis_bram_23_tstrb,
    input [C_INPUT_BRAM_23_DMWIDTH-1:0] s_axis_bram_23_tdata,
    output s_axis_bram_23_tready,
    input [C_INPUT_BRAM_23_ADDR_WIDTH-1:0] ap_bram_23_addr0,
    input [C_INPUT_BRAM_23_WIDTH-1:0] ap_bram_23_din0,
    output [C_INPUT_BRAM_23_WIDTH-1:0] ap_bram_23_dout0,
    input [C_INPUT_BRAM_23_WIDTH/8-1:0] ap_bram_23_we0,
    input ap_bram_23_en0,
    input [C_INPUT_BRAM_23_ADDR_WIDTH-1:0] ap_bram_23_addr1,
    input [C_INPUT_BRAM_23_WIDTH-1:0] ap_bram_23_din1,
    output [C_INPUT_BRAM_23_WIDTH-1:0] ap_bram_23_dout1,
    input [C_INPUT_BRAM_23_WIDTH/8-1:0] ap_bram_23_we1,
    input ap_bram_23_en1,
    //input AXI-Stream to FIFO interface 24
    input s_axis_bram_24_tlast,
    input s_axis_bram_24_tvalid,
    input [C_INPUT_BRAM_24_DMWIDTH/8-1:0] s_axis_bram_24_tkeep,
    input [C_INPUT_BRAM_24_DMWIDTH/8-1:0] s_axis_bram_24_tstrb,
    input [C_INPUT_BRAM_24_DMWIDTH-1:0] s_axis_bram_24_tdata,
    output s_axis_bram_24_tready,
    input [C_INPUT_BRAM_24_ADDR_WIDTH-1:0] ap_bram_24_addr0,
    input [C_INPUT_BRAM_24_WIDTH-1:0] ap_bram_24_din0,
    output [C_INPUT_BRAM_24_WIDTH-1:0] ap_bram_24_dout0,
    input [C_INPUT_BRAM_24_WIDTH/8-1:0] ap_bram_24_we0,
    input ap_bram_24_en0,
    input [C_INPUT_BRAM_24_ADDR_WIDTH-1:0] ap_bram_24_addr1,
    input [C_INPUT_BRAM_24_WIDTH-1:0] ap_bram_24_din1,
    output [C_INPUT_BRAM_24_WIDTH-1:0] ap_bram_24_dout1,
    input [C_INPUT_BRAM_24_WIDTH/8-1:0] ap_bram_24_we1,
    input ap_bram_24_en1,
    //input AXI-Stream to FIFO interface 25
    input s_axis_bram_25_tlast,
    input s_axis_bram_25_tvalid,
    input [C_INPUT_BRAM_25_DMWIDTH/8-1:0] s_axis_bram_25_tkeep,
    input [C_INPUT_BRAM_25_DMWIDTH/8-1:0] s_axis_bram_25_tstrb,
    input [C_INPUT_BRAM_25_DMWIDTH-1:0] s_axis_bram_25_tdata,
    output s_axis_bram_25_tready,
    input [C_INPUT_BRAM_25_ADDR_WIDTH-1:0] ap_bram_25_addr0,
    input [C_INPUT_BRAM_25_WIDTH-1:0] ap_bram_25_din0,
    output [C_INPUT_BRAM_25_WIDTH-1:0] ap_bram_25_dout0,
    input [C_INPUT_BRAM_25_WIDTH/8-1:0] ap_bram_25_we0,
    input ap_bram_25_en0,
    input [C_INPUT_BRAM_25_ADDR_WIDTH-1:0] ap_bram_25_addr1,
    input [C_INPUT_BRAM_25_WIDTH-1:0] ap_bram_25_din1,
    output [C_INPUT_BRAM_25_WIDTH-1:0] ap_bram_25_dout1,
    input [C_INPUT_BRAM_25_WIDTH/8-1:0] ap_bram_25_we1,
    input ap_bram_25_en1,
    //input AXI-Stream to FIFO interface 26
    input s_axis_bram_26_tlast,
    input s_axis_bram_26_tvalid,
    input [C_INPUT_BRAM_26_DMWIDTH/8-1:0] s_axis_bram_26_tkeep,
    input [C_INPUT_BRAM_26_DMWIDTH/8-1:0] s_axis_bram_26_tstrb,
    input [C_INPUT_BRAM_26_DMWIDTH-1:0] s_axis_bram_26_tdata,
    output s_axis_bram_26_tready,
    input [C_INPUT_BRAM_26_ADDR_WIDTH-1:0] ap_bram_26_addr0,
    input [C_INPUT_BRAM_26_WIDTH-1:0] ap_bram_26_din0,
    output [C_INPUT_BRAM_26_WIDTH-1:0] ap_bram_26_dout0,
    input [C_INPUT_BRAM_26_WIDTH/8-1:0] ap_bram_26_we0,
    input ap_bram_26_en0,
    input [C_INPUT_BRAM_26_ADDR_WIDTH-1:0] ap_bram_26_addr1,
    input [C_INPUT_BRAM_26_WIDTH-1:0] ap_bram_26_din1,
    output [C_INPUT_BRAM_26_WIDTH-1:0] ap_bram_26_dout1,
    input [C_INPUT_BRAM_26_WIDTH/8-1:0] ap_bram_26_we1,
    input ap_bram_26_en1,
    //input AXI-Stream to FIFO interface 27
    input s_axis_bram_27_tlast,
    input s_axis_bram_27_tvalid,
    input [C_INPUT_BRAM_27_DMWIDTH/8-1:0] s_axis_bram_27_tkeep,
    input [C_INPUT_BRAM_27_DMWIDTH/8-1:0] s_axis_bram_27_tstrb,
    input [C_INPUT_BRAM_27_DMWIDTH-1:0] s_axis_bram_27_tdata,
    output s_axis_bram_27_tready,
    input [C_INPUT_BRAM_27_ADDR_WIDTH-1:0] ap_bram_27_addr0,
    input [C_INPUT_BRAM_27_WIDTH-1:0] ap_bram_27_din0,
    output [C_INPUT_BRAM_27_WIDTH-1:0] ap_bram_27_dout0,
    input [C_INPUT_BRAM_27_WIDTH/8-1:0] ap_bram_27_we0,
    input ap_bram_27_en0,
    input [C_INPUT_BRAM_27_ADDR_WIDTH-1:0] ap_bram_27_addr1,
    input [C_INPUT_BRAM_27_WIDTH-1:0] ap_bram_27_din1,
    output [C_INPUT_BRAM_27_WIDTH-1:0] ap_bram_27_dout1,
    input [C_INPUT_BRAM_27_WIDTH/8-1:0] ap_bram_27_we1,
    input ap_bram_27_en1,
    //input AXI-Stream to FIFO interface 28
    input s_axis_bram_28_tlast,
    input s_axis_bram_28_tvalid,
    input [C_INPUT_BRAM_28_DMWIDTH/8-1:0] s_axis_bram_28_tkeep,
    input [C_INPUT_BRAM_28_DMWIDTH/8-1:0] s_axis_bram_28_tstrb,
    input [C_INPUT_BRAM_28_DMWIDTH-1:0] s_axis_bram_28_tdata,
    output s_axis_bram_28_tready,
    input [C_INPUT_BRAM_28_ADDR_WIDTH-1:0] ap_bram_28_addr0,
    input [C_INPUT_BRAM_28_WIDTH-1:0] ap_bram_28_din0,
    output [C_INPUT_BRAM_28_WIDTH-1:0] ap_bram_28_dout0,
    input [C_INPUT_BRAM_28_WIDTH/8-1:0] ap_bram_28_we0,
    input ap_bram_28_en0,
    input [C_INPUT_BRAM_28_ADDR_WIDTH-1:0] ap_bram_28_addr1,
    input [C_INPUT_BRAM_28_WIDTH-1:0] ap_bram_28_din1,
    output [C_INPUT_BRAM_28_WIDTH-1:0] ap_bram_28_dout1,
    input [C_INPUT_BRAM_28_WIDTH/8-1:0] ap_bram_28_we1,
    input ap_bram_28_en1,
    //input AXI-Stream to FIFO interface 29
    input s_axis_bram_29_tlast,
    input s_axis_bram_29_tvalid,
    input [C_INPUT_BRAM_29_DMWIDTH/8-1:0] s_axis_bram_29_tkeep,
    input [C_INPUT_BRAM_29_DMWIDTH/8-1:0] s_axis_bram_29_tstrb,
    input [C_INPUT_BRAM_29_DMWIDTH-1:0] s_axis_bram_29_tdata,
    output s_axis_bram_29_tready,
    input [C_INPUT_BRAM_29_ADDR_WIDTH-1:0] ap_bram_29_addr0,
    input [C_INPUT_BRAM_29_WIDTH-1:0] ap_bram_29_din0,
    output [C_INPUT_BRAM_29_WIDTH-1:0] ap_bram_29_dout0,
    input [C_INPUT_BRAM_29_WIDTH/8-1:0] ap_bram_29_we0,
    input ap_bram_29_en0,
    input [C_INPUT_BRAM_29_ADDR_WIDTH-1:0] ap_bram_29_addr1,
    input [C_INPUT_BRAM_29_WIDTH-1:0] ap_bram_29_din1,
    output [C_INPUT_BRAM_29_WIDTH-1:0] ap_bram_29_dout1,
    input [C_INPUT_BRAM_29_WIDTH/8-1:0] ap_bram_29_we1,
    input ap_bram_29_en1,
    //input AXI-Stream to FIFO interface 30
    input s_axis_bram_30_tlast,
    input s_axis_bram_30_tvalid,
    input [C_INPUT_BRAM_30_DMWIDTH/8-1:0] s_axis_bram_30_tkeep,
    input [C_INPUT_BRAM_30_DMWIDTH/8-1:0] s_axis_bram_30_tstrb,
    input [C_INPUT_BRAM_30_DMWIDTH-1:0] s_axis_bram_30_tdata,
    output s_axis_bram_30_tready,
    input [C_INPUT_BRAM_30_ADDR_WIDTH-1:0] ap_bram_30_addr0,
    input [C_INPUT_BRAM_30_WIDTH-1:0] ap_bram_30_din0,
    output [C_INPUT_BRAM_30_WIDTH-1:0] ap_bram_30_dout0,
    input [C_INPUT_BRAM_30_WIDTH/8-1:0] ap_bram_30_we0,
    input ap_bram_30_en0,
    input [C_INPUT_BRAM_30_ADDR_WIDTH-1:0] ap_bram_30_addr1,
    input [C_INPUT_BRAM_30_WIDTH-1:0] ap_bram_30_din1,
    output [C_INPUT_BRAM_30_WIDTH-1:0] ap_bram_30_dout1,
    input [C_INPUT_BRAM_30_WIDTH/8-1:0] ap_bram_30_we1,
    input ap_bram_30_en1,
    //input AXI-Stream to FIFO interface 31
    input s_axis_bram_31_tlast,
    input s_axis_bram_31_tvalid,
    input [C_INPUT_BRAM_31_DMWIDTH/8-1:0] s_axis_bram_31_tkeep,
    input [C_INPUT_BRAM_31_DMWIDTH/8-1:0] s_axis_bram_31_tstrb,
    input [C_INPUT_BRAM_31_DMWIDTH-1:0] s_axis_bram_31_tdata,
    output s_axis_bram_31_tready,
    input [C_INPUT_BRAM_31_ADDR_WIDTH-1:0] ap_bram_31_addr0,
    input [C_INPUT_BRAM_31_WIDTH-1:0] ap_bram_31_din0,
    output [C_INPUT_BRAM_31_WIDTH-1:0] ap_bram_31_dout0,
    input [C_INPUT_BRAM_31_WIDTH/8-1:0] ap_bram_31_we0,
    input ap_bram_31_en0,
    input [C_INPUT_BRAM_31_ADDR_WIDTH-1:0] ap_bram_31_addr1,
    input [C_INPUT_BRAM_31_WIDTH-1:0] ap_bram_31_din1,
    output [C_INPUT_BRAM_31_WIDTH-1:0] ap_bram_31_dout1,
    input [C_INPUT_BRAM_31_WIDTH/8-1:0] ap_bram_31_we1,
    input ap_bram_31_en1,
    //input AXI-Stream to FIFO interface 32
    input s_axis_bram_32_tlast,
    input s_axis_bram_32_tvalid,
    input [C_INPUT_BRAM_32_DMWIDTH/8-1:0] s_axis_bram_32_tkeep,
    input [C_INPUT_BRAM_32_DMWIDTH/8-1:0] s_axis_bram_32_tstrb,
    input [C_INPUT_BRAM_32_DMWIDTH-1:0] s_axis_bram_32_tdata,
    output s_axis_bram_32_tready,
    input [C_INPUT_BRAM_32_ADDR_WIDTH-1:0] ap_bram_32_addr0,
    input [C_INPUT_BRAM_32_WIDTH-1:0] ap_bram_32_din0,
    output [C_INPUT_BRAM_32_WIDTH-1:0] ap_bram_32_dout0,
    input [C_INPUT_BRAM_32_WIDTH/8-1:0] ap_bram_32_we0,
    input ap_bram_32_en0,
    input [C_INPUT_BRAM_32_ADDR_WIDTH-1:0] ap_bram_32_addr1,
    input [C_INPUT_BRAM_32_WIDTH-1:0] ap_bram_32_din1,
    output [C_INPUT_BRAM_32_WIDTH-1:0] ap_bram_32_dout1,
    input [C_INPUT_BRAM_32_WIDTH/8-1:0] ap_bram_32_we1,
    input ap_bram_32_en1,
    //input AXI-Stream to FIFO interface 33
    input s_axis_bram_33_tlast,
    input s_axis_bram_33_tvalid,
    input [C_INPUT_BRAM_33_DMWIDTH/8-1:0] s_axis_bram_33_tkeep,
    input [C_INPUT_BRAM_33_DMWIDTH/8-1:0] s_axis_bram_33_tstrb,
    input [C_INPUT_BRAM_33_DMWIDTH-1:0] s_axis_bram_33_tdata,
    output s_axis_bram_33_tready,
    input [C_INPUT_BRAM_33_ADDR_WIDTH-1:0] ap_bram_33_addr0,
    input [C_INPUT_BRAM_33_WIDTH-1:0] ap_bram_33_din0,
    output [C_INPUT_BRAM_33_WIDTH-1:0] ap_bram_33_dout0,
    input [C_INPUT_BRAM_33_WIDTH/8-1:0] ap_bram_33_we0,
    input ap_bram_33_en0,
    input [C_INPUT_BRAM_33_ADDR_WIDTH-1:0] ap_bram_33_addr1,
    input [C_INPUT_BRAM_33_WIDTH-1:0] ap_bram_33_din1,
    output [C_INPUT_BRAM_33_WIDTH-1:0] ap_bram_33_dout1,
    input [C_INPUT_BRAM_33_WIDTH/8-1:0] ap_bram_33_we1,
    input ap_bram_33_en1,
    //input AXI-Stream to FIFO interface 34
    input s_axis_bram_34_tlast,
    input s_axis_bram_34_tvalid,
    input [C_INPUT_BRAM_34_DMWIDTH/8-1:0] s_axis_bram_34_tkeep,
    input [C_INPUT_BRAM_34_DMWIDTH/8-1:0] s_axis_bram_34_tstrb,
    input [C_INPUT_BRAM_34_DMWIDTH-1:0] s_axis_bram_34_tdata,
    output s_axis_bram_34_tready,
    input [C_INPUT_BRAM_34_ADDR_WIDTH-1:0] ap_bram_34_addr0,
    input [C_INPUT_BRAM_34_WIDTH-1:0] ap_bram_34_din0,
    output [C_INPUT_BRAM_34_WIDTH-1:0] ap_bram_34_dout0,
    input [C_INPUT_BRAM_34_WIDTH/8-1:0] ap_bram_34_we0,
    input ap_bram_34_en0,
    input [C_INPUT_BRAM_34_ADDR_WIDTH-1:0] ap_bram_34_addr1,
    input [C_INPUT_BRAM_34_WIDTH-1:0] ap_bram_34_din1,
    output [C_INPUT_BRAM_34_WIDTH-1:0] ap_bram_34_dout1,
    input [C_INPUT_BRAM_34_WIDTH/8-1:0] ap_bram_34_we1,
    input ap_bram_34_en1,
    //input AXI-Stream to FIFO interface 35
    input s_axis_bram_35_tlast,
    input s_axis_bram_35_tvalid,
    input [C_INPUT_BRAM_35_DMWIDTH/8-1:0] s_axis_bram_35_tkeep,
    input [C_INPUT_BRAM_35_DMWIDTH/8-1:0] s_axis_bram_35_tstrb,
    input [C_INPUT_BRAM_35_DMWIDTH-1:0] s_axis_bram_35_tdata,
    output s_axis_bram_35_tready,
    input [C_INPUT_BRAM_35_ADDR_WIDTH-1:0] ap_bram_35_addr0,
    input [C_INPUT_BRAM_35_WIDTH-1:0] ap_bram_35_din0,
    output [C_INPUT_BRAM_35_WIDTH-1:0] ap_bram_35_dout0,
    input [C_INPUT_BRAM_35_WIDTH/8-1:0] ap_bram_35_we0,
    input ap_bram_35_en0,
    input [C_INPUT_BRAM_35_ADDR_WIDTH-1:0] ap_bram_35_addr1,
    input [C_INPUT_BRAM_35_WIDTH-1:0] ap_bram_35_din1,
    output [C_INPUT_BRAM_35_WIDTH-1:0] ap_bram_35_dout1,
    input [C_INPUT_BRAM_35_WIDTH/8-1:0] ap_bram_35_we1,
    input ap_bram_35_en1,
    //input AXI-Stream to FIFO interface 36
    input s_axis_bram_36_tlast,
    input s_axis_bram_36_tvalid,
    input [C_INPUT_BRAM_36_DMWIDTH/8-1:0] s_axis_bram_36_tkeep,
    input [C_INPUT_BRAM_36_DMWIDTH/8-1:0] s_axis_bram_36_tstrb,
    input [C_INPUT_BRAM_36_DMWIDTH-1:0] s_axis_bram_36_tdata,
    output s_axis_bram_36_tready,
    input [C_INPUT_BRAM_36_ADDR_WIDTH-1:0] ap_bram_36_addr0,
    input [C_INPUT_BRAM_36_WIDTH-1:0] ap_bram_36_din0,
    output [C_INPUT_BRAM_36_WIDTH-1:0] ap_bram_36_dout0,
    input [C_INPUT_BRAM_36_WIDTH/8-1:0] ap_bram_36_we0,
    input ap_bram_36_en0,
    input [C_INPUT_BRAM_36_ADDR_WIDTH-1:0] ap_bram_36_addr1,
    input [C_INPUT_BRAM_36_WIDTH-1:0] ap_bram_36_din1,
    output [C_INPUT_BRAM_36_WIDTH-1:0] ap_bram_36_dout1,
    input [C_INPUT_BRAM_36_WIDTH/8-1:0] ap_bram_36_we1,
    input ap_bram_36_en1,
    //input AXI-Stream to FIFO interface 37
    input s_axis_bram_37_tlast,
    input s_axis_bram_37_tvalid,
    input [C_INPUT_BRAM_37_DMWIDTH/8-1:0] s_axis_bram_37_tkeep,
    input [C_INPUT_BRAM_37_DMWIDTH/8-1:0] s_axis_bram_37_tstrb,
    input [C_INPUT_BRAM_37_DMWIDTH-1:0] s_axis_bram_37_tdata,
    output s_axis_bram_37_tready,
    input [C_INPUT_BRAM_37_ADDR_WIDTH-1:0] ap_bram_37_addr0,
    input [C_INPUT_BRAM_37_WIDTH-1:0] ap_bram_37_din0,
    output [C_INPUT_BRAM_37_WIDTH-1:0] ap_bram_37_dout0,
    input [C_INPUT_BRAM_37_WIDTH/8-1:0] ap_bram_37_we0,
    input ap_bram_37_en0,
    input [C_INPUT_BRAM_37_ADDR_WIDTH-1:0] ap_bram_37_addr1,
    input [C_INPUT_BRAM_37_WIDTH-1:0] ap_bram_37_din1,
    output [C_INPUT_BRAM_37_WIDTH-1:0] ap_bram_37_dout1,
    input [C_INPUT_BRAM_37_WIDTH/8-1:0] ap_bram_37_we1,
    input ap_bram_37_en1,
    //input AXI-Stream to FIFO interface 38
    input s_axis_bram_38_tlast,
    input s_axis_bram_38_tvalid,
    input [C_INPUT_BRAM_38_DMWIDTH/8-1:0] s_axis_bram_38_tkeep,
    input [C_INPUT_BRAM_38_DMWIDTH/8-1:0] s_axis_bram_38_tstrb,
    input [C_INPUT_BRAM_38_DMWIDTH-1:0] s_axis_bram_38_tdata,
    output s_axis_bram_38_tready,
    input [C_INPUT_BRAM_38_ADDR_WIDTH-1:0] ap_bram_38_addr0,
    input [C_INPUT_BRAM_38_WIDTH-1:0] ap_bram_38_din0,
    output [C_INPUT_BRAM_38_WIDTH-1:0] ap_bram_38_dout0,
    input [C_INPUT_BRAM_38_WIDTH/8-1:0] ap_bram_38_we0,
    input ap_bram_38_en0,
    input [C_INPUT_BRAM_38_ADDR_WIDTH-1:0] ap_bram_38_addr1,
    input [C_INPUT_BRAM_38_WIDTH-1:0] ap_bram_38_din1,
    output [C_INPUT_BRAM_38_WIDTH-1:0] ap_bram_38_dout1,
    input [C_INPUT_BRAM_38_WIDTH/8-1:0] ap_bram_38_we1,
    input ap_bram_38_en1,
    //input AXI-Stream to FIFO interface 39
    input s_axis_bram_39_tlast,
    input s_axis_bram_39_tvalid,
    input [C_INPUT_BRAM_39_DMWIDTH/8-1:0] s_axis_bram_39_tkeep,
    input [C_INPUT_BRAM_39_DMWIDTH/8-1:0] s_axis_bram_39_tstrb,
    input [C_INPUT_BRAM_39_DMWIDTH-1:0] s_axis_bram_39_tdata,
    output s_axis_bram_39_tready,
    input [C_INPUT_BRAM_39_ADDR_WIDTH-1:0] ap_bram_39_addr0,
    input [C_INPUT_BRAM_39_WIDTH-1:0] ap_bram_39_din0,
    output [C_INPUT_BRAM_39_WIDTH-1:0] ap_bram_39_dout0,
    input [C_INPUT_BRAM_39_WIDTH/8-1:0] ap_bram_39_we0,
    input ap_bram_39_en0,
    input [C_INPUT_BRAM_39_ADDR_WIDTH-1:0] ap_bram_39_addr1,
    input [C_INPUT_BRAM_39_WIDTH-1:0] ap_bram_39_din1,
    output [C_INPUT_BRAM_39_WIDTH-1:0] ap_bram_39_dout1,
    input [C_INPUT_BRAM_39_WIDTH/8-1:0] ap_bram_39_we1,
    input ap_bram_39_en1,
    //input AXI-Stream to FIFO interface 40
    input s_axis_bram_40_tlast,
    input s_axis_bram_40_tvalid,
    input [C_INPUT_BRAM_40_DMWIDTH/8-1:0] s_axis_bram_40_tkeep,
    input [C_INPUT_BRAM_40_DMWIDTH/8-1:0] s_axis_bram_40_tstrb,
    input [C_INPUT_BRAM_40_DMWIDTH-1:0] s_axis_bram_40_tdata,
    output s_axis_bram_40_tready,
    input [C_INPUT_BRAM_40_ADDR_WIDTH-1:0] ap_bram_40_addr0,
    input [C_INPUT_BRAM_40_WIDTH-1:0] ap_bram_40_din0,
    output [C_INPUT_BRAM_40_WIDTH-1:0] ap_bram_40_dout0,
    input [C_INPUT_BRAM_40_WIDTH/8-1:0] ap_bram_40_we0,
    input ap_bram_40_en0,
    input [C_INPUT_BRAM_40_ADDR_WIDTH-1:0] ap_bram_40_addr1,
    input [C_INPUT_BRAM_40_WIDTH-1:0] ap_bram_40_din1,
    output [C_INPUT_BRAM_40_WIDTH-1:0] ap_bram_40_dout1,
    input [C_INPUT_BRAM_40_WIDTH/8-1:0] ap_bram_40_we1,
    input ap_bram_40_en1,
    //input AXI-Stream to FIFO interface 41
    input s_axis_bram_41_tlast,
    input s_axis_bram_41_tvalid,
    input [C_INPUT_BRAM_41_DMWIDTH/8-1:0] s_axis_bram_41_tkeep,
    input [C_INPUT_BRAM_41_DMWIDTH/8-1:0] s_axis_bram_41_tstrb,
    input [C_INPUT_BRAM_41_DMWIDTH-1:0] s_axis_bram_41_tdata,
    output s_axis_bram_41_tready,
    input [C_INPUT_BRAM_41_ADDR_WIDTH-1:0] ap_bram_41_addr0,
    input [C_INPUT_BRAM_41_WIDTH-1:0] ap_bram_41_din0,
    output [C_INPUT_BRAM_41_WIDTH-1:0] ap_bram_41_dout0,
    input [C_INPUT_BRAM_41_WIDTH/8-1:0] ap_bram_41_we0,
    input ap_bram_41_en0,
    input [C_INPUT_BRAM_41_ADDR_WIDTH-1:0] ap_bram_41_addr1,
    input [C_INPUT_BRAM_41_WIDTH-1:0] ap_bram_41_din1,
    output [C_INPUT_BRAM_41_WIDTH-1:0] ap_bram_41_dout1,
    input [C_INPUT_BRAM_41_WIDTH/8-1:0] ap_bram_41_we1,
    input ap_bram_41_en1,
    //input AXI-Stream to FIFO interface 42
    input s_axis_bram_42_tlast,
    input s_axis_bram_42_tvalid,
    input [C_INPUT_BRAM_42_DMWIDTH/8-1:0] s_axis_bram_42_tkeep,
    input [C_INPUT_BRAM_42_DMWIDTH/8-1:0] s_axis_bram_42_tstrb,
    input [C_INPUT_BRAM_42_DMWIDTH-1:0] s_axis_bram_42_tdata,
    output s_axis_bram_42_tready,
    input [C_INPUT_BRAM_42_ADDR_WIDTH-1:0] ap_bram_42_addr0,
    input [C_INPUT_BRAM_42_WIDTH-1:0] ap_bram_42_din0,
    output [C_INPUT_BRAM_42_WIDTH-1:0] ap_bram_42_dout0,
    input [C_INPUT_BRAM_42_WIDTH/8-1:0] ap_bram_42_we0,
    input ap_bram_42_en0,
    input [C_INPUT_BRAM_42_ADDR_WIDTH-1:0] ap_bram_42_addr1,
    input [C_INPUT_BRAM_42_WIDTH-1:0] ap_bram_42_din1,
    output [C_INPUT_BRAM_42_WIDTH-1:0] ap_bram_42_dout1,
    input [C_INPUT_BRAM_42_WIDTH/8-1:0] ap_bram_42_we1,
    input ap_bram_42_en1,
    //input AXI-Stream to FIFO interface 43
    input s_axis_bram_43_tlast,
    input s_axis_bram_43_tvalid,
    input [C_INPUT_BRAM_43_DMWIDTH/8-1:0] s_axis_bram_43_tkeep,
    input [C_INPUT_BRAM_43_DMWIDTH/8-1:0] s_axis_bram_43_tstrb,
    input [C_INPUT_BRAM_43_DMWIDTH-1:0] s_axis_bram_43_tdata,
    output s_axis_bram_43_tready,
    input [C_INPUT_BRAM_43_ADDR_WIDTH-1:0] ap_bram_43_addr0,
    input [C_INPUT_BRAM_43_WIDTH-1:0] ap_bram_43_din0,
    output [C_INPUT_BRAM_43_WIDTH-1:0] ap_bram_43_dout0,
    input [C_INPUT_BRAM_43_WIDTH/8-1:0] ap_bram_43_we0,
    input ap_bram_43_en0,
    input [C_INPUT_BRAM_43_ADDR_WIDTH-1:0] ap_bram_43_addr1,
    input [C_INPUT_BRAM_43_WIDTH-1:0] ap_bram_43_din1,
    output [C_INPUT_BRAM_43_WIDTH-1:0] ap_bram_43_dout1,
    input [C_INPUT_BRAM_43_WIDTH/8-1:0] ap_bram_43_we1,
    input ap_bram_43_en1,
    //input AXI-Stream to FIFO interface 44
    input s_axis_bram_44_tlast,
    input s_axis_bram_44_tvalid,
    input [C_INPUT_BRAM_44_DMWIDTH/8-1:0] s_axis_bram_44_tkeep,
    input [C_INPUT_BRAM_44_DMWIDTH/8-1:0] s_axis_bram_44_tstrb,
    input [C_INPUT_BRAM_44_DMWIDTH-1:0] s_axis_bram_44_tdata,
    output s_axis_bram_44_tready,
    input [C_INPUT_BRAM_44_ADDR_WIDTH-1:0] ap_bram_44_addr0,
    input [C_INPUT_BRAM_44_WIDTH-1:0] ap_bram_44_din0,
    output [C_INPUT_BRAM_44_WIDTH-1:0] ap_bram_44_dout0,
    input [C_INPUT_BRAM_44_WIDTH/8-1:0] ap_bram_44_we0,
    input ap_bram_44_en0,
    input [C_INPUT_BRAM_44_ADDR_WIDTH-1:0] ap_bram_44_addr1,
    input [C_INPUT_BRAM_44_WIDTH-1:0] ap_bram_44_din1,
    output [C_INPUT_BRAM_44_WIDTH-1:0] ap_bram_44_dout1,
    input [C_INPUT_BRAM_44_WIDTH/8-1:0] ap_bram_44_we1,
    input ap_bram_44_en1,
    //input AXI-Stream to FIFO interface 45
    input s_axis_bram_45_tlast,
    input s_axis_bram_45_tvalid,
    input [C_INPUT_BRAM_45_DMWIDTH/8-1:0] s_axis_bram_45_tkeep,
    input [C_INPUT_BRAM_45_DMWIDTH/8-1:0] s_axis_bram_45_tstrb,
    input [C_INPUT_BRAM_45_DMWIDTH-1:0] s_axis_bram_45_tdata,
    output s_axis_bram_45_tready,
    input [C_INPUT_BRAM_45_ADDR_WIDTH-1:0] ap_bram_45_addr0,
    input [C_INPUT_BRAM_45_WIDTH-1:0] ap_bram_45_din0,
    output [C_INPUT_BRAM_45_WIDTH-1:0] ap_bram_45_dout0,
    input [C_INPUT_BRAM_45_WIDTH/8-1:0] ap_bram_45_we0,
    input ap_bram_45_en0,
    input [C_INPUT_BRAM_45_ADDR_WIDTH-1:0] ap_bram_45_addr1,
    input [C_INPUT_BRAM_45_WIDTH-1:0] ap_bram_45_din1,
    output [C_INPUT_BRAM_45_WIDTH-1:0] ap_bram_45_dout1,
    input [C_INPUT_BRAM_45_WIDTH/8-1:0] ap_bram_45_we1,
    input ap_bram_45_en1,
    //input AXI-Stream to FIFO interface 46
    input s_axis_bram_46_tlast,
    input s_axis_bram_46_tvalid,
    input [C_INPUT_BRAM_46_DMWIDTH/8-1:0] s_axis_bram_46_tkeep,
    input [C_INPUT_BRAM_46_DMWIDTH/8-1:0] s_axis_bram_46_tstrb,
    input [C_INPUT_BRAM_46_DMWIDTH-1:0] s_axis_bram_46_tdata,
    output s_axis_bram_46_tready,
    input [C_INPUT_BRAM_46_ADDR_WIDTH-1:0] ap_bram_46_addr0,
    input [C_INPUT_BRAM_46_WIDTH-1:0] ap_bram_46_din0,
    output [C_INPUT_BRAM_46_WIDTH-1:0] ap_bram_46_dout0,
    input [C_INPUT_BRAM_46_WIDTH/8-1:0] ap_bram_46_we0,
    input ap_bram_46_en0,
    input [C_INPUT_BRAM_46_ADDR_WIDTH-1:0] ap_bram_46_addr1,
    input [C_INPUT_BRAM_46_WIDTH-1:0] ap_bram_46_din1,
    output [C_INPUT_BRAM_46_WIDTH-1:0] ap_bram_46_dout1,
    input [C_INPUT_BRAM_46_WIDTH/8-1:0] ap_bram_46_we1,
    input ap_bram_46_en1,
    //input AXI-Stream to FIFO interface 47
    input s_axis_bram_47_tlast,
    input s_axis_bram_47_tvalid,
    input [C_INPUT_BRAM_47_DMWIDTH/8-1:0] s_axis_bram_47_tkeep,
    input [C_INPUT_BRAM_47_DMWIDTH/8-1:0] s_axis_bram_47_tstrb,
    input [C_INPUT_BRAM_47_DMWIDTH-1:0] s_axis_bram_47_tdata,
    output s_axis_bram_47_tready,
    input [C_INPUT_BRAM_47_ADDR_WIDTH-1:0] ap_bram_47_addr0,
    input [C_INPUT_BRAM_47_WIDTH-1:0] ap_bram_47_din0,
    output [C_INPUT_BRAM_47_WIDTH-1:0] ap_bram_47_dout0,
    input [C_INPUT_BRAM_47_WIDTH/8-1:0] ap_bram_47_we0,
    input ap_bram_47_en0,
    input [C_INPUT_BRAM_47_ADDR_WIDTH-1:0] ap_bram_47_addr1,
    input [C_INPUT_BRAM_47_WIDTH-1:0] ap_bram_47_din1,
    output [C_INPUT_BRAM_47_WIDTH-1:0] ap_bram_47_dout1,
    input [C_INPUT_BRAM_47_WIDTH/8-1:0] ap_bram_47_we1,
    input ap_bram_47_en1,
    //input AXI-Stream to FIFO interface 48
    input s_axis_bram_48_tlast,
    input s_axis_bram_48_tvalid,
    input [C_INPUT_BRAM_48_DMWIDTH/8-1:0] s_axis_bram_48_tkeep,
    input [C_INPUT_BRAM_48_DMWIDTH/8-1:0] s_axis_bram_48_tstrb,
    input [C_INPUT_BRAM_48_DMWIDTH-1:0] s_axis_bram_48_tdata,
    output s_axis_bram_48_tready,
    input [C_INPUT_BRAM_48_ADDR_WIDTH-1:0] ap_bram_48_addr0,
    input [C_INPUT_BRAM_48_WIDTH-1:0] ap_bram_48_din0,
    output [C_INPUT_BRAM_48_WIDTH-1:0] ap_bram_48_dout0,
    input [C_INPUT_BRAM_48_WIDTH/8-1:0] ap_bram_48_we0,
    input ap_bram_48_en0,
    input [C_INPUT_BRAM_48_ADDR_WIDTH-1:0] ap_bram_48_addr1,
    input [C_INPUT_BRAM_48_WIDTH-1:0] ap_bram_48_din1,
    output [C_INPUT_BRAM_48_WIDTH-1:0] ap_bram_48_dout1,
    input [C_INPUT_BRAM_48_WIDTH/8-1:0] ap_bram_48_we1,
    input ap_bram_48_en1,
    //input AXI-Stream to FIFO interface 49
    input s_axis_bram_49_tlast,
    input s_axis_bram_49_tvalid,
    input [C_INPUT_BRAM_49_DMWIDTH/8-1:0] s_axis_bram_49_tkeep,
    input [C_INPUT_BRAM_49_DMWIDTH/8-1:0] s_axis_bram_49_tstrb,
    input [C_INPUT_BRAM_49_DMWIDTH-1:0] s_axis_bram_49_tdata,
    output s_axis_bram_49_tready,
    input [C_INPUT_BRAM_49_ADDR_WIDTH-1:0] ap_bram_49_addr0,
    input [C_INPUT_BRAM_49_WIDTH-1:0] ap_bram_49_din0,
    output [C_INPUT_BRAM_49_WIDTH-1:0] ap_bram_49_dout0,
    input [C_INPUT_BRAM_49_WIDTH/8-1:0] ap_bram_49_we0,
    input ap_bram_49_en0,
    input [C_INPUT_BRAM_49_ADDR_WIDTH-1:0] ap_bram_49_addr1,
    input [C_INPUT_BRAM_49_WIDTH-1:0] ap_bram_49_din1,
    output [C_INPUT_BRAM_49_WIDTH-1:0] ap_bram_49_dout1,
    input [C_INPUT_BRAM_49_WIDTH/8-1:0] ap_bram_49_we1,
    input ap_bram_49_en1,
    //input AXI-Stream to FIFO interface 50
    input s_axis_bram_50_tlast,
    input s_axis_bram_50_tvalid,
    input [C_INPUT_BRAM_50_DMWIDTH/8-1:0] s_axis_bram_50_tkeep,
    input [C_INPUT_BRAM_50_DMWIDTH/8-1:0] s_axis_bram_50_tstrb,
    input [C_INPUT_BRAM_50_DMWIDTH-1:0] s_axis_bram_50_tdata,
    output s_axis_bram_50_tready,
    input [C_INPUT_BRAM_50_ADDR_WIDTH-1:0] ap_bram_50_addr0,
    input [C_INPUT_BRAM_50_WIDTH-1:0] ap_bram_50_din0,
    output [C_INPUT_BRAM_50_WIDTH-1:0] ap_bram_50_dout0,
    input [C_INPUT_BRAM_50_WIDTH/8-1:0] ap_bram_50_we0,
    input ap_bram_50_en0,
    input [C_INPUT_BRAM_50_ADDR_WIDTH-1:0] ap_bram_50_addr1,
    input [C_INPUT_BRAM_50_WIDTH-1:0] ap_bram_50_din1,
    output [C_INPUT_BRAM_50_WIDTH-1:0] ap_bram_50_dout1,
    input [C_INPUT_BRAM_50_WIDTH/8-1:0] ap_bram_50_we1,
    input ap_bram_50_en1,
    //input AXI-Stream to FIFO interface 51
    input s_axis_bram_51_tlast,
    input s_axis_bram_51_tvalid,
    input [C_INPUT_BRAM_51_DMWIDTH/8-1:0] s_axis_bram_51_tkeep,
    input [C_INPUT_BRAM_51_DMWIDTH/8-1:0] s_axis_bram_51_tstrb,
    input [C_INPUT_BRAM_51_DMWIDTH-1:0] s_axis_bram_51_tdata,
    output s_axis_bram_51_tready,
    input [C_INPUT_BRAM_51_ADDR_WIDTH-1:0] ap_bram_51_addr0,
    input [C_INPUT_BRAM_51_WIDTH-1:0] ap_bram_51_din0,
    output [C_INPUT_BRAM_51_WIDTH-1:0] ap_bram_51_dout0,
    input [C_INPUT_BRAM_51_WIDTH/8-1:0] ap_bram_51_we0,
    input ap_bram_51_en0,
    input [C_INPUT_BRAM_51_ADDR_WIDTH-1:0] ap_bram_51_addr1,
    input [C_INPUT_BRAM_51_WIDTH-1:0] ap_bram_51_din1,
    output [C_INPUT_BRAM_51_WIDTH-1:0] ap_bram_51_dout1,
    input [C_INPUT_BRAM_51_WIDTH/8-1:0] ap_bram_51_we1,
    input ap_bram_51_en1,
    //input AXI-Stream to FIFO interface 52
    input s_axis_bram_52_tlast,
    input s_axis_bram_52_tvalid,
    input [C_INPUT_BRAM_52_DMWIDTH/8-1:0] s_axis_bram_52_tkeep,
    input [C_INPUT_BRAM_52_DMWIDTH/8-1:0] s_axis_bram_52_tstrb,
    input [C_INPUT_BRAM_52_DMWIDTH-1:0] s_axis_bram_52_tdata,
    output s_axis_bram_52_tready,
    input [C_INPUT_BRAM_52_ADDR_WIDTH-1:0] ap_bram_52_addr0,
    input [C_INPUT_BRAM_52_WIDTH-1:0] ap_bram_52_din0,
    output [C_INPUT_BRAM_52_WIDTH-1:0] ap_bram_52_dout0,
    input [C_INPUT_BRAM_52_WIDTH/8-1:0] ap_bram_52_we0,
    input ap_bram_52_en0,
    input [C_INPUT_BRAM_52_ADDR_WIDTH-1:0] ap_bram_52_addr1,
    input [C_INPUT_BRAM_52_WIDTH-1:0] ap_bram_52_din1,
    output [C_INPUT_BRAM_52_WIDTH-1:0] ap_bram_52_dout1,
    input [C_INPUT_BRAM_52_WIDTH/8-1:0] ap_bram_52_we1,
    input ap_bram_52_en1,
    //input AXI-Stream to FIFO interface 53
    input s_axis_bram_53_tlast,
    input s_axis_bram_53_tvalid,
    input [C_INPUT_BRAM_53_DMWIDTH/8-1:0] s_axis_bram_53_tkeep,
    input [C_INPUT_BRAM_53_DMWIDTH/8-1:0] s_axis_bram_53_tstrb,
    input [C_INPUT_BRAM_53_DMWIDTH-1:0] s_axis_bram_53_tdata,
    output s_axis_bram_53_tready,
    input [C_INPUT_BRAM_53_ADDR_WIDTH-1:0] ap_bram_53_addr0,
    input [C_INPUT_BRAM_53_WIDTH-1:0] ap_bram_53_din0,
    output [C_INPUT_BRAM_53_WIDTH-1:0] ap_bram_53_dout0,
    input [C_INPUT_BRAM_53_WIDTH/8-1:0] ap_bram_53_we0,
    input ap_bram_53_en0,
    input [C_INPUT_BRAM_53_ADDR_WIDTH-1:0] ap_bram_53_addr1,
    input [C_INPUT_BRAM_53_WIDTH-1:0] ap_bram_53_din1,
    output [C_INPUT_BRAM_53_WIDTH-1:0] ap_bram_53_dout1,
    input [C_INPUT_BRAM_53_WIDTH/8-1:0] ap_bram_53_we1,
    input ap_bram_53_en1,
    //input AXI-Stream to FIFO interface 54
    input s_axis_bram_54_tlast,
    input s_axis_bram_54_tvalid,
    input [C_INPUT_BRAM_54_DMWIDTH/8-1:0] s_axis_bram_54_tkeep,
    input [C_INPUT_BRAM_54_DMWIDTH/8-1:0] s_axis_bram_54_tstrb,
    input [C_INPUT_BRAM_54_DMWIDTH-1:0] s_axis_bram_54_tdata,
    output s_axis_bram_54_tready,
    input [C_INPUT_BRAM_54_ADDR_WIDTH-1:0] ap_bram_54_addr0,
    input [C_INPUT_BRAM_54_WIDTH-1:0] ap_bram_54_din0,
    output [C_INPUT_BRAM_54_WIDTH-1:0] ap_bram_54_dout0,
    input [C_INPUT_BRAM_54_WIDTH/8-1:0] ap_bram_54_we0,
    input ap_bram_54_en0,
    input [C_INPUT_BRAM_54_ADDR_WIDTH-1:0] ap_bram_54_addr1,
    input [C_INPUT_BRAM_54_WIDTH-1:0] ap_bram_54_din1,
    output [C_INPUT_BRAM_54_WIDTH-1:0] ap_bram_54_dout1,
    input [C_INPUT_BRAM_54_WIDTH/8-1:0] ap_bram_54_we1,
    input ap_bram_54_en1,
    //input AXI-Stream to FIFO interface 55
    input s_axis_bram_55_tlast,
    input s_axis_bram_55_tvalid,
    input [C_INPUT_BRAM_55_DMWIDTH/8-1:0] s_axis_bram_55_tkeep,
    input [C_INPUT_BRAM_55_DMWIDTH/8-1:0] s_axis_bram_55_tstrb,
    input [C_INPUT_BRAM_55_DMWIDTH-1:0] s_axis_bram_55_tdata,
    output s_axis_bram_55_tready,
    input [C_INPUT_BRAM_55_ADDR_WIDTH-1:0] ap_bram_55_addr0,
    input [C_INPUT_BRAM_55_WIDTH-1:0] ap_bram_55_din0,
    output [C_INPUT_BRAM_55_WIDTH-1:0] ap_bram_55_dout0,
    input [C_INPUT_BRAM_55_WIDTH/8-1:0] ap_bram_55_we0,
    input ap_bram_55_en0,
    input [C_INPUT_BRAM_55_ADDR_WIDTH-1:0] ap_bram_55_addr1,
    input [C_INPUT_BRAM_55_WIDTH-1:0] ap_bram_55_din1,
    output [C_INPUT_BRAM_55_WIDTH-1:0] ap_bram_55_dout1,
    input [C_INPUT_BRAM_55_WIDTH/8-1:0] ap_bram_55_we1,
    input ap_bram_55_en1,
    //input AXI-Stream to FIFO interface 56
    input s_axis_bram_56_tlast,
    input s_axis_bram_56_tvalid,
    input [C_INPUT_BRAM_56_DMWIDTH/8-1:0] s_axis_bram_56_tkeep,
    input [C_INPUT_BRAM_56_DMWIDTH/8-1:0] s_axis_bram_56_tstrb,
    input [C_INPUT_BRAM_56_DMWIDTH-1:0] s_axis_bram_56_tdata,
    output s_axis_bram_56_tready,
    input [C_INPUT_BRAM_56_ADDR_WIDTH-1:0] ap_bram_56_addr0,
    input [C_INPUT_BRAM_56_WIDTH-1:0] ap_bram_56_din0,
    output [C_INPUT_BRAM_56_WIDTH-1:0] ap_bram_56_dout0,
    input [C_INPUT_BRAM_56_WIDTH/8-1:0] ap_bram_56_we0,
    input ap_bram_56_en0,
    input [C_INPUT_BRAM_56_ADDR_WIDTH-1:0] ap_bram_56_addr1,
    input [C_INPUT_BRAM_56_WIDTH-1:0] ap_bram_56_din1,
    output [C_INPUT_BRAM_56_WIDTH-1:0] ap_bram_56_dout1,
    input [C_INPUT_BRAM_56_WIDTH/8-1:0] ap_bram_56_we1,
    input ap_bram_56_en1,
    //input AXI-Stream to FIFO interface 57
    input s_axis_bram_57_tlast,
    input s_axis_bram_57_tvalid,
    input [C_INPUT_BRAM_57_DMWIDTH/8-1:0] s_axis_bram_57_tkeep,
    input [C_INPUT_BRAM_57_DMWIDTH/8-1:0] s_axis_bram_57_tstrb,
    input [C_INPUT_BRAM_57_DMWIDTH-1:0] s_axis_bram_57_tdata,
    output s_axis_bram_57_tready,
    input [C_INPUT_BRAM_57_ADDR_WIDTH-1:0] ap_bram_57_addr0,
    input [C_INPUT_BRAM_57_WIDTH-1:0] ap_bram_57_din0,
    output [C_INPUT_BRAM_57_WIDTH-1:0] ap_bram_57_dout0,
    input [C_INPUT_BRAM_57_WIDTH/8-1:0] ap_bram_57_we0,
    input ap_bram_57_en0,
    input [C_INPUT_BRAM_57_ADDR_WIDTH-1:0] ap_bram_57_addr1,
    input [C_INPUT_BRAM_57_WIDTH-1:0] ap_bram_57_din1,
    output [C_INPUT_BRAM_57_WIDTH-1:0] ap_bram_57_dout1,
    input [C_INPUT_BRAM_57_WIDTH/8-1:0] ap_bram_57_we1,
    input ap_bram_57_en1,
    //input AXI-Stream to FIFO interface 58
    input s_axis_bram_58_tlast,
    input s_axis_bram_58_tvalid,
    input [C_INPUT_BRAM_58_DMWIDTH/8-1:0] s_axis_bram_58_tkeep,
    input [C_INPUT_BRAM_58_DMWIDTH/8-1:0] s_axis_bram_58_tstrb,
    input [C_INPUT_BRAM_58_DMWIDTH-1:0] s_axis_bram_58_tdata,
    output s_axis_bram_58_tready,
    input [C_INPUT_BRAM_58_ADDR_WIDTH-1:0] ap_bram_58_addr0,
    input [C_INPUT_BRAM_58_WIDTH-1:0] ap_bram_58_din0,
    output [C_INPUT_BRAM_58_WIDTH-1:0] ap_bram_58_dout0,
    input [C_INPUT_BRAM_58_WIDTH/8-1:0] ap_bram_58_we0,
    input ap_bram_58_en0,
    input [C_INPUT_BRAM_58_ADDR_WIDTH-1:0] ap_bram_58_addr1,
    input [C_INPUT_BRAM_58_WIDTH-1:0] ap_bram_58_din1,
    output [C_INPUT_BRAM_58_WIDTH-1:0] ap_bram_58_dout1,
    input [C_INPUT_BRAM_58_WIDTH/8-1:0] ap_bram_58_we1,
    input ap_bram_58_en1,
    //input AXI-Stream to FIFO interface 59
    input s_axis_bram_59_tlast,
    input s_axis_bram_59_tvalid,
    input [C_INPUT_BRAM_59_DMWIDTH/8-1:0] s_axis_bram_59_tkeep,
    input [C_INPUT_BRAM_59_DMWIDTH/8-1:0] s_axis_bram_59_tstrb,
    input [C_INPUT_BRAM_59_DMWIDTH-1:0] s_axis_bram_59_tdata,
    output s_axis_bram_59_tready,
    input [C_INPUT_BRAM_59_ADDR_WIDTH-1:0] ap_bram_59_addr0,
    input [C_INPUT_BRAM_59_WIDTH-1:0] ap_bram_59_din0,
    output [C_INPUT_BRAM_59_WIDTH-1:0] ap_bram_59_dout0,
    input [C_INPUT_BRAM_59_WIDTH/8-1:0] ap_bram_59_we0,
    input ap_bram_59_en0,
    input [C_INPUT_BRAM_59_ADDR_WIDTH-1:0] ap_bram_59_addr1,
    input [C_INPUT_BRAM_59_WIDTH-1:0] ap_bram_59_din1,
    output [C_INPUT_BRAM_59_WIDTH-1:0] ap_bram_59_dout1,
    input [C_INPUT_BRAM_59_WIDTH/8-1:0] ap_bram_59_we1,
    input ap_bram_59_en1,
    //input AXI-Stream to FIFO interface 60
    input s_axis_bram_60_tlast,
    input s_axis_bram_60_tvalid,
    input [C_INPUT_BRAM_60_DMWIDTH/8-1:0] s_axis_bram_60_tkeep,
    input [C_INPUT_BRAM_60_DMWIDTH/8-1:0] s_axis_bram_60_tstrb,
    input [C_INPUT_BRAM_60_DMWIDTH-1:0] s_axis_bram_60_tdata,
    output s_axis_bram_60_tready,
    input [C_INPUT_BRAM_60_ADDR_WIDTH-1:0] ap_bram_60_addr0,
    input [C_INPUT_BRAM_60_WIDTH-1:0] ap_bram_60_din0,
    output [C_INPUT_BRAM_60_WIDTH-1:0] ap_bram_60_dout0,
    input [C_INPUT_BRAM_60_WIDTH/8-1:0] ap_bram_60_we0,
    input ap_bram_60_en0,
    input [C_INPUT_BRAM_60_ADDR_WIDTH-1:0] ap_bram_60_addr1,
    input [C_INPUT_BRAM_60_WIDTH-1:0] ap_bram_60_din1,
    output [C_INPUT_BRAM_60_WIDTH-1:0] ap_bram_60_dout1,
    input [C_INPUT_BRAM_60_WIDTH/8-1:0] ap_bram_60_we1,
    input ap_bram_60_en1,
    //input AXI-Stream to FIFO interface 61
    input s_axis_bram_61_tlast,
    input s_axis_bram_61_tvalid,
    input [C_INPUT_BRAM_61_DMWIDTH/8-1:0] s_axis_bram_61_tkeep,
    input [C_INPUT_BRAM_61_DMWIDTH/8-1:0] s_axis_bram_61_tstrb,
    input [C_INPUT_BRAM_61_DMWIDTH-1:0] s_axis_bram_61_tdata,
    output s_axis_bram_61_tready,
    input [C_INPUT_BRAM_61_ADDR_WIDTH-1:0] ap_bram_61_addr0,
    input [C_INPUT_BRAM_61_WIDTH-1:0] ap_bram_61_din0,
    output [C_INPUT_BRAM_61_WIDTH-1:0] ap_bram_61_dout0,
    input [C_INPUT_BRAM_61_WIDTH/8-1:0] ap_bram_61_we0,
    input ap_bram_61_en0,
    input [C_INPUT_BRAM_61_ADDR_WIDTH-1:0] ap_bram_61_addr1,
    input [C_INPUT_BRAM_61_WIDTH-1:0] ap_bram_61_din1,
    output [C_INPUT_BRAM_61_WIDTH-1:0] ap_bram_61_dout1,
    input [C_INPUT_BRAM_61_WIDTH/8-1:0] ap_bram_61_we1,
    input ap_bram_61_en1,
    //input AXI-Stream to FIFO interface 62
    input s_axis_bram_62_tlast,
    input s_axis_bram_62_tvalid,
    input [C_INPUT_BRAM_62_DMWIDTH/8-1:0] s_axis_bram_62_tkeep,
    input [C_INPUT_BRAM_62_DMWIDTH/8-1:0] s_axis_bram_62_tstrb,
    input [C_INPUT_BRAM_62_DMWIDTH-1:0] s_axis_bram_62_tdata,
    output s_axis_bram_62_tready,
    input [C_INPUT_BRAM_62_ADDR_WIDTH-1:0] ap_bram_62_addr0,
    input [C_INPUT_BRAM_62_WIDTH-1:0] ap_bram_62_din0,
    output [C_INPUT_BRAM_62_WIDTH-1:0] ap_bram_62_dout0,
    input [C_INPUT_BRAM_62_WIDTH/8-1:0] ap_bram_62_we0,
    input ap_bram_62_en0,
    input [C_INPUT_BRAM_62_ADDR_WIDTH-1:0] ap_bram_62_addr1,
    input [C_INPUT_BRAM_62_WIDTH-1:0] ap_bram_62_din1,
    output [C_INPUT_BRAM_62_WIDTH-1:0] ap_bram_62_dout1,
    input [C_INPUT_BRAM_62_WIDTH/8-1:0] ap_bram_62_we1,
    input ap_bram_62_en1,
    //input AXI-Stream to FIFO interface 63
    input s_axis_bram_63_tlast,
    input s_axis_bram_63_tvalid,
    input [C_INPUT_BRAM_63_DMWIDTH/8-1:0] s_axis_bram_63_tkeep,
    input [C_INPUT_BRAM_63_DMWIDTH/8-1:0] s_axis_bram_63_tstrb,
    input [C_INPUT_BRAM_63_DMWIDTH-1:0] s_axis_bram_63_tdata,
    output s_axis_bram_63_tready,
    input [C_INPUT_BRAM_63_ADDR_WIDTH-1:0] ap_bram_63_addr0,
    input [C_INPUT_BRAM_63_WIDTH-1:0] ap_bram_63_din0,
    output [C_INPUT_BRAM_63_WIDTH-1:0] ap_bram_63_dout0,
    input [C_INPUT_BRAM_63_WIDTH/8-1:0] ap_bram_63_we0,
    input ap_bram_63_en0,
    input [C_INPUT_BRAM_63_ADDR_WIDTH-1:0] ap_bram_63_addr1,
    input [C_INPUT_BRAM_63_WIDTH-1:0] ap_bram_63_din1,
    output [C_INPUT_BRAM_63_WIDTH-1:0] ap_bram_63_dout1,
    input [C_INPUT_BRAM_63_WIDTH/8-1:0] ap_bram_63_we1,
    input ap_bram_63_en1,
    //input AXI-Stream to FIFO interface 64
    input s_axis_bram_64_tlast,
    input s_axis_bram_64_tvalid,
    input [C_INPUT_BRAM_64_DMWIDTH/8-1:0] s_axis_bram_64_tkeep,
    input [C_INPUT_BRAM_64_DMWIDTH/8-1:0] s_axis_bram_64_tstrb,
    input [C_INPUT_BRAM_64_DMWIDTH-1:0] s_axis_bram_64_tdata,
    output s_axis_bram_64_tready,
    input [C_INPUT_BRAM_64_ADDR_WIDTH-1:0] ap_bram_64_addr0,
    input [C_INPUT_BRAM_64_WIDTH-1:0] ap_bram_64_din0,
    output [C_INPUT_BRAM_64_WIDTH-1:0] ap_bram_64_dout0,
    input [C_INPUT_BRAM_64_WIDTH/8-1:0] ap_bram_64_we0,
    input ap_bram_64_en0,
    input [C_INPUT_BRAM_64_ADDR_WIDTH-1:0] ap_bram_64_addr1,
    input [C_INPUT_BRAM_64_WIDTH-1:0] ap_bram_64_din1,
    output [C_INPUT_BRAM_64_WIDTH-1:0] ap_bram_64_dout1,
    input [C_INPUT_BRAM_64_WIDTH/8-1:0] ap_bram_64_we1,
    input ap_bram_64_en1,
    //input AXI-Stream to FIFO interface 65
    input s_axis_bram_65_tlast,
    input s_axis_bram_65_tvalid,
    input [C_INPUT_BRAM_65_DMWIDTH/8-1:0] s_axis_bram_65_tkeep,
    input [C_INPUT_BRAM_65_DMWIDTH/8-1:0] s_axis_bram_65_tstrb,
    input [C_INPUT_BRAM_65_DMWIDTH-1:0] s_axis_bram_65_tdata,
    output s_axis_bram_65_tready,
    input [C_INPUT_BRAM_65_ADDR_WIDTH-1:0] ap_bram_65_addr0,
    input [C_INPUT_BRAM_65_WIDTH-1:0] ap_bram_65_din0,
    output [C_INPUT_BRAM_65_WIDTH-1:0] ap_bram_65_dout0,
    input [C_INPUT_BRAM_65_WIDTH/8-1:0] ap_bram_65_we0,
    input ap_bram_65_en0,
    input [C_INPUT_BRAM_65_ADDR_WIDTH-1:0] ap_bram_65_addr1,
    input [C_INPUT_BRAM_65_WIDTH-1:0] ap_bram_65_din1,
    output [C_INPUT_BRAM_65_WIDTH-1:0] ap_bram_65_dout1,
    input [C_INPUT_BRAM_65_WIDTH/8-1:0] ap_bram_65_we1,
    input ap_bram_65_en1,
    //input AXI-Stream to FIFO interface 66
    input s_axis_bram_66_tlast,
    input s_axis_bram_66_tvalid,
    input [C_INPUT_BRAM_66_DMWIDTH/8-1:0] s_axis_bram_66_tkeep,
    input [C_INPUT_BRAM_66_DMWIDTH/8-1:0] s_axis_bram_66_tstrb,
    input [C_INPUT_BRAM_66_DMWIDTH-1:0] s_axis_bram_66_tdata,
    output s_axis_bram_66_tready,
    input [C_INPUT_BRAM_66_ADDR_WIDTH-1:0] ap_bram_66_addr0,
    input [C_INPUT_BRAM_66_WIDTH-1:0] ap_bram_66_din0,
    output [C_INPUT_BRAM_66_WIDTH-1:0] ap_bram_66_dout0,
    input [C_INPUT_BRAM_66_WIDTH/8-1:0] ap_bram_66_we0,
    input ap_bram_66_en0,
    input [C_INPUT_BRAM_66_ADDR_WIDTH-1:0] ap_bram_66_addr1,
    input [C_INPUT_BRAM_66_WIDTH-1:0] ap_bram_66_din1,
    output [C_INPUT_BRAM_66_WIDTH-1:0] ap_bram_66_dout1,
    input [C_INPUT_BRAM_66_WIDTH/8-1:0] ap_bram_66_we1,
    input ap_bram_66_en1,
    //input AXI-Stream to FIFO interface 67
    input s_axis_bram_67_tlast,
    input s_axis_bram_67_tvalid,
    input [C_INPUT_BRAM_67_DMWIDTH/8-1:0] s_axis_bram_67_tkeep,
    input [C_INPUT_BRAM_67_DMWIDTH/8-1:0] s_axis_bram_67_tstrb,
    input [C_INPUT_BRAM_67_DMWIDTH-1:0] s_axis_bram_67_tdata,
    output s_axis_bram_67_tready,
    input [C_INPUT_BRAM_67_ADDR_WIDTH-1:0] ap_bram_67_addr0,
    input [C_INPUT_BRAM_67_WIDTH-1:0] ap_bram_67_din0,
    output [C_INPUT_BRAM_67_WIDTH-1:0] ap_bram_67_dout0,
    input [C_INPUT_BRAM_67_WIDTH/8-1:0] ap_bram_67_we0,
    input ap_bram_67_en0,
    input [C_INPUT_BRAM_67_ADDR_WIDTH-1:0] ap_bram_67_addr1,
    input [C_INPUT_BRAM_67_WIDTH-1:0] ap_bram_67_din1,
    output [C_INPUT_BRAM_67_WIDTH-1:0] ap_bram_67_dout1,
    input [C_INPUT_BRAM_67_WIDTH/8-1:0] ap_bram_67_we1,
    input ap_bram_67_en1,
    //input AXI-Stream to FIFO interface 68
    input s_axis_bram_68_tlast,
    input s_axis_bram_68_tvalid,
    input [C_INPUT_BRAM_68_DMWIDTH/8-1:0] s_axis_bram_68_tkeep,
    input [C_INPUT_BRAM_68_DMWIDTH/8-1:0] s_axis_bram_68_tstrb,
    input [C_INPUT_BRAM_68_DMWIDTH-1:0] s_axis_bram_68_tdata,
    output s_axis_bram_68_tready,
    input [C_INPUT_BRAM_68_ADDR_WIDTH-1:0] ap_bram_68_addr0,
    input [C_INPUT_BRAM_68_WIDTH-1:0] ap_bram_68_din0,
    output [C_INPUT_BRAM_68_WIDTH-1:0] ap_bram_68_dout0,
    input [C_INPUT_BRAM_68_WIDTH/8-1:0] ap_bram_68_we0,
    input ap_bram_68_en0,
    input [C_INPUT_BRAM_68_ADDR_WIDTH-1:0] ap_bram_68_addr1,
    input [C_INPUT_BRAM_68_WIDTH-1:0] ap_bram_68_din1,
    output [C_INPUT_BRAM_68_WIDTH-1:0] ap_bram_68_dout1,
    input [C_INPUT_BRAM_68_WIDTH/8-1:0] ap_bram_68_we1,
    input ap_bram_68_en1,
    //input AXI-Stream to FIFO interface 69
    input s_axis_bram_69_tlast,
    input s_axis_bram_69_tvalid,
    input [C_INPUT_BRAM_69_DMWIDTH/8-1:0] s_axis_bram_69_tkeep,
    input [C_INPUT_BRAM_69_DMWIDTH/8-1:0] s_axis_bram_69_tstrb,
    input [C_INPUT_BRAM_69_DMWIDTH-1:0] s_axis_bram_69_tdata,
    output s_axis_bram_69_tready,
    input [C_INPUT_BRAM_69_ADDR_WIDTH-1:0] ap_bram_69_addr0,
    input [C_INPUT_BRAM_69_WIDTH-1:0] ap_bram_69_din0,
    output [C_INPUT_BRAM_69_WIDTH-1:0] ap_bram_69_dout0,
    input [C_INPUT_BRAM_69_WIDTH/8-1:0] ap_bram_69_we0,
    input ap_bram_69_en0,
    input [C_INPUT_BRAM_69_ADDR_WIDTH-1:0] ap_bram_69_addr1,
    input [C_INPUT_BRAM_69_WIDTH-1:0] ap_bram_69_din1,
    output [C_INPUT_BRAM_69_WIDTH-1:0] ap_bram_69_dout1,
    input [C_INPUT_BRAM_69_WIDTH/8-1:0] ap_bram_69_we1,
    input ap_bram_69_en1,
    //input AXI-Stream to FIFO interface 70
    input s_axis_bram_70_tlast,
    input s_axis_bram_70_tvalid,
    input [C_INPUT_BRAM_70_DMWIDTH/8-1:0] s_axis_bram_70_tkeep,
    input [C_INPUT_BRAM_70_DMWIDTH/8-1:0] s_axis_bram_70_tstrb,
    input [C_INPUT_BRAM_70_DMWIDTH-1:0] s_axis_bram_70_tdata,
    output s_axis_bram_70_tready,
    input [C_INPUT_BRAM_70_ADDR_WIDTH-1:0] ap_bram_70_addr0,
    input [C_INPUT_BRAM_70_WIDTH-1:0] ap_bram_70_din0,
    output [C_INPUT_BRAM_70_WIDTH-1:0] ap_bram_70_dout0,
    input [C_INPUT_BRAM_70_WIDTH/8-1:0] ap_bram_70_we0,
    input ap_bram_70_en0,
    input [C_INPUT_BRAM_70_ADDR_WIDTH-1:0] ap_bram_70_addr1,
    input [C_INPUT_BRAM_70_WIDTH-1:0] ap_bram_70_din1,
    output [C_INPUT_BRAM_70_WIDTH-1:0] ap_bram_70_dout1,
    input [C_INPUT_BRAM_70_WIDTH/8-1:0] ap_bram_70_we1,
    input ap_bram_70_en1,
    //input AXI-Stream to FIFO interface 71
    input s_axis_bram_71_tlast,
    input s_axis_bram_71_tvalid,
    input [C_INPUT_BRAM_71_DMWIDTH/8-1:0] s_axis_bram_71_tkeep,
    input [C_INPUT_BRAM_71_DMWIDTH/8-1:0] s_axis_bram_71_tstrb,
    input [C_INPUT_BRAM_71_DMWIDTH-1:0] s_axis_bram_71_tdata,
    output s_axis_bram_71_tready,
    input [C_INPUT_BRAM_71_ADDR_WIDTH-1:0] ap_bram_71_addr0,
    input [C_INPUT_BRAM_71_WIDTH-1:0] ap_bram_71_din0,
    output [C_INPUT_BRAM_71_WIDTH-1:0] ap_bram_71_dout0,
    input [C_INPUT_BRAM_71_WIDTH/8-1:0] ap_bram_71_we0,
    input ap_bram_71_en0,
    input [C_INPUT_BRAM_71_ADDR_WIDTH-1:0] ap_bram_71_addr1,
    input [C_INPUT_BRAM_71_WIDTH-1:0] ap_bram_71_din1,
    output [C_INPUT_BRAM_71_WIDTH-1:0] ap_bram_71_dout1,
    input [C_INPUT_BRAM_71_WIDTH/8-1:0] ap_bram_71_we1,
    input ap_bram_71_en1,
    //input AXI-Stream to FIFO interface 72
    input s_axis_bram_72_tlast,
    input s_axis_bram_72_tvalid,
    input [C_INPUT_BRAM_72_DMWIDTH/8-1:0] s_axis_bram_72_tkeep,
    input [C_INPUT_BRAM_72_DMWIDTH/8-1:0] s_axis_bram_72_tstrb,
    input [C_INPUT_BRAM_72_DMWIDTH-1:0] s_axis_bram_72_tdata,
    output s_axis_bram_72_tready,
    input [C_INPUT_BRAM_72_ADDR_WIDTH-1:0] ap_bram_72_addr0,
    input [C_INPUT_BRAM_72_WIDTH-1:0] ap_bram_72_din0,
    output [C_INPUT_BRAM_72_WIDTH-1:0] ap_bram_72_dout0,
    input [C_INPUT_BRAM_72_WIDTH/8-1:0] ap_bram_72_we0,
    input ap_bram_72_en0,
    input [C_INPUT_BRAM_72_ADDR_WIDTH-1:0] ap_bram_72_addr1,
    input [C_INPUT_BRAM_72_WIDTH-1:0] ap_bram_72_din1,
    output [C_INPUT_BRAM_72_WIDTH-1:0] ap_bram_72_dout1,
    input [C_INPUT_BRAM_72_WIDTH/8-1:0] ap_bram_72_we1,
    input ap_bram_72_en1,
    //input AXI-Stream to FIFO interface 73
    input s_axis_bram_73_tlast,
    input s_axis_bram_73_tvalid,
    input [C_INPUT_BRAM_73_DMWIDTH/8-1:0] s_axis_bram_73_tkeep,
    input [C_INPUT_BRAM_73_DMWIDTH/8-1:0] s_axis_bram_73_tstrb,
    input [C_INPUT_BRAM_73_DMWIDTH-1:0] s_axis_bram_73_tdata,
    output s_axis_bram_73_tready,
    input [C_INPUT_BRAM_73_ADDR_WIDTH-1:0] ap_bram_73_addr0,
    input [C_INPUT_BRAM_73_WIDTH-1:0] ap_bram_73_din0,
    output [C_INPUT_BRAM_73_WIDTH-1:0] ap_bram_73_dout0,
    input [C_INPUT_BRAM_73_WIDTH/8-1:0] ap_bram_73_we0,
    input ap_bram_73_en0,
    input [C_INPUT_BRAM_73_ADDR_WIDTH-1:0] ap_bram_73_addr1,
    input [C_INPUT_BRAM_73_WIDTH-1:0] ap_bram_73_din1,
    output [C_INPUT_BRAM_73_WIDTH-1:0] ap_bram_73_dout1,
    input [C_INPUT_BRAM_73_WIDTH/8-1:0] ap_bram_73_we1,
    input ap_bram_73_en1,
    //input AXI-Stream to FIFO interface 74
    input s_axis_bram_74_tlast,
    input s_axis_bram_74_tvalid,
    input [C_INPUT_BRAM_74_DMWIDTH/8-1:0] s_axis_bram_74_tkeep,
    input [C_INPUT_BRAM_74_DMWIDTH/8-1:0] s_axis_bram_74_tstrb,
    input [C_INPUT_BRAM_74_DMWIDTH-1:0] s_axis_bram_74_tdata,
    output s_axis_bram_74_tready,
    input [C_INPUT_BRAM_74_ADDR_WIDTH-1:0] ap_bram_74_addr0,
    input [C_INPUT_BRAM_74_WIDTH-1:0] ap_bram_74_din0,
    output [C_INPUT_BRAM_74_WIDTH-1:0] ap_bram_74_dout0,
    input [C_INPUT_BRAM_74_WIDTH/8-1:0] ap_bram_74_we0,
    input ap_bram_74_en0,
    input [C_INPUT_BRAM_74_ADDR_WIDTH-1:0] ap_bram_74_addr1,
    input [C_INPUT_BRAM_74_WIDTH-1:0] ap_bram_74_din1,
    output [C_INPUT_BRAM_74_WIDTH-1:0] ap_bram_74_dout1,
    input [C_INPUT_BRAM_74_WIDTH/8-1:0] ap_bram_74_we1,
    input ap_bram_74_en1,
    //input AXI-Stream to FIFO interface 75
    input s_axis_bram_75_tlast,
    input s_axis_bram_75_tvalid,
    input [C_INPUT_BRAM_75_DMWIDTH/8-1:0] s_axis_bram_75_tkeep,
    input [C_INPUT_BRAM_75_DMWIDTH/8-1:0] s_axis_bram_75_tstrb,
    input [C_INPUT_BRAM_75_DMWIDTH-1:0] s_axis_bram_75_tdata,
    output s_axis_bram_75_tready,
    input [C_INPUT_BRAM_75_ADDR_WIDTH-1:0] ap_bram_75_addr0,
    input [C_INPUT_BRAM_75_WIDTH-1:0] ap_bram_75_din0,
    output [C_INPUT_BRAM_75_WIDTH-1:0] ap_bram_75_dout0,
    input [C_INPUT_BRAM_75_WIDTH/8-1:0] ap_bram_75_we0,
    input ap_bram_75_en0,
    input [C_INPUT_BRAM_75_ADDR_WIDTH-1:0] ap_bram_75_addr1,
    input [C_INPUT_BRAM_75_WIDTH-1:0] ap_bram_75_din1,
    output [C_INPUT_BRAM_75_WIDTH-1:0] ap_bram_75_dout1,
    input [C_INPUT_BRAM_75_WIDTH/8-1:0] ap_bram_75_we1,
    input ap_bram_75_en1,
    //input AXI-Stream to FIFO interface 76
    input s_axis_bram_76_tlast,
    input s_axis_bram_76_tvalid,
    input [C_INPUT_BRAM_76_DMWIDTH/8-1:0] s_axis_bram_76_tkeep,
    input [C_INPUT_BRAM_76_DMWIDTH/8-1:0] s_axis_bram_76_tstrb,
    input [C_INPUT_BRAM_76_DMWIDTH-1:0] s_axis_bram_76_tdata,
    output s_axis_bram_76_tready,
    input [C_INPUT_BRAM_76_ADDR_WIDTH-1:0] ap_bram_76_addr0,
    input [C_INPUT_BRAM_76_WIDTH-1:0] ap_bram_76_din0,
    output [C_INPUT_BRAM_76_WIDTH-1:0] ap_bram_76_dout0,
    input [C_INPUT_BRAM_76_WIDTH/8-1:0] ap_bram_76_we0,
    input ap_bram_76_en0,
    input [C_INPUT_BRAM_76_ADDR_WIDTH-1:0] ap_bram_76_addr1,
    input [C_INPUT_BRAM_76_WIDTH-1:0] ap_bram_76_din1,
    output [C_INPUT_BRAM_76_WIDTH-1:0] ap_bram_76_dout1,
    input [C_INPUT_BRAM_76_WIDTH/8-1:0] ap_bram_76_we1,
    input ap_bram_76_en1,
    //input AXI-Stream to FIFO interface 77
    input s_axis_bram_77_tlast,
    input s_axis_bram_77_tvalid,
    input [C_INPUT_BRAM_77_DMWIDTH/8-1:0] s_axis_bram_77_tkeep,
    input [C_INPUT_BRAM_77_DMWIDTH/8-1:0] s_axis_bram_77_tstrb,
    input [C_INPUT_BRAM_77_DMWIDTH-1:0] s_axis_bram_77_tdata,
    output s_axis_bram_77_tready,
    input [C_INPUT_BRAM_77_ADDR_WIDTH-1:0] ap_bram_77_addr0,
    input [C_INPUT_BRAM_77_WIDTH-1:0] ap_bram_77_din0,
    output [C_INPUT_BRAM_77_WIDTH-1:0] ap_bram_77_dout0,
    input [C_INPUT_BRAM_77_WIDTH/8-1:0] ap_bram_77_we0,
    input ap_bram_77_en0,
    input [C_INPUT_BRAM_77_ADDR_WIDTH-1:0] ap_bram_77_addr1,
    input [C_INPUT_BRAM_77_WIDTH-1:0] ap_bram_77_din1,
    output [C_INPUT_BRAM_77_WIDTH-1:0] ap_bram_77_dout1,
    input [C_INPUT_BRAM_77_WIDTH/8-1:0] ap_bram_77_we1,
    input ap_bram_77_en1,
    //input AXI-Stream to FIFO interface 78
    input s_axis_bram_78_tlast,
    input s_axis_bram_78_tvalid,
    input [C_INPUT_BRAM_78_DMWIDTH/8-1:0] s_axis_bram_78_tkeep,
    input [C_INPUT_BRAM_78_DMWIDTH/8-1:0] s_axis_bram_78_tstrb,
    input [C_INPUT_BRAM_78_DMWIDTH-1:0] s_axis_bram_78_tdata,
    output s_axis_bram_78_tready,
    input [C_INPUT_BRAM_78_ADDR_WIDTH-1:0] ap_bram_78_addr0,
    input [C_INPUT_BRAM_78_WIDTH-1:0] ap_bram_78_din0,
    output [C_INPUT_BRAM_78_WIDTH-1:0] ap_bram_78_dout0,
    input [C_INPUT_BRAM_78_WIDTH/8-1:0] ap_bram_78_we0,
    input ap_bram_78_en0,
    input [C_INPUT_BRAM_78_ADDR_WIDTH-1:0] ap_bram_78_addr1,
    input [C_INPUT_BRAM_78_WIDTH-1:0] ap_bram_78_din1,
    output [C_INPUT_BRAM_78_WIDTH-1:0] ap_bram_78_dout1,
    input [C_INPUT_BRAM_78_WIDTH/8-1:0] ap_bram_78_we1,
    input ap_bram_78_en1,
    //input AXI-Stream to FIFO interface 79
    input s_axis_bram_79_tlast,
    input s_axis_bram_79_tvalid,
    input [C_INPUT_BRAM_79_DMWIDTH/8-1:0] s_axis_bram_79_tkeep,
    input [C_INPUT_BRAM_79_DMWIDTH/8-1:0] s_axis_bram_79_tstrb,
    input [C_INPUT_BRAM_79_DMWIDTH-1:0] s_axis_bram_79_tdata,
    output s_axis_bram_79_tready,
    input [C_INPUT_BRAM_79_ADDR_WIDTH-1:0] ap_bram_79_addr0,
    input [C_INPUT_BRAM_79_WIDTH-1:0] ap_bram_79_din0,
    output [C_INPUT_BRAM_79_WIDTH-1:0] ap_bram_79_dout0,
    input [C_INPUT_BRAM_79_WIDTH/8-1:0] ap_bram_79_we0,
    input ap_bram_79_en0,
    input [C_INPUT_BRAM_79_ADDR_WIDTH-1:0] ap_bram_79_addr1,
    input [C_INPUT_BRAM_79_WIDTH-1:0] ap_bram_79_din1,
    output [C_INPUT_BRAM_79_WIDTH-1:0] ap_bram_79_dout1,
    input [C_INPUT_BRAM_79_WIDTH/8-1:0] ap_bram_79_we1,
    input ap_bram_79_en1,
    //input AXI-Stream to FIFO interface 80
    input s_axis_bram_80_tlast,
    input s_axis_bram_80_tvalid,
    input [C_INPUT_BRAM_80_DMWIDTH/8-1:0] s_axis_bram_80_tkeep,
    input [C_INPUT_BRAM_80_DMWIDTH/8-1:0] s_axis_bram_80_tstrb,
    input [C_INPUT_BRAM_80_DMWIDTH-1:0] s_axis_bram_80_tdata,
    output s_axis_bram_80_tready,
    input [C_INPUT_BRAM_80_ADDR_WIDTH-1:0] ap_bram_80_addr0,
    input [C_INPUT_BRAM_80_WIDTH-1:0] ap_bram_80_din0,
    output [C_INPUT_BRAM_80_WIDTH-1:0] ap_bram_80_dout0,
    input [C_INPUT_BRAM_80_WIDTH/8-1:0] ap_bram_80_we0,
    input ap_bram_80_en0,
    input [C_INPUT_BRAM_80_ADDR_WIDTH-1:0] ap_bram_80_addr1,
    input [C_INPUT_BRAM_80_WIDTH-1:0] ap_bram_80_din1,
    output [C_INPUT_BRAM_80_WIDTH-1:0] ap_bram_80_dout1,
    input [C_INPUT_BRAM_80_WIDTH/8-1:0] ap_bram_80_we1,
    input ap_bram_80_en1,
    //input AXI-Stream to FIFO interface 81
    input s_axis_bram_81_tlast,
    input s_axis_bram_81_tvalid,
    input [C_INPUT_BRAM_81_DMWIDTH/8-1:0] s_axis_bram_81_tkeep,
    input [C_INPUT_BRAM_81_DMWIDTH/8-1:0] s_axis_bram_81_tstrb,
    input [C_INPUT_BRAM_81_DMWIDTH-1:0] s_axis_bram_81_tdata,
    output s_axis_bram_81_tready,
    input [C_INPUT_BRAM_81_ADDR_WIDTH-1:0] ap_bram_81_addr0,
    input [C_INPUT_BRAM_81_WIDTH-1:0] ap_bram_81_din0,
    output [C_INPUT_BRAM_81_WIDTH-1:0] ap_bram_81_dout0,
    input [C_INPUT_BRAM_81_WIDTH/8-1:0] ap_bram_81_we0,
    input ap_bram_81_en0,
    input [C_INPUT_BRAM_81_ADDR_WIDTH-1:0] ap_bram_81_addr1,
    input [C_INPUT_BRAM_81_WIDTH-1:0] ap_bram_81_din1,
    output [C_INPUT_BRAM_81_WIDTH-1:0] ap_bram_81_dout1,
    input [C_INPUT_BRAM_81_WIDTH/8-1:0] ap_bram_81_we1,
    input ap_bram_81_en1,
    //input AXI-Stream to FIFO interface 82
    input s_axis_bram_82_tlast,
    input s_axis_bram_82_tvalid,
    input [C_INPUT_BRAM_82_DMWIDTH/8-1:0] s_axis_bram_82_tkeep,
    input [C_INPUT_BRAM_82_DMWIDTH/8-1:0] s_axis_bram_82_tstrb,
    input [C_INPUT_BRAM_82_DMWIDTH-1:0] s_axis_bram_82_tdata,
    output s_axis_bram_82_tready,
    input [C_INPUT_BRAM_82_ADDR_WIDTH-1:0] ap_bram_82_addr0,
    input [C_INPUT_BRAM_82_WIDTH-1:0] ap_bram_82_din0,
    output [C_INPUT_BRAM_82_WIDTH-1:0] ap_bram_82_dout0,
    input [C_INPUT_BRAM_82_WIDTH/8-1:0] ap_bram_82_we0,
    input ap_bram_82_en0,
    input [C_INPUT_BRAM_82_ADDR_WIDTH-1:0] ap_bram_82_addr1,
    input [C_INPUT_BRAM_82_WIDTH-1:0] ap_bram_82_din1,
    output [C_INPUT_BRAM_82_WIDTH-1:0] ap_bram_82_dout1,
    input [C_INPUT_BRAM_82_WIDTH/8-1:0] ap_bram_82_we1,
    input ap_bram_82_en1,
    //input AXI-Stream to FIFO interface 83
    input s_axis_bram_83_tlast,
    input s_axis_bram_83_tvalid,
    input [C_INPUT_BRAM_83_DMWIDTH/8-1:0] s_axis_bram_83_tkeep,
    input [C_INPUT_BRAM_83_DMWIDTH/8-1:0] s_axis_bram_83_tstrb,
    input [C_INPUT_BRAM_83_DMWIDTH-1:0] s_axis_bram_83_tdata,
    output s_axis_bram_83_tready,
    input [C_INPUT_BRAM_83_ADDR_WIDTH-1:0] ap_bram_83_addr0,
    input [C_INPUT_BRAM_83_WIDTH-1:0] ap_bram_83_din0,
    output [C_INPUT_BRAM_83_WIDTH-1:0] ap_bram_83_dout0,
    input [C_INPUT_BRAM_83_WIDTH/8-1:0] ap_bram_83_we0,
    input ap_bram_83_en0,
    input [C_INPUT_BRAM_83_ADDR_WIDTH-1:0] ap_bram_83_addr1,
    input [C_INPUT_BRAM_83_WIDTH-1:0] ap_bram_83_din1,
    output [C_INPUT_BRAM_83_WIDTH-1:0] ap_bram_83_dout1,
    input [C_INPUT_BRAM_83_WIDTH/8-1:0] ap_bram_83_we1,
    input ap_bram_83_en1,
    //input AXI-Stream to FIFO interface 84
    input s_axis_bram_84_tlast,
    input s_axis_bram_84_tvalid,
    input [C_INPUT_BRAM_84_DMWIDTH/8-1:0] s_axis_bram_84_tkeep,
    input [C_INPUT_BRAM_84_DMWIDTH/8-1:0] s_axis_bram_84_tstrb,
    input [C_INPUT_BRAM_84_DMWIDTH-1:0] s_axis_bram_84_tdata,
    output s_axis_bram_84_tready,
    input [C_INPUT_BRAM_84_ADDR_WIDTH-1:0] ap_bram_84_addr0,
    input [C_INPUT_BRAM_84_WIDTH-1:0] ap_bram_84_din0,
    output [C_INPUT_BRAM_84_WIDTH-1:0] ap_bram_84_dout0,
    input [C_INPUT_BRAM_84_WIDTH/8-1:0] ap_bram_84_we0,
    input ap_bram_84_en0,
    input [C_INPUT_BRAM_84_ADDR_WIDTH-1:0] ap_bram_84_addr1,
    input [C_INPUT_BRAM_84_WIDTH-1:0] ap_bram_84_din1,
    output [C_INPUT_BRAM_84_WIDTH-1:0] ap_bram_84_dout1,
    input [C_INPUT_BRAM_84_WIDTH/8-1:0] ap_bram_84_we1,
    input ap_bram_84_en1,
    //input AXI-Stream to FIFO interface 85
    input s_axis_bram_85_tlast,
    input s_axis_bram_85_tvalid,
    input [C_INPUT_BRAM_85_DMWIDTH/8-1:0] s_axis_bram_85_tkeep,
    input [C_INPUT_BRAM_85_DMWIDTH/8-1:0] s_axis_bram_85_tstrb,
    input [C_INPUT_BRAM_85_DMWIDTH-1:0] s_axis_bram_85_tdata,
    output s_axis_bram_85_tready,
    input [C_INPUT_BRAM_85_ADDR_WIDTH-1:0] ap_bram_85_addr0,
    input [C_INPUT_BRAM_85_WIDTH-1:0] ap_bram_85_din0,
    output [C_INPUT_BRAM_85_WIDTH-1:0] ap_bram_85_dout0,
    input [C_INPUT_BRAM_85_WIDTH/8-1:0] ap_bram_85_we0,
    input ap_bram_85_en0,
    input [C_INPUT_BRAM_85_ADDR_WIDTH-1:0] ap_bram_85_addr1,
    input [C_INPUT_BRAM_85_WIDTH-1:0] ap_bram_85_din1,
    output [C_INPUT_BRAM_85_WIDTH-1:0] ap_bram_85_dout1,
    input [C_INPUT_BRAM_85_WIDTH/8-1:0] ap_bram_85_we1,
    input ap_bram_85_en1,
    //input AXI-Stream to FIFO interface 86
    input s_axis_bram_86_tlast,
    input s_axis_bram_86_tvalid,
    input [C_INPUT_BRAM_86_DMWIDTH/8-1:0] s_axis_bram_86_tkeep,
    input [C_INPUT_BRAM_86_DMWIDTH/8-1:0] s_axis_bram_86_tstrb,
    input [C_INPUT_BRAM_86_DMWIDTH-1:0] s_axis_bram_86_tdata,
    output s_axis_bram_86_tready,
    input [C_INPUT_BRAM_86_ADDR_WIDTH-1:0] ap_bram_86_addr0,
    input [C_INPUT_BRAM_86_WIDTH-1:0] ap_bram_86_din0,
    output [C_INPUT_BRAM_86_WIDTH-1:0] ap_bram_86_dout0,
    input [C_INPUT_BRAM_86_WIDTH/8-1:0] ap_bram_86_we0,
    input ap_bram_86_en0,
    input [C_INPUT_BRAM_86_ADDR_WIDTH-1:0] ap_bram_86_addr1,
    input [C_INPUT_BRAM_86_WIDTH-1:0] ap_bram_86_din1,
    output [C_INPUT_BRAM_86_WIDTH-1:0] ap_bram_86_dout1,
    input [C_INPUT_BRAM_86_WIDTH/8-1:0] ap_bram_86_we1,
    input ap_bram_86_en1,
    //input AXI-Stream to FIFO interface 87
    input s_axis_bram_87_tlast,
    input s_axis_bram_87_tvalid,
    input [C_INPUT_BRAM_87_DMWIDTH/8-1:0] s_axis_bram_87_tkeep,
    input [C_INPUT_BRAM_87_DMWIDTH/8-1:0] s_axis_bram_87_tstrb,
    input [C_INPUT_BRAM_87_DMWIDTH-1:0] s_axis_bram_87_tdata,
    output s_axis_bram_87_tready,
    input [C_INPUT_BRAM_87_ADDR_WIDTH-1:0] ap_bram_87_addr0,
    input [C_INPUT_BRAM_87_WIDTH-1:0] ap_bram_87_din0,
    output [C_INPUT_BRAM_87_WIDTH-1:0] ap_bram_87_dout0,
    input [C_INPUT_BRAM_87_WIDTH/8-1:0] ap_bram_87_we0,
    input ap_bram_87_en0,
    input [C_INPUT_BRAM_87_ADDR_WIDTH-1:0] ap_bram_87_addr1,
    input [C_INPUT_BRAM_87_WIDTH-1:0] ap_bram_87_din1,
    output [C_INPUT_BRAM_87_WIDTH-1:0] ap_bram_87_dout1,
    input [C_INPUT_BRAM_87_WIDTH/8-1:0] ap_bram_87_we1,
    input ap_bram_87_en1,
    //input AXI-Stream to FIFO interface 88
    input s_axis_bram_88_tlast,
    input s_axis_bram_88_tvalid,
    input [C_INPUT_BRAM_88_DMWIDTH/8-1:0] s_axis_bram_88_tkeep,
    input [C_INPUT_BRAM_88_DMWIDTH/8-1:0] s_axis_bram_88_tstrb,
    input [C_INPUT_BRAM_88_DMWIDTH-1:0] s_axis_bram_88_tdata,
    output s_axis_bram_88_tready,
    input [C_INPUT_BRAM_88_ADDR_WIDTH-1:0] ap_bram_88_addr0,
    input [C_INPUT_BRAM_88_WIDTH-1:0] ap_bram_88_din0,
    output [C_INPUT_BRAM_88_WIDTH-1:0] ap_bram_88_dout0,
    input [C_INPUT_BRAM_88_WIDTH/8-1:0] ap_bram_88_we0,
    input ap_bram_88_en0,
    input [C_INPUT_BRAM_88_ADDR_WIDTH-1:0] ap_bram_88_addr1,
    input [C_INPUT_BRAM_88_WIDTH-1:0] ap_bram_88_din1,
    output [C_INPUT_BRAM_88_WIDTH-1:0] ap_bram_88_dout1,
    input [C_INPUT_BRAM_88_WIDTH/8-1:0] ap_bram_88_we1,
    input ap_bram_88_en1,
    //input AXI-Stream to FIFO interface 89
    input s_axis_bram_89_tlast,
    input s_axis_bram_89_tvalid,
    input [C_INPUT_BRAM_89_DMWIDTH/8-1:0] s_axis_bram_89_tkeep,
    input [C_INPUT_BRAM_89_DMWIDTH/8-1:0] s_axis_bram_89_tstrb,
    input [C_INPUT_BRAM_89_DMWIDTH-1:0] s_axis_bram_89_tdata,
    output s_axis_bram_89_tready,
    input [C_INPUT_BRAM_89_ADDR_WIDTH-1:0] ap_bram_89_addr0,
    input [C_INPUT_BRAM_89_WIDTH-1:0] ap_bram_89_din0,
    output [C_INPUT_BRAM_89_WIDTH-1:0] ap_bram_89_dout0,
    input [C_INPUT_BRAM_89_WIDTH/8-1:0] ap_bram_89_we0,
    input ap_bram_89_en0,
    input [C_INPUT_BRAM_89_ADDR_WIDTH-1:0] ap_bram_89_addr1,
    input [C_INPUT_BRAM_89_WIDTH-1:0] ap_bram_89_din1,
    output [C_INPUT_BRAM_89_WIDTH-1:0] ap_bram_89_dout1,
    input [C_INPUT_BRAM_89_WIDTH/8-1:0] ap_bram_89_we1,
    input ap_bram_89_en1,
    //input AXI-Stream to FIFO interface 90
    input s_axis_bram_90_tlast,
    input s_axis_bram_90_tvalid,
    input [C_INPUT_BRAM_90_DMWIDTH/8-1:0] s_axis_bram_90_tkeep,
    input [C_INPUT_BRAM_90_DMWIDTH/8-1:0] s_axis_bram_90_tstrb,
    input [C_INPUT_BRAM_90_DMWIDTH-1:0] s_axis_bram_90_tdata,
    output s_axis_bram_90_tready,
    input [C_INPUT_BRAM_90_ADDR_WIDTH-1:0] ap_bram_90_addr0,
    input [C_INPUT_BRAM_90_WIDTH-1:0] ap_bram_90_din0,
    output [C_INPUT_BRAM_90_WIDTH-1:0] ap_bram_90_dout0,
    input [C_INPUT_BRAM_90_WIDTH/8-1:0] ap_bram_90_we0,
    input ap_bram_90_en0,
    input [C_INPUT_BRAM_90_ADDR_WIDTH-1:0] ap_bram_90_addr1,
    input [C_INPUT_BRAM_90_WIDTH-1:0] ap_bram_90_din1,
    output [C_INPUT_BRAM_90_WIDTH-1:0] ap_bram_90_dout1,
    input [C_INPUT_BRAM_90_WIDTH/8-1:0] ap_bram_90_we1,
    input ap_bram_90_en1,
    //input AXI-Stream to FIFO interface 91
    input s_axis_bram_91_tlast,
    input s_axis_bram_91_tvalid,
    input [C_INPUT_BRAM_91_DMWIDTH/8-1:0] s_axis_bram_91_tkeep,
    input [C_INPUT_BRAM_91_DMWIDTH/8-1:0] s_axis_bram_91_tstrb,
    input [C_INPUT_BRAM_91_DMWIDTH-1:0] s_axis_bram_91_tdata,
    output s_axis_bram_91_tready,
    input [C_INPUT_BRAM_91_ADDR_WIDTH-1:0] ap_bram_91_addr0,
    input [C_INPUT_BRAM_91_WIDTH-1:0] ap_bram_91_din0,
    output [C_INPUT_BRAM_91_WIDTH-1:0] ap_bram_91_dout0,
    input [C_INPUT_BRAM_91_WIDTH/8-1:0] ap_bram_91_we0,
    input ap_bram_91_en0,
    input [C_INPUT_BRAM_91_ADDR_WIDTH-1:0] ap_bram_91_addr1,
    input [C_INPUT_BRAM_91_WIDTH-1:0] ap_bram_91_din1,
    output [C_INPUT_BRAM_91_WIDTH-1:0] ap_bram_91_dout1,
    input [C_INPUT_BRAM_91_WIDTH/8-1:0] ap_bram_91_we1,
    input ap_bram_91_en1,
    //input AXI-Stream to FIFO interface 92
    input s_axis_bram_92_tlast,
    input s_axis_bram_92_tvalid,
    input [C_INPUT_BRAM_92_DMWIDTH/8-1:0] s_axis_bram_92_tkeep,
    input [C_INPUT_BRAM_92_DMWIDTH/8-1:0] s_axis_bram_92_tstrb,
    input [C_INPUT_BRAM_92_DMWIDTH-1:0] s_axis_bram_92_tdata,
    output s_axis_bram_92_tready,
    input [C_INPUT_BRAM_92_ADDR_WIDTH-1:0] ap_bram_92_addr0,
    input [C_INPUT_BRAM_92_WIDTH-1:0] ap_bram_92_din0,
    output [C_INPUT_BRAM_92_WIDTH-1:0] ap_bram_92_dout0,
    input [C_INPUT_BRAM_92_WIDTH/8-1:0] ap_bram_92_we0,
    input ap_bram_92_en0,
    input [C_INPUT_BRAM_92_ADDR_WIDTH-1:0] ap_bram_92_addr1,
    input [C_INPUT_BRAM_92_WIDTH-1:0] ap_bram_92_din1,
    output [C_INPUT_BRAM_92_WIDTH-1:0] ap_bram_92_dout1,
    input [C_INPUT_BRAM_92_WIDTH/8-1:0] ap_bram_92_we1,
    input ap_bram_92_en1,
    //input AXI-Stream to FIFO interface 93
    input s_axis_bram_93_tlast,
    input s_axis_bram_93_tvalid,
    input [C_INPUT_BRAM_93_DMWIDTH/8-1:0] s_axis_bram_93_tkeep,
    input [C_INPUT_BRAM_93_DMWIDTH/8-1:0] s_axis_bram_93_tstrb,
    input [C_INPUT_BRAM_93_DMWIDTH-1:0] s_axis_bram_93_tdata,
    output s_axis_bram_93_tready,
    input [C_INPUT_BRAM_93_ADDR_WIDTH-1:0] ap_bram_93_addr0,
    input [C_INPUT_BRAM_93_WIDTH-1:0] ap_bram_93_din0,
    output [C_INPUT_BRAM_93_WIDTH-1:0] ap_bram_93_dout0,
    input [C_INPUT_BRAM_93_WIDTH/8-1:0] ap_bram_93_we0,
    input ap_bram_93_en0,
    input [C_INPUT_BRAM_93_ADDR_WIDTH-1:0] ap_bram_93_addr1,
    input [C_INPUT_BRAM_93_WIDTH-1:0] ap_bram_93_din1,
    output [C_INPUT_BRAM_93_WIDTH-1:0] ap_bram_93_dout1,
    input [C_INPUT_BRAM_93_WIDTH/8-1:0] ap_bram_93_we1,
    input ap_bram_93_en1,
    //input AXI-Stream to FIFO interface 94
    input s_axis_bram_94_tlast,
    input s_axis_bram_94_tvalid,
    input [C_INPUT_BRAM_94_DMWIDTH/8-1:0] s_axis_bram_94_tkeep,
    input [C_INPUT_BRAM_94_DMWIDTH/8-1:0] s_axis_bram_94_tstrb,
    input [C_INPUT_BRAM_94_DMWIDTH-1:0] s_axis_bram_94_tdata,
    output s_axis_bram_94_tready,
    input [C_INPUT_BRAM_94_ADDR_WIDTH-1:0] ap_bram_94_addr0,
    input [C_INPUT_BRAM_94_WIDTH-1:0] ap_bram_94_din0,
    output [C_INPUT_BRAM_94_WIDTH-1:0] ap_bram_94_dout0,
    input [C_INPUT_BRAM_94_WIDTH/8-1:0] ap_bram_94_we0,
    input ap_bram_94_en0,
    input [C_INPUT_BRAM_94_ADDR_WIDTH-1:0] ap_bram_94_addr1,
    input [C_INPUT_BRAM_94_WIDTH-1:0] ap_bram_94_din1,
    output [C_INPUT_BRAM_94_WIDTH-1:0] ap_bram_94_dout1,
    input [C_INPUT_BRAM_94_WIDTH/8-1:0] ap_bram_94_we1,
    input ap_bram_94_en1,
    //input AXI-Stream to FIFO interface 95
    input s_axis_bram_95_tlast,
    input s_axis_bram_95_tvalid,
    input [C_INPUT_BRAM_95_DMWIDTH/8-1:0] s_axis_bram_95_tkeep,
    input [C_INPUT_BRAM_95_DMWIDTH/8-1:0] s_axis_bram_95_tstrb,
    input [C_INPUT_BRAM_95_DMWIDTH-1:0] s_axis_bram_95_tdata,
    output s_axis_bram_95_tready,
    input [C_INPUT_BRAM_95_ADDR_WIDTH-1:0] ap_bram_95_addr0,
    input [C_INPUT_BRAM_95_WIDTH-1:0] ap_bram_95_din0,
    output [C_INPUT_BRAM_95_WIDTH-1:0] ap_bram_95_dout0,
    input [C_INPUT_BRAM_95_WIDTH/8-1:0] ap_bram_95_we0,
    input ap_bram_95_en0,
    input [C_INPUT_BRAM_95_ADDR_WIDTH-1:0] ap_bram_95_addr1,
    input [C_INPUT_BRAM_95_WIDTH-1:0] ap_bram_95_din1,
    output [C_INPUT_BRAM_95_WIDTH-1:0] ap_bram_95_dout1,
    input [C_INPUT_BRAM_95_WIDTH/8-1:0] ap_bram_95_we1,
    input ap_bram_95_en1,
    //input AXI-Stream to FIFO interface 96
    input s_axis_bram_96_tlast,
    input s_axis_bram_96_tvalid,
    input [C_INPUT_BRAM_96_DMWIDTH/8-1:0] s_axis_bram_96_tkeep,
    input [C_INPUT_BRAM_96_DMWIDTH/8-1:0] s_axis_bram_96_tstrb,
    input [C_INPUT_BRAM_96_DMWIDTH-1:0] s_axis_bram_96_tdata,
    output s_axis_bram_96_tready,
    input [C_INPUT_BRAM_96_ADDR_WIDTH-1:0] ap_bram_96_addr0,
    input [C_INPUT_BRAM_96_WIDTH-1:0] ap_bram_96_din0,
    output [C_INPUT_BRAM_96_WIDTH-1:0] ap_bram_96_dout0,
    input [C_INPUT_BRAM_96_WIDTH/8-1:0] ap_bram_96_we0,
    input ap_bram_96_en0,
    input [C_INPUT_BRAM_96_ADDR_WIDTH-1:0] ap_bram_96_addr1,
    input [C_INPUT_BRAM_96_WIDTH-1:0] ap_bram_96_din1,
    output [C_INPUT_BRAM_96_WIDTH-1:0] ap_bram_96_dout1,
    input [C_INPUT_BRAM_96_WIDTH/8-1:0] ap_bram_96_we1,
    input ap_bram_96_en1,
    //input AXI-Stream to FIFO interface 97
    input s_axis_bram_97_tlast,
    input s_axis_bram_97_tvalid,
    input [C_INPUT_BRAM_97_DMWIDTH/8-1:0] s_axis_bram_97_tkeep,
    input [C_INPUT_BRAM_97_DMWIDTH/8-1:0] s_axis_bram_97_tstrb,
    input [C_INPUT_BRAM_97_DMWIDTH-1:0] s_axis_bram_97_tdata,
    output s_axis_bram_97_tready,
    input [C_INPUT_BRAM_97_ADDR_WIDTH-1:0] ap_bram_97_addr0,
    input [C_INPUT_BRAM_97_WIDTH-1:0] ap_bram_97_din0,
    output [C_INPUT_BRAM_97_WIDTH-1:0] ap_bram_97_dout0,
    input [C_INPUT_BRAM_97_WIDTH/8-1:0] ap_bram_97_we0,
    input ap_bram_97_en0,
    input [C_INPUT_BRAM_97_ADDR_WIDTH-1:0] ap_bram_97_addr1,
    input [C_INPUT_BRAM_97_WIDTH-1:0] ap_bram_97_din1,
    output [C_INPUT_BRAM_97_WIDTH-1:0] ap_bram_97_dout1,
    input [C_INPUT_BRAM_97_WIDTH/8-1:0] ap_bram_97_we1,
    input ap_bram_97_en1,
    //input AXI-Stream to FIFO interface 98
    input s_axis_bram_98_tlast,
    input s_axis_bram_98_tvalid,
    input [C_INPUT_BRAM_98_DMWIDTH/8-1:0] s_axis_bram_98_tkeep,
    input [C_INPUT_BRAM_98_DMWIDTH/8-1:0] s_axis_bram_98_tstrb,
    input [C_INPUT_BRAM_98_DMWIDTH-1:0] s_axis_bram_98_tdata,
    output s_axis_bram_98_tready,
    input [C_INPUT_BRAM_98_ADDR_WIDTH-1:0] ap_bram_98_addr0,
    input [C_INPUT_BRAM_98_WIDTH-1:0] ap_bram_98_din0,
    output [C_INPUT_BRAM_98_WIDTH-1:0] ap_bram_98_dout0,
    input [C_INPUT_BRAM_98_WIDTH/8-1:0] ap_bram_98_we0,
    input ap_bram_98_en0,
    input [C_INPUT_BRAM_98_ADDR_WIDTH-1:0] ap_bram_98_addr1,
    input [C_INPUT_BRAM_98_WIDTH-1:0] ap_bram_98_din1,
    output [C_INPUT_BRAM_98_WIDTH-1:0] ap_bram_98_dout1,
    input [C_INPUT_BRAM_98_WIDTH/8-1:0] ap_bram_98_we1,
    input ap_bram_98_en1,
    //input AXI-Stream to FIFO interface 99
    input s_axis_bram_99_tlast,
    input s_axis_bram_99_tvalid,
    input [C_INPUT_BRAM_99_DMWIDTH/8-1:0] s_axis_bram_99_tkeep,
    input [C_INPUT_BRAM_99_DMWIDTH/8-1:0] s_axis_bram_99_tstrb,
    input [C_INPUT_BRAM_99_DMWIDTH-1:0] s_axis_bram_99_tdata,
    output s_axis_bram_99_tready,
    input [C_INPUT_BRAM_99_ADDR_WIDTH-1:0] ap_bram_99_addr0,
    input [C_INPUT_BRAM_99_WIDTH-1:0] ap_bram_99_din0,
    output [C_INPUT_BRAM_99_WIDTH-1:0] ap_bram_99_dout0,
    input [C_INPUT_BRAM_99_WIDTH/8-1:0] ap_bram_99_we0,
    input ap_bram_99_en0,
    input [C_INPUT_BRAM_99_ADDR_WIDTH-1:0] ap_bram_99_addr1,
    input [C_INPUT_BRAM_99_WIDTH-1:0] ap_bram_99_din1,
    output [C_INPUT_BRAM_99_WIDTH-1:0] ap_bram_99_dout1,
    input [C_INPUT_BRAM_99_WIDTH/8-1:0] ap_bram_99_we1,
    input ap_bram_99_en1,
    //input AXI-Stream to FIFO interface 100
    input s_axis_bram_100_tlast,
    input s_axis_bram_100_tvalid,
    input [C_INPUT_BRAM_100_DMWIDTH/8-1:0] s_axis_bram_100_tkeep,
    input [C_INPUT_BRAM_100_DMWIDTH/8-1:0] s_axis_bram_100_tstrb,
    input [C_INPUT_BRAM_100_DMWIDTH-1:0] s_axis_bram_100_tdata,
    output s_axis_bram_100_tready,
    input [C_INPUT_BRAM_100_ADDR_WIDTH-1:0] ap_bram_100_addr0,
    input [C_INPUT_BRAM_100_WIDTH-1:0] ap_bram_100_din0,
    output [C_INPUT_BRAM_100_WIDTH-1:0] ap_bram_100_dout0,
    input [C_INPUT_BRAM_100_WIDTH/8-1:0] ap_bram_100_we0,
    input ap_bram_100_en0,
    input [C_INPUT_BRAM_100_ADDR_WIDTH-1:0] ap_bram_100_addr1,
    input [C_INPUT_BRAM_100_WIDTH-1:0] ap_bram_100_din1,
    output [C_INPUT_BRAM_100_WIDTH-1:0] ap_bram_100_dout1,
    input [C_INPUT_BRAM_100_WIDTH/8-1:0] ap_bram_100_we1,
    input ap_bram_100_en1,
    //input AXI-Stream to FIFO interface 101
    input s_axis_bram_101_tlast,
    input s_axis_bram_101_tvalid,
    input [C_INPUT_BRAM_101_DMWIDTH/8-1:0] s_axis_bram_101_tkeep,
    input [C_INPUT_BRAM_101_DMWIDTH/8-1:0] s_axis_bram_101_tstrb,
    input [C_INPUT_BRAM_101_DMWIDTH-1:0] s_axis_bram_101_tdata,
    output s_axis_bram_101_tready,
    input [C_INPUT_BRAM_101_ADDR_WIDTH-1:0] ap_bram_101_addr0,
    input [C_INPUT_BRAM_101_WIDTH-1:0] ap_bram_101_din0,
    output [C_INPUT_BRAM_101_WIDTH-1:0] ap_bram_101_dout0,
    input [C_INPUT_BRAM_101_WIDTH/8-1:0] ap_bram_101_we0,
    input ap_bram_101_en0,
    input [C_INPUT_BRAM_101_ADDR_WIDTH-1:0] ap_bram_101_addr1,
    input [C_INPUT_BRAM_101_WIDTH-1:0] ap_bram_101_din1,
    output [C_INPUT_BRAM_101_WIDTH-1:0] ap_bram_101_dout1,
    input [C_INPUT_BRAM_101_WIDTH/8-1:0] ap_bram_101_we1,
    input ap_bram_101_en1,
    //input AXI-Stream to FIFO interface 102
    input s_axis_bram_102_tlast,
    input s_axis_bram_102_tvalid,
    input [C_INPUT_BRAM_102_DMWIDTH/8-1:0] s_axis_bram_102_tkeep,
    input [C_INPUT_BRAM_102_DMWIDTH/8-1:0] s_axis_bram_102_tstrb,
    input [C_INPUT_BRAM_102_DMWIDTH-1:0] s_axis_bram_102_tdata,
    output s_axis_bram_102_tready,
    input [C_INPUT_BRAM_102_ADDR_WIDTH-1:0] ap_bram_102_addr0,
    input [C_INPUT_BRAM_102_WIDTH-1:0] ap_bram_102_din0,
    output [C_INPUT_BRAM_102_WIDTH-1:0] ap_bram_102_dout0,
    input [C_INPUT_BRAM_102_WIDTH/8-1:0] ap_bram_102_we0,
    input ap_bram_102_en0,
    input [C_INPUT_BRAM_102_ADDR_WIDTH-1:0] ap_bram_102_addr1,
    input [C_INPUT_BRAM_102_WIDTH-1:0] ap_bram_102_din1,
    output [C_INPUT_BRAM_102_WIDTH-1:0] ap_bram_102_dout1,
    input [C_INPUT_BRAM_102_WIDTH/8-1:0] ap_bram_102_we1,
    input ap_bram_102_en1,
    //input AXI-Stream to FIFO interface 103
    input s_axis_bram_103_tlast,
    input s_axis_bram_103_tvalid,
    input [C_INPUT_BRAM_103_DMWIDTH/8-1:0] s_axis_bram_103_tkeep,
    input [C_INPUT_BRAM_103_DMWIDTH/8-1:0] s_axis_bram_103_tstrb,
    input [C_INPUT_BRAM_103_DMWIDTH-1:0] s_axis_bram_103_tdata,
    output s_axis_bram_103_tready,
    input [C_INPUT_BRAM_103_ADDR_WIDTH-1:0] ap_bram_103_addr0,
    input [C_INPUT_BRAM_103_WIDTH-1:0] ap_bram_103_din0,
    output [C_INPUT_BRAM_103_WIDTH-1:0] ap_bram_103_dout0,
    input [C_INPUT_BRAM_103_WIDTH/8-1:0] ap_bram_103_we0,
    input ap_bram_103_en0,
    input [C_INPUT_BRAM_103_ADDR_WIDTH-1:0] ap_bram_103_addr1,
    input [C_INPUT_BRAM_103_WIDTH-1:0] ap_bram_103_din1,
    output [C_INPUT_BRAM_103_WIDTH-1:0] ap_bram_103_dout1,
    input [C_INPUT_BRAM_103_WIDTH/8-1:0] ap_bram_103_we1,
    input ap_bram_103_en1,
    //input AXI-Stream to FIFO interface 104
    input s_axis_bram_104_tlast,
    input s_axis_bram_104_tvalid,
    input [C_INPUT_BRAM_104_DMWIDTH/8-1:0] s_axis_bram_104_tkeep,
    input [C_INPUT_BRAM_104_DMWIDTH/8-1:0] s_axis_bram_104_tstrb,
    input [C_INPUT_BRAM_104_DMWIDTH-1:0] s_axis_bram_104_tdata,
    output s_axis_bram_104_tready,
    input [C_INPUT_BRAM_104_ADDR_WIDTH-1:0] ap_bram_104_addr0,
    input [C_INPUT_BRAM_104_WIDTH-1:0] ap_bram_104_din0,
    output [C_INPUT_BRAM_104_WIDTH-1:0] ap_bram_104_dout0,
    input [C_INPUT_BRAM_104_WIDTH/8-1:0] ap_bram_104_we0,
    input ap_bram_104_en0,
    input [C_INPUT_BRAM_104_ADDR_WIDTH-1:0] ap_bram_104_addr1,
    input [C_INPUT_BRAM_104_WIDTH-1:0] ap_bram_104_din1,
    output [C_INPUT_BRAM_104_WIDTH-1:0] ap_bram_104_dout1,
    input [C_INPUT_BRAM_104_WIDTH/8-1:0] ap_bram_104_we1,
    input ap_bram_104_en1,
    //input AXI-Stream to FIFO interface 105
    input s_axis_bram_105_tlast,
    input s_axis_bram_105_tvalid,
    input [C_INPUT_BRAM_105_DMWIDTH/8-1:0] s_axis_bram_105_tkeep,
    input [C_INPUT_BRAM_105_DMWIDTH/8-1:0] s_axis_bram_105_tstrb,
    input [C_INPUT_BRAM_105_DMWIDTH-1:0] s_axis_bram_105_tdata,
    output s_axis_bram_105_tready,
    input [C_INPUT_BRAM_105_ADDR_WIDTH-1:0] ap_bram_105_addr0,
    input [C_INPUT_BRAM_105_WIDTH-1:0] ap_bram_105_din0,
    output [C_INPUT_BRAM_105_WIDTH-1:0] ap_bram_105_dout0,
    input [C_INPUT_BRAM_105_WIDTH/8-1:0] ap_bram_105_we0,
    input ap_bram_105_en0,
    input [C_INPUT_BRAM_105_ADDR_WIDTH-1:0] ap_bram_105_addr1,
    input [C_INPUT_BRAM_105_WIDTH-1:0] ap_bram_105_din1,
    output [C_INPUT_BRAM_105_WIDTH-1:0] ap_bram_105_dout1,
    input [C_INPUT_BRAM_105_WIDTH/8-1:0] ap_bram_105_we1,
    input ap_bram_105_en1,
    //input AXI-Stream to FIFO interface 106
    input s_axis_bram_106_tlast,
    input s_axis_bram_106_tvalid,
    input [C_INPUT_BRAM_106_DMWIDTH/8-1:0] s_axis_bram_106_tkeep,
    input [C_INPUT_BRAM_106_DMWIDTH/8-1:0] s_axis_bram_106_tstrb,
    input [C_INPUT_BRAM_106_DMWIDTH-1:0] s_axis_bram_106_tdata,
    output s_axis_bram_106_tready,
    input [C_INPUT_BRAM_106_ADDR_WIDTH-1:0] ap_bram_106_addr0,
    input [C_INPUT_BRAM_106_WIDTH-1:0] ap_bram_106_din0,
    output [C_INPUT_BRAM_106_WIDTH-1:0] ap_bram_106_dout0,
    input [C_INPUT_BRAM_106_WIDTH/8-1:0] ap_bram_106_we0,
    input ap_bram_106_en0,
    input [C_INPUT_BRAM_106_ADDR_WIDTH-1:0] ap_bram_106_addr1,
    input [C_INPUT_BRAM_106_WIDTH-1:0] ap_bram_106_din1,
    output [C_INPUT_BRAM_106_WIDTH-1:0] ap_bram_106_dout1,
    input [C_INPUT_BRAM_106_WIDTH/8-1:0] ap_bram_106_we1,
    input ap_bram_106_en1,
    //input AXI-Stream to FIFO interface 107
    input s_axis_bram_107_tlast,
    input s_axis_bram_107_tvalid,
    input [C_INPUT_BRAM_107_DMWIDTH/8-1:0] s_axis_bram_107_tkeep,
    input [C_INPUT_BRAM_107_DMWIDTH/8-1:0] s_axis_bram_107_tstrb,
    input [C_INPUT_BRAM_107_DMWIDTH-1:0] s_axis_bram_107_tdata,
    output s_axis_bram_107_tready,
    input [C_INPUT_BRAM_107_ADDR_WIDTH-1:0] ap_bram_107_addr0,
    input [C_INPUT_BRAM_107_WIDTH-1:0] ap_bram_107_din0,
    output [C_INPUT_BRAM_107_WIDTH-1:0] ap_bram_107_dout0,
    input [C_INPUT_BRAM_107_WIDTH/8-1:0] ap_bram_107_we0,
    input ap_bram_107_en0,
    input [C_INPUT_BRAM_107_ADDR_WIDTH-1:0] ap_bram_107_addr1,
    input [C_INPUT_BRAM_107_WIDTH-1:0] ap_bram_107_din1,
    output [C_INPUT_BRAM_107_WIDTH-1:0] ap_bram_107_dout1,
    input [C_INPUT_BRAM_107_WIDTH/8-1:0] ap_bram_107_we1,
    input ap_bram_107_en1,
    //input AXI-Stream to FIFO interface 108
    input s_axis_bram_108_tlast,
    input s_axis_bram_108_tvalid,
    input [C_INPUT_BRAM_108_DMWIDTH/8-1:0] s_axis_bram_108_tkeep,
    input [C_INPUT_BRAM_108_DMWIDTH/8-1:0] s_axis_bram_108_tstrb,
    input [C_INPUT_BRAM_108_DMWIDTH-1:0] s_axis_bram_108_tdata,
    output s_axis_bram_108_tready,
    input [C_INPUT_BRAM_108_ADDR_WIDTH-1:0] ap_bram_108_addr0,
    input [C_INPUT_BRAM_108_WIDTH-1:0] ap_bram_108_din0,
    output [C_INPUT_BRAM_108_WIDTH-1:0] ap_bram_108_dout0,
    input [C_INPUT_BRAM_108_WIDTH/8-1:0] ap_bram_108_we0,
    input ap_bram_108_en0,
    input [C_INPUT_BRAM_108_ADDR_WIDTH-1:0] ap_bram_108_addr1,
    input [C_INPUT_BRAM_108_WIDTH-1:0] ap_bram_108_din1,
    output [C_INPUT_BRAM_108_WIDTH-1:0] ap_bram_108_dout1,
    input [C_INPUT_BRAM_108_WIDTH/8-1:0] ap_bram_108_we1,
    input ap_bram_108_en1,
    //input AXI-Stream to FIFO interface 109
    input s_axis_bram_109_tlast,
    input s_axis_bram_109_tvalid,
    input [C_INPUT_BRAM_109_DMWIDTH/8-1:0] s_axis_bram_109_tkeep,
    input [C_INPUT_BRAM_109_DMWIDTH/8-1:0] s_axis_bram_109_tstrb,
    input [C_INPUT_BRAM_109_DMWIDTH-1:0] s_axis_bram_109_tdata,
    output s_axis_bram_109_tready,
    input [C_INPUT_BRAM_109_ADDR_WIDTH-1:0] ap_bram_109_addr0,
    input [C_INPUT_BRAM_109_WIDTH-1:0] ap_bram_109_din0,
    output [C_INPUT_BRAM_109_WIDTH-1:0] ap_bram_109_dout0,
    input [C_INPUT_BRAM_109_WIDTH/8-1:0] ap_bram_109_we0,
    input ap_bram_109_en0,
    input [C_INPUT_BRAM_109_ADDR_WIDTH-1:0] ap_bram_109_addr1,
    input [C_INPUT_BRAM_109_WIDTH-1:0] ap_bram_109_din1,
    output [C_INPUT_BRAM_109_WIDTH-1:0] ap_bram_109_dout1,
    input [C_INPUT_BRAM_109_WIDTH/8-1:0] ap_bram_109_we1,
    input ap_bram_109_en1,
    //input AXI-Stream to FIFO interface 110
    input s_axis_bram_110_tlast,
    input s_axis_bram_110_tvalid,
    input [C_INPUT_BRAM_110_DMWIDTH/8-1:0] s_axis_bram_110_tkeep,
    input [C_INPUT_BRAM_110_DMWIDTH/8-1:0] s_axis_bram_110_tstrb,
    input [C_INPUT_BRAM_110_DMWIDTH-1:0] s_axis_bram_110_tdata,
    output s_axis_bram_110_tready,
    input [C_INPUT_BRAM_110_ADDR_WIDTH-1:0] ap_bram_110_addr0,
    input [C_INPUT_BRAM_110_WIDTH-1:0] ap_bram_110_din0,
    output [C_INPUT_BRAM_110_WIDTH-1:0] ap_bram_110_dout0,
    input [C_INPUT_BRAM_110_WIDTH/8-1:0] ap_bram_110_we0,
    input ap_bram_110_en0,
    input [C_INPUT_BRAM_110_ADDR_WIDTH-1:0] ap_bram_110_addr1,
    input [C_INPUT_BRAM_110_WIDTH-1:0] ap_bram_110_din1,
    output [C_INPUT_BRAM_110_WIDTH-1:0] ap_bram_110_dout1,
    input [C_INPUT_BRAM_110_WIDTH/8-1:0] ap_bram_110_we1,
    input ap_bram_110_en1,
    //input AXI-Stream to FIFO interface 111
    input s_axis_bram_111_tlast,
    input s_axis_bram_111_tvalid,
    input [C_INPUT_BRAM_111_DMWIDTH/8-1:0] s_axis_bram_111_tkeep,
    input [C_INPUT_BRAM_111_DMWIDTH/8-1:0] s_axis_bram_111_tstrb,
    input [C_INPUT_BRAM_111_DMWIDTH-1:0] s_axis_bram_111_tdata,
    output s_axis_bram_111_tready,
    input [C_INPUT_BRAM_111_ADDR_WIDTH-1:0] ap_bram_111_addr0,
    input [C_INPUT_BRAM_111_WIDTH-1:0] ap_bram_111_din0,
    output [C_INPUT_BRAM_111_WIDTH-1:0] ap_bram_111_dout0,
    input [C_INPUT_BRAM_111_WIDTH/8-1:0] ap_bram_111_we0,
    input ap_bram_111_en0,
    input [C_INPUT_BRAM_111_ADDR_WIDTH-1:0] ap_bram_111_addr1,
    input [C_INPUT_BRAM_111_WIDTH-1:0] ap_bram_111_din1,
    output [C_INPUT_BRAM_111_WIDTH-1:0] ap_bram_111_dout1,
    input [C_INPUT_BRAM_111_WIDTH/8-1:0] ap_bram_111_we1,
    input ap_bram_111_en1,
    //input AXI-Stream to FIFO interface 112
    input s_axis_bram_112_tlast,
    input s_axis_bram_112_tvalid,
    input [C_INPUT_BRAM_112_DMWIDTH/8-1:0] s_axis_bram_112_tkeep,
    input [C_INPUT_BRAM_112_DMWIDTH/8-1:0] s_axis_bram_112_tstrb,
    input [C_INPUT_BRAM_112_DMWIDTH-1:0] s_axis_bram_112_tdata,
    output s_axis_bram_112_tready,
    input [C_INPUT_BRAM_112_ADDR_WIDTH-1:0] ap_bram_112_addr0,
    input [C_INPUT_BRAM_112_WIDTH-1:0] ap_bram_112_din0,
    output [C_INPUT_BRAM_112_WIDTH-1:0] ap_bram_112_dout0,
    input [C_INPUT_BRAM_112_WIDTH/8-1:0] ap_bram_112_we0,
    input ap_bram_112_en0,
    input [C_INPUT_BRAM_112_ADDR_WIDTH-1:0] ap_bram_112_addr1,
    input [C_INPUT_BRAM_112_WIDTH-1:0] ap_bram_112_din1,
    output [C_INPUT_BRAM_112_WIDTH-1:0] ap_bram_112_dout1,
    input [C_INPUT_BRAM_112_WIDTH/8-1:0] ap_bram_112_we1,
    input ap_bram_112_en1,
    //input AXI-Stream to FIFO interface 113
    input s_axis_bram_113_tlast,
    input s_axis_bram_113_tvalid,
    input [C_INPUT_BRAM_113_DMWIDTH/8-1:0] s_axis_bram_113_tkeep,
    input [C_INPUT_BRAM_113_DMWIDTH/8-1:0] s_axis_bram_113_tstrb,
    input [C_INPUT_BRAM_113_DMWIDTH-1:0] s_axis_bram_113_tdata,
    output s_axis_bram_113_tready,
    input [C_INPUT_BRAM_113_ADDR_WIDTH-1:0] ap_bram_113_addr0,
    input [C_INPUT_BRAM_113_WIDTH-1:0] ap_bram_113_din0,
    output [C_INPUT_BRAM_113_WIDTH-1:0] ap_bram_113_dout0,
    input [C_INPUT_BRAM_113_WIDTH/8-1:0] ap_bram_113_we0,
    input ap_bram_113_en0,
    input [C_INPUT_BRAM_113_ADDR_WIDTH-1:0] ap_bram_113_addr1,
    input [C_INPUT_BRAM_113_WIDTH-1:0] ap_bram_113_din1,
    output [C_INPUT_BRAM_113_WIDTH-1:0] ap_bram_113_dout1,
    input [C_INPUT_BRAM_113_WIDTH/8-1:0] ap_bram_113_we1,
    input ap_bram_113_en1,
    //input AXI-Stream to FIFO interface 114
    input s_axis_bram_114_tlast,
    input s_axis_bram_114_tvalid,
    input [C_INPUT_BRAM_114_DMWIDTH/8-1:0] s_axis_bram_114_tkeep,
    input [C_INPUT_BRAM_114_DMWIDTH/8-1:0] s_axis_bram_114_tstrb,
    input [C_INPUT_BRAM_114_DMWIDTH-1:0] s_axis_bram_114_tdata,
    output s_axis_bram_114_tready,
    input [C_INPUT_BRAM_114_ADDR_WIDTH-1:0] ap_bram_114_addr0,
    input [C_INPUT_BRAM_114_WIDTH-1:0] ap_bram_114_din0,
    output [C_INPUT_BRAM_114_WIDTH-1:0] ap_bram_114_dout0,
    input [C_INPUT_BRAM_114_WIDTH/8-1:0] ap_bram_114_we0,
    input ap_bram_114_en0,
    input [C_INPUT_BRAM_114_ADDR_WIDTH-1:0] ap_bram_114_addr1,
    input [C_INPUT_BRAM_114_WIDTH-1:0] ap_bram_114_din1,
    output [C_INPUT_BRAM_114_WIDTH-1:0] ap_bram_114_dout1,
    input [C_INPUT_BRAM_114_WIDTH/8-1:0] ap_bram_114_we1,
    input ap_bram_114_en1,
    //input AXI-Stream to FIFO interface 115
    input s_axis_bram_115_tlast,
    input s_axis_bram_115_tvalid,
    input [C_INPUT_BRAM_115_DMWIDTH/8-1:0] s_axis_bram_115_tkeep,
    input [C_INPUT_BRAM_115_DMWIDTH/8-1:0] s_axis_bram_115_tstrb,
    input [C_INPUT_BRAM_115_DMWIDTH-1:0] s_axis_bram_115_tdata,
    output s_axis_bram_115_tready,
    input [C_INPUT_BRAM_115_ADDR_WIDTH-1:0] ap_bram_115_addr0,
    input [C_INPUT_BRAM_115_WIDTH-1:0] ap_bram_115_din0,
    output [C_INPUT_BRAM_115_WIDTH-1:0] ap_bram_115_dout0,
    input [C_INPUT_BRAM_115_WIDTH/8-1:0] ap_bram_115_we0,
    input ap_bram_115_en0,
    input [C_INPUT_BRAM_115_ADDR_WIDTH-1:0] ap_bram_115_addr1,
    input [C_INPUT_BRAM_115_WIDTH-1:0] ap_bram_115_din1,
    output [C_INPUT_BRAM_115_WIDTH-1:0] ap_bram_115_dout1,
    input [C_INPUT_BRAM_115_WIDTH/8-1:0] ap_bram_115_we1,
    input ap_bram_115_en1,
    //input AXI-Stream to FIFO interface 116
    input s_axis_bram_116_tlast,
    input s_axis_bram_116_tvalid,
    input [C_INPUT_BRAM_116_DMWIDTH/8-1:0] s_axis_bram_116_tkeep,
    input [C_INPUT_BRAM_116_DMWIDTH/8-1:0] s_axis_bram_116_tstrb,
    input [C_INPUT_BRAM_116_DMWIDTH-1:0] s_axis_bram_116_tdata,
    output s_axis_bram_116_tready,
    input [C_INPUT_BRAM_116_ADDR_WIDTH-1:0] ap_bram_116_addr0,
    input [C_INPUT_BRAM_116_WIDTH-1:0] ap_bram_116_din0,
    output [C_INPUT_BRAM_116_WIDTH-1:0] ap_bram_116_dout0,
    input [C_INPUT_BRAM_116_WIDTH/8-1:0] ap_bram_116_we0,
    input ap_bram_116_en0,
    input [C_INPUT_BRAM_116_ADDR_WIDTH-1:0] ap_bram_116_addr1,
    input [C_INPUT_BRAM_116_WIDTH-1:0] ap_bram_116_din1,
    output [C_INPUT_BRAM_116_WIDTH-1:0] ap_bram_116_dout1,
    input [C_INPUT_BRAM_116_WIDTH/8-1:0] ap_bram_116_we1,
    input ap_bram_116_en1,
    //input AXI-Stream to FIFO interface 117
    input s_axis_bram_117_tlast,
    input s_axis_bram_117_tvalid,
    input [C_INPUT_BRAM_117_DMWIDTH/8-1:0] s_axis_bram_117_tkeep,
    input [C_INPUT_BRAM_117_DMWIDTH/8-1:0] s_axis_bram_117_tstrb,
    input [C_INPUT_BRAM_117_DMWIDTH-1:0] s_axis_bram_117_tdata,
    output s_axis_bram_117_tready,
    input [C_INPUT_BRAM_117_ADDR_WIDTH-1:0] ap_bram_117_addr0,
    input [C_INPUT_BRAM_117_WIDTH-1:0] ap_bram_117_din0,
    output [C_INPUT_BRAM_117_WIDTH-1:0] ap_bram_117_dout0,
    input [C_INPUT_BRAM_117_WIDTH/8-1:0] ap_bram_117_we0,
    input ap_bram_117_en0,
    input [C_INPUT_BRAM_117_ADDR_WIDTH-1:0] ap_bram_117_addr1,
    input [C_INPUT_BRAM_117_WIDTH-1:0] ap_bram_117_din1,
    output [C_INPUT_BRAM_117_WIDTH-1:0] ap_bram_117_dout1,
    input [C_INPUT_BRAM_117_WIDTH/8-1:0] ap_bram_117_we1,
    input ap_bram_117_en1,
    //input AXI-Stream to FIFO interface 118
    input s_axis_bram_118_tlast,
    input s_axis_bram_118_tvalid,
    input [C_INPUT_BRAM_118_DMWIDTH/8-1:0] s_axis_bram_118_tkeep,
    input [C_INPUT_BRAM_118_DMWIDTH/8-1:0] s_axis_bram_118_tstrb,
    input [C_INPUT_BRAM_118_DMWIDTH-1:0] s_axis_bram_118_tdata,
    output s_axis_bram_118_tready,
    input [C_INPUT_BRAM_118_ADDR_WIDTH-1:0] ap_bram_118_addr0,
    input [C_INPUT_BRAM_118_WIDTH-1:0] ap_bram_118_din0,
    output [C_INPUT_BRAM_118_WIDTH-1:0] ap_bram_118_dout0,
    input [C_INPUT_BRAM_118_WIDTH/8-1:0] ap_bram_118_we0,
    input ap_bram_118_en0,
    input [C_INPUT_BRAM_118_ADDR_WIDTH-1:0] ap_bram_118_addr1,
    input [C_INPUT_BRAM_118_WIDTH-1:0] ap_bram_118_din1,
    output [C_INPUT_BRAM_118_WIDTH-1:0] ap_bram_118_dout1,
    input [C_INPUT_BRAM_118_WIDTH/8-1:0] ap_bram_118_we1,
    input ap_bram_118_en1,
    //input AXI-Stream to FIFO interface 119
    input s_axis_bram_119_tlast,
    input s_axis_bram_119_tvalid,
    input [C_INPUT_BRAM_119_DMWIDTH/8-1:0] s_axis_bram_119_tkeep,
    input [C_INPUT_BRAM_119_DMWIDTH/8-1:0] s_axis_bram_119_tstrb,
    input [C_INPUT_BRAM_119_DMWIDTH-1:0] s_axis_bram_119_tdata,
    output s_axis_bram_119_tready,
    input [C_INPUT_BRAM_119_ADDR_WIDTH-1:0] ap_bram_119_addr0,
    input [C_INPUT_BRAM_119_WIDTH-1:0] ap_bram_119_din0,
    output [C_INPUT_BRAM_119_WIDTH-1:0] ap_bram_119_dout0,
    input [C_INPUT_BRAM_119_WIDTH/8-1:0] ap_bram_119_we0,
    input ap_bram_119_en0,
    input [C_INPUT_BRAM_119_ADDR_WIDTH-1:0] ap_bram_119_addr1,
    input [C_INPUT_BRAM_119_WIDTH-1:0] ap_bram_119_din1,
    output [C_INPUT_BRAM_119_WIDTH-1:0] ap_bram_119_dout1,
    input [C_INPUT_BRAM_119_WIDTH/8-1:0] ap_bram_119_we1,
    input ap_bram_119_en1,
    //input AXI-Stream to FIFO interface 120
    input s_axis_bram_120_tlast,
    input s_axis_bram_120_tvalid,
    input [C_INPUT_BRAM_120_DMWIDTH/8-1:0] s_axis_bram_120_tkeep,
    input [C_INPUT_BRAM_120_DMWIDTH/8-1:0] s_axis_bram_120_tstrb,
    input [C_INPUT_BRAM_120_DMWIDTH-1:0] s_axis_bram_120_tdata,
    output s_axis_bram_120_tready,
    input [C_INPUT_BRAM_120_ADDR_WIDTH-1:0] ap_bram_120_addr0,
    input [C_INPUT_BRAM_120_WIDTH-1:0] ap_bram_120_din0,
    output [C_INPUT_BRAM_120_WIDTH-1:0] ap_bram_120_dout0,
    input [C_INPUT_BRAM_120_WIDTH/8-1:0] ap_bram_120_we0,
    input ap_bram_120_en0,
    input [C_INPUT_BRAM_120_ADDR_WIDTH-1:0] ap_bram_120_addr1,
    input [C_INPUT_BRAM_120_WIDTH-1:0] ap_bram_120_din1,
    output [C_INPUT_BRAM_120_WIDTH-1:0] ap_bram_120_dout1,
    input [C_INPUT_BRAM_120_WIDTH/8-1:0] ap_bram_120_we1,
    input ap_bram_120_en1,
    //input AXI-Stream to FIFO interface 121
    input s_axis_bram_121_tlast,
    input s_axis_bram_121_tvalid,
    input [C_INPUT_BRAM_121_DMWIDTH/8-1:0] s_axis_bram_121_tkeep,
    input [C_INPUT_BRAM_121_DMWIDTH/8-1:0] s_axis_bram_121_tstrb,
    input [C_INPUT_BRAM_121_DMWIDTH-1:0] s_axis_bram_121_tdata,
    output s_axis_bram_121_tready,
    input [C_INPUT_BRAM_121_ADDR_WIDTH-1:0] ap_bram_121_addr0,
    input [C_INPUT_BRAM_121_WIDTH-1:0] ap_bram_121_din0,
    output [C_INPUT_BRAM_121_WIDTH-1:0] ap_bram_121_dout0,
    input [C_INPUT_BRAM_121_WIDTH/8-1:0] ap_bram_121_we0,
    input ap_bram_121_en0,
    input [C_INPUT_BRAM_121_ADDR_WIDTH-1:0] ap_bram_121_addr1,
    input [C_INPUT_BRAM_121_WIDTH-1:0] ap_bram_121_din1,
    output [C_INPUT_BRAM_121_WIDTH-1:0] ap_bram_121_dout1,
    input [C_INPUT_BRAM_121_WIDTH/8-1:0] ap_bram_121_we1,
    input ap_bram_121_en1,
    //input AXI-Stream to FIFO interface 122
    input s_axis_bram_122_tlast,
    input s_axis_bram_122_tvalid,
    input [C_INPUT_BRAM_122_DMWIDTH/8-1:0] s_axis_bram_122_tkeep,
    input [C_INPUT_BRAM_122_DMWIDTH/8-1:0] s_axis_bram_122_tstrb,
    input [C_INPUT_BRAM_122_DMWIDTH-1:0] s_axis_bram_122_tdata,
    output s_axis_bram_122_tready,
    input [C_INPUT_BRAM_122_ADDR_WIDTH-1:0] ap_bram_122_addr0,
    input [C_INPUT_BRAM_122_WIDTH-1:0] ap_bram_122_din0,
    output [C_INPUT_BRAM_122_WIDTH-1:0] ap_bram_122_dout0,
    input [C_INPUT_BRAM_122_WIDTH/8-1:0] ap_bram_122_we0,
    input ap_bram_122_en0,
    input [C_INPUT_BRAM_122_ADDR_WIDTH-1:0] ap_bram_122_addr1,
    input [C_INPUT_BRAM_122_WIDTH-1:0] ap_bram_122_din1,
    output [C_INPUT_BRAM_122_WIDTH-1:0] ap_bram_122_dout1,
    input [C_INPUT_BRAM_122_WIDTH/8-1:0] ap_bram_122_we1,
    input ap_bram_122_en1,
    //input AXI-Stream to FIFO interface 123
    input s_axis_bram_123_tlast,
    input s_axis_bram_123_tvalid,
    input [C_INPUT_BRAM_123_DMWIDTH/8-1:0] s_axis_bram_123_tkeep,
    input [C_INPUT_BRAM_123_DMWIDTH/8-1:0] s_axis_bram_123_tstrb,
    input [C_INPUT_BRAM_123_DMWIDTH-1:0] s_axis_bram_123_tdata,
    output s_axis_bram_123_tready,
    input [C_INPUT_BRAM_123_ADDR_WIDTH-1:0] ap_bram_123_addr0,
    input [C_INPUT_BRAM_123_WIDTH-1:0] ap_bram_123_din0,
    output [C_INPUT_BRAM_123_WIDTH-1:0] ap_bram_123_dout0,
    input [C_INPUT_BRAM_123_WIDTH/8-1:0] ap_bram_123_we0,
    input ap_bram_123_en0,
    input [C_INPUT_BRAM_123_ADDR_WIDTH-1:0] ap_bram_123_addr1,
    input [C_INPUT_BRAM_123_WIDTH-1:0] ap_bram_123_din1,
    output [C_INPUT_BRAM_123_WIDTH-1:0] ap_bram_123_dout1,
    input [C_INPUT_BRAM_123_WIDTH/8-1:0] ap_bram_123_we1,
    input ap_bram_123_en1,
    //input AXI-Stream to FIFO interface 124
    input s_axis_bram_124_tlast,
    input s_axis_bram_124_tvalid,
    input [C_INPUT_BRAM_124_DMWIDTH/8-1:0] s_axis_bram_124_tkeep,
    input [C_INPUT_BRAM_124_DMWIDTH/8-1:0] s_axis_bram_124_tstrb,
    input [C_INPUT_BRAM_124_DMWIDTH-1:0] s_axis_bram_124_tdata,
    output s_axis_bram_124_tready,
    input [C_INPUT_BRAM_124_ADDR_WIDTH-1:0] ap_bram_124_addr0,
    input [C_INPUT_BRAM_124_WIDTH-1:0] ap_bram_124_din0,
    output [C_INPUT_BRAM_124_WIDTH-1:0] ap_bram_124_dout0,
    input [C_INPUT_BRAM_124_WIDTH/8-1:0] ap_bram_124_we0,
    input ap_bram_124_en0,
    input [C_INPUT_BRAM_124_ADDR_WIDTH-1:0] ap_bram_124_addr1,
    input [C_INPUT_BRAM_124_WIDTH-1:0] ap_bram_124_din1,
    output [C_INPUT_BRAM_124_WIDTH-1:0] ap_bram_124_dout1,
    input [C_INPUT_BRAM_124_WIDTH/8-1:0] ap_bram_124_we1,
    input ap_bram_124_en1,
    //input AXI-Stream to FIFO interface 125
    input s_axis_bram_125_tlast,
    input s_axis_bram_125_tvalid,
    input [C_INPUT_BRAM_125_DMWIDTH/8-1:0] s_axis_bram_125_tkeep,
    input [C_INPUT_BRAM_125_DMWIDTH/8-1:0] s_axis_bram_125_tstrb,
    input [C_INPUT_BRAM_125_DMWIDTH-1:0] s_axis_bram_125_tdata,
    output s_axis_bram_125_tready,
    input [C_INPUT_BRAM_125_ADDR_WIDTH-1:0] ap_bram_125_addr0,
    input [C_INPUT_BRAM_125_WIDTH-1:0] ap_bram_125_din0,
    output [C_INPUT_BRAM_125_WIDTH-1:0] ap_bram_125_dout0,
    input [C_INPUT_BRAM_125_WIDTH/8-1:0] ap_bram_125_we0,
    input ap_bram_125_en0,
    input [C_INPUT_BRAM_125_ADDR_WIDTH-1:0] ap_bram_125_addr1,
    input [C_INPUT_BRAM_125_WIDTH-1:0] ap_bram_125_din1,
    output [C_INPUT_BRAM_125_WIDTH-1:0] ap_bram_125_dout1,
    input [C_INPUT_BRAM_125_WIDTH/8-1:0] ap_bram_125_we1,
    input ap_bram_125_en1,
    //input AXI-Stream to FIFO interface 126
    input s_axis_bram_126_tlast,
    input s_axis_bram_126_tvalid,
    input [C_INPUT_BRAM_126_DMWIDTH/8-1:0] s_axis_bram_126_tkeep,
    input [C_INPUT_BRAM_126_DMWIDTH/8-1:0] s_axis_bram_126_tstrb,
    input [C_INPUT_BRAM_126_DMWIDTH-1:0] s_axis_bram_126_tdata,
    output s_axis_bram_126_tready,
    input [C_INPUT_BRAM_126_ADDR_WIDTH-1:0] ap_bram_126_addr0,
    input [C_INPUT_BRAM_126_WIDTH-1:0] ap_bram_126_din0,
    output [C_INPUT_BRAM_126_WIDTH-1:0] ap_bram_126_dout0,
    input [C_INPUT_BRAM_126_WIDTH/8-1:0] ap_bram_126_we0,
    input ap_bram_126_en0,
    input [C_INPUT_BRAM_126_ADDR_WIDTH-1:0] ap_bram_126_addr1,
    input [C_INPUT_BRAM_126_WIDTH-1:0] ap_bram_126_din1,
    output [C_INPUT_BRAM_126_WIDTH-1:0] ap_bram_126_dout1,
    input [C_INPUT_BRAM_126_WIDTH/8-1:0] ap_bram_126_we1,
    input ap_bram_126_en1,
    //input AXI-Stream to FIFO interface 127
    input s_axis_bram_127_tlast,
    input s_axis_bram_127_tvalid,
    input [C_INPUT_BRAM_127_DMWIDTH/8-1:0] s_axis_bram_127_tkeep,
    input [C_INPUT_BRAM_127_DMWIDTH/8-1:0] s_axis_bram_127_tstrb,
    input [C_INPUT_BRAM_127_DMWIDTH-1:0] s_axis_bram_127_tdata,
    output s_axis_bram_127_tready,
    input [C_INPUT_BRAM_127_ADDR_WIDTH-1:0] ap_bram_127_addr0,
    input [C_INPUT_BRAM_127_WIDTH-1:0] ap_bram_127_din0,
    output [C_INPUT_BRAM_127_WIDTH-1:0] ap_bram_127_dout0,
    input [C_INPUT_BRAM_127_WIDTH/8-1:0] ap_bram_127_we0,
    input ap_bram_127_en0,
    input [C_INPUT_BRAM_127_ADDR_WIDTH-1:0] ap_bram_127_addr1,
    input [C_INPUT_BRAM_127_WIDTH-1:0] ap_bram_127_din1,
    output [C_INPUT_BRAM_127_WIDTH-1:0] ap_bram_127_dout1,
    input [C_INPUT_BRAM_127_WIDTH/8-1:0] ap_bram_127_we1,
    input ap_bram_127_en1,
    //-----------------------------------------------------------
    //in-out AXI-Stream output interface 0
    output m_axis_bram_0_tlast,
    output m_axis_bram_0_tvalid,  
    output [C_OUTPUT_BRAM_0_DMWIDTH/8-1:0] m_axis_bram_0_tkeep,
    output [C_OUTPUT_BRAM_0_DMWIDTH/8-1:0] m_axis_bram_0_tstrb,
    output [C_OUTPUT_BRAM_0_DMWIDTH-1:0] m_axis_bram_0_tdata,
    input m_axis_bram_0_tready,
    //in-out AXI-Stream output interface 1
    output m_axis_bram_1_tlast,
    output m_axis_bram_1_tvalid,  
    output [C_OUTPUT_BRAM_1_DMWIDTH/8-1:0] m_axis_bram_1_tkeep,
    output [C_OUTPUT_BRAM_1_DMWIDTH/8-1:0] m_axis_bram_1_tstrb,
    output [C_OUTPUT_BRAM_1_DMWIDTH-1:0] m_axis_bram_1_tdata,
    input m_axis_bram_1_tready,
    //in-out AXI-Stream output interface 2
    output m_axis_bram_2_tlast,
    output m_axis_bram_2_tvalid,  
    output [C_OUTPUT_BRAM_2_DMWIDTH/8-1:0] m_axis_bram_2_tkeep,
    output [C_OUTPUT_BRAM_2_DMWIDTH/8-1:0] m_axis_bram_2_tstrb,
    output [C_OUTPUT_BRAM_2_DMWIDTH-1:0] m_axis_bram_2_tdata,
    input m_axis_bram_2_tready,
    //in-out AXI-Stream output interface 3
    output m_axis_bram_3_tlast,
    output m_axis_bram_3_tvalid,  
    output [C_OUTPUT_BRAM_3_DMWIDTH/8-1:0] m_axis_bram_3_tkeep,
    output [C_OUTPUT_BRAM_3_DMWIDTH/8-1:0] m_axis_bram_3_tstrb,
    output [C_OUTPUT_BRAM_3_DMWIDTH-1:0] m_axis_bram_3_tdata,
    input m_axis_bram_3_tready,
    //in-out AXI-Stream output interface 4
    output m_axis_bram_4_tlast,
    output m_axis_bram_4_tvalid,  
    output [C_OUTPUT_BRAM_4_DMWIDTH/8-1:0] m_axis_bram_4_tkeep,
    output [C_OUTPUT_BRAM_4_DMWIDTH/8-1:0] m_axis_bram_4_tstrb,
    output [C_OUTPUT_BRAM_4_DMWIDTH-1:0] m_axis_bram_4_tdata,
    input m_axis_bram_4_tready,
    //in-out AXI-Stream output interface 5
    output m_axis_bram_5_tlast,
    output m_axis_bram_5_tvalid,  
    output [C_OUTPUT_BRAM_5_DMWIDTH/8-1:0] m_axis_bram_5_tkeep,
    output [C_OUTPUT_BRAM_5_DMWIDTH/8-1:0] m_axis_bram_5_tstrb,
    output [C_OUTPUT_BRAM_5_DMWIDTH-1:0] m_axis_bram_5_tdata,
    input m_axis_bram_5_tready,
    //in-out AXI-Stream output interface 6
    output m_axis_bram_6_tlast,
    output m_axis_bram_6_tvalid,  
    output [C_OUTPUT_BRAM_6_DMWIDTH/8-1:0] m_axis_bram_6_tkeep,
    output [C_OUTPUT_BRAM_6_DMWIDTH/8-1:0] m_axis_bram_6_tstrb,
    output [C_OUTPUT_BRAM_6_DMWIDTH-1:0] m_axis_bram_6_tdata,
    input m_axis_bram_6_tready,
    //in-out AXI-Stream output interface 7
    output m_axis_bram_7_tlast,
    output m_axis_bram_7_tvalid,  
    output [C_OUTPUT_BRAM_7_DMWIDTH/8-1:0] m_axis_bram_7_tkeep,
    output [C_OUTPUT_BRAM_7_DMWIDTH/8-1:0] m_axis_bram_7_tstrb,
    output [C_OUTPUT_BRAM_7_DMWIDTH-1:0] m_axis_bram_7_tdata,
    input m_axis_bram_7_tready,
    //in-out AXI-Stream output interface 8
    output m_axis_bram_8_tlast,
    output m_axis_bram_8_tvalid,  
    output [C_OUTPUT_BRAM_8_DMWIDTH/8-1:0] m_axis_bram_8_tkeep,
    output [C_OUTPUT_BRAM_8_DMWIDTH/8-1:0] m_axis_bram_8_tstrb,
    output [C_OUTPUT_BRAM_8_DMWIDTH-1:0] m_axis_bram_8_tdata,
    input m_axis_bram_8_tready,
    //in-out AXI-Stream output interface 9
    output m_axis_bram_9_tlast,
    output m_axis_bram_9_tvalid,  
    output [C_OUTPUT_BRAM_9_DMWIDTH/8-1:0] m_axis_bram_9_tkeep,
    output [C_OUTPUT_BRAM_9_DMWIDTH/8-1:0] m_axis_bram_9_tstrb,
    output [C_OUTPUT_BRAM_9_DMWIDTH-1:0] m_axis_bram_9_tdata,
    input m_axis_bram_9_tready,
    //in-out AXI-Stream output interface 10
    output m_axis_bram_10_tlast,
    output m_axis_bram_10_tvalid,  
    output [C_OUTPUT_BRAM_10_DMWIDTH/8-1:0] m_axis_bram_10_tkeep,
    output [C_OUTPUT_BRAM_10_DMWIDTH/8-1:0] m_axis_bram_10_tstrb,
    output [C_OUTPUT_BRAM_10_DMWIDTH-1:0] m_axis_bram_10_tdata,
    input m_axis_bram_10_tready,
    //in-out AXI-Stream output interface 11
    output m_axis_bram_11_tlast,
    output m_axis_bram_11_tvalid,  
    output [C_OUTPUT_BRAM_11_DMWIDTH/8-1:0] m_axis_bram_11_tkeep,
    output [C_OUTPUT_BRAM_11_DMWIDTH/8-1:0] m_axis_bram_11_tstrb,
    output [C_OUTPUT_BRAM_11_DMWIDTH-1:0] m_axis_bram_11_tdata,
    input m_axis_bram_11_tready,
    //in-out AXI-Stream output interface 12
    output m_axis_bram_12_tlast,
    output m_axis_bram_12_tvalid,  
    output [C_OUTPUT_BRAM_12_DMWIDTH/8-1:0] m_axis_bram_12_tkeep,
    output [C_OUTPUT_BRAM_12_DMWIDTH/8-1:0] m_axis_bram_12_tstrb,
    output [C_OUTPUT_BRAM_12_DMWIDTH-1:0] m_axis_bram_12_tdata,
    input m_axis_bram_12_tready,
    //in-out AXI-Stream output interface 13
    output m_axis_bram_13_tlast,
    output m_axis_bram_13_tvalid,  
    output [C_OUTPUT_BRAM_13_DMWIDTH/8-1:0] m_axis_bram_13_tkeep,
    output [C_OUTPUT_BRAM_13_DMWIDTH/8-1:0] m_axis_bram_13_tstrb,
    output [C_OUTPUT_BRAM_13_DMWIDTH-1:0] m_axis_bram_13_tdata,
    input m_axis_bram_13_tready,
    //in-out AXI-Stream output interface 14
    output m_axis_bram_14_tlast,
    output m_axis_bram_14_tvalid,  
    output [C_OUTPUT_BRAM_14_DMWIDTH/8-1:0] m_axis_bram_14_tkeep,
    output [C_OUTPUT_BRAM_14_DMWIDTH/8-1:0] m_axis_bram_14_tstrb,
    output [C_OUTPUT_BRAM_14_DMWIDTH-1:0] m_axis_bram_14_tdata,
    input m_axis_bram_14_tready,
    //in-out AXI-Stream output interface 15
    output m_axis_bram_15_tlast,
    output m_axis_bram_15_tvalid,  
    output [C_OUTPUT_BRAM_15_DMWIDTH/8-1:0] m_axis_bram_15_tkeep,
    output [C_OUTPUT_BRAM_15_DMWIDTH/8-1:0] m_axis_bram_15_tstrb,
    output [C_OUTPUT_BRAM_15_DMWIDTH-1:0] m_axis_bram_15_tdata,
    input m_axis_bram_15_tready,
    //in-out AXI-Stream output interface 16
    output m_axis_bram_16_tlast,
    output m_axis_bram_16_tvalid,  
    output [C_OUTPUT_BRAM_16_DMWIDTH/8-1:0] m_axis_bram_16_tkeep,
    output [C_OUTPUT_BRAM_16_DMWIDTH/8-1:0] m_axis_bram_16_tstrb,
    output [C_OUTPUT_BRAM_16_DMWIDTH-1:0] m_axis_bram_16_tdata,
    input m_axis_bram_16_tready,
    //in-out AXI-Stream output interface 17
    output m_axis_bram_17_tlast,
    output m_axis_bram_17_tvalid,  
    output [C_OUTPUT_BRAM_17_DMWIDTH/8-1:0] m_axis_bram_17_tkeep,
    output [C_OUTPUT_BRAM_17_DMWIDTH/8-1:0] m_axis_bram_17_tstrb,
    output [C_OUTPUT_BRAM_17_DMWIDTH-1:0] m_axis_bram_17_tdata,
    input m_axis_bram_17_tready,
    //in-out AXI-Stream output interface 18
    output m_axis_bram_18_tlast,
    output m_axis_bram_18_tvalid,  
    output [C_OUTPUT_BRAM_18_DMWIDTH/8-1:0] m_axis_bram_18_tkeep,
    output [C_OUTPUT_BRAM_18_DMWIDTH/8-1:0] m_axis_bram_18_tstrb,
    output [C_OUTPUT_BRAM_18_DMWIDTH-1:0] m_axis_bram_18_tdata,
    input m_axis_bram_18_tready,
    //in-out AXI-Stream output interface 19
    output m_axis_bram_19_tlast,
    output m_axis_bram_19_tvalid,  
    output [C_OUTPUT_BRAM_19_DMWIDTH/8-1:0] m_axis_bram_19_tkeep,
    output [C_OUTPUT_BRAM_19_DMWIDTH/8-1:0] m_axis_bram_19_tstrb,
    output [C_OUTPUT_BRAM_19_DMWIDTH-1:0] m_axis_bram_19_tdata,
    input m_axis_bram_19_tready,
    //in-out AXI-Stream output interface 20
    output m_axis_bram_20_tlast,
    output m_axis_bram_20_tvalid,  
    output [C_OUTPUT_BRAM_20_DMWIDTH/8-1:0] m_axis_bram_20_tkeep,
    output [C_OUTPUT_BRAM_20_DMWIDTH/8-1:0] m_axis_bram_20_tstrb,
    output [C_OUTPUT_BRAM_20_DMWIDTH-1:0] m_axis_bram_20_tdata,
    input m_axis_bram_20_tready,
    //in-out AXI-Stream output interface 21
    output m_axis_bram_21_tlast,
    output m_axis_bram_21_tvalid,  
    output [C_OUTPUT_BRAM_21_DMWIDTH/8-1:0] m_axis_bram_21_tkeep,
    output [C_OUTPUT_BRAM_21_DMWIDTH/8-1:0] m_axis_bram_21_tstrb,
    output [C_OUTPUT_BRAM_21_DMWIDTH-1:0] m_axis_bram_21_tdata,
    input m_axis_bram_21_tready,
    //in-out AXI-Stream output interface 22
    output m_axis_bram_22_tlast,
    output m_axis_bram_22_tvalid,  
    output [C_OUTPUT_BRAM_22_DMWIDTH/8-1:0] m_axis_bram_22_tkeep,
    output [C_OUTPUT_BRAM_22_DMWIDTH/8-1:0] m_axis_bram_22_tstrb,
    output [C_OUTPUT_BRAM_22_DMWIDTH-1:0] m_axis_bram_22_tdata,
    input m_axis_bram_22_tready,
    //in-out AXI-Stream output interface 23
    output m_axis_bram_23_tlast,
    output m_axis_bram_23_tvalid,  
    output [C_OUTPUT_BRAM_23_DMWIDTH/8-1:0] m_axis_bram_23_tkeep,
    output [C_OUTPUT_BRAM_23_DMWIDTH/8-1:0] m_axis_bram_23_tstrb,
    output [C_OUTPUT_BRAM_23_DMWIDTH-1:0] m_axis_bram_23_tdata,
    input m_axis_bram_23_tready,
    //in-out AXI-Stream output interface 24
    output m_axis_bram_24_tlast,
    output m_axis_bram_24_tvalid,  
    output [C_OUTPUT_BRAM_24_DMWIDTH/8-1:0] m_axis_bram_24_tkeep,
    output [C_OUTPUT_BRAM_24_DMWIDTH/8-1:0] m_axis_bram_24_tstrb,
    output [C_OUTPUT_BRAM_24_DMWIDTH-1:0] m_axis_bram_24_tdata,
    input m_axis_bram_24_tready,
    //in-out AXI-Stream output interface 25
    output m_axis_bram_25_tlast,
    output m_axis_bram_25_tvalid,  
    output [C_OUTPUT_BRAM_25_DMWIDTH/8-1:0] m_axis_bram_25_tkeep,
    output [C_OUTPUT_BRAM_25_DMWIDTH/8-1:0] m_axis_bram_25_tstrb,
    output [C_OUTPUT_BRAM_25_DMWIDTH-1:0] m_axis_bram_25_tdata,
    input m_axis_bram_25_tready,
    //in-out AXI-Stream output interface 26
    output m_axis_bram_26_tlast,
    output m_axis_bram_26_tvalid,  
    output [C_OUTPUT_BRAM_26_DMWIDTH/8-1:0] m_axis_bram_26_tkeep,
    output [C_OUTPUT_BRAM_26_DMWIDTH/8-1:0] m_axis_bram_26_tstrb,
    output [C_OUTPUT_BRAM_26_DMWIDTH-1:0] m_axis_bram_26_tdata,
    input m_axis_bram_26_tready,
    //in-out AXI-Stream output interface 27
    output m_axis_bram_27_tlast,
    output m_axis_bram_27_tvalid,  
    output [C_OUTPUT_BRAM_27_DMWIDTH/8-1:0] m_axis_bram_27_tkeep,
    output [C_OUTPUT_BRAM_27_DMWIDTH/8-1:0] m_axis_bram_27_tstrb,
    output [C_OUTPUT_BRAM_27_DMWIDTH-1:0] m_axis_bram_27_tdata,
    input m_axis_bram_27_tready,
    //in-out AXI-Stream output interface 28
    output m_axis_bram_28_tlast,
    output m_axis_bram_28_tvalid,  
    output [C_OUTPUT_BRAM_28_DMWIDTH/8-1:0] m_axis_bram_28_tkeep,
    output [C_OUTPUT_BRAM_28_DMWIDTH/8-1:0] m_axis_bram_28_tstrb,
    output [C_OUTPUT_BRAM_28_DMWIDTH-1:0] m_axis_bram_28_tdata,
    input m_axis_bram_28_tready,
    //in-out AXI-Stream output interface 29
    output m_axis_bram_29_tlast,
    output m_axis_bram_29_tvalid,  
    output [C_OUTPUT_BRAM_29_DMWIDTH/8-1:0] m_axis_bram_29_tkeep,
    output [C_OUTPUT_BRAM_29_DMWIDTH/8-1:0] m_axis_bram_29_tstrb,
    output [C_OUTPUT_BRAM_29_DMWIDTH-1:0] m_axis_bram_29_tdata,
    input m_axis_bram_29_tready,
    //in-out AXI-Stream output interface 30
    output m_axis_bram_30_tlast,
    output m_axis_bram_30_tvalid,  
    output [C_OUTPUT_BRAM_30_DMWIDTH/8-1:0] m_axis_bram_30_tkeep,
    output [C_OUTPUT_BRAM_30_DMWIDTH/8-1:0] m_axis_bram_30_tstrb,
    output [C_OUTPUT_BRAM_30_DMWIDTH-1:0] m_axis_bram_30_tdata,
    input m_axis_bram_30_tready,
    //in-out AXI-Stream output interface 31
    output m_axis_bram_31_tlast,
    output m_axis_bram_31_tvalid,  
    output [C_OUTPUT_BRAM_31_DMWIDTH/8-1:0] m_axis_bram_31_tkeep,
    output [C_OUTPUT_BRAM_31_DMWIDTH/8-1:0] m_axis_bram_31_tstrb,
    output [C_OUTPUT_BRAM_31_DMWIDTH-1:0] m_axis_bram_31_tdata,
    input m_axis_bram_31_tready,
    //in-out AXI-Stream output interface 32
    output m_axis_bram_32_tlast,
    output m_axis_bram_32_tvalid,  
    output [C_OUTPUT_BRAM_32_DMWIDTH/8-1:0] m_axis_bram_32_tkeep,
    output [C_OUTPUT_BRAM_32_DMWIDTH/8-1:0] m_axis_bram_32_tstrb,
    output [C_OUTPUT_BRAM_32_DMWIDTH-1:0] m_axis_bram_32_tdata,
    input m_axis_bram_32_tready,
    //in-out AXI-Stream output interface 33
    output m_axis_bram_33_tlast,
    output m_axis_bram_33_tvalid,  
    output [C_OUTPUT_BRAM_33_DMWIDTH/8-1:0] m_axis_bram_33_tkeep,
    output [C_OUTPUT_BRAM_33_DMWIDTH/8-1:0] m_axis_bram_33_tstrb,
    output [C_OUTPUT_BRAM_33_DMWIDTH-1:0] m_axis_bram_33_tdata,
    input m_axis_bram_33_tready,
    //in-out AXI-Stream output interface 34
    output m_axis_bram_34_tlast,
    output m_axis_bram_34_tvalid,  
    output [C_OUTPUT_BRAM_34_DMWIDTH/8-1:0] m_axis_bram_34_tkeep,
    output [C_OUTPUT_BRAM_34_DMWIDTH/8-1:0] m_axis_bram_34_tstrb,
    output [C_OUTPUT_BRAM_34_DMWIDTH-1:0] m_axis_bram_34_tdata,
    input m_axis_bram_34_tready,
    //in-out AXI-Stream output interface 35
    output m_axis_bram_35_tlast,
    output m_axis_bram_35_tvalid,  
    output [C_OUTPUT_BRAM_35_DMWIDTH/8-1:0] m_axis_bram_35_tkeep,
    output [C_OUTPUT_BRAM_35_DMWIDTH/8-1:0] m_axis_bram_35_tstrb,
    output [C_OUTPUT_BRAM_35_DMWIDTH-1:0] m_axis_bram_35_tdata,
    input m_axis_bram_35_tready,
    //in-out AXI-Stream output interface 36
    output m_axis_bram_36_tlast,
    output m_axis_bram_36_tvalid,  
    output [C_OUTPUT_BRAM_36_DMWIDTH/8-1:0] m_axis_bram_36_tkeep,
    output [C_OUTPUT_BRAM_36_DMWIDTH/8-1:0] m_axis_bram_36_tstrb,
    output [C_OUTPUT_BRAM_36_DMWIDTH-1:0] m_axis_bram_36_tdata,
    input m_axis_bram_36_tready,
    //in-out AXI-Stream output interface 37
    output m_axis_bram_37_tlast,
    output m_axis_bram_37_tvalid,  
    output [C_OUTPUT_BRAM_37_DMWIDTH/8-1:0] m_axis_bram_37_tkeep,
    output [C_OUTPUT_BRAM_37_DMWIDTH/8-1:0] m_axis_bram_37_tstrb,
    output [C_OUTPUT_BRAM_37_DMWIDTH-1:0] m_axis_bram_37_tdata,
    input m_axis_bram_37_tready,
    //in-out AXI-Stream output interface 38
    output m_axis_bram_38_tlast,
    output m_axis_bram_38_tvalid,  
    output [C_OUTPUT_BRAM_38_DMWIDTH/8-1:0] m_axis_bram_38_tkeep,
    output [C_OUTPUT_BRAM_38_DMWIDTH/8-1:0] m_axis_bram_38_tstrb,
    output [C_OUTPUT_BRAM_38_DMWIDTH-1:0] m_axis_bram_38_tdata,
    input m_axis_bram_38_tready,
    //in-out AXI-Stream output interface 39
    output m_axis_bram_39_tlast,
    output m_axis_bram_39_tvalid,  
    output [C_OUTPUT_BRAM_39_DMWIDTH/8-1:0] m_axis_bram_39_tkeep,
    output [C_OUTPUT_BRAM_39_DMWIDTH/8-1:0] m_axis_bram_39_tstrb,
    output [C_OUTPUT_BRAM_39_DMWIDTH-1:0] m_axis_bram_39_tdata,
    input m_axis_bram_39_tready,
    //in-out AXI-Stream output interface 40
    output m_axis_bram_40_tlast,
    output m_axis_bram_40_tvalid,  
    output [C_OUTPUT_BRAM_40_DMWIDTH/8-1:0] m_axis_bram_40_tkeep,
    output [C_OUTPUT_BRAM_40_DMWIDTH/8-1:0] m_axis_bram_40_tstrb,
    output [C_OUTPUT_BRAM_40_DMWIDTH-1:0] m_axis_bram_40_tdata,
    input m_axis_bram_40_tready,
    //in-out AXI-Stream output interface 41
    output m_axis_bram_41_tlast,
    output m_axis_bram_41_tvalid,  
    output [C_OUTPUT_BRAM_41_DMWIDTH/8-1:0] m_axis_bram_41_tkeep,
    output [C_OUTPUT_BRAM_41_DMWIDTH/8-1:0] m_axis_bram_41_tstrb,
    output [C_OUTPUT_BRAM_41_DMWIDTH-1:0] m_axis_bram_41_tdata,
    input m_axis_bram_41_tready,
    //in-out AXI-Stream output interface 42
    output m_axis_bram_42_tlast,
    output m_axis_bram_42_tvalid,  
    output [C_OUTPUT_BRAM_42_DMWIDTH/8-1:0] m_axis_bram_42_tkeep,
    output [C_OUTPUT_BRAM_42_DMWIDTH/8-1:0] m_axis_bram_42_tstrb,
    output [C_OUTPUT_BRAM_42_DMWIDTH-1:0] m_axis_bram_42_tdata,
    input m_axis_bram_42_tready,
    //in-out AXI-Stream output interface 43
    output m_axis_bram_43_tlast,
    output m_axis_bram_43_tvalid,  
    output [C_OUTPUT_BRAM_43_DMWIDTH/8-1:0] m_axis_bram_43_tkeep,
    output [C_OUTPUT_BRAM_43_DMWIDTH/8-1:0] m_axis_bram_43_tstrb,
    output [C_OUTPUT_BRAM_43_DMWIDTH-1:0] m_axis_bram_43_tdata,
    input m_axis_bram_43_tready,
    //in-out AXI-Stream output interface 44
    output m_axis_bram_44_tlast,
    output m_axis_bram_44_tvalid,  
    output [C_OUTPUT_BRAM_44_DMWIDTH/8-1:0] m_axis_bram_44_tkeep,
    output [C_OUTPUT_BRAM_44_DMWIDTH/8-1:0] m_axis_bram_44_tstrb,
    output [C_OUTPUT_BRAM_44_DMWIDTH-1:0] m_axis_bram_44_tdata,
    input m_axis_bram_44_tready,
    //in-out AXI-Stream output interface 45
    output m_axis_bram_45_tlast,
    output m_axis_bram_45_tvalid,  
    output [C_OUTPUT_BRAM_45_DMWIDTH/8-1:0] m_axis_bram_45_tkeep,
    output [C_OUTPUT_BRAM_45_DMWIDTH/8-1:0] m_axis_bram_45_tstrb,
    output [C_OUTPUT_BRAM_45_DMWIDTH-1:0] m_axis_bram_45_tdata,
    input m_axis_bram_45_tready,
    //in-out AXI-Stream output interface 46
    output m_axis_bram_46_tlast,
    output m_axis_bram_46_tvalid,  
    output [C_OUTPUT_BRAM_46_DMWIDTH/8-1:0] m_axis_bram_46_tkeep,
    output [C_OUTPUT_BRAM_46_DMWIDTH/8-1:0] m_axis_bram_46_tstrb,
    output [C_OUTPUT_BRAM_46_DMWIDTH-1:0] m_axis_bram_46_tdata,
    input m_axis_bram_46_tready,
    //in-out AXI-Stream output interface 47
    output m_axis_bram_47_tlast,
    output m_axis_bram_47_tvalid,  
    output [C_OUTPUT_BRAM_47_DMWIDTH/8-1:0] m_axis_bram_47_tkeep,
    output [C_OUTPUT_BRAM_47_DMWIDTH/8-1:0] m_axis_bram_47_tstrb,
    output [C_OUTPUT_BRAM_47_DMWIDTH-1:0] m_axis_bram_47_tdata,
    input m_axis_bram_47_tready,
    //in-out AXI-Stream output interface 48
    output m_axis_bram_48_tlast,
    output m_axis_bram_48_tvalid,  
    output [C_OUTPUT_BRAM_48_DMWIDTH/8-1:0] m_axis_bram_48_tkeep,
    output [C_OUTPUT_BRAM_48_DMWIDTH/8-1:0] m_axis_bram_48_tstrb,
    output [C_OUTPUT_BRAM_48_DMWIDTH-1:0] m_axis_bram_48_tdata,
    input m_axis_bram_48_tready,
    //in-out AXI-Stream output interface 49
    output m_axis_bram_49_tlast,
    output m_axis_bram_49_tvalid,  
    output [C_OUTPUT_BRAM_49_DMWIDTH/8-1:0] m_axis_bram_49_tkeep,
    output [C_OUTPUT_BRAM_49_DMWIDTH/8-1:0] m_axis_bram_49_tstrb,
    output [C_OUTPUT_BRAM_49_DMWIDTH-1:0] m_axis_bram_49_tdata,
    input m_axis_bram_49_tready,
    //in-out AXI-Stream output interface 50
    output m_axis_bram_50_tlast,
    output m_axis_bram_50_tvalid,  
    output [C_OUTPUT_BRAM_50_DMWIDTH/8-1:0] m_axis_bram_50_tkeep,
    output [C_OUTPUT_BRAM_50_DMWIDTH/8-1:0] m_axis_bram_50_tstrb,
    output [C_OUTPUT_BRAM_50_DMWIDTH-1:0] m_axis_bram_50_tdata,
    input m_axis_bram_50_tready,
    //in-out AXI-Stream output interface 51
    output m_axis_bram_51_tlast,
    output m_axis_bram_51_tvalid,  
    output [C_OUTPUT_BRAM_51_DMWIDTH/8-1:0] m_axis_bram_51_tkeep,
    output [C_OUTPUT_BRAM_51_DMWIDTH/8-1:0] m_axis_bram_51_tstrb,
    output [C_OUTPUT_BRAM_51_DMWIDTH-1:0] m_axis_bram_51_tdata,
    input m_axis_bram_51_tready,
    //in-out AXI-Stream output interface 52
    output m_axis_bram_52_tlast,
    output m_axis_bram_52_tvalid,  
    output [C_OUTPUT_BRAM_52_DMWIDTH/8-1:0] m_axis_bram_52_tkeep,
    output [C_OUTPUT_BRAM_52_DMWIDTH/8-1:0] m_axis_bram_52_tstrb,
    output [C_OUTPUT_BRAM_52_DMWIDTH-1:0] m_axis_bram_52_tdata,
    input m_axis_bram_52_tready,
    //in-out AXI-Stream output interface 53
    output m_axis_bram_53_tlast,
    output m_axis_bram_53_tvalid,  
    output [C_OUTPUT_BRAM_53_DMWIDTH/8-1:0] m_axis_bram_53_tkeep,
    output [C_OUTPUT_BRAM_53_DMWIDTH/8-1:0] m_axis_bram_53_tstrb,
    output [C_OUTPUT_BRAM_53_DMWIDTH-1:0] m_axis_bram_53_tdata,
    input m_axis_bram_53_tready,
    //in-out AXI-Stream output interface 54
    output m_axis_bram_54_tlast,
    output m_axis_bram_54_tvalid,  
    output [C_OUTPUT_BRAM_54_DMWIDTH/8-1:0] m_axis_bram_54_tkeep,
    output [C_OUTPUT_BRAM_54_DMWIDTH/8-1:0] m_axis_bram_54_tstrb,
    output [C_OUTPUT_BRAM_54_DMWIDTH-1:0] m_axis_bram_54_tdata,
    input m_axis_bram_54_tready,
    //in-out AXI-Stream output interface 55
    output m_axis_bram_55_tlast,
    output m_axis_bram_55_tvalid,  
    output [C_OUTPUT_BRAM_55_DMWIDTH/8-1:0] m_axis_bram_55_tkeep,
    output [C_OUTPUT_BRAM_55_DMWIDTH/8-1:0] m_axis_bram_55_tstrb,
    output [C_OUTPUT_BRAM_55_DMWIDTH-1:0] m_axis_bram_55_tdata,
    input m_axis_bram_55_tready,
    //in-out AXI-Stream output interface 56
    output m_axis_bram_56_tlast,
    output m_axis_bram_56_tvalid,  
    output [C_OUTPUT_BRAM_56_DMWIDTH/8-1:0] m_axis_bram_56_tkeep,
    output [C_OUTPUT_BRAM_56_DMWIDTH/8-1:0] m_axis_bram_56_tstrb,
    output [C_OUTPUT_BRAM_56_DMWIDTH-1:0] m_axis_bram_56_tdata,
    input m_axis_bram_56_tready,
    //in-out AXI-Stream output interface 57
    output m_axis_bram_57_tlast,
    output m_axis_bram_57_tvalid,  
    output [C_OUTPUT_BRAM_57_DMWIDTH/8-1:0] m_axis_bram_57_tkeep,
    output [C_OUTPUT_BRAM_57_DMWIDTH/8-1:0] m_axis_bram_57_tstrb,
    output [C_OUTPUT_BRAM_57_DMWIDTH-1:0] m_axis_bram_57_tdata,
    input m_axis_bram_57_tready,
    //in-out AXI-Stream output interface 58
    output m_axis_bram_58_tlast,
    output m_axis_bram_58_tvalid,  
    output [C_OUTPUT_BRAM_58_DMWIDTH/8-1:0] m_axis_bram_58_tkeep,
    output [C_OUTPUT_BRAM_58_DMWIDTH/8-1:0] m_axis_bram_58_tstrb,
    output [C_OUTPUT_BRAM_58_DMWIDTH-1:0] m_axis_bram_58_tdata,
    input m_axis_bram_58_tready,
    //in-out AXI-Stream output interface 59
    output m_axis_bram_59_tlast,
    output m_axis_bram_59_tvalid,  
    output [C_OUTPUT_BRAM_59_DMWIDTH/8-1:0] m_axis_bram_59_tkeep,
    output [C_OUTPUT_BRAM_59_DMWIDTH/8-1:0] m_axis_bram_59_tstrb,
    output [C_OUTPUT_BRAM_59_DMWIDTH-1:0] m_axis_bram_59_tdata,
    input m_axis_bram_59_tready,
    //in-out AXI-Stream output interface 60
    output m_axis_bram_60_tlast,
    output m_axis_bram_60_tvalid,  
    output [C_OUTPUT_BRAM_60_DMWIDTH/8-1:0] m_axis_bram_60_tkeep,
    output [C_OUTPUT_BRAM_60_DMWIDTH/8-1:0] m_axis_bram_60_tstrb,
    output [C_OUTPUT_BRAM_60_DMWIDTH-1:0] m_axis_bram_60_tdata,
    input m_axis_bram_60_tready,
    //in-out AXI-Stream output interface 61
    output m_axis_bram_61_tlast,
    output m_axis_bram_61_tvalid,  
    output [C_OUTPUT_BRAM_61_DMWIDTH/8-1:0] m_axis_bram_61_tkeep,
    output [C_OUTPUT_BRAM_61_DMWIDTH/8-1:0] m_axis_bram_61_tstrb,
    output [C_OUTPUT_BRAM_61_DMWIDTH-1:0] m_axis_bram_61_tdata,
    input m_axis_bram_61_tready,
    //in-out AXI-Stream output interface 62
    output m_axis_bram_62_tlast,
    output m_axis_bram_62_tvalid,  
    output [C_OUTPUT_BRAM_62_DMWIDTH/8-1:0] m_axis_bram_62_tkeep,
    output [C_OUTPUT_BRAM_62_DMWIDTH/8-1:0] m_axis_bram_62_tstrb,
    output [C_OUTPUT_BRAM_62_DMWIDTH-1:0] m_axis_bram_62_tdata,
    input m_axis_bram_62_tready,
    //in-out AXI-Stream output interface 63
    output m_axis_bram_63_tlast,
    output m_axis_bram_63_tvalid,  
    output [C_OUTPUT_BRAM_63_DMWIDTH/8-1:0] m_axis_bram_63_tkeep,
    output [C_OUTPUT_BRAM_63_DMWIDTH/8-1:0] m_axis_bram_63_tstrb,
    output [C_OUTPUT_BRAM_63_DMWIDTH-1:0] m_axis_bram_63_tdata,
    input m_axis_bram_63_tready,
    //in-out AXI-Stream output interface 64
    output m_axis_bram_64_tlast,
    output m_axis_bram_64_tvalid,  
    output [C_OUTPUT_BRAM_64_DMWIDTH/8-1:0] m_axis_bram_64_tkeep,
    output [C_OUTPUT_BRAM_64_DMWIDTH/8-1:0] m_axis_bram_64_tstrb,
    output [C_OUTPUT_BRAM_64_DMWIDTH-1:0] m_axis_bram_64_tdata,
    input m_axis_bram_64_tready,
    //in-out AXI-Stream output interface 65
    output m_axis_bram_65_tlast,
    output m_axis_bram_65_tvalid,  
    output [C_OUTPUT_BRAM_65_DMWIDTH/8-1:0] m_axis_bram_65_tkeep,
    output [C_OUTPUT_BRAM_65_DMWIDTH/8-1:0] m_axis_bram_65_tstrb,
    output [C_OUTPUT_BRAM_65_DMWIDTH-1:0] m_axis_bram_65_tdata,
    input m_axis_bram_65_tready,
    //in-out AXI-Stream output interface 66
    output m_axis_bram_66_tlast,
    output m_axis_bram_66_tvalid,  
    output [C_OUTPUT_BRAM_66_DMWIDTH/8-1:0] m_axis_bram_66_tkeep,
    output [C_OUTPUT_BRAM_66_DMWIDTH/8-1:0] m_axis_bram_66_tstrb,
    output [C_OUTPUT_BRAM_66_DMWIDTH-1:0] m_axis_bram_66_tdata,
    input m_axis_bram_66_tready,
    //in-out AXI-Stream output interface 67
    output m_axis_bram_67_tlast,
    output m_axis_bram_67_tvalid,  
    output [C_OUTPUT_BRAM_67_DMWIDTH/8-1:0] m_axis_bram_67_tkeep,
    output [C_OUTPUT_BRAM_67_DMWIDTH/8-1:0] m_axis_bram_67_tstrb,
    output [C_OUTPUT_BRAM_67_DMWIDTH-1:0] m_axis_bram_67_tdata,
    input m_axis_bram_67_tready,
    //in-out AXI-Stream output interface 68
    output m_axis_bram_68_tlast,
    output m_axis_bram_68_tvalid,  
    output [C_OUTPUT_BRAM_68_DMWIDTH/8-1:0] m_axis_bram_68_tkeep,
    output [C_OUTPUT_BRAM_68_DMWIDTH/8-1:0] m_axis_bram_68_tstrb,
    output [C_OUTPUT_BRAM_68_DMWIDTH-1:0] m_axis_bram_68_tdata,
    input m_axis_bram_68_tready,
    //in-out AXI-Stream output interface 69
    output m_axis_bram_69_tlast,
    output m_axis_bram_69_tvalid,  
    output [C_OUTPUT_BRAM_69_DMWIDTH/8-1:0] m_axis_bram_69_tkeep,
    output [C_OUTPUT_BRAM_69_DMWIDTH/8-1:0] m_axis_bram_69_tstrb,
    output [C_OUTPUT_BRAM_69_DMWIDTH-1:0] m_axis_bram_69_tdata,
    input m_axis_bram_69_tready,
    //in-out AXI-Stream output interface 70
    output m_axis_bram_70_tlast,
    output m_axis_bram_70_tvalid,  
    output [C_OUTPUT_BRAM_70_DMWIDTH/8-1:0] m_axis_bram_70_tkeep,
    output [C_OUTPUT_BRAM_70_DMWIDTH/8-1:0] m_axis_bram_70_tstrb,
    output [C_OUTPUT_BRAM_70_DMWIDTH-1:0] m_axis_bram_70_tdata,
    input m_axis_bram_70_tready,
    //in-out AXI-Stream output interface 71
    output m_axis_bram_71_tlast,
    output m_axis_bram_71_tvalid,  
    output [C_OUTPUT_BRAM_71_DMWIDTH/8-1:0] m_axis_bram_71_tkeep,
    output [C_OUTPUT_BRAM_71_DMWIDTH/8-1:0] m_axis_bram_71_tstrb,
    output [C_OUTPUT_BRAM_71_DMWIDTH-1:0] m_axis_bram_71_tdata,
    input m_axis_bram_71_tready,
    //in-out AXI-Stream output interface 72
    output m_axis_bram_72_tlast,
    output m_axis_bram_72_tvalid,  
    output [C_OUTPUT_BRAM_72_DMWIDTH/8-1:0] m_axis_bram_72_tkeep,
    output [C_OUTPUT_BRAM_72_DMWIDTH/8-1:0] m_axis_bram_72_tstrb,
    output [C_OUTPUT_BRAM_72_DMWIDTH-1:0] m_axis_bram_72_tdata,
    input m_axis_bram_72_tready,
    //in-out AXI-Stream output interface 73
    output m_axis_bram_73_tlast,
    output m_axis_bram_73_tvalid,  
    output [C_OUTPUT_BRAM_73_DMWIDTH/8-1:0] m_axis_bram_73_tkeep,
    output [C_OUTPUT_BRAM_73_DMWIDTH/8-1:0] m_axis_bram_73_tstrb,
    output [C_OUTPUT_BRAM_73_DMWIDTH-1:0] m_axis_bram_73_tdata,
    input m_axis_bram_73_tready,
    //in-out AXI-Stream output interface 74
    output m_axis_bram_74_tlast,
    output m_axis_bram_74_tvalid,  
    output [C_OUTPUT_BRAM_74_DMWIDTH/8-1:0] m_axis_bram_74_tkeep,
    output [C_OUTPUT_BRAM_74_DMWIDTH/8-1:0] m_axis_bram_74_tstrb,
    output [C_OUTPUT_BRAM_74_DMWIDTH-1:0] m_axis_bram_74_tdata,
    input m_axis_bram_74_tready,
    //in-out AXI-Stream output interface 75
    output m_axis_bram_75_tlast,
    output m_axis_bram_75_tvalid,  
    output [C_OUTPUT_BRAM_75_DMWIDTH/8-1:0] m_axis_bram_75_tkeep,
    output [C_OUTPUT_BRAM_75_DMWIDTH/8-1:0] m_axis_bram_75_tstrb,
    output [C_OUTPUT_BRAM_75_DMWIDTH-1:0] m_axis_bram_75_tdata,
    input m_axis_bram_75_tready,
    //in-out AXI-Stream output interface 76
    output m_axis_bram_76_tlast,
    output m_axis_bram_76_tvalid,  
    output [C_OUTPUT_BRAM_76_DMWIDTH/8-1:0] m_axis_bram_76_tkeep,
    output [C_OUTPUT_BRAM_76_DMWIDTH/8-1:0] m_axis_bram_76_tstrb,
    output [C_OUTPUT_BRAM_76_DMWIDTH-1:0] m_axis_bram_76_tdata,
    input m_axis_bram_76_tready,
    //in-out AXI-Stream output interface 77
    output m_axis_bram_77_tlast,
    output m_axis_bram_77_tvalid,  
    output [C_OUTPUT_BRAM_77_DMWIDTH/8-1:0] m_axis_bram_77_tkeep,
    output [C_OUTPUT_BRAM_77_DMWIDTH/8-1:0] m_axis_bram_77_tstrb,
    output [C_OUTPUT_BRAM_77_DMWIDTH-1:0] m_axis_bram_77_tdata,
    input m_axis_bram_77_tready,
    //in-out AXI-Stream output interface 78
    output m_axis_bram_78_tlast,
    output m_axis_bram_78_tvalid,  
    output [C_OUTPUT_BRAM_78_DMWIDTH/8-1:0] m_axis_bram_78_tkeep,
    output [C_OUTPUT_BRAM_78_DMWIDTH/8-1:0] m_axis_bram_78_tstrb,
    output [C_OUTPUT_BRAM_78_DMWIDTH-1:0] m_axis_bram_78_tdata,
    input m_axis_bram_78_tready,
    //in-out AXI-Stream output interface 79
    output m_axis_bram_79_tlast,
    output m_axis_bram_79_tvalid,  
    output [C_OUTPUT_BRAM_79_DMWIDTH/8-1:0] m_axis_bram_79_tkeep,
    output [C_OUTPUT_BRAM_79_DMWIDTH/8-1:0] m_axis_bram_79_tstrb,
    output [C_OUTPUT_BRAM_79_DMWIDTH-1:0] m_axis_bram_79_tdata,
    input m_axis_bram_79_tready,
    //in-out AXI-Stream output interface 80
    output m_axis_bram_80_tlast,
    output m_axis_bram_80_tvalid,  
    output [C_OUTPUT_BRAM_80_DMWIDTH/8-1:0] m_axis_bram_80_tkeep,
    output [C_OUTPUT_BRAM_80_DMWIDTH/8-1:0] m_axis_bram_80_tstrb,
    output [C_OUTPUT_BRAM_80_DMWIDTH-1:0] m_axis_bram_80_tdata,
    input m_axis_bram_80_tready,
    //in-out AXI-Stream output interface 81
    output m_axis_bram_81_tlast,
    output m_axis_bram_81_tvalid,  
    output [C_OUTPUT_BRAM_81_DMWIDTH/8-1:0] m_axis_bram_81_tkeep,
    output [C_OUTPUT_BRAM_81_DMWIDTH/8-1:0] m_axis_bram_81_tstrb,
    output [C_OUTPUT_BRAM_81_DMWIDTH-1:0] m_axis_bram_81_tdata,
    input m_axis_bram_81_tready,
    //in-out AXI-Stream output interface 82
    output m_axis_bram_82_tlast,
    output m_axis_bram_82_tvalid,  
    output [C_OUTPUT_BRAM_82_DMWIDTH/8-1:0] m_axis_bram_82_tkeep,
    output [C_OUTPUT_BRAM_82_DMWIDTH/8-1:0] m_axis_bram_82_tstrb,
    output [C_OUTPUT_BRAM_82_DMWIDTH-1:0] m_axis_bram_82_tdata,
    input m_axis_bram_82_tready,
    //in-out AXI-Stream output interface 83
    output m_axis_bram_83_tlast,
    output m_axis_bram_83_tvalid,  
    output [C_OUTPUT_BRAM_83_DMWIDTH/8-1:0] m_axis_bram_83_tkeep,
    output [C_OUTPUT_BRAM_83_DMWIDTH/8-1:0] m_axis_bram_83_tstrb,
    output [C_OUTPUT_BRAM_83_DMWIDTH-1:0] m_axis_bram_83_tdata,
    input m_axis_bram_83_tready,
    //in-out AXI-Stream output interface 84
    output m_axis_bram_84_tlast,
    output m_axis_bram_84_tvalid,  
    output [C_OUTPUT_BRAM_84_DMWIDTH/8-1:0] m_axis_bram_84_tkeep,
    output [C_OUTPUT_BRAM_84_DMWIDTH/8-1:0] m_axis_bram_84_tstrb,
    output [C_OUTPUT_BRAM_84_DMWIDTH-1:0] m_axis_bram_84_tdata,
    input m_axis_bram_84_tready,
    //in-out AXI-Stream output interface 85
    output m_axis_bram_85_tlast,
    output m_axis_bram_85_tvalid,  
    output [C_OUTPUT_BRAM_85_DMWIDTH/8-1:0] m_axis_bram_85_tkeep,
    output [C_OUTPUT_BRAM_85_DMWIDTH/8-1:0] m_axis_bram_85_tstrb,
    output [C_OUTPUT_BRAM_85_DMWIDTH-1:0] m_axis_bram_85_tdata,
    input m_axis_bram_85_tready,
    //in-out AXI-Stream output interface 86
    output m_axis_bram_86_tlast,
    output m_axis_bram_86_tvalid,  
    output [C_OUTPUT_BRAM_86_DMWIDTH/8-1:0] m_axis_bram_86_tkeep,
    output [C_OUTPUT_BRAM_86_DMWIDTH/8-1:0] m_axis_bram_86_tstrb,
    output [C_OUTPUT_BRAM_86_DMWIDTH-1:0] m_axis_bram_86_tdata,
    input m_axis_bram_86_tready,
    //in-out AXI-Stream output interface 87
    output m_axis_bram_87_tlast,
    output m_axis_bram_87_tvalid,  
    output [C_OUTPUT_BRAM_87_DMWIDTH/8-1:0] m_axis_bram_87_tkeep,
    output [C_OUTPUT_BRAM_87_DMWIDTH/8-1:0] m_axis_bram_87_tstrb,
    output [C_OUTPUT_BRAM_87_DMWIDTH-1:0] m_axis_bram_87_tdata,
    input m_axis_bram_87_tready,
    //in-out AXI-Stream output interface 88
    output m_axis_bram_88_tlast,
    output m_axis_bram_88_tvalid,  
    output [C_OUTPUT_BRAM_88_DMWIDTH/8-1:0] m_axis_bram_88_tkeep,
    output [C_OUTPUT_BRAM_88_DMWIDTH/8-1:0] m_axis_bram_88_tstrb,
    output [C_OUTPUT_BRAM_88_DMWIDTH-1:0] m_axis_bram_88_tdata,
    input m_axis_bram_88_tready,
    //in-out AXI-Stream output interface 89
    output m_axis_bram_89_tlast,
    output m_axis_bram_89_tvalid,  
    output [C_OUTPUT_BRAM_89_DMWIDTH/8-1:0] m_axis_bram_89_tkeep,
    output [C_OUTPUT_BRAM_89_DMWIDTH/8-1:0] m_axis_bram_89_tstrb,
    output [C_OUTPUT_BRAM_89_DMWIDTH-1:0] m_axis_bram_89_tdata,
    input m_axis_bram_89_tready,
    //in-out AXI-Stream output interface 90
    output m_axis_bram_90_tlast,
    output m_axis_bram_90_tvalid,  
    output [C_OUTPUT_BRAM_90_DMWIDTH/8-1:0] m_axis_bram_90_tkeep,
    output [C_OUTPUT_BRAM_90_DMWIDTH/8-1:0] m_axis_bram_90_tstrb,
    output [C_OUTPUT_BRAM_90_DMWIDTH-1:0] m_axis_bram_90_tdata,
    input m_axis_bram_90_tready,
    //in-out AXI-Stream output interface 91
    output m_axis_bram_91_tlast,
    output m_axis_bram_91_tvalid,  
    output [C_OUTPUT_BRAM_91_DMWIDTH/8-1:0] m_axis_bram_91_tkeep,
    output [C_OUTPUT_BRAM_91_DMWIDTH/8-1:0] m_axis_bram_91_tstrb,
    output [C_OUTPUT_BRAM_91_DMWIDTH-1:0] m_axis_bram_91_tdata,
    input m_axis_bram_91_tready,
    //in-out AXI-Stream output interface 92
    output m_axis_bram_92_tlast,
    output m_axis_bram_92_tvalid,  
    output [C_OUTPUT_BRAM_92_DMWIDTH/8-1:0] m_axis_bram_92_tkeep,
    output [C_OUTPUT_BRAM_92_DMWIDTH/8-1:0] m_axis_bram_92_tstrb,
    output [C_OUTPUT_BRAM_92_DMWIDTH-1:0] m_axis_bram_92_tdata,
    input m_axis_bram_92_tready,
    //in-out AXI-Stream output interface 93
    output m_axis_bram_93_tlast,
    output m_axis_bram_93_tvalid,  
    output [C_OUTPUT_BRAM_93_DMWIDTH/8-1:0] m_axis_bram_93_tkeep,
    output [C_OUTPUT_BRAM_93_DMWIDTH/8-1:0] m_axis_bram_93_tstrb,
    output [C_OUTPUT_BRAM_93_DMWIDTH-1:0] m_axis_bram_93_tdata,
    input m_axis_bram_93_tready,
    //in-out AXI-Stream output interface 94
    output m_axis_bram_94_tlast,
    output m_axis_bram_94_tvalid,  
    output [C_OUTPUT_BRAM_94_DMWIDTH/8-1:0] m_axis_bram_94_tkeep,
    output [C_OUTPUT_BRAM_94_DMWIDTH/8-1:0] m_axis_bram_94_tstrb,
    output [C_OUTPUT_BRAM_94_DMWIDTH-1:0] m_axis_bram_94_tdata,
    input m_axis_bram_94_tready,
    //in-out AXI-Stream output interface 95
    output m_axis_bram_95_tlast,
    output m_axis_bram_95_tvalid,  
    output [C_OUTPUT_BRAM_95_DMWIDTH/8-1:0] m_axis_bram_95_tkeep,
    output [C_OUTPUT_BRAM_95_DMWIDTH/8-1:0] m_axis_bram_95_tstrb,
    output [C_OUTPUT_BRAM_95_DMWIDTH-1:0] m_axis_bram_95_tdata,
    input m_axis_bram_95_tready,
    //in-out AXI-Stream output interface 96
    output m_axis_bram_96_tlast,
    output m_axis_bram_96_tvalid,  
    output [C_OUTPUT_BRAM_96_DMWIDTH/8-1:0] m_axis_bram_96_tkeep,
    output [C_OUTPUT_BRAM_96_DMWIDTH/8-1:0] m_axis_bram_96_tstrb,
    output [C_OUTPUT_BRAM_96_DMWIDTH-1:0] m_axis_bram_96_tdata,
    input m_axis_bram_96_tready,
    //in-out AXI-Stream output interface 97
    output m_axis_bram_97_tlast,
    output m_axis_bram_97_tvalid,  
    output [C_OUTPUT_BRAM_97_DMWIDTH/8-1:0] m_axis_bram_97_tkeep,
    output [C_OUTPUT_BRAM_97_DMWIDTH/8-1:0] m_axis_bram_97_tstrb,
    output [C_OUTPUT_BRAM_97_DMWIDTH-1:0] m_axis_bram_97_tdata,
    input m_axis_bram_97_tready,
    //in-out AXI-Stream output interface 98
    output m_axis_bram_98_tlast,
    output m_axis_bram_98_tvalid,  
    output [C_OUTPUT_BRAM_98_DMWIDTH/8-1:0] m_axis_bram_98_tkeep,
    output [C_OUTPUT_BRAM_98_DMWIDTH/8-1:0] m_axis_bram_98_tstrb,
    output [C_OUTPUT_BRAM_98_DMWIDTH-1:0] m_axis_bram_98_tdata,
    input m_axis_bram_98_tready,
    //in-out AXI-Stream output interface 99
    output m_axis_bram_99_tlast,
    output m_axis_bram_99_tvalid,  
    output [C_OUTPUT_BRAM_99_DMWIDTH/8-1:0] m_axis_bram_99_tkeep,
    output [C_OUTPUT_BRAM_99_DMWIDTH/8-1:0] m_axis_bram_99_tstrb,
    output [C_OUTPUT_BRAM_99_DMWIDTH-1:0] m_axis_bram_99_tdata,
    input m_axis_bram_99_tready,
    //in-out AXI-Stream output interface 100
    output m_axis_bram_100_tlast,
    output m_axis_bram_100_tvalid,  
    output [C_OUTPUT_BRAM_100_DMWIDTH/8-1:0] m_axis_bram_100_tkeep,
    output [C_OUTPUT_BRAM_100_DMWIDTH/8-1:0] m_axis_bram_100_tstrb,
    output [C_OUTPUT_BRAM_100_DMWIDTH-1:0] m_axis_bram_100_tdata,
    input m_axis_bram_100_tready,
    //in-out AXI-Stream output interface 101
    output m_axis_bram_101_tlast,
    output m_axis_bram_101_tvalid,  
    output [C_OUTPUT_BRAM_101_DMWIDTH/8-1:0] m_axis_bram_101_tkeep,
    output [C_OUTPUT_BRAM_101_DMWIDTH/8-1:0] m_axis_bram_101_tstrb,
    output [C_OUTPUT_BRAM_101_DMWIDTH-1:0] m_axis_bram_101_tdata,
    input m_axis_bram_101_tready,
    //in-out AXI-Stream output interface 102
    output m_axis_bram_102_tlast,
    output m_axis_bram_102_tvalid,  
    output [C_OUTPUT_BRAM_102_DMWIDTH/8-1:0] m_axis_bram_102_tkeep,
    output [C_OUTPUT_BRAM_102_DMWIDTH/8-1:0] m_axis_bram_102_tstrb,
    output [C_OUTPUT_BRAM_102_DMWIDTH-1:0] m_axis_bram_102_tdata,
    input m_axis_bram_102_tready,
    //in-out AXI-Stream output interface 103
    output m_axis_bram_103_tlast,
    output m_axis_bram_103_tvalid,  
    output [C_OUTPUT_BRAM_103_DMWIDTH/8-1:0] m_axis_bram_103_tkeep,
    output [C_OUTPUT_BRAM_103_DMWIDTH/8-1:0] m_axis_bram_103_tstrb,
    output [C_OUTPUT_BRAM_103_DMWIDTH-1:0] m_axis_bram_103_tdata,
    input m_axis_bram_103_tready,
    //in-out AXI-Stream output interface 104
    output m_axis_bram_104_tlast,
    output m_axis_bram_104_tvalid,  
    output [C_OUTPUT_BRAM_104_DMWIDTH/8-1:0] m_axis_bram_104_tkeep,
    output [C_OUTPUT_BRAM_104_DMWIDTH/8-1:0] m_axis_bram_104_tstrb,
    output [C_OUTPUT_BRAM_104_DMWIDTH-1:0] m_axis_bram_104_tdata,
    input m_axis_bram_104_tready,
    //in-out AXI-Stream output interface 105
    output m_axis_bram_105_tlast,
    output m_axis_bram_105_tvalid,  
    output [C_OUTPUT_BRAM_105_DMWIDTH/8-1:0] m_axis_bram_105_tkeep,
    output [C_OUTPUT_BRAM_105_DMWIDTH/8-1:0] m_axis_bram_105_tstrb,
    output [C_OUTPUT_BRAM_105_DMWIDTH-1:0] m_axis_bram_105_tdata,
    input m_axis_bram_105_tready,
    //in-out AXI-Stream output interface 106
    output m_axis_bram_106_tlast,
    output m_axis_bram_106_tvalid,  
    output [C_OUTPUT_BRAM_106_DMWIDTH/8-1:0] m_axis_bram_106_tkeep,
    output [C_OUTPUT_BRAM_106_DMWIDTH/8-1:0] m_axis_bram_106_tstrb,
    output [C_OUTPUT_BRAM_106_DMWIDTH-1:0] m_axis_bram_106_tdata,
    input m_axis_bram_106_tready,
    //in-out AXI-Stream output interface 107
    output m_axis_bram_107_tlast,
    output m_axis_bram_107_tvalid,  
    output [C_OUTPUT_BRAM_107_DMWIDTH/8-1:0] m_axis_bram_107_tkeep,
    output [C_OUTPUT_BRAM_107_DMWIDTH/8-1:0] m_axis_bram_107_tstrb,
    output [C_OUTPUT_BRAM_107_DMWIDTH-1:0] m_axis_bram_107_tdata,
    input m_axis_bram_107_tready,
    //in-out AXI-Stream output interface 108
    output m_axis_bram_108_tlast,
    output m_axis_bram_108_tvalid,  
    output [C_OUTPUT_BRAM_108_DMWIDTH/8-1:0] m_axis_bram_108_tkeep,
    output [C_OUTPUT_BRAM_108_DMWIDTH/8-1:0] m_axis_bram_108_tstrb,
    output [C_OUTPUT_BRAM_108_DMWIDTH-1:0] m_axis_bram_108_tdata,
    input m_axis_bram_108_tready,
    //in-out AXI-Stream output interface 109
    output m_axis_bram_109_tlast,
    output m_axis_bram_109_tvalid,  
    output [C_OUTPUT_BRAM_109_DMWIDTH/8-1:0] m_axis_bram_109_tkeep,
    output [C_OUTPUT_BRAM_109_DMWIDTH/8-1:0] m_axis_bram_109_tstrb,
    output [C_OUTPUT_BRAM_109_DMWIDTH-1:0] m_axis_bram_109_tdata,
    input m_axis_bram_109_tready,
    //in-out AXI-Stream output interface 110
    output m_axis_bram_110_tlast,
    output m_axis_bram_110_tvalid,  
    output [C_OUTPUT_BRAM_110_DMWIDTH/8-1:0] m_axis_bram_110_tkeep,
    output [C_OUTPUT_BRAM_110_DMWIDTH/8-1:0] m_axis_bram_110_tstrb,
    output [C_OUTPUT_BRAM_110_DMWIDTH-1:0] m_axis_bram_110_tdata,
    input m_axis_bram_110_tready,
    //in-out AXI-Stream output interface 111
    output m_axis_bram_111_tlast,
    output m_axis_bram_111_tvalid,  
    output [C_OUTPUT_BRAM_111_DMWIDTH/8-1:0] m_axis_bram_111_tkeep,
    output [C_OUTPUT_BRAM_111_DMWIDTH/8-1:0] m_axis_bram_111_tstrb,
    output [C_OUTPUT_BRAM_111_DMWIDTH-1:0] m_axis_bram_111_tdata,
    input m_axis_bram_111_tready,
    //in-out AXI-Stream output interface 112
    output m_axis_bram_112_tlast,
    output m_axis_bram_112_tvalid,  
    output [C_OUTPUT_BRAM_112_DMWIDTH/8-1:0] m_axis_bram_112_tkeep,
    output [C_OUTPUT_BRAM_112_DMWIDTH/8-1:0] m_axis_bram_112_tstrb,
    output [C_OUTPUT_BRAM_112_DMWIDTH-1:0] m_axis_bram_112_tdata,
    input m_axis_bram_112_tready,
    //in-out AXI-Stream output interface 113
    output m_axis_bram_113_tlast,
    output m_axis_bram_113_tvalid,  
    output [C_OUTPUT_BRAM_113_DMWIDTH/8-1:0] m_axis_bram_113_tkeep,
    output [C_OUTPUT_BRAM_113_DMWIDTH/8-1:0] m_axis_bram_113_tstrb,
    output [C_OUTPUT_BRAM_113_DMWIDTH-1:0] m_axis_bram_113_tdata,
    input m_axis_bram_113_tready,
    //in-out AXI-Stream output interface 114
    output m_axis_bram_114_tlast,
    output m_axis_bram_114_tvalid,  
    output [C_OUTPUT_BRAM_114_DMWIDTH/8-1:0] m_axis_bram_114_tkeep,
    output [C_OUTPUT_BRAM_114_DMWIDTH/8-1:0] m_axis_bram_114_tstrb,
    output [C_OUTPUT_BRAM_114_DMWIDTH-1:0] m_axis_bram_114_tdata,
    input m_axis_bram_114_tready,
    //in-out AXI-Stream output interface 115
    output m_axis_bram_115_tlast,
    output m_axis_bram_115_tvalid,  
    output [C_OUTPUT_BRAM_115_DMWIDTH/8-1:0] m_axis_bram_115_tkeep,
    output [C_OUTPUT_BRAM_115_DMWIDTH/8-1:0] m_axis_bram_115_tstrb,
    output [C_OUTPUT_BRAM_115_DMWIDTH-1:0] m_axis_bram_115_tdata,
    input m_axis_bram_115_tready,
    //in-out AXI-Stream output interface 116
    output m_axis_bram_116_tlast,
    output m_axis_bram_116_tvalid,  
    output [C_OUTPUT_BRAM_116_DMWIDTH/8-1:0] m_axis_bram_116_tkeep,
    output [C_OUTPUT_BRAM_116_DMWIDTH/8-1:0] m_axis_bram_116_tstrb,
    output [C_OUTPUT_BRAM_116_DMWIDTH-1:0] m_axis_bram_116_tdata,
    input m_axis_bram_116_tready,
    //in-out AXI-Stream output interface 117
    output m_axis_bram_117_tlast,
    output m_axis_bram_117_tvalid,  
    output [C_OUTPUT_BRAM_117_DMWIDTH/8-1:0] m_axis_bram_117_tkeep,
    output [C_OUTPUT_BRAM_117_DMWIDTH/8-1:0] m_axis_bram_117_tstrb,
    output [C_OUTPUT_BRAM_117_DMWIDTH-1:0] m_axis_bram_117_tdata,
    input m_axis_bram_117_tready,
    //in-out AXI-Stream output interface 118
    output m_axis_bram_118_tlast,
    output m_axis_bram_118_tvalid,  
    output [C_OUTPUT_BRAM_118_DMWIDTH/8-1:0] m_axis_bram_118_tkeep,
    output [C_OUTPUT_BRAM_118_DMWIDTH/8-1:0] m_axis_bram_118_tstrb,
    output [C_OUTPUT_BRAM_118_DMWIDTH-1:0] m_axis_bram_118_tdata,
    input m_axis_bram_118_tready,
    //in-out AXI-Stream output interface 119
    output m_axis_bram_119_tlast,
    output m_axis_bram_119_tvalid,  
    output [C_OUTPUT_BRAM_119_DMWIDTH/8-1:0] m_axis_bram_119_tkeep,
    output [C_OUTPUT_BRAM_119_DMWIDTH/8-1:0] m_axis_bram_119_tstrb,
    output [C_OUTPUT_BRAM_119_DMWIDTH-1:0] m_axis_bram_119_tdata,
    input m_axis_bram_119_tready,
    //in-out AXI-Stream output interface 120
    output m_axis_bram_120_tlast,
    output m_axis_bram_120_tvalid,  
    output [C_OUTPUT_BRAM_120_DMWIDTH/8-1:0] m_axis_bram_120_tkeep,
    output [C_OUTPUT_BRAM_120_DMWIDTH/8-1:0] m_axis_bram_120_tstrb,
    output [C_OUTPUT_BRAM_120_DMWIDTH-1:0] m_axis_bram_120_tdata,
    input m_axis_bram_120_tready,
    //in-out AXI-Stream output interface 121
    output m_axis_bram_121_tlast,
    output m_axis_bram_121_tvalid,  
    output [C_OUTPUT_BRAM_121_DMWIDTH/8-1:0] m_axis_bram_121_tkeep,
    output [C_OUTPUT_BRAM_121_DMWIDTH/8-1:0] m_axis_bram_121_tstrb,
    output [C_OUTPUT_BRAM_121_DMWIDTH-1:0] m_axis_bram_121_tdata,
    input m_axis_bram_121_tready,
    //in-out AXI-Stream output interface 122
    output m_axis_bram_122_tlast,
    output m_axis_bram_122_tvalid,  
    output [C_OUTPUT_BRAM_122_DMWIDTH/8-1:0] m_axis_bram_122_tkeep,
    output [C_OUTPUT_BRAM_122_DMWIDTH/8-1:0] m_axis_bram_122_tstrb,
    output [C_OUTPUT_BRAM_122_DMWIDTH-1:0] m_axis_bram_122_tdata,
    input m_axis_bram_122_tready,
    //in-out AXI-Stream output interface 123
    output m_axis_bram_123_tlast,
    output m_axis_bram_123_tvalid,  
    output [C_OUTPUT_BRAM_123_DMWIDTH/8-1:0] m_axis_bram_123_tkeep,
    output [C_OUTPUT_BRAM_123_DMWIDTH/8-1:0] m_axis_bram_123_tstrb,
    output [C_OUTPUT_BRAM_123_DMWIDTH-1:0] m_axis_bram_123_tdata,
    input m_axis_bram_123_tready,
    //in-out AXI-Stream output interface 124
    output m_axis_bram_124_tlast,
    output m_axis_bram_124_tvalid,  
    output [C_OUTPUT_BRAM_124_DMWIDTH/8-1:0] m_axis_bram_124_tkeep,
    output [C_OUTPUT_BRAM_124_DMWIDTH/8-1:0] m_axis_bram_124_tstrb,
    output [C_OUTPUT_BRAM_124_DMWIDTH-1:0] m_axis_bram_124_tdata,
    input m_axis_bram_124_tready,
    //in-out AXI-Stream output interface 125
    output m_axis_bram_125_tlast,
    output m_axis_bram_125_tvalid,  
    output [C_OUTPUT_BRAM_125_DMWIDTH/8-1:0] m_axis_bram_125_tkeep,
    output [C_OUTPUT_BRAM_125_DMWIDTH/8-1:0] m_axis_bram_125_tstrb,
    output [C_OUTPUT_BRAM_125_DMWIDTH-1:0] m_axis_bram_125_tdata,
    input m_axis_bram_125_tready,
    //in-out AXI-Stream output interface 126
    output m_axis_bram_126_tlast,
    output m_axis_bram_126_tvalid,  
    output [C_OUTPUT_BRAM_126_DMWIDTH/8-1:0] m_axis_bram_126_tkeep,
    output [C_OUTPUT_BRAM_126_DMWIDTH/8-1:0] m_axis_bram_126_tstrb,
    output [C_OUTPUT_BRAM_126_DMWIDTH-1:0] m_axis_bram_126_tdata,
    input m_axis_bram_126_tready,
    //in-out AXI-Stream output interface 127
    output m_axis_bram_127_tlast,
    output m_axis_bram_127_tvalid,  
    output [C_OUTPUT_BRAM_127_DMWIDTH/8-1:0] m_axis_bram_127_tkeep,
    output [C_OUTPUT_BRAM_127_DMWIDTH/8-1:0] m_axis_bram_127_tstrb,
    output [C_OUTPUT_BRAM_127_DMWIDTH-1:0] m_axis_bram_127_tdata,
    input m_axis_bram_127_tready
    );
    
parameter C_NUM_INPUT_BRAMs = 0; 
parameter C_INPUT_BRAM_0_PORTS = 1;
parameter C_INPUT_BRAM_1_PORTS = 1;
parameter C_INPUT_BRAM_2_PORTS = 1;
parameter C_INPUT_BRAM_3_PORTS = 1;
parameter C_INPUT_BRAM_4_PORTS = 1;
parameter C_INPUT_BRAM_5_PORTS = 1;
parameter C_INPUT_BRAM_6_PORTS = 1;
parameter C_INPUT_BRAM_7_PORTS = 1;
parameter C_INPUT_BRAM_8_PORTS = 1;
parameter C_INPUT_BRAM_9_PORTS = 1;
parameter C_INPUT_BRAM_10_PORTS = 1;
parameter C_INPUT_BRAM_11_PORTS = 1;
parameter C_INPUT_BRAM_12_PORTS = 1;
parameter C_INPUT_BRAM_13_PORTS = 1;
parameter C_INPUT_BRAM_14_PORTS = 1;
parameter C_INPUT_BRAM_15_PORTS = 1;
parameter C_INPUT_BRAM_16_PORTS = 1;
parameter C_INPUT_BRAM_17_PORTS = 1;
parameter C_INPUT_BRAM_18_PORTS = 1;
parameter C_INPUT_BRAM_19_PORTS = 1;
parameter C_INPUT_BRAM_20_PORTS = 1;
parameter C_INPUT_BRAM_21_PORTS = 1;
parameter C_INPUT_BRAM_22_PORTS = 1;
parameter C_INPUT_BRAM_23_PORTS = 1;
parameter C_INPUT_BRAM_24_PORTS = 1;
parameter C_INPUT_BRAM_25_PORTS = 1;
parameter C_INPUT_BRAM_26_PORTS = 1;
parameter C_INPUT_BRAM_27_PORTS = 1;
parameter C_INPUT_BRAM_28_PORTS = 1;
parameter C_INPUT_BRAM_29_PORTS = 1;
parameter C_INPUT_BRAM_30_PORTS = 1;
parameter C_INPUT_BRAM_31_PORTS = 1;
parameter C_INPUT_BRAM_32_PORTS = 1;
parameter C_INPUT_BRAM_33_PORTS = 1;
parameter C_INPUT_BRAM_34_PORTS = 1;
parameter C_INPUT_BRAM_35_PORTS = 1;
parameter C_INPUT_BRAM_36_PORTS = 1;
parameter C_INPUT_BRAM_37_PORTS = 1;
parameter C_INPUT_BRAM_38_PORTS = 1;
parameter C_INPUT_BRAM_39_PORTS = 1;
parameter C_INPUT_BRAM_40_PORTS = 1;
parameter C_INPUT_BRAM_41_PORTS = 1;
parameter C_INPUT_BRAM_42_PORTS = 1;
parameter C_INPUT_BRAM_43_PORTS = 1;
parameter C_INPUT_BRAM_44_PORTS = 1;
parameter C_INPUT_BRAM_45_PORTS = 1;
parameter C_INPUT_BRAM_46_PORTS = 1;
parameter C_INPUT_BRAM_47_PORTS = 1;
parameter C_INPUT_BRAM_48_PORTS = 1;
parameter C_INPUT_BRAM_49_PORTS = 1;
parameter C_INPUT_BRAM_50_PORTS = 1;
parameter C_INPUT_BRAM_51_PORTS = 1;
parameter C_INPUT_BRAM_52_PORTS = 1;
parameter C_INPUT_BRAM_53_PORTS = 1;
parameter C_INPUT_BRAM_54_PORTS = 1;
parameter C_INPUT_BRAM_55_PORTS = 1;
parameter C_INPUT_BRAM_56_PORTS = 1;
parameter C_INPUT_BRAM_57_PORTS = 1;
parameter C_INPUT_BRAM_58_PORTS = 1;
parameter C_INPUT_BRAM_59_PORTS = 1;
parameter C_INPUT_BRAM_60_PORTS = 1;
parameter C_INPUT_BRAM_61_PORTS = 1;
parameter C_INPUT_BRAM_62_PORTS = 1;
parameter C_INPUT_BRAM_63_PORTS = 1;
parameter C_INPUT_BRAM_64_PORTS = 1;
parameter C_INPUT_BRAM_65_PORTS = 1;
parameter C_INPUT_BRAM_66_PORTS = 1;
parameter C_INPUT_BRAM_67_PORTS = 1;
parameter C_INPUT_BRAM_68_PORTS = 1;
parameter C_INPUT_BRAM_69_PORTS = 1;
parameter C_INPUT_BRAM_70_PORTS = 1;
parameter C_INPUT_BRAM_71_PORTS = 1;
parameter C_INPUT_BRAM_72_PORTS = 1;
parameter C_INPUT_BRAM_73_PORTS = 1;
parameter C_INPUT_BRAM_74_PORTS = 1;
parameter C_INPUT_BRAM_75_PORTS = 1;
parameter C_INPUT_BRAM_76_PORTS = 1;
parameter C_INPUT_BRAM_77_PORTS = 1;
parameter C_INPUT_BRAM_78_PORTS = 1;
parameter C_INPUT_BRAM_79_PORTS = 1;
parameter C_INPUT_BRAM_80_PORTS = 1;
parameter C_INPUT_BRAM_81_PORTS = 1;
parameter C_INPUT_BRAM_82_PORTS = 1;
parameter C_INPUT_BRAM_83_PORTS = 1;
parameter C_INPUT_BRAM_84_PORTS = 1;
parameter C_INPUT_BRAM_85_PORTS = 1;
parameter C_INPUT_BRAM_86_PORTS = 1;
parameter C_INPUT_BRAM_87_PORTS = 1;
parameter C_INPUT_BRAM_88_PORTS = 1;
parameter C_INPUT_BRAM_89_PORTS = 1;
parameter C_INPUT_BRAM_90_PORTS = 1;
parameter C_INPUT_BRAM_91_PORTS = 1;
parameter C_INPUT_BRAM_92_PORTS = 1;
parameter C_INPUT_BRAM_93_PORTS = 1;
parameter C_INPUT_BRAM_94_PORTS = 1;
parameter C_INPUT_BRAM_95_PORTS = 1;
parameter C_INPUT_BRAM_96_PORTS = 1;
parameter C_INPUT_BRAM_97_PORTS = 1;
parameter C_INPUT_BRAM_98_PORTS = 1;
parameter C_INPUT_BRAM_99_PORTS = 1;
parameter C_INPUT_BRAM_100_PORTS = 1;
parameter C_INPUT_BRAM_101_PORTS = 1;
parameter C_INPUT_BRAM_102_PORTS = 1;
parameter C_INPUT_BRAM_103_PORTS = 1;
parameter C_INPUT_BRAM_104_PORTS = 1;
parameter C_INPUT_BRAM_105_PORTS = 1;
parameter C_INPUT_BRAM_106_PORTS = 1;
parameter C_INPUT_BRAM_107_PORTS = 1;
parameter C_INPUT_BRAM_108_PORTS = 1;
parameter C_INPUT_BRAM_109_PORTS = 1;
parameter C_INPUT_BRAM_110_PORTS = 1;
parameter C_INPUT_BRAM_111_PORTS = 1;
parameter C_INPUT_BRAM_112_PORTS = 1;
parameter C_INPUT_BRAM_113_PORTS = 1;
parameter C_INPUT_BRAM_114_PORTS = 1;
parameter C_INPUT_BRAM_115_PORTS = 1;
parameter C_INPUT_BRAM_116_PORTS = 1;
parameter C_INPUT_BRAM_117_PORTS = 1;
parameter C_INPUT_BRAM_118_PORTS = 1;
parameter C_INPUT_BRAM_119_PORTS = 1;
parameter C_INPUT_BRAM_120_PORTS = 1;
parameter C_INPUT_BRAM_121_PORTS = 1;
parameter C_INPUT_BRAM_122_PORTS = 1;
parameter C_INPUT_BRAM_123_PORTS = 1;
parameter C_INPUT_BRAM_124_PORTS = 1;
parameter C_INPUT_BRAM_125_PORTS = 1;
parameter C_INPUT_BRAM_126_PORTS = 1;
parameter C_INPUT_BRAM_127_PORTS = 1;
parameter [31:0] C_INPUT_BRAM_0_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_1_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_2_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_3_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_4_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_5_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_6_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_7_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_8_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_9_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_10_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_11_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_12_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_13_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_14_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_15_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_16_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_17_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_18_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_19_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_20_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_21_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_22_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_23_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_24_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_25_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_26_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_27_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_28_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_29_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_30_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_31_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_32_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_33_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_34_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_35_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_36_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_37_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_38_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_39_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_40_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_41_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_42_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_43_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_44_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_45_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_46_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_47_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_48_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_49_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_50_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_51_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_52_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_53_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_54_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_55_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_56_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_57_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_58_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_59_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_60_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_61_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_62_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_63_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_64_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_65_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_66_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_67_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_68_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_69_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_70_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_71_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_72_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_73_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_74_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_75_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_76_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_77_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_78_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_79_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_80_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_81_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_82_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_83_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_84_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_85_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_86_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_87_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_88_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_89_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_90_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_91_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_92_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_93_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_94_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_95_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_96_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_97_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_98_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_99_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_100_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_101_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_102_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_103_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_104_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_105_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_106_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_107_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_108_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_109_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_110_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_111_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_112_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_113_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_114_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_115_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_116_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_117_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_118_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_119_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_120_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_121_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_122_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_123_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_124_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_125_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_126_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_127_WIDTH = 8;     //width of input bram interface on the accelerator
parameter [31:0] C_INPUT_BRAM_0_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_1_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_2_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_3_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_4_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_5_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_6_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_7_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_8_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_9_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_10_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_11_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_12_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_13_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_14_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_15_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_16_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_17_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_18_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_19_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_20_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_21_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_22_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_23_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_24_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_25_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_26_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_27_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_28_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_29_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_30_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_31_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_32_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_33_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_34_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_35_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_36_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_37_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_38_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_39_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_40_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_41_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_42_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_43_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_44_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_45_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_46_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_47_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_48_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_49_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_50_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_51_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_52_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_53_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_54_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_55_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_56_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_57_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_58_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_59_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_60_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_61_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_62_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_63_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_64_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_65_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_66_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_67_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_68_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_69_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_70_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_71_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_72_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_73_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_74_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_75_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_76_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_77_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_78_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_79_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_80_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_81_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_82_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_83_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_84_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_85_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_86_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_87_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_88_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_89_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_90_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_91_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_92_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_93_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_94_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_95_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_96_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_97_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_98_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_99_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_100_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_101_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_102_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_103_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_104_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_105_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_106_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_107_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_108_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_109_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_110_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_111_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_112_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_113_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_114_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_115_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_116_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_117_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_118_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_119_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_120_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_121_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_122_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_123_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_124_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_125_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_126_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_127_DEPTH = 2;      //depth of BRAM in adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_0_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_1_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_2_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_3_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_4_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_5_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_6_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_7_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_8_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_9_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_10_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_11_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_12_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_13_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_14_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_15_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_16_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_17_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_18_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_19_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_20_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_21_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_22_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_23_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_24_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_25_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_26_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_27_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_28_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_29_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_30_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_31_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_32_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_33_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_34_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_35_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_36_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_37_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_38_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_39_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_40_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_41_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_42_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_43_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_44_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_45_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_46_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_47_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_48_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_49_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_50_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_51_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_52_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_53_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_54_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_55_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_56_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_57_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_58_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_59_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_60_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_61_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_62_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_63_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_64_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_65_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_66_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_67_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_68_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_69_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_70_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_71_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_72_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_73_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_74_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_75_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_76_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_77_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_78_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_79_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_80_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_81_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_82_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_83_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_84_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_85_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_86_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_87_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_88_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_89_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_90_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_91_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_92_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_93_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_94_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_95_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_96_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_97_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_98_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_99_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_100_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_101_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_102_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_103_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_104_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_105_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_106_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_107_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_108_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_109_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_110_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_111_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_112_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_113_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_114_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_115_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_116_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_117_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_118_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_119_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_120_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_121_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_122_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_123_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_124_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_125_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_126_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_INPUT_BRAM_127_DMWIDTH = 8;   //width of AXIS interface from DM to adapter for input bram interface
parameter [31:0] C_OUTPUT_BRAM_0_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_1_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_2_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_3_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_4_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_5_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_6_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_7_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_8_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_9_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_10_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_11_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_12_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_13_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_14_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_15_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_16_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_17_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_18_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_19_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_20_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_21_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_22_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_23_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_24_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_25_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_26_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_27_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_28_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_29_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_30_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_31_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_32_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_33_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_34_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_35_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_36_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_37_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_38_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_39_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_40_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_41_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_42_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_43_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_44_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_45_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_46_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_47_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_48_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_49_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_50_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_51_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_52_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_53_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_54_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_55_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_56_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_57_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_58_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_59_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_60_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_61_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_62_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_63_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_64_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_65_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_66_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_67_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_68_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_69_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_70_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_71_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_72_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_73_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_74_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_75_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_76_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_77_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_78_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_79_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_80_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_81_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_82_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_83_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_84_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_85_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_86_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_87_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_88_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_89_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_90_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_91_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_92_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_93_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_94_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_95_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_96_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_97_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_98_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_99_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_100_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_101_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_102_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_103_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_104_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_105_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_106_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_107_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_108_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_109_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_110_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_111_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_112_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_113_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_114_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_115_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_116_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_117_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_118_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_119_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_120_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_121_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_122_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_123_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_124_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_125_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_126_DMWIDTH = 8;
parameter [31:0] C_OUTPUT_BRAM_127_DMWIDTH = 8;
parameter [0:0] C_BRAM_0_IS_INOUT = 0;
parameter [0:0] C_BRAM_1_IS_INOUT = 0;
parameter [0:0] C_BRAM_2_IS_INOUT = 0;
parameter [0:0] C_BRAM_3_IS_INOUT = 0;
parameter [0:0] C_BRAM_4_IS_INOUT = 0;
parameter [0:0] C_BRAM_5_IS_INOUT = 0;
parameter [0:0] C_BRAM_6_IS_INOUT = 0;
parameter [0:0] C_BRAM_7_IS_INOUT = 0;
parameter [0:0] C_BRAM_8_IS_INOUT = 0;
parameter [0:0] C_BRAM_9_IS_INOUT = 0;
parameter [0:0] C_BRAM_10_IS_INOUT = 0;
parameter [0:0] C_BRAM_11_IS_INOUT = 0;
parameter [0:0] C_BRAM_12_IS_INOUT = 0;
parameter [0:0] C_BRAM_13_IS_INOUT = 0;
parameter [0:0] C_BRAM_14_IS_INOUT = 0;
parameter [0:0] C_BRAM_15_IS_INOUT = 0;
parameter [0:0] C_BRAM_16_IS_INOUT = 0;
parameter [0:0] C_BRAM_17_IS_INOUT = 0;
parameter [0:0] C_BRAM_18_IS_INOUT = 0;
parameter [0:0] C_BRAM_19_IS_INOUT = 0;
parameter [0:0] C_BRAM_20_IS_INOUT = 0;
parameter [0:0] C_BRAM_21_IS_INOUT = 0;
parameter [0:0] C_BRAM_22_IS_INOUT = 0;
parameter [0:0] C_BRAM_23_IS_INOUT = 0;
parameter [0:0] C_BRAM_24_IS_INOUT = 0;
parameter [0:0] C_BRAM_25_IS_INOUT = 0;
parameter [0:0] C_BRAM_26_IS_INOUT = 0;
parameter [0:0] C_BRAM_27_IS_INOUT = 0;
parameter [0:0] C_BRAM_28_IS_INOUT = 0;
parameter [0:0] C_BRAM_29_IS_INOUT = 0;
parameter [0:0] C_BRAM_30_IS_INOUT = 0;
parameter [0:0] C_BRAM_31_IS_INOUT = 0;
parameter [0:0] C_BRAM_32_IS_INOUT = 0;
parameter [0:0] C_BRAM_33_IS_INOUT = 0;
parameter [0:0] C_BRAM_34_IS_INOUT = 0;
parameter [0:0] C_BRAM_35_IS_INOUT = 0;
parameter [0:0] C_BRAM_36_IS_INOUT = 0;
parameter [0:0] C_BRAM_37_IS_INOUT = 0;
parameter [0:0] C_BRAM_38_IS_INOUT = 0;
parameter [0:0] C_BRAM_39_IS_INOUT = 0;
parameter [0:0] C_BRAM_40_IS_INOUT = 0;
parameter [0:0] C_BRAM_41_IS_INOUT = 0;
parameter [0:0] C_BRAM_42_IS_INOUT = 0;
parameter [0:0] C_BRAM_43_IS_INOUT = 0;
parameter [0:0] C_BRAM_44_IS_INOUT = 0;
parameter [0:0] C_BRAM_45_IS_INOUT = 0;
parameter [0:0] C_BRAM_46_IS_INOUT = 0;
parameter [0:0] C_BRAM_47_IS_INOUT = 0;
parameter [0:0] C_BRAM_48_IS_INOUT = 0;
parameter [0:0] C_BRAM_49_IS_INOUT = 0;
parameter [0:0] C_BRAM_50_IS_INOUT = 0;
parameter [0:0] C_BRAM_51_IS_INOUT = 0;
parameter [0:0] C_BRAM_52_IS_INOUT = 0;
parameter [0:0] C_BRAM_53_IS_INOUT = 0;
parameter [0:0] C_BRAM_54_IS_INOUT = 0;
parameter [0:0] C_BRAM_55_IS_INOUT = 0;
parameter [0:0] C_BRAM_56_IS_INOUT = 0;
parameter [0:0] C_BRAM_57_IS_INOUT = 0;
parameter [0:0] C_BRAM_58_IS_INOUT = 0;
parameter [0:0] C_BRAM_59_IS_INOUT = 0;
parameter [0:0] C_BRAM_60_IS_INOUT = 0;
parameter [0:0] C_BRAM_61_IS_INOUT = 0;
parameter [0:0] C_BRAM_62_IS_INOUT = 0;
parameter [0:0] C_BRAM_63_IS_INOUT = 0;
parameter [0:0] C_BRAM_64_IS_INOUT = 0;
parameter [0:0] C_BRAM_65_IS_INOUT = 0;
parameter [0:0] C_BRAM_66_IS_INOUT = 0;
parameter [0:0] C_BRAM_67_IS_INOUT = 0;
parameter [0:0] C_BRAM_68_IS_INOUT = 0;
parameter [0:0] C_BRAM_69_IS_INOUT = 0;
parameter [0:0] C_BRAM_70_IS_INOUT = 0;
parameter [0:0] C_BRAM_71_IS_INOUT = 0;
parameter [0:0] C_BRAM_72_IS_INOUT = 0;
parameter [0:0] C_BRAM_73_IS_INOUT = 0;
parameter [0:0] C_BRAM_74_IS_INOUT = 0;
parameter [0:0] C_BRAM_75_IS_INOUT = 0;
parameter [0:0] C_BRAM_76_IS_INOUT = 0;
parameter [0:0] C_BRAM_77_IS_INOUT = 0;
parameter [0:0] C_BRAM_78_IS_INOUT = 0;
parameter [0:0] C_BRAM_79_IS_INOUT = 0;
parameter [0:0] C_BRAM_80_IS_INOUT = 0;
parameter [0:0] C_BRAM_81_IS_INOUT = 0;
parameter [0:0] C_BRAM_82_IS_INOUT = 0;
parameter [0:0] C_BRAM_83_IS_INOUT = 0;
parameter [0:0] C_BRAM_84_IS_INOUT = 0;
parameter [0:0] C_BRAM_85_IS_INOUT = 0;
parameter [0:0] C_BRAM_86_IS_INOUT = 0;
parameter [0:0] C_BRAM_87_IS_INOUT = 0;
parameter [0:0] C_BRAM_88_IS_INOUT = 0;
parameter [0:0] C_BRAM_89_IS_INOUT = 0;
parameter [0:0] C_BRAM_90_IS_INOUT = 0;
parameter [0:0] C_BRAM_91_IS_INOUT = 0;
parameter [0:0] C_BRAM_92_IS_INOUT = 0;
parameter [0:0] C_BRAM_93_IS_INOUT = 0;
parameter [0:0] C_BRAM_94_IS_INOUT = 0;
parameter [0:0] C_BRAM_95_IS_INOUT = 0;
parameter [0:0] C_BRAM_96_IS_INOUT = 0;
parameter [0:0] C_BRAM_97_IS_INOUT = 0;
parameter [0:0] C_BRAM_98_IS_INOUT = 0;
parameter [0:0] C_BRAM_99_IS_INOUT = 0;
parameter [0:0] C_BRAM_100_IS_INOUT = 0;
parameter [0:0] C_BRAM_101_IS_INOUT = 0;
parameter [0:0] C_BRAM_102_IS_INOUT = 0;
parameter [0:0] C_BRAM_103_IS_INOUT = 0;
parameter [0:0] C_BRAM_104_IS_INOUT = 0;
parameter [0:0] C_BRAM_105_IS_INOUT = 0;
parameter [0:0] C_BRAM_106_IS_INOUT = 0;
parameter [0:0] C_BRAM_107_IS_INOUT = 0;
parameter [0:0] C_BRAM_108_IS_INOUT = 0;
parameter [0:0] C_BRAM_109_IS_INOUT = 0;
parameter [0:0] C_BRAM_110_IS_INOUT = 0;
parameter [0:0] C_BRAM_111_IS_INOUT = 0;
parameter [0:0] C_BRAM_112_IS_INOUT = 0;
parameter [0:0] C_BRAM_113_IS_INOUT = 0;
parameter [0:0] C_BRAM_114_IS_INOUT = 0;
parameter [0:0] C_BRAM_115_IS_INOUT = 0;
parameter [0:0] C_BRAM_116_IS_INOUT = 0;
parameter [0:0] C_BRAM_117_IS_INOUT = 0;
parameter [0:0] C_BRAM_118_IS_INOUT = 0;
parameter [0:0] C_BRAM_119_IS_INOUT = 0;
parameter [0:0] C_BRAM_120_IS_INOUT = 0;
parameter [0:0] C_BRAM_121_IS_INOUT = 0;
parameter [0:0] C_BRAM_122_IS_INOUT = 0;
parameter [0:0] C_BRAM_123_IS_INOUT = 0;
parameter [0:0] C_BRAM_124_IS_INOUT = 0;
parameter [0:0] C_BRAM_125_IS_INOUT = 0;
parameter [0:0] C_BRAM_126_IS_INOUT = 0;
parameter [0:0] C_BRAM_127_IS_INOUT = 0;
parameter [31:0] C_INPUT_BRAM_0_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_1_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_2_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_3_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_4_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_5_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_6_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_7_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_8_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_9_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_10_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_11_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_12_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_13_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_14_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_15_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_16_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_17_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_18_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_19_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_20_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_21_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_22_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_23_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_24_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_25_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_26_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_27_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_28_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_29_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_30_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_31_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_32_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_33_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_34_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_35_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_36_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_37_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_38_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_39_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_40_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_41_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_42_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_43_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_44_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_45_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_46_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_47_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_48_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_49_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_50_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_51_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_52_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_53_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_54_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_55_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_56_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_57_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_58_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_59_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_60_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_61_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_62_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_63_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_64_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_65_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_66_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_67_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_68_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_69_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_70_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_71_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_72_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_73_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_74_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_75_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_76_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_77_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_78_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_79_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_80_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_81_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_82_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_83_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_84_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_85_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_86_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_87_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_88_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_89_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_90_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_91_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_92_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_93_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_94_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_95_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_96_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_97_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_98_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_99_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_100_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_101_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_102_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_103_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_104_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_105_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_106_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_107_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_108_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_109_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_110_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_111_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_112_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_113_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_114_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_115_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_116_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_117_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_118_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_119_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_120_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_121_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_122_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_123_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_124_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_125_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_126_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_127_MB_DEPTH = 1;  //depth, number of copies of BRAM args
parameter [31:0] C_INPUT_BRAM_0_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_1_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_2_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_3_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_4_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_5_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_6_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_7_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_8_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_9_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_10_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_11_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_12_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_13_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_14_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_15_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_16_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_17_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_18_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_19_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_20_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_21_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_22_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_23_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_24_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_25_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_26_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_27_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_28_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_29_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_30_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_31_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_32_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_33_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_34_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_35_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_36_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_37_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_38_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_39_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_40_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_41_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_42_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_43_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_44_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_45_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_46_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_47_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_48_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_49_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_50_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_51_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_52_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_53_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_54_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_55_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_56_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_57_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_58_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_59_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_60_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_61_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_62_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_63_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_64_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_65_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_66_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_67_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_68_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_69_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_70_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_71_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_72_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_73_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_74_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_75_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_76_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_77_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_78_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_79_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_80_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_81_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_82_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_83_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_84_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_85_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_86_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_87_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_88_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_89_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_90_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_91_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_92_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_93_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_94_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_95_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_96_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_97_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_98_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_99_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_100_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_101_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_102_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_103_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_104_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_105_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_106_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_107_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_108_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_109_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_110_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_111_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_112_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_113_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_114_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_115_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_116_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_117_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_118_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_119_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_120_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_121_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_122_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_123_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_124_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_125_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_126_ADDR_WIDTH = 1;
parameter [31:0] C_INPUT_BRAM_127_ADDR_WIDTH = 1;

    localparam C_MAX_INPUT_BRAMs = 128;
    localparam C_MAX_BIT_WIDTH = 1024;
    localparam [(C_MAX_INPUT_BRAMs*32)-1:0] C_INBRAM_BIT_ARRAY = {C_INPUT_BRAM_127_WIDTH,C_INPUT_BRAM_126_WIDTH,C_INPUT_BRAM_125_WIDTH,C_INPUT_BRAM_124_WIDTH,C_INPUT_BRAM_123_WIDTH,C_INPUT_BRAM_122_WIDTH,C_INPUT_BRAM_121_WIDTH,C_INPUT_BRAM_120_WIDTH,C_INPUT_BRAM_119_WIDTH,C_INPUT_BRAM_118_WIDTH,C_INPUT_BRAM_117_WIDTH,C_INPUT_BRAM_116_WIDTH,C_INPUT_BRAM_115_WIDTH,C_INPUT_BRAM_114_WIDTH,C_INPUT_BRAM_113_WIDTH,C_INPUT_BRAM_112_WIDTH,C_INPUT_BRAM_111_WIDTH,C_INPUT_BRAM_110_WIDTH,C_INPUT_BRAM_109_WIDTH,C_INPUT_BRAM_108_WIDTH,C_INPUT_BRAM_107_WIDTH,C_INPUT_BRAM_106_WIDTH,C_INPUT_BRAM_105_WIDTH,C_INPUT_BRAM_104_WIDTH,C_INPUT_BRAM_103_WIDTH,C_INPUT_BRAM_102_WIDTH,C_INPUT_BRAM_101_WIDTH,C_INPUT_BRAM_100_WIDTH,C_INPUT_BRAM_99_WIDTH,C_INPUT_BRAM_98_WIDTH,C_INPUT_BRAM_97_WIDTH,C_INPUT_BRAM_96_WIDTH,C_INPUT_BRAM_95_WIDTH,C_INPUT_BRAM_94_WIDTH,C_INPUT_BRAM_93_WIDTH,C_INPUT_BRAM_92_WIDTH,C_INPUT_BRAM_91_WIDTH,C_INPUT_BRAM_90_WIDTH,C_INPUT_BRAM_89_WIDTH,C_INPUT_BRAM_88_WIDTH,C_INPUT_BRAM_87_WIDTH,C_INPUT_BRAM_86_WIDTH,C_INPUT_BRAM_85_WIDTH,C_INPUT_BRAM_84_WIDTH,C_INPUT_BRAM_83_WIDTH,C_INPUT_BRAM_82_WIDTH,C_INPUT_BRAM_81_WIDTH,C_INPUT_BRAM_80_WIDTH,C_INPUT_BRAM_79_WIDTH,C_INPUT_BRAM_78_WIDTH,C_INPUT_BRAM_77_WIDTH,C_INPUT_BRAM_76_WIDTH,C_INPUT_BRAM_75_WIDTH,C_INPUT_BRAM_74_WIDTH,C_INPUT_BRAM_73_WIDTH,C_INPUT_BRAM_72_WIDTH,C_INPUT_BRAM_71_WIDTH,C_INPUT_BRAM_70_WIDTH,C_INPUT_BRAM_69_WIDTH,C_INPUT_BRAM_68_WIDTH,C_INPUT_BRAM_67_WIDTH,C_INPUT_BRAM_66_WIDTH,C_INPUT_BRAM_65_WIDTH,C_INPUT_BRAM_64_WIDTH,C_INPUT_BRAM_63_WIDTH,C_INPUT_BRAM_62_WIDTH,C_INPUT_BRAM_61_WIDTH,C_INPUT_BRAM_60_WIDTH,C_INPUT_BRAM_59_WIDTH,C_INPUT_BRAM_58_WIDTH,C_INPUT_BRAM_57_WIDTH,C_INPUT_BRAM_56_WIDTH,C_INPUT_BRAM_55_WIDTH,C_INPUT_BRAM_54_WIDTH,C_INPUT_BRAM_53_WIDTH,C_INPUT_BRAM_52_WIDTH,C_INPUT_BRAM_51_WIDTH,C_INPUT_BRAM_50_WIDTH,C_INPUT_BRAM_49_WIDTH,C_INPUT_BRAM_48_WIDTH,C_INPUT_BRAM_47_WIDTH,C_INPUT_BRAM_46_WIDTH,C_INPUT_BRAM_45_WIDTH,C_INPUT_BRAM_44_WIDTH,C_INPUT_BRAM_43_WIDTH,C_INPUT_BRAM_42_WIDTH,C_INPUT_BRAM_41_WIDTH,C_INPUT_BRAM_40_WIDTH,C_INPUT_BRAM_39_WIDTH,C_INPUT_BRAM_38_WIDTH,C_INPUT_BRAM_37_WIDTH,C_INPUT_BRAM_36_WIDTH,C_INPUT_BRAM_35_WIDTH,C_INPUT_BRAM_34_WIDTH,C_INPUT_BRAM_33_WIDTH,C_INPUT_BRAM_32_WIDTH,C_INPUT_BRAM_31_WIDTH,C_INPUT_BRAM_30_WIDTH,C_INPUT_BRAM_29_WIDTH,C_INPUT_BRAM_28_WIDTH,C_INPUT_BRAM_27_WIDTH,C_INPUT_BRAM_26_WIDTH,C_INPUT_BRAM_25_WIDTH,C_INPUT_BRAM_24_WIDTH,C_INPUT_BRAM_23_WIDTH,C_INPUT_BRAM_22_WIDTH,C_INPUT_BRAM_21_WIDTH,C_INPUT_BRAM_20_WIDTH,C_INPUT_BRAM_19_WIDTH,C_INPUT_BRAM_18_WIDTH,C_INPUT_BRAM_17_WIDTH,C_INPUT_BRAM_16_WIDTH,C_INPUT_BRAM_15_WIDTH,C_INPUT_BRAM_14_WIDTH,C_INPUT_BRAM_13_WIDTH,C_INPUT_BRAM_12_WIDTH,C_INPUT_BRAM_11_WIDTH,C_INPUT_BRAM_10_WIDTH,C_INPUT_BRAM_9_WIDTH,C_INPUT_BRAM_8_WIDTH,C_INPUT_BRAM_7_WIDTH,C_INPUT_BRAM_6_WIDTH,C_INPUT_BRAM_5_WIDTH,C_INPUT_BRAM_4_WIDTH,C_INPUT_BRAM_3_WIDTH,C_INPUT_BRAM_2_WIDTH,C_INPUT_BRAM_1_WIDTH,C_INPUT_BRAM_0_WIDTH};
    localparam [(C_MAX_INPUT_BRAMs*32)-1:0] C_DEPTH_BIT_ARRAY = {C_INPUT_BRAM_127_DEPTH,C_INPUT_BRAM_126_DEPTH,C_INPUT_BRAM_125_DEPTH,C_INPUT_BRAM_124_DEPTH,C_INPUT_BRAM_123_DEPTH,C_INPUT_BRAM_122_DEPTH,C_INPUT_BRAM_121_DEPTH,C_INPUT_BRAM_120_DEPTH,C_INPUT_BRAM_119_DEPTH,C_INPUT_BRAM_118_DEPTH,C_INPUT_BRAM_117_DEPTH,C_INPUT_BRAM_116_DEPTH,C_INPUT_BRAM_115_DEPTH,C_INPUT_BRAM_114_DEPTH,C_INPUT_BRAM_113_DEPTH,C_INPUT_BRAM_112_DEPTH,C_INPUT_BRAM_111_DEPTH,C_INPUT_BRAM_110_DEPTH,C_INPUT_BRAM_109_DEPTH,C_INPUT_BRAM_108_DEPTH,C_INPUT_BRAM_107_DEPTH,C_INPUT_BRAM_106_DEPTH,C_INPUT_BRAM_105_DEPTH,C_INPUT_BRAM_104_DEPTH,C_INPUT_BRAM_103_DEPTH,C_INPUT_BRAM_102_DEPTH,C_INPUT_BRAM_101_DEPTH,C_INPUT_BRAM_100_DEPTH,C_INPUT_BRAM_99_DEPTH,C_INPUT_BRAM_98_DEPTH,C_INPUT_BRAM_97_DEPTH,C_INPUT_BRAM_96_DEPTH,C_INPUT_BRAM_95_DEPTH,C_INPUT_BRAM_94_DEPTH,C_INPUT_BRAM_93_DEPTH,C_INPUT_BRAM_92_DEPTH,C_INPUT_BRAM_91_DEPTH,C_INPUT_BRAM_90_DEPTH,C_INPUT_BRAM_89_DEPTH,C_INPUT_BRAM_88_DEPTH,C_INPUT_BRAM_87_DEPTH,C_INPUT_BRAM_86_DEPTH,C_INPUT_BRAM_85_DEPTH,C_INPUT_BRAM_84_DEPTH,C_INPUT_BRAM_83_DEPTH,C_INPUT_BRAM_82_DEPTH,C_INPUT_BRAM_81_DEPTH,C_INPUT_BRAM_80_DEPTH,C_INPUT_BRAM_79_DEPTH,C_INPUT_BRAM_78_DEPTH,C_INPUT_BRAM_77_DEPTH,C_INPUT_BRAM_76_DEPTH,C_INPUT_BRAM_75_DEPTH,C_INPUT_BRAM_74_DEPTH,C_INPUT_BRAM_73_DEPTH,C_INPUT_BRAM_72_DEPTH,C_INPUT_BRAM_71_DEPTH,C_INPUT_BRAM_70_DEPTH,C_INPUT_BRAM_69_DEPTH,C_INPUT_BRAM_68_DEPTH,C_INPUT_BRAM_67_DEPTH,C_INPUT_BRAM_66_DEPTH,C_INPUT_BRAM_65_DEPTH,C_INPUT_BRAM_64_DEPTH,C_INPUT_BRAM_63_DEPTH,C_INPUT_BRAM_62_DEPTH,C_INPUT_BRAM_61_DEPTH,C_INPUT_BRAM_60_DEPTH,C_INPUT_BRAM_59_DEPTH,C_INPUT_BRAM_58_DEPTH,C_INPUT_BRAM_57_DEPTH,C_INPUT_BRAM_56_DEPTH,C_INPUT_BRAM_55_DEPTH,C_INPUT_BRAM_54_DEPTH,C_INPUT_BRAM_53_DEPTH,C_INPUT_BRAM_52_DEPTH,C_INPUT_BRAM_51_DEPTH,C_INPUT_BRAM_50_DEPTH,C_INPUT_BRAM_49_DEPTH,C_INPUT_BRAM_48_DEPTH,C_INPUT_BRAM_47_DEPTH,C_INPUT_BRAM_46_DEPTH,C_INPUT_BRAM_45_DEPTH,C_INPUT_BRAM_44_DEPTH,C_INPUT_BRAM_43_DEPTH,C_INPUT_BRAM_42_DEPTH,C_INPUT_BRAM_41_DEPTH,C_INPUT_BRAM_40_DEPTH,C_INPUT_BRAM_39_DEPTH,C_INPUT_BRAM_38_DEPTH,C_INPUT_BRAM_37_DEPTH,C_INPUT_BRAM_36_DEPTH,C_INPUT_BRAM_35_DEPTH,C_INPUT_BRAM_34_DEPTH,C_INPUT_BRAM_33_DEPTH,C_INPUT_BRAM_32_DEPTH,C_INPUT_BRAM_31_DEPTH,C_INPUT_BRAM_30_DEPTH,C_INPUT_BRAM_29_DEPTH,C_INPUT_BRAM_28_DEPTH,C_INPUT_BRAM_27_DEPTH,C_INPUT_BRAM_26_DEPTH,C_INPUT_BRAM_25_DEPTH,C_INPUT_BRAM_24_DEPTH,C_INPUT_BRAM_23_DEPTH,C_INPUT_BRAM_22_DEPTH,C_INPUT_BRAM_21_DEPTH,C_INPUT_BRAM_20_DEPTH,C_INPUT_BRAM_19_DEPTH,C_INPUT_BRAM_18_DEPTH,C_INPUT_BRAM_17_DEPTH,C_INPUT_BRAM_16_DEPTH,C_INPUT_BRAM_15_DEPTH,C_INPUT_BRAM_14_DEPTH,C_INPUT_BRAM_13_DEPTH,C_INPUT_BRAM_12_DEPTH,C_INPUT_BRAM_11_DEPTH,C_INPUT_BRAM_10_DEPTH,C_INPUT_BRAM_9_DEPTH,C_INPUT_BRAM_8_DEPTH,C_INPUT_BRAM_7_DEPTH,C_INPUT_BRAM_6_DEPTH,C_INPUT_BRAM_5_DEPTH,C_INPUT_BRAM_4_DEPTH,C_INPUT_BRAM_3_DEPTH,C_INPUT_BRAM_2_DEPTH,C_INPUT_BRAM_1_DEPTH,C_INPUT_BRAM_0_DEPTH};
    localparam [(C_MAX_INPUT_BRAMs*32)-1:0] C_DMWIDTH_BIT_ARRAY = {C_INPUT_BRAM_127_DMWIDTH,C_INPUT_BRAM_126_DMWIDTH,C_INPUT_BRAM_125_DMWIDTH,C_INPUT_BRAM_124_DMWIDTH,C_INPUT_BRAM_123_DMWIDTH,C_INPUT_BRAM_122_DMWIDTH,C_INPUT_BRAM_121_DMWIDTH,C_INPUT_BRAM_120_DMWIDTH,C_INPUT_BRAM_119_DMWIDTH,C_INPUT_BRAM_118_DMWIDTH,C_INPUT_BRAM_117_DMWIDTH,C_INPUT_BRAM_116_DMWIDTH,C_INPUT_BRAM_115_DMWIDTH,C_INPUT_BRAM_114_DMWIDTH,C_INPUT_BRAM_113_DMWIDTH,C_INPUT_BRAM_112_DMWIDTH,C_INPUT_BRAM_111_DMWIDTH,C_INPUT_BRAM_110_DMWIDTH,C_INPUT_BRAM_109_DMWIDTH,C_INPUT_BRAM_108_DMWIDTH,C_INPUT_BRAM_107_DMWIDTH,C_INPUT_BRAM_106_DMWIDTH,C_INPUT_BRAM_105_DMWIDTH,C_INPUT_BRAM_104_DMWIDTH,C_INPUT_BRAM_103_DMWIDTH,C_INPUT_BRAM_102_DMWIDTH,C_INPUT_BRAM_101_DMWIDTH,C_INPUT_BRAM_100_DMWIDTH,C_INPUT_BRAM_99_DMWIDTH,C_INPUT_BRAM_98_DMWIDTH,C_INPUT_BRAM_97_DMWIDTH,C_INPUT_BRAM_96_DMWIDTH,C_INPUT_BRAM_95_DMWIDTH,C_INPUT_BRAM_94_DMWIDTH,C_INPUT_BRAM_93_DMWIDTH,C_INPUT_BRAM_92_DMWIDTH,C_INPUT_BRAM_91_DMWIDTH,C_INPUT_BRAM_90_DMWIDTH,C_INPUT_BRAM_89_DMWIDTH,C_INPUT_BRAM_88_DMWIDTH,C_INPUT_BRAM_87_DMWIDTH,C_INPUT_BRAM_86_DMWIDTH,C_INPUT_BRAM_85_DMWIDTH,C_INPUT_BRAM_84_DMWIDTH,C_INPUT_BRAM_83_DMWIDTH,C_INPUT_BRAM_82_DMWIDTH,C_INPUT_BRAM_81_DMWIDTH,C_INPUT_BRAM_80_DMWIDTH,C_INPUT_BRAM_79_DMWIDTH,C_INPUT_BRAM_78_DMWIDTH,C_INPUT_BRAM_77_DMWIDTH,C_INPUT_BRAM_76_DMWIDTH,C_INPUT_BRAM_75_DMWIDTH,C_INPUT_BRAM_74_DMWIDTH,C_INPUT_BRAM_73_DMWIDTH,C_INPUT_BRAM_72_DMWIDTH,C_INPUT_BRAM_71_DMWIDTH,C_INPUT_BRAM_70_DMWIDTH,C_INPUT_BRAM_69_DMWIDTH,C_INPUT_BRAM_68_DMWIDTH,C_INPUT_BRAM_67_DMWIDTH,C_INPUT_BRAM_66_DMWIDTH,C_INPUT_BRAM_65_DMWIDTH,C_INPUT_BRAM_64_DMWIDTH,C_INPUT_BRAM_63_DMWIDTH,C_INPUT_BRAM_62_DMWIDTH,C_INPUT_BRAM_61_DMWIDTH,C_INPUT_BRAM_60_DMWIDTH,C_INPUT_BRAM_59_DMWIDTH,C_INPUT_BRAM_58_DMWIDTH,C_INPUT_BRAM_57_DMWIDTH,C_INPUT_BRAM_56_DMWIDTH,C_INPUT_BRAM_55_DMWIDTH,C_INPUT_BRAM_54_DMWIDTH,C_INPUT_BRAM_53_DMWIDTH,C_INPUT_BRAM_52_DMWIDTH,C_INPUT_BRAM_51_DMWIDTH,C_INPUT_BRAM_50_DMWIDTH,C_INPUT_BRAM_49_DMWIDTH,C_INPUT_BRAM_48_DMWIDTH,C_INPUT_BRAM_47_DMWIDTH,C_INPUT_BRAM_46_DMWIDTH,C_INPUT_BRAM_45_DMWIDTH,C_INPUT_BRAM_44_DMWIDTH,C_INPUT_BRAM_43_DMWIDTH,C_INPUT_BRAM_42_DMWIDTH,C_INPUT_BRAM_41_DMWIDTH,C_INPUT_BRAM_40_DMWIDTH,C_INPUT_BRAM_39_DMWIDTH,C_INPUT_BRAM_38_DMWIDTH,C_INPUT_BRAM_37_DMWIDTH,C_INPUT_BRAM_36_DMWIDTH,C_INPUT_BRAM_35_DMWIDTH,C_INPUT_BRAM_34_DMWIDTH,C_INPUT_BRAM_33_DMWIDTH,C_INPUT_BRAM_32_DMWIDTH,C_INPUT_BRAM_31_DMWIDTH,C_INPUT_BRAM_30_DMWIDTH,C_INPUT_BRAM_29_DMWIDTH,C_INPUT_BRAM_28_DMWIDTH,C_INPUT_BRAM_27_DMWIDTH,C_INPUT_BRAM_26_DMWIDTH,C_INPUT_BRAM_25_DMWIDTH,C_INPUT_BRAM_24_DMWIDTH,C_INPUT_BRAM_23_DMWIDTH,C_INPUT_BRAM_22_DMWIDTH,C_INPUT_BRAM_21_DMWIDTH,C_INPUT_BRAM_20_DMWIDTH,C_INPUT_BRAM_19_DMWIDTH,C_INPUT_BRAM_18_DMWIDTH,C_INPUT_BRAM_17_DMWIDTH,C_INPUT_BRAM_16_DMWIDTH,C_INPUT_BRAM_15_DMWIDTH,C_INPUT_BRAM_14_DMWIDTH,C_INPUT_BRAM_13_DMWIDTH,C_INPUT_BRAM_12_DMWIDTH,C_INPUT_BRAM_11_DMWIDTH,C_INPUT_BRAM_10_DMWIDTH,C_INPUT_BRAM_9_DMWIDTH,C_INPUT_BRAM_8_DMWIDTH,C_INPUT_BRAM_7_DMWIDTH,C_INPUT_BRAM_6_DMWIDTH,C_INPUT_BRAM_5_DMWIDTH,C_INPUT_BRAM_4_DMWIDTH,C_INPUT_BRAM_3_DMWIDTH,C_INPUT_BRAM_2_DMWIDTH,C_INPUT_BRAM_1_DMWIDTH,C_INPUT_BRAM_0_DMWIDTH};
    localparam [C_MAX_INPUT_BRAMs-1:0] C_INOUT_BIT_ARRAY = {C_BRAM_127_IS_INOUT,C_BRAM_126_IS_INOUT,C_BRAM_125_IS_INOUT,C_BRAM_124_IS_INOUT,C_BRAM_123_IS_INOUT,C_BRAM_122_IS_INOUT,C_BRAM_121_IS_INOUT,C_BRAM_120_IS_INOUT,C_BRAM_119_IS_INOUT,C_BRAM_118_IS_INOUT,C_BRAM_117_IS_INOUT,C_BRAM_116_IS_INOUT,C_BRAM_115_IS_INOUT,C_BRAM_114_IS_INOUT,C_BRAM_113_IS_INOUT,C_BRAM_112_IS_INOUT,C_BRAM_111_IS_INOUT,C_BRAM_110_IS_INOUT,C_BRAM_109_IS_INOUT,C_BRAM_108_IS_INOUT,C_BRAM_107_IS_INOUT,C_BRAM_106_IS_INOUT,C_BRAM_105_IS_INOUT,C_BRAM_104_IS_INOUT,C_BRAM_103_IS_INOUT,C_BRAM_102_IS_INOUT,C_BRAM_101_IS_INOUT,C_BRAM_100_IS_INOUT,C_BRAM_99_IS_INOUT,C_BRAM_98_IS_INOUT,C_BRAM_97_IS_INOUT,C_BRAM_96_IS_INOUT,C_BRAM_95_IS_INOUT,C_BRAM_94_IS_INOUT,C_BRAM_93_IS_INOUT,C_BRAM_92_IS_INOUT,C_BRAM_91_IS_INOUT,C_BRAM_90_IS_INOUT,C_BRAM_89_IS_INOUT,C_BRAM_88_IS_INOUT,C_BRAM_87_IS_INOUT,C_BRAM_86_IS_INOUT,C_BRAM_85_IS_INOUT,C_BRAM_84_IS_INOUT,C_BRAM_83_IS_INOUT,C_BRAM_82_IS_INOUT,C_BRAM_81_IS_INOUT,C_BRAM_80_IS_INOUT,C_BRAM_79_IS_INOUT,C_BRAM_78_IS_INOUT,C_BRAM_77_IS_INOUT,C_BRAM_76_IS_INOUT,C_BRAM_75_IS_INOUT,C_BRAM_74_IS_INOUT,C_BRAM_73_IS_INOUT,C_BRAM_72_IS_INOUT,C_BRAM_71_IS_INOUT,C_BRAM_70_IS_INOUT,C_BRAM_69_IS_INOUT,C_BRAM_68_IS_INOUT,C_BRAM_67_IS_INOUT,C_BRAM_66_IS_INOUT,C_BRAM_65_IS_INOUT,C_BRAM_64_IS_INOUT,C_BRAM_63_IS_INOUT,C_BRAM_62_IS_INOUT,C_BRAM_61_IS_INOUT,C_BRAM_60_IS_INOUT,C_BRAM_59_IS_INOUT,C_BRAM_58_IS_INOUT,C_BRAM_57_IS_INOUT,C_BRAM_56_IS_INOUT,C_BRAM_55_IS_INOUT,C_BRAM_54_IS_INOUT,C_BRAM_53_IS_INOUT,C_BRAM_52_IS_INOUT,C_BRAM_51_IS_INOUT,C_BRAM_50_IS_INOUT,C_BRAM_49_IS_INOUT,C_BRAM_48_IS_INOUT,C_BRAM_47_IS_INOUT,C_BRAM_46_IS_INOUT,C_BRAM_45_IS_INOUT,C_BRAM_44_IS_INOUT,C_BRAM_43_IS_INOUT,C_BRAM_42_IS_INOUT,C_BRAM_41_IS_INOUT,C_BRAM_40_IS_INOUT,C_BRAM_39_IS_INOUT,C_BRAM_38_IS_INOUT,C_BRAM_37_IS_INOUT,C_BRAM_36_IS_INOUT,C_BRAM_35_IS_INOUT,C_BRAM_34_IS_INOUT,C_BRAM_33_IS_INOUT,C_BRAM_32_IS_INOUT,C_BRAM_31_IS_INOUT,C_BRAM_30_IS_INOUT,C_BRAM_29_IS_INOUT,C_BRAM_28_IS_INOUT,C_BRAM_27_IS_INOUT,C_BRAM_26_IS_INOUT,C_BRAM_25_IS_INOUT,C_BRAM_24_IS_INOUT,C_BRAM_23_IS_INOUT,C_BRAM_22_IS_INOUT,C_BRAM_21_IS_INOUT,C_BRAM_20_IS_INOUT,C_BRAM_19_IS_INOUT,C_BRAM_18_IS_INOUT,C_BRAM_17_IS_INOUT,C_BRAM_16_IS_INOUT,C_BRAM_15_IS_INOUT,C_BRAM_14_IS_INOUT,C_BRAM_13_IS_INOUT,C_BRAM_12_IS_INOUT,C_BRAM_11_IS_INOUT,C_BRAM_10_IS_INOUT,C_BRAM_9_IS_INOUT,C_BRAM_8_IS_INOUT,C_BRAM_7_IS_INOUT,C_BRAM_6_IS_INOUT,C_BRAM_5_IS_INOUT,C_BRAM_4_IS_INOUT,C_BRAM_3_IS_INOUT,C_BRAM_2_IS_INOUT,C_BRAM_1_IS_INOUT,C_BRAM_0_IS_INOUT};
    localparam [C_MAX_INPUT_BRAMs*32-1:0] C_ADDR_BIT_ARRAY = {C_INPUT_BRAM_127_ADDR_WIDTH,C_INPUT_BRAM_126_ADDR_WIDTH,C_INPUT_BRAM_125_ADDR_WIDTH,C_INPUT_BRAM_124_ADDR_WIDTH,C_INPUT_BRAM_123_ADDR_WIDTH,C_INPUT_BRAM_122_ADDR_WIDTH,C_INPUT_BRAM_121_ADDR_WIDTH,C_INPUT_BRAM_120_ADDR_WIDTH,C_INPUT_BRAM_119_ADDR_WIDTH,C_INPUT_BRAM_118_ADDR_WIDTH,C_INPUT_BRAM_117_ADDR_WIDTH,C_INPUT_BRAM_116_ADDR_WIDTH,C_INPUT_BRAM_115_ADDR_WIDTH,C_INPUT_BRAM_114_ADDR_WIDTH,C_INPUT_BRAM_113_ADDR_WIDTH,C_INPUT_BRAM_112_ADDR_WIDTH,C_INPUT_BRAM_111_ADDR_WIDTH,C_INPUT_BRAM_110_ADDR_WIDTH,C_INPUT_BRAM_109_ADDR_WIDTH,C_INPUT_BRAM_108_ADDR_WIDTH,C_INPUT_BRAM_107_ADDR_WIDTH,C_INPUT_BRAM_106_ADDR_WIDTH,C_INPUT_BRAM_105_ADDR_WIDTH,C_INPUT_BRAM_104_ADDR_WIDTH,C_INPUT_BRAM_103_ADDR_WIDTH,C_INPUT_BRAM_102_ADDR_WIDTH,C_INPUT_BRAM_101_ADDR_WIDTH,C_INPUT_BRAM_100_ADDR_WIDTH,C_INPUT_BRAM_99_ADDR_WIDTH,C_INPUT_BRAM_98_ADDR_WIDTH,C_INPUT_BRAM_97_ADDR_WIDTH,C_INPUT_BRAM_96_ADDR_WIDTH,C_INPUT_BRAM_95_ADDR_WIDTH,C_INPUT_BRAM_94_ADDR_WIDTH,C_INPUT_BRAM_93_ADDR_WIDTH,C_INPUT_BRAM_92_ADDR_WIDTH,C_INPUT_BRAM_91_ADDR_WIDTH,C_INPUT_BRAM_90_ADDR_WIDTH,C_INPUT_BRAM_89_ADDR_WIDTH,C_INPUT_BRAM_88_ADDR_WIDTH,C_INPUT_BRAM_87_ADDR_WIDTH,C_INPUT_BRAM_86_ADDR_WIDTH,C_INPUT_BRAM_85_ADDR_WIDTH,C_INPUT_BRAM_84_ADDR_WIDTH,C_INPUT_BRAM_83_ADDR_WIDTH,C_INPUT_BRAM_82_ADDR_WIDTH,C_INPUT_BRAM_81_ADDR_WIDTH,C_INPUT_BRAM_80_ADDR_WIDTH,C_INPUT_BRAM_79_ADDR_WIDTH,C_INPUT_BRAM_78_ADDR_WIDTH,C_INPUT_BRAM_77_ADDR_WIDTH,C_INPUT_BRAM_76_ADDR_WIDTH,C_INPUT_BRAM_75_ADDR_WIDTH,C_INPUT_BRAM_74_ADDR_WIDTH,C_INPUT_BRAM_73_ADDR_WIDTH,C_INPUT_BRAM_72_ADDR_WIDTH,C_INPUT_BRAM_71_ADDR_WIDTH,C_INPUT_BRAM_70_ADDR_WIDTH,C_INPUT_BRAM_69_ADDR_WIDTH,C_INPUT_BRAM_68_ADDR_WIDTH,C_INPUT_BRAM_67_ADDR_WIDTH,C_INPUT_BRAM_66_ADDR_WIDTH,C_INPUT_BRAM_65_ADDR_WIDTH,C_INPUT_BRAM_64_ADDR_WIDTH,C_INPUT_BRAM_63_ADDR_WIDTH,C_INPUT_BRAM_62_ADDR_WIDTH,C_INPUT_BRAM_61_ADDR_WIDTH,C_INPUT_BRAM_60_ADDR_WIDTH,C_INPUT_BRAM_59_ADDR_WIDTH,C_INPUT_BRAM_58_ADDR_WIDTH,C_INPUT_BRAM_57_ADDR_WIDTH,C_INPUT_BRAM_56_ADDR_WIDTH,C_INPUT_BRAM_55_ADDR_WIDTH,C_INPUT_BRAM_54_ADDR_WIDTH,C_INPUT_BRAM_53_ADDR_WIDTH,C_INPUT_BRAM_52_ADDR_WIDTH,C_INPUT_BRAM_51_ADDR_WIDTH,C_INPUT_BRAM_50_ADDR_WIDTH,C_INPUT_BRAM_49_ADDR_WIDTH,C_INPUT_BRAM_48_ADDR_WIDTH,C_INPUT_BRAM_47_ADDR_WIDTH,C_INPUT_BRAM_46_ADDR_WIDTH,C_INPUT_BRAM_45_ADDR_WIDTH,C_INPUT_BRAM_44_ADDR_WIDTH,C_INPUT_BRAM_43_ADDR_WIDTH,C_INPUT_BRAM_42_ADDR_WIDTH,C_INPUT_BRAM_41_ADDR_WIDTH,C_INPUT_BRAM_40_ADDR_WIDTH,C_INPUT_BRAM_39_ADDR_WIDTH,C_INPUT_BRAM_38_ADDR_WIDTH,C_INPUT_BRAM_37_ADDR_WIDTH,C_INPUT_BRAM_36_ADDR_WIDTH,C_INPUT_BRAM_35_ADDR_WIDTH,C_INPUT_BRAM_34_ADDR_WIDTH,C_INPUT_BRAM_33_ADDR_WIDTH,C_INPUT_BRAM_32_ADDR_WIDTH,C_INPUT_BRAM_31_ADDR_WIDTH,C_INPUT_BRAM_30_ADDR_WIDTH,C_INPUT_BRAM_29_ADDR_WIDTH,C_INPUT_BRAM_28_ADDR_WIDTH,C_INPUT_BRAM_27_ADDR_WIDTH,C_INPUT_BRAM_26_ADDR_WIDTH,C_INPUT_BRAM_25_ADDR_WIDTH,C_INPUT_BRAM_24_ADDR_WIDTH,C_INPUT_BRAM_23_ADDR_WIDTH,C_INPUT_BRAM_22_ADDR_WIDTH,C_INPUT_BRAM_21_ADDR_WIDTH,C_INPUT_BRAM_20_ADDR_WIDTH,C_INPUT_BRAM_19_ADDR_WIDTH,C_INPUT_BRAM_18_ADDR_WIDTH,C_INPUT_BRAM_17_ADDR_WIDTH,C_INPUT_BRAM_16_ADDR_WIDTH,C_INPUT_BRAM_15_ADDR_WIDTH,C_INPUT_BRAM_14_ADDR_WIDTH,C_INPUT_BRAM_13_ADDR_WIDTH,C_INPUT_BRAM_12_ADDR_WIDTH,C_INPUT_BRAM_11_ADDR_WIDTH,C_INPUT_BRAM_10_ADDR_WIDTH,C_INPUT_BRAM_9_ADDR_WIDTH,C_INPUT_BRAM_8_ADDR_WIDTH,C_INPUT_BRAM_7_ADDR_WIDTH,C_INPUT_BRAM_6_ADDR_WIDTH,C_INPUT_BRAM_5_ADDR_WIDTH,C_INPUT_BRAM_4_ADDR_WIDTH,C_INPUT_BRAM_3_ADDR_WIDTH,C_INPUT_BRAM_2_ADDR_WIDTH,C_INPUT_BRAM_1_ADDR_WIDTH,C_INPUT_BRAM_0_ADDR_WIDTH};
    localparam [(C_MAX_INPUT_BRAMs*32)-1:0] C_MB_DEPTH_BIT_ARRAY = {C_INPUT_BRAM_127_MB_DEPTH,C_INPUT_BRAM_126_MB_DEPTH,C_INPUT_BRAM_125_MB_DEPTH,C_INPUT_BRAM_124_MB_DEPTH,C_INPUT_BRAM_123_MB_DEPTH,C_INPUT_BRAM_122_MB_DEPTH,C_INPUT_BRAM_121_MB_DEPTH,C_INPUT_BRAM_120_MB_DEPTH,C_INPUT_BRAM_119_MB_DEPTH,C_INPUT_BRAM_118_MB_DEPTH,C_INPUT_BRAM_117_MB_DEPTH,C_INPUT_BRAM_116_MB_DEPTH,C_INPUT_BRAM_115_MB_DEPTH,C_INPUT_BRAM_114_MB_DEPTH,C_INPUT_BRAM_113_MB_DEPTH,C_INPUT_BRAM_112_MB_DEPTH,C_INPUT_BRAM_111_MB_DEPTH,C_INPUT_BRAM_110_MB_DEPTH,C_INPUT_BRAM_109_MB_DEPTH,C_INPUT_BRAM_108_MB_DEPTH,C_INPUT_BRAM_107_MB_DEPTH,C_INPUT_BRAM_106_MB_DEPTH,C_INPUT_BRAM_105_MB_DEPTH,C_INPUT_BRAM_104_MB_DEPTH,C_INPUT_BRAM_103_MB_DEPTH,C_INPUT_BRAM_102_MB_DEPTH,C_INPUT_BRAM_101_MB_DEPTH,C_INPUT_BRAM_100_MB_DEPTH,C_INPUT_BRAM_99_MB_DEPTH,C_INPUT_BRAM_98_MB_DEPTH,C_INPUT_BRAM_97_MB_DEPTH,C_INPUT_BRAM_96_MB_DEPTH,C_INPUT_BRAM_95_MB_DEPTH,C_INPUT_BRAM_94_MB_DEPTH,C_INPUT_BRAM_93_MB_DEPTH,C_INPUT_BRAM_92_MB_DEPTH,C_INPUT_BRAM_91_MB_DEPTH,C_INPUT_BRAM_90_MB_DEPTH,C_INPUT_BRAM_89_MB_DEPTH,C_INPUT_BRAM_88_MB_DEPTH,C_INPUT_BRAM_87_MB_DEPTH,C_INPUT_BRAM_86_MB_DEPTH,C_INPUT_BRAM_85_MB_DEPTH,C_INPUT_BRAM_84_MB_DEPTH,C_INPUT_BRAM_83_MB_DEPTH,C_INPUT_BRAM_82_MB_DEPTH,C_INPUT_BRAM_81_MB_DEPTH,C_INPUT_BRAM_80_MB_DEPTH,C_INPUT_BRAM_79_MB_DEPTH,C_INPUT_BRAM_78_MB_DEPTH,C_INPUT_BRAM_77_MB_DEPTH,C_INPUT_BRAM_76_MB_DEPTH,C_INPUT_BRAM_75_MB_DEPTH,C_INPUT_BRAM_74_MB_DEPTH,C_INPUT_BRAM_73_MB_DEPTH,C_INPUT_BRAM_72_MB_DEPTH,C_INPUT_BRAM_71_MB_DEPTH,C_INPUT_BRAM_70_MB_DEPTH,C_INPUT_BRAM_69_MB_DEPTH,C_INPUT_BRAM_68_MB_DEPTH,C_INPUT_BRAM_67_MB_DEPTH,C_INPUT_BRAM_66_MB_DEPTH,C_INPUT_BRAM_65_MB_DEPTH,C_INPUT_BRAM_64_MB_DEPTH,C_INPUT_BRAM_63_MB_DEPTH,C_INPUT_BRAM_62_MB_DEPTH,C_INPUT_BRAM_61_MB_DEPTH,C_INPUT_BRAM_60_MB_DEPTH,C_INPUT_BRAM_59_MB_DEPTH,C_INPUT_BRAM_58_MB_DEPTH,C_INPUT_BRAM_57_MB_DEPTH,C_INPUT_BRAM_56_MB_DEPTH,C_INPUT_BRAM_55_MB_DEPTH,C_INPUT_BRAM_54_MB_DEPTH,C_INPUT_BRAM_53_MB_DEPTH,C_INPUT_BRAM_52_MB_DEPTH,C_INPUT_BRAM_51_MB_DEPTH,C_INPUT_BRAM_50_MB_DEPTH,C_INPUT_BRAM_49_MB_DEPTH,C_INPUT_BRAM_48_MB_DEPTH,C_INPUT_BRAM_47_MB_DEPTH,C_INPUT_BRAM_46_MB_DEPTH,C_INPUT_BRAM_45_MB_DEPTH,C_INPUT_BRAM_44_MB_DEPTH,C_INPUT_BRAM_43_MB_DEPTH,C_INPUT_BRAM_42_MB_DEPTH,C_INPUT_BRAM_41_MB_DEPTH,C_INPUT_BRAM_40_MB_DEPTH,C_INPUT_BRAM_39_MB_DEPTH,C_INPUT_BRAM_38_MB_DEPTH,C_INPUT_BRAM_37_MB_DEPTH,C_INPUT_BRAM_36_MB_DEPTH,C_INPUT_BRAM_35_MB_DEPTH,C_INPUT_BRAM_34_MB_DEPTH,C_INPUT_BRAM_33_MB_DEPTH,C_INPUT_BRAM_32_MB_DEPTH,C_INPUT_BRAM_31_MB_DEPTH,C_INPUT_BRAM_30_MB_DEPTH,C_INPUT_BRAM_29_MB_DEPTH,C_INPUT_BRAM_28_MB_DEPTH,C_INPUT_BRAM_27_MB_DEPTH,C_INPUT_BRAM_26_MB_DEPTH,C_INPUT_BRAM_25_MB_DEPTH,C_INPUT_BRAM_24_MB_DEPTH,C_INPUT_BRAM_23_MB_DEPTH,C_INPUT_BRAM_22_MB_DEPTH,C_INPUT_BRAM_21_MB_DEPTH,C_INPUT_BRAM_20_MB_DEPTH,C_INPUT_BRAM_19_MB_DEPTH,C_INPUT_BRAM_18_MB_DEPTH,C_INPUT_BRAM_17_MB_DEPTH,C_INPUT_BRAM_16_MB_DEPTH,C_INPUT_BRAM_15_MB_DEPTH,C_INPUT_BRAM_14_MB_DEPTH,C_INPUT_BRAM_13_MB_DEPTH,C_INPUT_BRAM_12_MB_DEPTH,C_INPUT_BRAM_11_MB_DEPTH,C_INPUT_BRAM_10_MB_DEPTH,C_INPUT_BRAM_9_MB_DEPTH,C_INPUT_BRAM_8_MB_DEPTH,C_INPUT_BRAM_7_MB_DEPTH,C_INPUT_BRAM_6_MB_DEPTH,C_INPUT_BRAM_5_MB_DEPTH,C_INPUT_BRAM_4_MB_DEPTH,C_INPUT_BRAM_3_MB_DEPTH,C_INPUT_BRAM_2_MB_DEPTH,C_INPUT_BRAM_1_MB_DEPTH,C_INPUT_BRAM_0_MB_DEPTH};
    localparam [(C_MAX_INPUT_BRAMs*32)-1:0] C_PORTS_BIT_ARRAY = {C_INPUT_BRAM_127_PORTS,C_INPUT_BRAM_126_PORTS,C_INPUT_BRAM_125_PORTS,C_INPUT_BRAM_124_PORTS,C_INPUT_BRAM_123_PORTS,C_INPUT_BRAM_122_PORTS,C_INPUT_BRAM_121_PORTS,C_INPUT_BRAM_120_PORTS,C_INPUT_BRAM_119_PORTS,C_INPUT_BRAM_118_PORTS,C_INPUT_BRAM_117_PORTS,C_INPUT_BRAM_116_PORTS,C_INPUT_BRAM_115_PORTS,C_INPUT_BRAM_114_PORTS,C_INPUT_BRAM_113_PORTS,C_INPUT_BRAM_112_PORTS,C_INPUT_BRAM_111_PORTS,C_INPUT_BRAM_110_PORTS,C_INPUT_BRAM_109_PORTS,C_INPUT_BRAM_108_PORTS,C_INPUT_BRAM_107_PORTS,C_INPUT_BRAM_106_PORTS,C_INPUT_BRAM_105_PORTS,C_INPUT_BRAM_104_PORTS,C_INPUT_BRAM_103_PORTS,C_INPUT_BRAM_102_PORTS,C_INPUT_BRAM_101_PORTS,C_INPUT_BRAM_100_PORTS,C_INPUT_BRAM_99_PORTS,C_INPUT_BRAM_98_PORTS,C_INPUT_BRAM_97_PORTS,C_INPUT_BRAM_96_PORTS,C_INPUT_BRAM_95_PORTS,C_INPUT_BRAM_94_PORTS,C_INPUT_BRAM_93_PORTS,C_INPUT_BRAM_92_PORTS,C_INPUT_BRAM_91_PORTS,C_INPUT_BRAM_90_PORTS,C_INPUT_BRAM_89_PORTS,C_INPUT_BRAM_88_PORTS,C_INPUT_BRAM_87_PORTS,C_INPUT_BRAM_86_PORTS,C_INPUT_BRAM_85_PORTS,C_INPUT_BRAM_84_PORTS,C_INPUT_BRAM_83_PORTS,C_INPUT_BRAM_82_PORTS,C_INPUT_BRAM_81_PORTS,C_INPUT_BRAM_80_PORTS,C_INPUT_BRAM_79_PORTS,C_INPUT_BRAM_78_PORTS,C_INPUT_BRAM_77_PORTS,C_INPUT_BRAM_76_PORTS,C_INPUT_BRAM_75_PORTS,C_INPUT_BRAM_74_PORTS,C_INPUT_BRAM_73_PORTS,C_INPUT_BRAM_72_PORTS,C_INPUT_BRAM_71_PORTS,C_INPUT_BRAM_70_PORTS,C_INPUT_BRAM_69_PORTS,C_INPUT_BRAM_68_PORTS,C_INPUT_BRAM_67_PORTS,C_INPUT_BRAM_66_PORTS,C_INPUT_BRAM_65_PORTS,C_INPUT_BRAM_64_PORTS,C_INPUT_BRAM_63_PORTS,C_INPUT_BRAM_62_PORTS,C_INPUT_BRAM_61_PORTS,C_INPUT_BRAM_60_PORTS,C_INPUT_BRAM_59_PORTS,C_INPUT_BRAM_58_PORTS,C_INPUT_BRAM_57_PORTS,C_INPUT_BRAM_56_PORTS,C_INPUT_BRAM_55_PORTS,C_INPUT_BRAM_54_PORTS,C_INPUT_BRAM_53_PORTS,C_INPUT_BRAM_52_PORTS,C_INPUT_BRAM_51_PORTS,C_INPUT_BRAM_50_PORTS,C_INPUT_BRAM_49_PORTS,C_INPUT_BRAM_48_PORTS,C_INPUT_BRAM_47_PORTS,C_INPUT_BRAM_46_PORTS,C_INPUT_BRAM_45_PORTS,C_INPUT_BRAM_44_PORTS,C_INPUT_BRAM_43_PORTS,C_INPUT_BRAM_42_PORTS,C_INPUT_BRAM_41_PORTS,C_INPUT_BRAM_40_PORTS,C_INPUT_BRAM_39_PORTS,C_INPUT_BRAM_38_PORTS,C_INPUT_BRAM_37_PORTS,C_INPUT_BRAM_36_PORTS,C_INPUT_BRAM_35_PORTS,C_INPUT_BRAM_34_PORTS,C_INPUT_BRAM_33_PORTS,C_INPUT_BRAM_32_PORTS,C_INPUT_BRAM_31_PORTS,C_INPUT_BRAM_30_PORTS,C_INPUT_BRAM_29_PORTS,C_INPUT_BRAM_28_PORTS,C_INPUT_BRAM_27_PORTS,C_INPUT_BRAM_26_PORTS,C_INPUT_BRAM_25_PORTS,C_INPUT_BRAM_24_PORTS,C_INPUT_BRAM_23_PORTS,C_INPUT_BRAM_22_PORTS,C_INPUT_BRAM_21_PORTS,C_INPUT_BRAM_20_PORTS,C_INPUT_BRAM_19_PORTS,C_INPUT_BRAM_18_PORTS,C_INPUT_BRAM_17_PORTS,C_INPUT_BRAM_16_PORTS,C_INPUT_BRAM_15_PORTS,C_INPUT_BRAM_14_PORTS,C_INPUT_BRAM_13_PORTS,C_INPUT_BRAM_12_PORTS,C_INPUT_BRAM_11_PORTS,C_INPUT_BRAM_10_PORTS,C_INPUT_BRAM_9_PORTS,C_INPUT_BRAM_8_PORTS,C_INPUT_BRAM_7_PORTS,C_INPUT_BRAM_6_PORTS,C_INPUT_BRAM_5_PORTS,C_INPUT_BRAM_4_PORTS,C_INPUT_BRAM_3_PORTS,C_INPUT_BRAM_2_PORTS,C_INPUT_BRAM_1_PORTS,C_INPUT_BRAM_0_PORTS};
    
    wire [C_NUM_INPUT_BRAMs-1:0] tlast;
    wire [C_NUM_INPUT_BRAMs-1:0] tvalid;
    wire [C_MAX_BIT_WIDTH/8-1:0] tkeep [C_NUM_INPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH/8-1:0] tstrb [C_NUM_INPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH-1:0]   tdata [C_NUM_INPUT_BRAMs-1:0];
    wire [C_NUM_INPUT_BRAMs-1:0] tready;
    
    wire [C_NUM_INPUT_BRAMs-1:0] dwconv0_tlast;
    wire [C_NUM_INPUT_BRAMs-1:0] dwconv0_tvalid;
    wire [C_MAX_BIT_WIDTH-1:0] dwconv0_tdata [C_NUM_INPUT_BRAMs-1:0];
    wire [C_NUM_INPUT_BRAMs-1:0] dwconv0_tready;
    
    wire [C_NUM_INPUT_BRAMs-1:0] dwconv1_tlast;
    wire [C_NUM_INPUT_BRAMs-1:0] dwconv1_tvalid;
    wire [C_MAX_BIT_WIDTH-1:0] dwconv1_tdata [C_NUM_INPUT_BRAMs-1:0];
    wire [C_NUM_INPUT_BRAMs-1:0] dwconv1_tready;
    wire [C_MAX_BIT_WIDTH/8-1:0] dwconv1_tkeep [C_NUM_INPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH/8-1:0] dwconv1_tstrb [C_NUM_INPUT_BRAMs-1:0];
    
    wire [C_NUM_INPUT_BRAMs-1:0] buf0_tlast;
    wire [C_NUM_INPUT_BRAMs-1:0] buf0_tvalid;
    wire [C_MAX_BIT_WIDTH-1:0] buf0_tdata [C_NUM_INPUT_BRAMs-1:0];
    wire [C_NUM_INPUT_BRAMs-1:0] buf0_tready;

    wire [C_NUM_INPUT_BRAMs-1:0] buf1_tlast;
    wire [C_NUM_INPUT_BRAMs-1:0] buf1_tvalid;
    wire [C_MAX_BIT_WIDTH-1:0] buf1_tdata [C_NUM_INPUT_BRAMs-1:0];
    wire [C_NUM_INPUT_BRAMs-1:0] buf1_tready;

    wire [C_NUM_INPUT_BRAMs-1:0] out_tlast;
    wire [C_NUM_INPUT_BRAMs-1:0] out_tvalid;
    wire [C_MAX_BIT_WIDTH-1:0] out_tdata [C_NUM_INPUT_BRAMs-1:0];
    wire [C_NUM_INPUT_BRAMs-1:0] out_tready;
    
    wire [C_MAX_BIT_WIDTH-1:0] addr0 [C_NUM_INPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH-1:0] addr1 [C_NUM_INPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH-1:0] din0 [C_NUM_INPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH-1:0] din1 [C_NUM_INPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH-1:0] dout0 [C_NUM_INPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH-1:0] dout1 [C_NUM_INPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH/8-1:0] we0 [C_NUM_INPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH/8-1:0] we1 [C_NUM_INPUT_BRAMs-1:0];
    wire [C_NUM_INPUT_BRAMs-1:0] en0;
    wire [C_NUM_INPUT_BRAMs-1:0] en1;
    
    //assign inputs to buses, and buses to outputs
    generate
        if(C_NUM_INPUT_BRAMs > 0) begin
            assign tlast[0] = s_axis_bram_0_tlast;
            assign tvalid[0] = s_axis_bram_0_tvalid;
            assign tkeep[0][C_INPUT_BRAM_0_DMWIDTH/8-1:0] = s_axis_bram_0_tkeep;
            assign tstrb[0][C_INPUT_BRAM_0_DMWIDTH/8-1:0] = s_axis_bram_0_tstrb;
            assign tdata[0][C_INPUT_BRAM_0_DMWIDTH-1:0] = s_axis_bram_0_tdata;
            assign s_axis_bram_0_tready = tready[0];
            
            assign addr0[0][C_INPUT_BRAM_0_ADDR_WIDTH-1:0] = ap_bram_0_addr0;
            assign din0[0][C_INPUT_BRAM_0_WIDTH-1:0] = ap_bram_0_din0;
            assign ap_bram_0_dout0 = dout0[0][C_INPUT_BRAM_0_WIDTH-1:0];
            assign we0[0][C_INPUT_BRAM_0_WIDTH/8-1:0] = ap_bram_0_we0;
            assign en0[0] = ap_bram_0_en0;
            assign addr1[0][C_INPUT_BRAM_0_ADDR_WIDTH-1:0] = ap_bram_0_addr1;
            assign din1[0][C_INPUT_BRAM_0_WIDTH-1:0] = ap_bram_0_din1;
            assign ap_bram_0_dout1 = dout1[0][C_INPUT_BRAM_0_WIDTH-1:0];
            assign we1[0][C_INPUT_BRAM_0_WIDTH/8-1:0] = ap_bram_0_we1;
            assign en1[0] = ap_bram_0_en1;
            
            assign dwconv1_tready[0] = m_axis_bram_0_tready;
            assign m_axis_bram_0_tlast = dwconv1_tlast[0];
            assign m_axis_bram_0_tvalid = dwconv1_tvalid[0];
            assign m_axis_bram_0_tkeep = dwconv1_tkeep[0][C_OUTPUT_BRAM_0_DMWIDTH/8-1:0];
            assign m_axis_bram_0_tstrb = dwconv1_tstrb[0][C_OUTPUT_BRAM_0_DMWIDTH/8-1:0];
            assign m_axis_bram_0_tdata = dwconv1_tdata[0][C_OUTPUT_BRAM_0_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 1) begin
            assign tlast[1] = s_axis_bram_1_tlast;
            assign tvalid[1] = s_axis_bram_1_tvalid;
            assign tkeep[1][C_INPUT_BRAM_1_DMWIDTH/8-1:0] = s_axis_bram_1_tkeep;
            assign tstrb[1][C_INPUT_BRAM_1_DMWIDTH/8-1:0] = s_axis_bram_1_tstrb;
            assign tdata[1][C_INPUT_BRAM_1_DMWIDTH-1:0] = s_axis_bram_1_tdata;
            assign s_axis_bram_1_tready = tready[1];
            
            assign addr0[1][C_INPUT_BRAM_1_ADDR_WIDTH-1:0] = ap_bram_1_addr0;
            assign din0[1][C_INPUT_BRAM_1_WIDTH-1:0] = ap_bram_1_din0;
            assign ap_bram_1_dout0 = dout0[1][C_INPUT_BRAM_1_WIDTH-1:0];
            assign we0[1][C_INPUT_BRAM_1_WIDTH/8-1:0] = ap_bram_1_we0;
            assign en0[1] = ap_bram_1_en0;
            assign addr1[1][C_INPUT_BRAM_1_ADDR_WIDTH-1:0] = ap_bram_1_addr1;
            assign din1[1][C_INPUT_BRAM_1_WIDTH-1:0] = ap_bram_1_din1;
            assign ap_bram_1_dout1 = dout1[1][C_INPUT_BRAM_1_WIDTH-1:0];
            assign we1[1][C_INPUT_BRAM_1_WIDTH/8-1:0] = ap_bram_1_we1;
            assign en1[1] = ap_bram_1_en1;
            
            assign dwconv1_tready[1] = m_axis_bram_1_tready;
            assign m_axis_bram_1_tlast = dwconv1_tlast[1];
            assign m_axis_bram_1_tvalid = dwconv1_tvalid[1];
            assign m_axis_bram_1_tkeep = dwconv1_tkeep[1][C_OUTPUT_BRAM_1_DMWIDTH/8-1:0];
            assign m_axis_bram_1_tstrb = dwconv1_tstrb[1][C_OUTPUT_BRAM_1_DMWIDTH/8-1:0];
            assign m_axis_bram_1_tdata = dwconv1_tdata[1][C_OUTPUT_BRAM_1_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 2) begin
            assign tlast[2] = s_axis_bram_2_tlast;
            assign tvalid[2] = s_axis_bram_2_tvalid;
            assign tkeep[2][C_INPUT_BRAM_2_DMWIDTH/8-1:0] = s_axis_bram_2_tkeep;
            assign tstrb[2][C_INPUT_BRAM_2_DMWIDTH/8-1:0] = s_axis_bram_2_tstrb;
            assign tdata[2][C_INPUT_BRAM_2_DMWIDTH-1:0] = s_axis_bram_2_tdata;
            assign s_axis_bram_2_tready = tready[2];
            
            assign addr0[2][C_INPUT_BRAM_2_ADDR_WIDTH-1:0] = ap_bram_2_addr0;
            assign din0[2][C_INPUT_BRAM_2_WIDTH-1:0] = ap_bram_2_din0;
            assign ap_bram_2_dout0 = dout0[2][C_INPUT_BRAM_2_WIDTH-1:0];
            assign we0[2][C_INPUT_BRAM_2_WIDTH/8-1:0] = ap_bram_2_we0;
            assign en0[2] = ap_bram_2_en0;
            assign addr1[2][C_INPUT_BRAM_2_ADDR_WIDTH-1:0] = ap_bram_2_addr1;
            assign din1[2][C_INPUT_BRAM_2_WIDTH-1:0] = ap_bram_2_din1;
            assign ap_bram_2_dout1 = dout1[2][C_INPUT_BRAM_2_WIDTH-1:0];
            assign we1[2][C_INPUT_BRAM_2_WIDTH/8-1:0] = ap_bram_2_we1;
            assign en1[2] = ap_bram_2_en1;
            
            assign dwconv1_tready[2] = m_axis_bram_2_tready;
            assign m_axis_bram_2_tlast = dwconv1_tlast[2];
            assign m_axis_bram_2_tvalid = dwconv1_tvalid[2];
            assign m_axis_bram_2_tkeep = dwconv1_tkeep[2][C_OUTPUT_BRAM_2_DMWIDTH/8-1:0];
            assign m_axis_bram_2_tstrb = dwconv1_tstrb[2][C_OUTPUT_BRAM_2_DMWIDTH/8-1:0];
            assign m_axis_bram_2_tdata = dwconv1_tdata[2][C_OUTPUT_BRAM_2_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 3) begin
            assign tlast[3] = s_axis_bram_3_tlast;
            assign tvalid[3] = s_axis_bram_3_tvalid;
            assign tkeep[3][C_INPUT_BRAM_3_DMWIDTH/8-1:0] = s_axis_bram_3_tkeep;
            assign tstrb[3][C_INPUT_BRAM_3_DMWIDTH/8-1:0] = s_axis_bram_3_tstrb;
            assign tdata[3][C_INPUT_BRAM_3_DMWIDTH-1:0] = s_axis_bram_3_tdata;
            assign s_axis_bram_3_tready = tready[3];
            
            assign addr0[3][C_INPUT_BRAM_3_ADDR_WIDTH-1:0] = ap_bram_3_addr0;
            assign din0[3][C_INPUT_BRAM_3_WIDTH-1:0] = ap_bram_3_din0;
            assign ap_bram_3_dout0 = dout0[3][C_INPUT_BRAM_3_WIDTH-1:0];
            assign we0[3][C_INPUT_BRAM_3_WIDTH/8-1:0] = ap_bram_3_we0;
            assign en0[3] = ap_bram_3_en0;
            assign addr1[3][C_INPUT_BRAM_3_ADDR_WIDTH-1:0] = ap_bram_3_addr1;
            assign din1[3][C_INPUT_BRAM_3_WIDTH-1:0] = ap_bram_3_din1;
            assign ap_bram_3_dout1 = dout1[3][C_INPUT_BRAM_3_WIDTH-1:0];
            assign we1[3][C_INPUT_BRAM_3_WIDTH/8-1:0] = ap_bram_3_we1;
            assign en1[3] = ap_bram_3_en1;
            
            assign dwconv1_tready[3] = m_axis_bram_3_tready;
            assign m_axis_bram_3_tlast = dwconv1_tlast[3];
            assign m_axis_bram_3_tvalid = dwconv1_tvalid[3];
            assign m_axis_bram_3_tkeep = dwconv1_tkeep[3][C_OUTPUT_BRAM_3_DMWIDTH/8-1:0];
            assign m_axis_bram_3_tstrb = dwconv1_tstrb[3][C_OUTPUT_BRAM_3_DMWIDTH/8-1:0];
            assign m_axis_bram_3_tdata = dwconv1_tdata[3][C_OUTPUT_BRAM_3_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 4) begin
            assign tlast[4] = s_axis_bram_4_tlast;
            assign tvalid[4] = s_axis_bram_4_tvalid;
            assign tkeep[4][C_INPUT_BRAM_4_DMWIDTH/8-1:0] = s_axis_bram_4_tkeep;
            assign tstrb[4][C_INPUT_BRAM_4_DMWIDTH/8-1:0] = s_axis_bram_4_tstrb;
            assign tdata[4][C_INPUT_BRAM_4_DMWIDTH-1:0] = s_axis_bram_4_tdata;
            assign s_axis_bram_4_tready = tready[4];
            
            assign addr0[4][C_INPUT_BRAM_4_ADDR_WIDTH-1:0] = ap_bram_4_addr0;
            assign din0[4][C_INPUT_BRAM_4_WIDTH-1:0] = ap_bram_4_din0;
            assign ap_bram_4_dout0 = dout0[4][C_INPUT_BRAM_4_WIDTH-1:0];
            assign we0[4][C_INPUT_BRAM_4_WIDTH/8-1:0] = ap_bram_4_we0;
            assign en0[4] = ap_bram_4_en0;
            assign addr1[4][C_INPUT_BRAM_4_ADDR_WIDTH-1:0] = ap_bram_4_addr1;
            assign din1[4][C_INPUT_BRAM_4_WIDTH-1:0] = ap_bram_4_din1;
            assign ap_bram_4_dout1 = dout1[4][C_INPUT_BRAM_4_WIDTH-1:0];
            assign we1[4][C_INPUT_BRAM_4_WIDTH/8-1:0] = ap_bram_4_we1;
            assign en1[4] = ap_bram_4_en1;
            
            assign dwconv1_tready[4] = m_axis_bram_4_tready;
            assign m_axis_bram_4_tlast = dwconv1_tlast[4];
            assign m_axis_bram_4_tvalid = dwconv1_tvalid[4];
            assign m_axis_bram_4_tkeep = dwconv1_tkeep[4][C_OUTPUT_BRAM_4_DMWIDTH/8-1:0];
            assign m_axis_bram_4_tstrb = dwconv1_tstrb[4][C_OUTPUT_BRAM_4_DMWIDTH/8-1:0];
            assign m_axis_bram_4_tdata = dwconv1_tdata[4][C_OUTPUT_BRAM_4_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 5) begin
            assign tlast[5] = s_axis_bram_5_tlast;
            assign tvalid[5] = s_axis_bram_5_tvalid;
            assign tkeep[5][C_INPUT_BRAM_5_DMWIDTH/8-1:0] = s_axis_bram_5_tkeep;
            assign tstrb[5][C_INPUT_BRAM_5_DMWIDTH/8-1:0] = s_axis_bram_5_tstrb;
            assign tdata[5][C_INPUT_BRAM_5_DMWIDTH-1:0] = s_axis_bram_5_tdata;
            assign s_axis_bram_5_tready = tready[5];
            
            assign addr0[5][C_INPUT_BRAM_5_ADDR_WIDTH-1:0] = ap_bram_5_addr0;
            assign din0[5][C_INPUT_BRAM_5_WIDTH-1:0] = ap_bram_5_din0;
            assign ap_bram_5_dout0 = dout0[5][C_INPUT_BRAM_5_WIDTH-1:0];
            assign we0[5][C_INPUT_BRAM_5_WIDTH/8-1:0] = ap_bram_5_we0;
            assign en0[5] = ap_bram_5_en0;
            assign addr1[5][C_INPUT_BRAM_5_ADDR_WIDTH-1:0] = ap_bram_5_addr1;
            assign din1[5][C_INPUT_BRAM_5_WIDTH-1:0] = ap_bram_5_din1;
            assign ap_bram_5_dout1 = dout1[5][C_INPUT_BRAM_5_WIDTH-1:0];
            assign we1[5][C_INPUT_BRAM_5_WIDTH/8-1:0] = ap_bram_5_we1;
            assign en1[5] = ap_bram_5_en1;
            
            assign dwconv1_tready[5] = m_axis_bram_5_tready;
            assign m_axis_bram_5_tlast = dwconv1_tlast[5];
            assign m_axis_bram_5_tvalid = dwconv1_tvalid[5];
            assign m_axis_bram_5_tkeep = dwconv1_tkeep[5][C_OUTPUT_BRAM_5_DMWIDTH/8-1:0];
            assign m_axis_bram_5_tstrb = dwconv1_tstrb[5][C_OUTPUT_BRAM_5_DMWIDTH/8-1:0];
            assign m_axis_bram_5_tdata = dwconv1_tdata[5][C_OUTPUT_BRAM_5_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 6) begin
            assign tlast[6] = s_axis_bram_6_tlast;
            assign tvalid[6] = s_axis_bram_6_tvalid;
            assign tkeep[6][C_INPUT_BRAM_6_DMWIDTH/8-1:0] = s_axis_bram_6_tkeep;
            assign tstrb[6][C_INPUT_BRAM_6_DMWIDTH/8-1:0] = s_axis_bram_6_tstrb;
            assign tdata[6][C_INPUT_BRAM_6_DMWIDTH-1:0] = s_axis_bram_6_tdata;
            assign s_axis_bram_6_tready = tready[6];
            
            assign addr0[6][C_INPUT_BRAM_6_ADDR_WIDTH-1:0] = ap_bram_6_addr0;
            assign din0[6][C_INPUT_BRAM_6_WIDTH-1:0] = ap_bram_6_din0;
            assign ap_bram_6_dout0 = dout0[6][C_INPUT_BRAM_6_WIDTH-1:0];
            assign we0[6][C_INPUT_BRAM_6_WIDTH/8-1:0] = ap_bram_6_we0;
            assign en0[6] = ap_bram_6_en0;
            assign addr1[6][C_INPUT_BRAM_6_ADDR_WIDTH-1:0] = ap_bram_6_addr1;
            assign din1[6][C_INPUT_BRAM_6_WIDTH-1:0] = ap_bram_6_din1;
            assign ap_bram_6_dout1 = dout1[6][C_INPUT_BRAM_6_WIDTH-1:0];
            assign we1[6][C_INPUT_BRAM_6_WIDTH/8-1:0] = ap_bram_6_we1;
            assign en1[6] = ap_bram_6_en1;
            
            assign dwconv1_tready[6] = m_axis_bram_6_tready;
            assign m_axis_bram_6_tlast = dwconv1_tlast[6];
            assign m_axis_bram_6_tvalid = dwconv1_tvalid[6];
            assign m_axis_bram_6_tkeep = dwconv1_tkeep[6][C_OUTPUT_BRAM_6_DMWIDTH/8-1:0];
            assign m_axis_bram_6_tstrb = dwconv1_tstrb[6][C_OUTPUT_BRAM_6_DMWIDTH/8-1:0];
            assign m_axis_bram_6_tdata = dwconv1_tdata[6][C_OUTPUT_BRAM_6_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 7) begin
            assign tlast[7] = s_axis_bram_7_tlast;
            assign tvalid[7] = s_axis_bram_7_tvalid;
            assign tkeep[7][C_INPUT_BRAM_7_DMWIDTH/8-1:0] = s_axis_bram_7_tkeep;
            assign tstrb[7][C_INPUT_BRAM_7_DMWIDTH/8-1:0] = s_axis_bram_7_tstrb;
            assign tdata[7][C_INPUT_BRAM_7_DMWIDTH-1:0] = s_axis_bram_7_tdata;
            assign s_axis_bram_7_tready = tready[7];
            
            assign addr0[7][C_INPUT_BRAM_7_ADDR_WIDTH-1:0] = ap_bram_7_addr0;
            assign din0[7][C_INPUT_BRAM_7_WIDTH-1:0] = ap_bram_7_din0;
            assign ap_bram_7_dout0 = dout0[7][C_INPUT_BRAM_7_WIDTH-1:0];
            assign we0[7][C_INPUT_BRAM_7_WIDTH/8-1:0] = ap_bram_7_we0;
            assign en0[7] = ap_bram_7_en0;
            assign addr1[7][C_INPUT_BRAM_7_ADDR_WIDTH-1:0] = ap_bram_7_addr1;
            assign din1[7][C_INPUT_BRAM_7_WIDTH-1:0] = ap_bram_7_din1;
            assign ap_bram_7_dout1 = dout1[7][C_INPUT_BRAM_7_WIDTH-1:0];
            assign we1[7][C_INPUT_BRAM_7_WIDTH/8-1:0] = ap_bram_7_we1;
            assign en1[7] = ap_bram_7_en1;
            
            assign dwconv1_tready[7] = m_axis_bram_7_tready;
            assign m_axis_bram_7_tlast = dwconv1_tlast[7];
            assign m_axis_bram_7_tvalid = dwconv1_tvalid[7];
            assign m_axis_bram_7_tkeep = dwconv1_tkeep[7][C_OUTPUT_BRAM_7_DMWIDTH/8-1:0];
            assign m_axis_bram_7_tstrb = dwconv1_tstrb[7][C_OUTPUT_BRAM_7_DMWIDTH/8-1:0];
            assign m_axis_bram_7_tdata = dwconv1_tdata[7][C_OUTPUT_BRAM_7_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 8) begin
            assign tlast[8] = s_axis_bram_8_tlast;
            assign tvalid[8] = s_axis_bram_8_tvalid;
            assign tkeep[8][C_INPUT_BRAM_8_DMWIDTH/8-1:0] = s_axis_bram_8_tkeep;
            assign tstrb[8][C_INPUT_BRAM_8_DMWIDTH/8-1:0] = s_axis_bram_8_tstrb;
            assign tdata[8][C_INPUT_BRAM_8_DMWIDTH-1:0] = s_axis_bram_8_tdata;
            assign s_axis_bram_8_tready = tready[8];
            
            assign addr0[8][C_INPUT_BRAM_8_ADDR_WIDTH-1:0] = ap_bram_8_addr0;
            assign din0[8][C_INPUT_BRAM_8_WIDTH-1:0] = ap_bram_8_din0;
            assign ap_bram_8_dout0 = dout0[8][C_INPUT_BRAM_8_WIDTH-1:0];
            assign we0[8][C_INPUT_BRAM_8_WIDTH/8-1:0] = ap_bram_8_we0;
            assign en0[8] = ap_bram_8_en0;
            assign addr1[8][C_INPUT_BRAM_8_ADDR_WIDTH-1:0] = ap_bram_8_addr1;
            assign din1[8][C_INPUT_BRAM_8_WIDTH-1:0] = ap_bram_8_din1;
            assign ap_bram_8_dout1 = dout1[8][C_INPUT_BRAM_8_WIDTH-1:0];
            assign we1[8][C_INPUT_BRAM_8_WIDTH/8-1:0] = ap_bram_8_we1;
            assign en1[8] = ap_bram_8_en1;
            
            assign dwconv1_tready[8] = m_axis_bram_8_tready;
            assign m_axis_bram_8_tlast = dwconv1_tlast[8];
            assign m_axis_bram_8_tvalid = dwconv1_tvalid[8];
            assign m_axis_bram_8_tkeep = dwconv1_tkeep[8][C_OUTPUT_BRAM_8_DMWIDTH/8-1:0];
            assign m_axis_bram_8_tstrb = dwconv1_tstrb[8][C_OUTPUT_BRAM_8_DMWIDTH/8-1:0];
            assign m_axis_bram_8_tdata = dwconv1_tdata[8][C_OUTPUT_BRAM_8_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 9) begin
            assign tlast[9] = s_axis_bram_9_tlast;
            assign tvalid[9] = s_axis_bram_9_tvalid;
            assign tkeep[9][C_INPUT_BRAM_9_DMWIDTH/8-1:0] = s_axis_bram_9_tkeep;
            assign tstrb[9][C_INPUT_BRAM_9_DMWIDTH/8-1:0] = s_axis_bram_9_tstrb;
            assign tdata[9][C_INPUT_BRAM_9_DMWIDTH-1:0] = s_axis_bram_9_tdata;
            assign s_axis_bram_9_tready = tready[9];
            
            assign addr0[9][C_INPUT_BRAM_9_ADDR_WIDTH-1:0] = ap_bram_9_addr0;
            assign din0[9][C_INPUT_BRAM_9_WIDTH-1:0] = ap_bram_9_din0;
            assign ap_bram_9_dout0 = dout0[9][C_INPUT_BRAM_9_WIDTH-1:0];
            assign we0[9][C_INPUT_BRAM_9_WIDTH/8-1:0] = ap_bram_9_we0;
            assign en0[9] = ap_bram_9_en0;
            assign addr1[9][C_INPUT_BRAM_9_ADDR_WIDTH-1:0] = ap_bram_9_addr1;
            assign din1[9][C_INPUT_BRAM_9_WIDTH-1:0] = ap_bram_9_din1;
            assign ap_bram_9_dout1 = dout1[9][C_INPUT_BRAM_9_WIDTH-1:0];
            assign we1[9][C_INPUT_BRAM_9_WIDTH/8-1:0] = ap_bram_9_we1;
            assign en1[9] = ap_bram_9_en1;
            
            assign dwconv1_tready[9] = m_axis_bram_9_tready;
            assign m_axis_bram_9_tlast = dwconv1_tlast[9];
            assign m_axis_bram_9_tvalid = dwconv1_tvalid[9];
            assign m_axis_bram_9_tkeep = dwconv1_tkeep[9][C_OUTPUT_BRAM_9_DMWIDTH/8-1:0];
            assign m_axis_bram_9_tstrb = dwconv1_tstrb[9][C_OUTPUT_BRAM_9_DMWIDTH/8-1:0];
            assign m_axis_bram_9_tdata = dwconv1_tdata[9][C_OUTPUT_BRAM_9_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 10) begin
            assign tlast[10] = s_axis_bram_10_tlast;
            assign tvalid[10] = s_axis_bram_10_tvalid;
            assign tkeep[10][C_INPUT_BRAM_10_DMWIDTH/8-1:0] = s_axis_bram_10_tkeep;
            assign tstrb[10][C_INPUT_BRAM_10_DMWIDTH/8-1:0] = s_axis_bram_10_tstrb;
            assign tdata[10][C_INPUT_BRAM_10_DMWIDTH-1:0] = s_axis_bram_10_tdata;
            assign s_axis_bram_10_tready = tready[10];
            
            assign addr0[10][C_INPUT_BRAM_10_ADDR_WIDTH-1:0] = ap_bram_10_addr0;
            assign din0[10][C_INPUT_BRAM_10_WIDTH-1:0] = ap_bram_10_din0;
            assign ap_bram_10_dout0 = dout0[10][C_INPUT_BRAM_10_WIDTH-1:0];
            assign we0[10][C_INPUT_BRAM_10_WIDTH/8-1:0] = ap_bram_10_we0;
            assign en0[10] = ap_bram_10_en0;
            assign addr1[10][C_INPUT_BRAM_10_ADDR_WIDTH-1:0] = ap_bram_10_addr1;
            assign din1[10][C_INPUT_BRAM_10_WIDTH-1:0] = ap_bram_10_din1;
            assign ap_bram_10_dout1 = dout1[10][C_INPUT_BRAM_10_WIDTH-1:0];
            assign we1[10][C_INPUT_BRAM_10_WIDTH/8-1:0] = ap_bram_10_we1;
            assign en1[10] = ap_bram_10_en1;
            
            assign dwconv1_tready[10] = m_axis_bram_10_tready;
            assign m_axis_bram_10_tlast = dwconv1_tlast[10];
            assign m_axis_bram_10_tvalid = dwconv1_tvalid[10];
            assign m_axis_bram_10_tkeep = dwconv1_tkeep[10][C_OUTPUT_BRAM_10_DMWIDTH/8-1:0];
            assign m_axis_bram_10_tstrb = dwconv1_tstrb[10][C_OUTPUT_BRAM_10_DMWIDTH/8-1:0];
            assign m_axis_bram_10_tdata = dwconv1_tdata[10][C_OUTPUT_BRAM_10_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 11) begin
            assign tlast[11] = s_axis_bram_11_tlast;
            assign tvalid[11] = s_axis_bram_11_tvalid;
            assign tkeep[11][C_INPUT_BRAM_11_DMWIDTH/8-1:0] = s_axis_bram_11_tkeep;
            assign tstrb[11][C_INPUT_BRAM_11_DMWIDTH/8-1:0] = s_axis_bram_11_tstrb;
            assign tdata[11][C_INPUT_BRAM_11_DMWIDTH-1:0] = s_axis_bram_11_tdata;
            assign s_axis_bram_11_tready = tready[11];
            
            assign addr0[11][C_INPUT_BRAM_11_ADDR_WIDTH-1:0] = ap_bram_11_addr0;
            assign din0[11][C_INPUT_BRAM_11_WIDTH-1:0] = ap_bram_11_din0;
            assign ap_bram_11_dout0 = dout0[11][C_INPUT_BRAM_11_WIDTH-1:0];
            assign we0[11][C_INPUT_BRAM_11_WIDTH/8-1:0] = ap_bram_11_we0;
            assign en0[11] = ap_bram_11_en0;
            assign addr1[11][C_INPUT_BRAM_11_ADDR_WIDTH-1:0] = ap_bram_11_addr1;
            assign din1[11][C_INPUT_BRAM_11_WIDTH-1:0] = ap_bram_11_din1;
            assign ap_bram_11_dout1 = dout1[11][C_INPUT_BRAM_11_WIDTH-1:0];
            assign we1[11][C_INPUT_BRAM_11_WIDTH/8-1:0] = ap_bram_11_we1;
            assign en1[11] = ap_bram_11_en1;
            
            assign dwconv1_tready[11] = m_axis_bram_11_tready;
            assign m_axis_bram_11_tlast = dwconv1_tlast[11];
            assign m_axis_bram_11_tvalid = dwconv1_tvalid[11];
            assign m_axis_bram_11_tkeep = dwconv1_tkeep[11][C_OUTPUT_BRAM_11_DMWIDTH/8-1:0];
            assign m_axis_bram_11_tstrb = dwconv1_tstrb[11][C_OUTPUT_BRAM_11_DMWIDTH/8-1:0];
            assign m_axis_bram_11_tdata = dwconv1_tdata[11][C_OUTPUT_BRAM_11_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 12) begin
            assign tlast[12] = s_axis_bram_12_tlast;
            assign tvalid[12] = s_axis_bram_12_tvalid;
            assign tkeep[12][C_INPUT_BRAM_12_DMWIDTH/8-1:0] = s_axis_bram_12_tkeep;
            assign tstrb[12][C_INPUT_BRAM_12_DMWIDTH/8-1:0] = s_axis_bram_12_tstrb;
            assign tdata[12][C_INPUT_BRAM_12_DMWIDTH-1:0] = s_axis_bram_12_tdata;
            assign s_axis_bram_12_tready = tready[12];
            
            assign addr0[12][C_INPUT_BRAM_12_ADDR_WIDTH-1:0] = ap_bram_12_addr0;
            assign din0[12][C_INPUT_BRAM_12_WIDTH-1:0] = ap_bram_12_din0;
            assign ap_bram_12_dout0 = dout0[12][C_INPUT_BRAM_12_WIDTH-1:0];
            assign we0[12][C_INPUT_BRAM_12_WIDTH/8-1:0] = ap_bram_12_we0;
            assign en0[12] = ap_bram_12_en0;
            assign addr1[12][C_INPUT_BRAM_12_ADDR_WIDTH-1:0] = ap_bram_12_addr1;
            assign din1[12][C_INPUT_BRAM_12_WIDTH-1:0] = ap_bram_12_din1;
            assign ap_bram_12_dout1 = dout1[12][C_INPUT_BRAM_12_WIDTH-1:0];
            assign we1[12][C_INPUT_BRAM_12_WIDTH/8-1:0] = ap_bram_12_we1;
            assign en1[12] = ap_bram_12_en1;
            
            assign dwconv1_tready[12] = m_axis_bram_12_tready;
            assign m_axis_bram_12_tlast = dwconv1_tlast[12];
            assign m_axis_bram_12_tvalid = dwconv1_tvalid[12];
            assign m_axis_bram_12_tkeep = dwconv1_tkeep[12][C_OUTPUT_BRAM_12_DMWIDTH/8-1:0];
            assign m_axis_bram_12_tstrb = dwconv1_tstrb[12][C_OUTPUT_BRAM_12_DMWIDTH/8-1:0];
            assign m_axis_bram_12_tdata = dwconv1_tdata[12][C_OUTPUT_BRAM_12_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 13) begin
            assign tlast[13] = s_axis_bram_13_tlast;
            assign tvalid[13] = s_axis_bram_13_tvalid;
            assign tkeep[13][C_INPUT_BRAM_13_DMWIDTH/8-1:0] = s_axis_bram_13_tkeep;
            assign tstrb[13][C_INPUT_BRAM_13_DMWIDTH/8-1:0] = s_axis_bram_13_tstrb;
            assign tdata[13][C_INPUT_BRAM_13_DMWIDTH-1:0] = s_axis_bram_13_tdata;
            assign s_axis_bram_13_tready = tready[13];
            
            assign addr0[13][C_INPUT_BRAM_13_ADDR_WIDTH-1:0] = ap_bram_13_addr0;
            assign din0[13][C_INPUT_BRAM_13_WIDTH-1:0] = ap_bram_13_din0;
            assign ap_bram_13_dout0 = dout0[13][C_INPUT_BRAM_13_WIDTH-1:0];
            assign we0[13][C_INPUT_BRAM_13_WIDTH/8-1:0] = ap_bram_13_we0;
            assign en0[13] = ap_bram_13_en0;
            assign addr1[13][C_INPUT_BRAM_13_ADDR_WIDTH-1:0] = ap_bram_13_addr1;
            assign din1[13][C_INPUT_BRAM_13_WIDTH-1:0] = ap_bram_13_din1;
            assign ap_bram_13_dout1 = dout1[13][C_INPUT_BRAM_13_WIDTH-1:0];
            assign we1[13][C_INPUT_BRAM_13_WIDTH/8-1:0] = ap_bram_13_we1;
            assign en1[13] = ap_bram_13_en1;
            
            assign dwconv1_tready[13] = m_axis_bram_13_tready;
            assign m_axis_bram_13_tlast = dwconv1_tlast[13];
            assign m_axis_bram_13_tvalid = dwconv1_tvalid[13];
            assign m_axis_bram_13_tkeep = dwconv1_tkeep[13][C_OUTPUT_BRAM_13_DMWIDTH/8-1:0];
            assign m_axis_bram_13_tstrb = dwconv1_tstrb[13][C_OUTPUT_BRAM_13_DMWIDTH/8-1:0];
            assign m_axis_bram_13_tdata = dwconv1_tdata[13][C_OUTPUT_BRAM_13_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 14) begin
            assign tlast[14] = s_axis_bram_14_tlast;
            assign tvalid[14] = s_axis_bram_14_tvalid;
            assign tkeep[14][C_INPUT_BRAM_14_DMWIDTH/8-1:0] = s_axis_bram_14_tkeep;
            assign tstrb[14][C_INPUT_BRAM_14_DMWIDTH/8-1:0] = s_axis_bram_14_tstrb;
            assign tdata[14][C_INPUT_BRAM_14_DMWIDTH-1:0] = s_axis_bram_14_tdata;
            assign s_axis_bram_14_tready = tready[14];
            
            assign addr0[14][C_INPUT_BRAM_14_ADDR_WIDTH-1:0] = ap_bram_14_addr0;
            assign din0[14][C_INPUT_BRAM_14_WIDTH-1:0] = ap_bram_14_din0;
            assign ap_bram_14_dout0 = dout0[14][C_INPUT_BRAM_14_WIDTH-1:0];
            assign we0[14][C_INPUT_BRAM_14_WIDTH/8-1:0] = ap_bram_14_we0;
            assign en0[14] = ap_bram_14_en0;
            assign addr1[14][C_INPUT_BRAM_14_ADDR_WIDTH-1:0] = ap_bram_14_addr1;
            assign din1[14][C_INPUT_BRAM_14_WIDTH-1:0] = ap_bram_14_din1;
            assign ap_bram_14_dout1 = dout1[14][C_INPUT_BRAM_14_WIDTH-1:0];
            assign we1[14][C_INPUT_BRAM_14_WIDTH/8-1:0] = ap_bram_14_we1;
            assign en1[14] = ap_bram_14_en1;
            
            assign dwconv1_tready[14] = m_axis_bram_14_tready;
            assign m_axis_bram_14_tlast = dwconv1_tlast[14];
            assign m_axis_bram_14_tvalid = dwconv1_tvalid[14];
            assign m_axis_bram_14_tkeep = dwconv1_tkeep[14][C_OUTPUT_BRAM_14_DMWIDTH/8-1:0];
            assign m_axis_bram_14_tstrb = dwconv1_tstrb[14][C_OUTPUT_BRAM_14_DMWIDTH/8-1:0];
            assign m_axis_bram_14_tdata = dwconv1_tdata[14][C_OUTPUT_BRAM_14_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 15) begin
            assign tlast[15] = s_axis_bram_15_tlast;
            assign tvalid[15] = s_axis_bram_15_tvalid;
            assign tkeep[15][C_INPUT_BRAM_15_DMWIDTH/8-1:0] = s_axis_bram_15_tkeep;
            assign tstrb[15][C_INPUT_BRAM_15_DMWIDTH/8-1:0] = s_axis_bram_15_tstrb;
            assign tdata[15][C_INPUT_BRAM_15_DMWIDTH-1:0] = s_axis_bram_15_tdata;
            assign s_axis_bram_15_tready = tready[15];
            
            assign addr0[15][C_INPUT_BRAM_15_ADDR_WIDTH-1:0] = ap_bram_15_addr0;
            assign din0[15][C_INPUT_BRAM_15_WIDTH-1:0] = ap_bram_15_din0;
            assign ap_bram_15_dout0 = dout0[15][C_INPUT_BRAM_15_WIDTH-1:0];
            assign we0[15][C_INPUT_BRAM_15_WIDTH/8-1:0] = ap_bram_15_we0;
            assign en0[15] = ap_bram_15_en0;
            assign addr1[15][C_INPUT_BRAM_15_ADDR_WIDTH-1:0] = ap_bram_15_addr1;
            assign din1[15][C_INPUT_BRAM_15_WIDTH-1:0] = ap_bram_15_din1;
            assign ap_bram_15_dout1 = dout1[15][C_INPUT_BRAM_15_WIDTH-1:0];
            assign we1[15][C_INPUT_BRAM_15_WIDTH/8-1:0] = ap_bram_15_we1;
            assign en1[15] = ap_bram_15_en1;
            
            assign dwconv1_tready[15] = m_axis_bram_15_tready;
            assign m_axis_bram_15_tlast = dwconv1_tlast[15];
            assign m_axis_bram_15_tvalid = dwconv1_tvalid[15];
            assign m_axis_bram_15_tkeep = dwconv1_tkeep[15][C_OUTPUT_BRAM_15_DMWIDTH/8-1:0];
            assign m_axis_bram_15_tstrb = dwconv1_tstrb[15][C_OUTPUT_BRAM_15_DMWIDTH/8-1:0];
            assign m_axis_bram_15_tdata = dwconv1_tdata[15][C_OUTPUT_BRAM_15_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 16) begin
            assign tlast[16] = s_axis_bram_16_tlast;
            assign tvalid[16] = s_axis_bram_16_tvalid;
            assign tkeep[16][C_INPUT_BRAM_16_DMWIDTH/8-1:0] = s_axis_bram_16_tkeep;
            assign tstrb[16][C_INPUT_BRAM_16_DMWIDTH/8-1:0] = s_axis_bram_16_tstrb;
            assign tdata[16][C_INPUT_BRAM_16_DMWIDTH-1:0] = s_axis_bram_16_tdata;
            assign s_axis_bram_16_tready = tready[16];
            
            assign addr0[16][C_INPUT_BRAM_16_ADDR_WIDTH-1:0] = ap_bram_16_addr0;
            assign din0[16][C_INPUT_BRAM_16_WIDTH-1:0] = ap_bram_16_din0;
            assign ap_bram_16_dout0 = dout0[16][C_INPUT_BRAM_16_WIDTH-1:0];
            assign we0[16][C_INPUT_BRAM_16_WIDTH/8-1:0] = ap_bram_16_we0;
            assign en0[16] = ap_bram_16_en0;
            assign addr1[16][C_INPUT_BRAM_16_ADDR_WIDTH-1:0] = ap_bram_16_addr1;
            assign din1[16][C_INPUT_BRAM_16_WIDTH-1:0] = ap_bram_16_din1;
            assign ap_bram_16_dout1 = dout1[16][C_INPUT_BRAM_16_WIDTH-1:0];
            assign we1[16][C_INPUT_BRAM_16_WIDTH/8-1:0] = ap_bram_16_we1;
            assign en1[16] = ap_bram_16_en1;
            
            assign dwconv1_tready[16] = m_axis_bram_16_tready;
            assign m_axis_bram_16_tlast = dwconv1_tlast[16];
            assign m_axis_bram_16_tvalid = dwconv1_tvalid[16];
            assign m_axis_bram_16_tkeep = dwconv1_tkeep[16][C_OUTPUT_BRAM_16_DMWIDTH/8-1:0];
            assign m_axis_bram_16_tstrb = dwconv1_tstrb[16][C_OUTPUT_BRAM_16_DMWIDTH/8-1:0];
            assign m_axis_bram_16_tdata = dwconv1_tdata[16][C_OUTPUT_BRAM_16_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 17) begin
            assign tlast[17] = s_axis_bram_17_tlast;
            assign tvalid[17] = s_axis_bram_17_tvalid;
            assign tkeep[17][C_INPUT_BRAM_17_DMWIDTH/8-1:0] = s_axis_bram_17_tkeep;
            assign tstrb[17][C_INPUT_BRAM_17_DMWIDTH/8-1:0] = s_axis_bram_17_tstrb;
            assign tdata[17][C_INPUT_BRAM_17_DMWIDTH-1:0] = s_axis_bram_17_tdata;
            assign s_axis_bram_17_tready = tready[17];
            
            assign addr0[17][C_INPUT_BRAM_17_ADDR_WIDTH-1:0] = ap_bram_17_addr0;
            assign din0[17][C_INPUT_BRAM_17_WIDTH-1:0] = ap_bram_17_din0;
            assign ap_bram_17_dout0 = dout0[17][C_INPUT_BRAM_17_WIDTH-1:0];
            assign we0[17][C_INPUT_BRAM_17_WIDTH/8-1:0] = ap_bram_17_we0;
            assign en0[17] = ap_bram_17_en0;
            assign addr1[17][C_INPUT_BRAM_17_ADDR_WIDTH-1:0] = ap_bram_17_addr1;
            assign din1[17][C_INPUT_BRAM_17_WIDTH-1:0] = ap_bram_17_din1;
            assign ap_bram_17_dout1 = dout1[17][C_INPUT_BRAM_17_WIDTH-1:0];
            assign we1[17][C_INPUT_BRAM_17_WIDTH/8-1:0] = ap_bram_17_we1;
            assign en1[17] = ap_bram_17_en1;
            
            assign dwconv1_tready[17] = m_axis_bram_17_tready;
            assign m_axis_bram_17_tlast = dwconv1_tlast[17];
            assign m_axis_bram_17_tvalid = dwconv1_tvalid[17];
            assign m_axis_bram_17_tkeep = dwconv1_tkeep[17][C_OUTPUT_BRAM_17_DMWIDTH/8-1:0];
            assign m_axis_bram_17_tstrb = dwconv1_tstrb[17][C_OUTPUT_BRAM_17_DMWIDTH/8-1:0];
            assign m_axis_bram_17_tdata = dwconv1_tdata[17][C_OUTPUT_BRAM_17_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 18) begin
            assign tlast[18] = s_axis_bram_18_tlast;
            assign tvalid[18] = s_axis_bram_18_tvalid;
            assign tkeep[18][C_INPUT_BRAM_18_DMWIDTH/8-1:0] = s_axis_bram_18_tkeep;
            assign tstrb[18][C_INPUT_BRAM_18_DMWIDTH/8-1:0] = s_axis_bram_18_tstrb;
            assign tdata[18][C_INPUT_BRAM_18_DMWIDTH-1:0] = s_axis_bram_18_tdata;
            assign s_axis_bram_18_tready = tready[18];
            
            assign addr0[18][C_INPUT_BRAM_18_ADDR_WIDTH-1:0] = ap_bram_18_addr0;
            assign din0[18][C_INPUT_BRAM_18_WIDTH-1:0] = ap_bram_18_din0;
            assign ap_bram_18_dout0 = dout0[18][C_INPUT_BRAM_18_WIDTH-1:0];
            assign we0[18][C_INPUT_BRAM_18_WIDTH/8-1:0] = ap_bram_18_we0;
            assign en0[18] = ap_bram_18_en0;
            assign addr1[18][C_INPUT_BRAM_18_ADDR_WIDTH-1:0] = ap_bram_18_addr1;
            assign din1[18][C_INPUT_BRAM_18_WIDTH-1:0] = ap_bram_18_din1;
            assign ap_bram_18_dout1 = dout1[18][C_INPUT_BRAM_18_WIDTH-1:0];
            assign we1[18][C_INPUT_BRAM_18_WIDTH/8-1:0] = ap_bram_18_we1;
            assign en1[18] = ap_bram_18_en1;
            
            assign dwconv1_tready[18] = m_axis_bram_18_tready;
            assign m_axis_bram_18_tlast = dwconv1_tlast[18];
            assign m_axis_bram_18_tvalid = dwconv1_tvalid[18];
            assign m_axis_bram_18_tkeep = dwconv1_tkeep[18][C_OUTPUT_BRAM_18_DMWIDTH/8-1:0];
            assign m_axis_bram_18_tstrb = dwconv1_tstrb[18][C_OUTPUT_BRAM_18_DMWIDTH/8-1:0];
            assign m_axis_bram_18_tdata = dwconv1_tdata[18][C_OUTPUT_BRAM_18_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 19) begin
            assign tlast[19] = s_axis_bram_19_tlast;
            assign tvalid[19] = s_axis_bram_19_tvalid;
            assign tkeep[19][C_INPUT_BRAM_19_DMWIDTH/8-1:0] = s_axis_bram_19_tkeep;
            assign tstrb[19][C_INPUT_BRAM_19_DMWIDTH/8-1:0] = s_axis_bram_19_tstrb;
            assign tdata[19][C_INPUT_BRAM_19_DMWIDTH-1:0] = s_axis_bram_19_tdata;
            assign s_axis_bram_19_tready = tready[19];
            
            assign addr0[19][C_INPUT_BRAM_19_ADDR_WIDTH-1:0] = ap_bram_19_addr0;
            assign din0[19][C_INPUT_BRAM_19_WIDTH-1:0] = ap_bram_19_din0;
            assign ap_bram_19_dout0 = dout0[19][C_INPUT_BRAM_19_WIDTH-1:0];
            assign we0[19][C_INPUT_BRAM_19_WIDTH/8-1:0] = ap_bram_19_we0;
            assign en0[19] = ap_bram_19_en0;
            assign addr1[19][C_INPUT_BRAM_19_ADDR_WIDTH-1:0] = ap_bram_19_addr1;
            assign din1[19][C_INPUT_BRAM_19_WIDTH-1:0] = ap_bram_19_din1;
            assign ap_bram_19_dout1 = dout1[19][C_INPUT_BRAM_19_WIDTH-1:0];
            assign we1[19][C_INPUT_BRAM_19_WIDTH/8-1:0] = ap_bram_19_we1;
            assign en1[19] = ap_bram_19_en1;
            
            assign dwconv1_tready[19] = m_axis_bram_19_tready;
            assign m_axis_bram_19_tlast = dwconv1_tlast[19];
            assign m_axis_bram_19_tvalid = dwconv1_tvalid[19];
            assign m_axis_bram_19_tkeep = dwconv1_tkeep[19][C_OUTPUT_BRAM_19_DMWIDTH/8-1:0];
            assign m_axis_bram_19_tstrb = dwconv1_tstrb[19][C_OUTPUT_BRAM_19_DMWIDTH/8-1:0];
            assign m_axis_bram_19_tdata = dwconv1_tdata[19][C_OUTPUT_BRAM_19_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 20) begin
            assign tlast[20] = s_axis_bram_20_tlast;
            assign tvalid[20] = s_axis_bram_20_tvalid;
            assign tkeep[20][C_INPUT_BRAM_20_DMWIDTH/8-1:0] = s_axis_bram_20_tkeep;
            assign tstrb[20][C_INPUT_BRAM_20_DMWIDTH/8-1:0] = s_axis_bram_20_tstrb;
            assign tdata[20][C_INPUT_BRAM_20_DMWIDTH-1:0] = s_axis_bram_20_tdata;
            assign s_axis_bram_20_tready = tready[20];
            
            assign addr0[20][C_INPUT_BRAM_20_ADDR_WIDTH-1:0] = ap_bram_20_addr0;
            assign din0[20][C_INPUT_BRAM_20_WIDTH-1:0] = ap_bram_20_din0;
            assign ap_bram_20_dout0 = dout0[20][C_INPUT_BRAM_20_WIDTH-1:0];
            assign we0[20][C_INPUT_BRAM_20_WIDTH/8-1:0] = ap_bram_20_we0;
            assign en0[20] = ap_bram_20_en0;
            assign addr1[20][C_INPUT_BRAM_20_ADDR_WIDTH-1:0] = ap_bram_20_addr1;
            assign din1[20][C_INPUT_BRAM_20_WIDTH-1:0] = ap_bram_20_din1;
            assign ap_bram_20_dout1 = dout1[20][C_INPUT_BRAM_20_WIDTH-1:0];
            assign we1[20][C_INPUT_BRAM_20_WIDTH/8-1:0] = ap_bram_20_we1;
            assign en1[20] = ap_bram_20_en1;
            
            assign dwconv1_tready[20] = m_axis_bram_20_tready;
            assign m_axis_bram_20_tlast = dwconv1_tlast[20];
            assign m_axis_bram_20_tvalid = dwconv1_tvalid[20];
            assign m_axis_bram_20_tkeep = dwconv1_tkeep[20][C_OUTPUT_BRAM_20_DMWIDTH/8-1:0];
            assign m_axis_bram_20_tstrb = dwconv1_tstrb[20][C_OUTPUT_BRAM_20_DMWIDTH/8-1:0];
            assign m_axis_bram_20_tdata = dwconv1_tdata[20][C_OUTPUT_BRAM_20_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 21) begin
            assign tlast[21] = s_axis_bram_21_tlast;
            assign tvalid[21] = s_axis_bram_21_tvalid;
            assign tkeep[21][C_INPUT_BRAM_21_DMWIDTH/8-1:0] = s_axis_bram_21_tkeep;
            assign tstrb[21][C_INPUT_BRAM_21_DMWIDTH/8-1:0] = s_axis_bram_21_tstrb;
            assign tdata[21][C_INPUT_BRAM_21_DMWIDTH-1:0] = s_axis_bram_21_tdata;
            assign s_axis_bram_21_tready = tready[21];
            
            assign addr0[21][C_INPUT_BRAM_21_ADDR_WIDTH-1:0] = ap_bram_21_addr0;
            assign din0[21][C_INPUT_BRAM_21_WIDTH-1:0] = ap_bram_21_din0;
            assign ap_bram_21_dout0 = dout0[21][C_INPUT_BRAM_21_WIDTH-1:0];
            assign we0[21][C_INPUT_BRAM_21_WIDTH/8-1:0] = ap_bram_21_we0;
            assign en0[21] = ap_bram_21_en0;
            assign addr1[21][C_INPUT_BRAM_21_ADDR_WIDTH-1:0] = ap_bram_21_addr1;
            assign din1[21][C_INPUT_BRAM_21_WIDTH-1:0] = ap_bram_21_din1;
            assign ap_bram_21_dout1 = dout1[21][C_INPUT_BRAM_21_WIDTH-1:0];
            assign we1[21][C_INPUT_BRAM_21_WIDTH/8-1:0] = ap_bram_21_we1;
            assign en1[21] = ap_bram_21_en1;
            
            assign dwconv1_tready[21] = m_axis_bram_21_tready;
            assign m_axis_bram_21_tlast = dwconv1_tlast[21];
            assign m_axis_bram_21_tvalid = dwconv1_tvalid[21];
            assign m_axis_bram_21_tkeep = dwconv1_tkeep[21][C_OUTPUT_BRAM_21_DMWIDTH/8-1:0];
            assign m_axis_bram_21_tstrb = dwconv1_tstrb[21][C_OUTPUT_BRAM_21_DMWIDTH/8-1:0];
            assign m_axis_bram_21_tdata = dwconv1_tdata[21][C_OUTPUT_BRAM_21_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 22) begin
            assign tlast[22] = s_axis_bram_22_tlast;
            assign tvalid[22] = s_axis_bram_22_tvalid;
            assign tkeep[22][C_INPUT_BRAM_22_DMWIDTH/8-1:0] = s_axis_bram_22_tkeep;
            assign tstrb[22][C_INPUT_BRAM_22_DMWIDTH/8-1:0] = s_axis_bram_22_tstrb;
            assign tdata[22][C_INPUT_BRAM_22_DMWIDTH-1:0] = s_axis_bram_22_tdata;
            assign s_axis_bram_22_tready = tready[22];
            
            assign addr0[22][C_INPUT_BRAM_22_ADDR_WIDTH-1:0] = ap_bram_22_addr0;
            assign din0[22][C_INPUT_BRAM_22_WIDTH-1:0] = ap_bram_22_din0;
            assign ap_bram_22_dout0 = dout0[22][C_INPUT_BRAM_22_WIDTH-1:0];
            assign we0[22][C_INPUT_BRAM_22_WIDTH/8-1:0] = ap_bram_22_we0;
            assign en0[22] = ap_bram_22_en0;
            assign addr1[22][C_INPUT_BRAM_22_ADDR_WIDTH-1:0] = ap_bram_22_addr1;
            assign din1[22][C_INPUT_BRAM_22_WIDTH-1:0] = ap_bram_22_din1;
            assign ap_bram_22_dout1 = dout1[22][C_INPUT_BRAM_22_WIDTH-1:0];
            assign we1[22][C_INPUT_BRAM_22_WIDTH/8-1:0] = ap_bram_22_we1;
            assign en1[22] = ap_bram_22_en1;
            
            assign dwconv1_tready[22] = m_axis_bram_22_tready;
            assign m_axis_bram_22_tlast = dwconv1_tlast[22];
            assign m_axis_bram_22_tvalid = dwconv1_tvalid[22];
            assign m_axis_bram_22_tkeep = dwconv1_tkeep[22][C_OUTPUT_BRAM_22_DMWIDTH/8-1:0];
            assign m_axis_bram_22_tstrb = dwconv1_tstrb[22][C_OUTPUT_BRAM_22_DMWIDTH/8-1:0];
            assign m_axis_bram_22_tdata = dwconv1_tdata[22][C_OUTPUT_BRAM_22_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 23) begin
            assign tlast[23] = s_axis_bram_23_tlast;
            assign tvalid[23] = s_axis_bram_23_tvalid;
            assign tkeep[23][C_INPUT_BRAM_23_DMWIDTH/8-1:0] = s_axis_bram_23_tkeep;
            assign tstrb[23][C_INPUT_BRAM_23_DMWIDTH/8-1:0] = s_axis_bram_23_tstrb;
            assign tdata[23][C_INPUT_BRAM_23_DMWIDTH-1:0] = s_axis_bram_23_tdata;
            assign s_axis_bram_23_tready = tready[23];
            
            assign addr0[23][C_INPUT_BRAM_23_ADDR_WIDTH-1:0] = ap_bram_23_addr0;
            assign din0[23][C_INPUT_BRAM_23_WIDTH-1:0] = ap_bram_23_din0;
            assign ap_bram_23_dout0 = dout0[23][C_INPUT_BRAM_23_WIDTH-1:0];
            assign we0[23][C_INPUT_BRAM_23_WIDTH/8-1:0] = ap_bram_23_we0;
            assign en0[23] = ap_bram_23_en0;
            assign addr1[23][C_INPUT_BRAM_23_ADDR_WIDTH-1:0] = ap_bram_23_addr1;
            assign din1[23][C_INPUT_BRAM_23_WIDTH-1:0] = ap_bram_23_din1;
            assign ap_bram_23_dout1 = dout1[23][C_INPUT_BRAM_23_WIDTH-1:0];
            assign we1[23][C_INPUT_BRAM_23_WIDTH/8-1:0] = ap_bram_23_we1;
            assign en1[23] = ap_bram_23_en1;
            
            assign dwconv1_tready[23] = m_axis_bram_23_tready;
            assign m_axis_bram_23_tlast = dwconv1_tlast[23];
            assign m_axis_bram_23_tvalid = dwconv1_tvalid[23];
            assign m_axis_bram_23_tkeep = dwconv1_tkeep[23][C_OUTPUT_BRAM_23_DMWIDTH/8-1:0];
            assign m_axis_bram_23_tstrb = dwconv1_tstrb[23][C_OUTPUT_BRAM_23_DMWIDTH/8-1:0];
            assign m_axis_bram_23_tdata = dwconv1_tdata[23][C_OUTPUT_BRAM_23_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 24) begin
            assign tlast[24] = s_axis_bram_24_tlast;
            assign tvalid[24] = s_axis_bram_24_tvalid;
            assign tkeep[24][C_INPUT_BRAM_24_DMWIDTH/8-1:0] = s_axis_bram_24_tkeep;
            assign tstrb[24][C_INPUT_BRAM_24_DMWIDTH/8-1:0] = s_axis_bram_24_tstrb;
            assign tdata[24][C_INPUT_BRAM_24_DMWIDTH-1:0] = s_axis_bram_24_tdata;
            assign s_axis_bram_24_tready = tready[24];
            
            assign addr0[24][C_INPUT_BRAM_24_ADDR_WIDTH-1:0] = ap_bram_24_addr0;
            assign din0[24][C_INPUT_BRAM_24_WIDTH-1:0] = ap_bram_24_din0;
            assign ap_bram_24_dout0 = dout0[24][C_INPUT_BRAM_24_WIDTH-1:0];
            assign we0[24][C_INPUT_BRAM_24_WIDTH/8-1:0] = ap_bram_24_we0;
            assign en0[24] = ap_bram_24_en0;
            assign addr1[24][C_INPUT_BRAM_24_ADDR_WIDTH-1:0] = ap_bram_24_addr1;
            assign din1[24][C_INPUT_BRAM_24_WIDTH-1:0] = ap_bram_24_din1;
            assign ap_bram_24_dout1 = dout1[24][C_INPUT_BRAM_24_WIDTH-1:0];
            assign we1[24][C_INPUT_BRAM_24_WIDTH/8-1:0] = ap_bram_24_we1;
            assign en1[24] = ap_bram_24_en1;
            
            assign dwconv1_tready[24] = m_axis_bram_24_tready;
            assign m_axis_bram_24_tlast = dwconv1_tlast[24];
            assign m_axis_bram_24_tvalid = dwconv1_tvalid[24];
            assign m_axis_bram_24_tkeep = dwconv1_tkeep[24][C_OUTPUT_BRAM_24_DMWIDTH/8-1:0];
            assign m_axis_bram_24_tstrb = dwconv1_tstrb[24][C_OUTPUT_BRAM_24_DMWIDTH/8-1:0];
            assign m_axis_bram_24_tdata = dwconv1_tdata[24][C_OUTPUT_BRAM_24_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 25) begin
            assign tlast[25] = s_axis_bram_25_tlast;
            assign tvalid[25] = s_axis_bram_25_tvalid;
            assign tkeep[25][C_INPUT_BRAM_25_DMWIDTH/8-1:0] = s_axis_bram_25_tkeep;
            assign tstrb[25][C_INPUT_BRAM_25_DMWIDTH/8-1:0] = s_axis_bram_25_tstrb;
            assign tdata[25][C_INPUT_BRAM_25_DMWIDTH-1:0] = s_axis_bram_25_tdata;
            assign s_axis_bram_25_tready = tready[25];
            
            assign addr0[25][C_INPUT_BRAM_25_ADDR_WIDTH-1:0] = ap_bram_25_addr0;
            assign din0[25][C_INPUT_BRAM_25_WIDTH-1:0] = ap_bram_25_din0;
            assign ap_bram_25_dout0 = dout0[25][C_INPUT_BRAM_25_WIDTH-1:0];
            assign we0[25][C_INPUT_BRAM_25_WIDTH/8-1:0] = ap_bram_25_we0;
            assign en0[25] = ap_bram_25_en0;
            assign addr1[25][C_INPUT_BRAM_25_ADDR_WIDTH-1:0] = ap_bram_25_addr1;
            assign din1[25][C_INPUT_BRAM_25_WIDTH-1:0] = ap_bram_25_din1;
            assign ap_bram_25_dout1 = dout1[25][C_INPUT_BRAM_25_WIDTH-1:0];
            assign we1[25][C_INPUT_BRAM_25_WIDTH/8-1:0] = ap_bram_25_we1;
            assign en1[25] = ap_bram_25_en1;
            
            assign dwconv1_tready[25] = m_axis_bram_25_tready;
            assign m_axis_bram_25_tlast = dwconv1_tlast[25];
            assign m_axis_bram_25_tvalid = dwconv1_tvalid[25];
            assign m_axis_bram_25_tkeep = dwconv1_tkeep[25][C_OUTPUT_BRAM_25_DMWIDTH/8-1:0];
            assign m_axis_bram_25_tstrb = dwconv1_tstrb[25][C_OUTPUT_BRAM_25_DMWIDTH/8-1:0];
            assign m_axis_bram_25_tdata = dwconv1_tdata[25][C_OUTPUT_BRAM_25_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 26) begin
            assign tlast[26] = s_axis_bram_26_tlast;
            assign tvalid[26] = s_axis_bram_26_tvalid;
            assign tkeep[26][C_INPUT_BRAM_26_DMWIDTH/8-1:0] = s_axis_bram_26_tkeep;
            assign tstrb[26][C_INPUT_BRAM_26_DMWIDTH/8-1:0] = s_axis_bram_26_tstrb;
            assign tdata[26][C_INPUT_BRAM_26_DMWIDTH-1:0] = s_axis_bram_26_tdata;
            assign s_axis_bram_26_tready = tready[26];
            
            assign addr0[26][C_INPUT_BRAM_26_ADDR_WIDTH-1:0] = ap_bram_26_addr0;
            assign din0[26][C_INPUT_BRAM_26_WIDTH-1:0] = ap_bram_26_din0;
            assign ap_bram_26_dout0 = dout0[26][C_INPUT_BRAM_26_WIDTH-1:0];
            assign we0[26][C_INPUT_BRAM_26_WIDTH/8-1:0] = ap_bram_26_we0;
            assign en0[26] = ap_bram_26_en0;
            assign addr1[26][C_INPUT_BRAM_26_ADDR_WIDTH-1:0] = ap_bram_26_addr1;
            assign din1[26][C_INPUT_BRAM_26_WIDTH-1:0] = ap_bram_26_din1;
            assign ap_bram_26_dout1 = dout1[26][C_INPUT_BRAM_26_WIDTH-1:0];
            assign we1[26][C_INPUT_BRAM_26_WIDTH/8-1:0] = ap_bram_26_we1;
            assign en1[26] = ap_bram_26_en1;
            
            assign dwconv1_tready[26] = m_axis_bram_26_tready;
            assign m_axis_bram_26_tlast = dwconv1_tlast[26];
            assign m_axis_bram_26_tvalid = dwconv1_tvalid[26];
            assign m_axis_bram_26_tkeep = dwconv1_tkeep[26][C_OUTPUT_BRAM_26_DMWIDTH/8-1:0];
            assign m_axis_bram_26_tstrb = dwconv1_tstrb[26][C_OUTPUT_BRAM_26_DMWIDTH/8-1:0];
            assign m_axis_bram_26_tdata = dwconv1_tdata[26][C_OUTPUT_BRAM_26_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 27) begin
            assign tlast[27] = s_axis_bram_27_tlast;
            assign tvalid[27] = s_axis_bram_27_tvalid;
            assign tkeep[27][C_INPUT_BRAM_27_DMWIDTH/8-1:0] = s_axis_bram_27_tkeep;
            assign tstrb[27][C_INPUT_BRAM_27_DMWIDTH/8-1:0] = s_axis_bram_27_tstrb;
            assign tdata[27][C_INPUT_BRAM_27_DMWIDTH-1:0] = s_axis_bram_27_tdata;
            assign s_axis_bram_27_tready = tready[27];
            
            assign addr0[27][C_INPUT_BRAM_27_ADDR_WIDTH-1:0] = ap_bram_27_addr0;
            assign din0[27][C_INPUT_BRAM_27_WIDTH-1:0] = ap_bram_27_din0;
            assign ap_bram_27_dout0 = dout0[27][C_INPUT_BRAM_27_WIDTH-1:0];
            assign we0[27][C_INPUT_BRAM_27_WIDTH/8-1:0] = ap_bram_27_we0;
            assign en0[27] = ap_bram_27_en0;
            assign addr1[27][C_INPUT_BRAM_27_ADDR_WIDTH-1:0] = ap_bram_27_addr1;
            assign din1[27][C_INPUT_BRAM_27_WIDTH-1:0] = ap_bram_27_din1;
            assign ap_bram_27_dout1 = dout1[27][C_INPUT_BRAM_27_WIDTH-1:0];
            assign we1[27][C_INPUT_BRAM_27_WIDTH/8-1:0] = ap_bram_27_we1;
            assign en1[27] = ap_bram_27_en1;
            
            assign dwconv1_tready[27] = m_axis_bram_27_tready;
            assign m_axis_bram_27_tlast = dwconv1_tlast[27];
            assign m_axis_bram_27_tvalid = dwconv1_tvalid[27];
            assign m_axis_bram_27_tkeep = dwconv1_tkeep[27][C_OUTPUT_BRAM_27_DMWIDTH/8-1:0];
            assign m_axis_bram_27_tstrb = dwconv1_tstrb[27][C_OUTPUT_BRAM_27_DMWIDTH/8-1:0];
            assign m_axis_bram_27_tdata = dwconv1_tdata[27][C_OUTPUT_BRAM_27_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 28) begin
            assign tlast[28] = s_axis_bram_28_tlast;
            assign tvalid[28] = s_axis_bram_28_tvalid;
            assign tkeep[28][C_INPUT_BRAM_28_DMWIDTH/8-1:0] = s_axis_bram_28_tkeep;
            assign tstrb[28][C_INPUT_BRAM_28_DMWIDTH/8-1:0] = s_axis_bram_28_tstrb;
            assign tdata[28][C_INPUT_BRAM_28_DMWIDTH-1:0] = s_axis_bram_28_tdata;
            assign s_axis_bram_28_tready = tready[28];
            
            assign addr0[28][C_INPUT_BRAM_28_ADDR_WIDTH-1:0] = ap_bram_28_addr0;
            assign din0[28][C_INPUT_BRAM_28_WIDTH-1:0] = ap_bram_28_din0;
            assign ap_bram_28_dout0 = dout0[28][C_INPUT_BRAM_28_WIDTH-1:0];
            assign we0[28][C_INPUT_BRAM_28_WIDTH/8-1:0] = ap_bram_28_we0;
            assign en0[28] = ap_bram_28_en0;
            assign addr1[28][C_INPUT_BRAM_28_ADDR_WIDTH-1:0] = ap_bram_28_addr1;
            assign din1[28][C_INPUT_BRAM_28_WIDTH-1:0] = ap_bram_28_din1;
            assign ap_bram_28_dout1 = dout1[28][C_INPUT_BRAM_28_WIDTH-1:0];
            assign we1[28][C_INPUT_BRAM_28_WIDTH/8-1:0] = ap_bram_28_we1;
            assign en1[28] = ap_bram_28_en1;
            
            assign dwconv1_tready[28] = m_axis_bram_28_tready;
            assign m_axis_bram_28_tlast = dwconv1_tlast[28];
            assign m_axis_bram_28_tvalid = dwconv1_tvalid[28];
            assign m_axis_bram_28_tkeep = dwconv1_tkeep[28][C_OUTPUT_BRAM_28_DMWIDTH/8-1:0];
            assign m_axis_bram_28_tstrb = dwconv1_tstrb[28][C_OUTPUT_BRAM_28_DMWIDTH/8-1:0];
            assign m_axis_bram_28_tdata = dwconv1_tdata[28][C_OUTPUT_BRAM_28_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 29) begin
            assign tlast[29] = s_axis_bram_29_tlast;
            assign tvalid[29] = s_axis_bram_29_tvalid;
            assign tkeep[29][C_INPUT_BRAM_29_DMWIDTH/8-1:0] = s_axis_bram_29_tkeep;
            assign tstrb[29][C_INPUT_BRAM_29_DMWIDTH/8-1:0] = s_axis_bram_29_tstrb;
            assign tdata[29][C_INPUT_BRAM_29_DMWIDTH-1:0] = s_axis_bram_29_tdata;
            assign s_axis_bram_29_tready = tready[29];
            
            assign addr0[29][C_INPUT_BRAM_29_ADDR_WIDTH-1:0] = ap_bram_29_addr0;
            assign din0[29][C_INPUT_BRAM_29_WIDTH-1:0] = ap_bram_29_din0;
            assign ap_bram_29_dout0 = dout0[29][C_INPUT_BRAM_29_WIDTH-1:0];
            assign we0[29][C_INPUT_BRAM_29_WIDTH/8-1:0] = ap_bram_29_we0;
            assign en0[29] = ap_bram_29_en0;
            assign addr1[29][C_INPUT_BRAM_29_ADDR_WIDTH-1:0] = ap_bram_29_addr1;
            assign din1[29][C_INPUT_BRAM_29_WIDTH-1:0] = ap_bram_29_din1;
            assign ap_bram_29_dout1 = dout1[29][C_INPUT_BRAM_29_WIDTH-1:0];
            assign we1[29][C_INPUT_BRAM_29_WIDTH/8-1:0] = ap_bram_29_we1;
            assign en1[29] = ap_bram_29_en1;
            
            assign dwconv1_tready[29] = m_axis_bram_29_tready;
            assign m_axis_bram_29_tlast = dwconv1_tlast[29];
            assign m_axis_bram_29_tvalid = dwconv1_tvalid[29];
            assign m_axis_bram_29_tkeep = dwconv1_tkeep[29][C_OUTPUT_BRAM_29_DMWIDTH/8-1:0];
            assign m_axis_bram_29_tstrb = dwconv1_tstrb[29][C_OUTPUT_BRAM_29_DMWIDTH/8-1:0];
            assign m_axis_bram_29_tdata = dwconv1_tdata[29][C_OUTPUT_BRAM_29_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 30) begin
            assign tlast[30] = s_axis_bram_30_tlast;
            assign tvalid[30] = s_axis_bram_30_tvalid;
            assign tkeep[30][C_INPUT_BRAM_30_DMWIDTH/8-1:0] = s_axis_bram_30_tkeep;
            assign tstrb[30][C_INPUT_BRAM_30_DMWIDTH/8-1:0] = s_axis_bram_30_tstrb;
            assign tdata[30][C_INPUT_BRAM_30_DMWIDTH-1:0] = s_axis_bram_30_tdata;
            assign s_axis_bram_30_tready = tready[30];
            
            assign addr0[30][C_INPUT_BRAM_30_ADDR_WIDTH-1:0] = ap_bram_30_addr0;
            assign din0[30][C_INPUT_BRAM_30_WIDTH-1:0] = ap_bram_30_din0;
            assign ap_bram_30_dout0 = dout0[30][C_INPUT_BRAM_30_WIDTH-1:0];
            assign we0[30][C_INPUT_BRAM_30_WIDTH/8-1:0] = ap_bram_30_we0;
            assign en0[30] = ap_bram_30_en0;
            assign addr1[30][C_INPUT_BRAM_30_ADDR_WIDTH-1:0] = ap_bram_30_addr1;
            assign din1[30][C_INPUT_BRAM_30_WIDTH-1:0] = ap_bram_30_din1;
            assign ap_bram_30_dout1 = dout1[30][C_INPUT_BRAM_30_WIDTH-1:0];
            assign we1[30][C_INPUT_BRAM_30_WIDTH/8-1:0] = ap_bram_30_we1;
            assign en1[30] = ap_bram_30_en1;
            
            assign dwconv1_tready[30] = m_axis_bram_30_tready;
            assign m_axis_bram_30_tlast = dwconv1_tlast[30];
            assign m_axis_bram_30_tvalid = dwconv1_tvalid[30];
            assign m_axis_bram_30_tkeep = dwconv1_tkeep[30][C_OUTPUT_BRAM_30_DMWIDTH/8-1:0];
            assign m_axis_bram_30_tstrb = dwconv1_tstrb[30][C_OUTPUT_BRAM_30_DMWIDTH/8-1:0];
            assign m_axis_bram_30_tdata = dwconv1_tdata[30][C_OUTPUT_BRAM_30_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 31) begin
            assign tlast[31] = s_axis_bram_31_tlast;
            assign tvalid[31] = s_axis_bram_31_tvalid;
            assign tkeep[31][C_INPUT_BRAM_31_DMWIDTH/8-1:0] = s_axis_bram_31_tkeep;
            assign tstrb[31][C_INPUT_BRAM_31_DMWIDTH/8-1:0] = s_axis_bram_31_tstrb;
            assign tdata[31][C_INPUT_BRAM_31_DMWIDTH-1:0] = s_axis_bram_31_tdata;
            assign s_axis_bram_31_tready = tready[31];
            
            assign addr0[31][C_INPUT_BRAM_31_ADDR_WIDTH-1:0] = ap_bram_31_addr0;
            assign din0[31][C_INPUT_BRAM_31_WIDTH-1:0] = ap_bram_31_din0;
            assign ap_bram_31_dout0 = dout0[31][C_INPUT_BRAM_31_WIDTH-1:0];
            assign we0[31][C_INPUT_BRAM_31_WIDTH/8-1:0] = ap_bram_31_we0;
            assign en0[31] = ap_bram_31_en0;
            assign addr1[31][C_INPUT_BRAM_31_ADDR_WIDTH-1:0] = ap_bram_31_addr1;
            assign din1[31][C_INPUT_BRAM_31_WIDTH-1:0] = ap_bram_31_din1;
            assign ap_bram_31_dout1 = dout1[31][C_INPUT_BRAM_31_WIDTH-1:0];
            assign we1[31][C_INPUT_BRAM_31_WIDTH/8-1:0] = ap_bram_31_we1;
            assign en1[31] = ap_bram_31_en1;
            
            assign dwconv1_tready[31] = m_axis_bram_31_tready;
            assign m_axis_bram_31_tlast = dwconv1_tlast[31];
            assign m_axis_bram_31_tvalid = dwconv1_tvalid[31];
            assign m_axis_bram_31_tkeep = dwconv1_tkeep[31][C_OUTPUT_BRAM_31_DMWIDTH/8-1:0];
            assign m_axis_bram_31_tstrb = dwconv1_tstrb[31][C_OUTPUT_BRAM_31_DMWIDTH/8-1:0];
            assign m_axis_bram_31_tdata = dwconv1_tdata[31][C_OUTPUT_BRAM_31_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 32) begin
            assign tlast[32] = s_axis_bram_32_tlast;
            assign tvalid[32] = s_axis_bram_32_tvalid;
            assign tkeep[32][C_INPUT_BRAM_32_DMWIDTH/8-1:0] = s_axis_bram_32_tkeep;
            assign tstrb[32][C_INPUT_BRAM_32_DMWIDTH/8-1:0] = s_axis_bram_32_tstrb;
            assign tdata[32][C_INPUT_BRAM_32_DMWIDTH-1:0] = s_axis_bram_32_tdata;
            assign s_axis_bram_32_tready = tready[32];
            
            assign addr0[32][C_INPUT_BRAM_32_ADDR_WIDTH-1:0] = ap_bram_32_addr0;
            assign din0[32][C_INPUT_BRAM_32_WIDTH-1:0] = ap_bram_32_din0;
            assign ap_bram_32_dout0 = dout0[32][C_INPUT_BRAM_32_WIDTH-1:0];
            assign we0[32][C_INPUT_BRAM_32_WIDTH/8-1:0] = ap_bram_32_we0;
            assign en0[32] = ap_bram_32_en0;
            assign addr1[32][C_INPUT_BRAM_32_ADDR_WIDTH-1:0] = ap_bram_32_addr1;
            assign din1[32][C_INPUT_BRAM_32_WIDTH-1:0] = ap_bram_32_din1;
            assign ap_bram_32_dout1 = dout1[32][C_INPUT_BRAM_32_WIDTH-1:0];
            assign we1[32][C_INPUT_BRAM_32_WIDTH/8-1:0] = ap_bram_32_we1;
            assign en1[32] = ap_bram_32_en1;
            
            assign dwconv1_tready[32] = m_axis_bram_32_tready;
            assign m_axis_bram_32_tlast = dwconv1_tlast[32];
            assign m_axis_bram_32_tvalid = dwconv1_tvalid[32];
            assign m_axis_bram_32_tkeep = dwconv1_tkeep[32][C_OUTPUT_BRAM_32_DMWIDTH/8-1:0];
            assign m_axis_bram_32_tstrb = dwconv1_tstrb[32][C_OUTPUT_BRAM_32_DMWIDTH/8-1:0];
            assign m_axis_bram_32_tdata = dwconv1_tdata[32][C_OUTPUT_BRAM_32_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 33) begin
            assign tlast[33] = s_axis_bram_33_tlast;
            assign tvalid[33] = s_axis_bram_33_tvalid;
            assign tkeep[33][C_INPUT_BRAM_33_DMWIDTH/8-1:0] = s_axis_bram_33_tkeep;
            assign tstrb[33][C_INPUT_BRAM_33_DMWIDTH/8-1:0] = s_axis_bram_33_tstrb;
            assign tdata[33][C_INPUT_BRAM_33_DMWIDTH-1:0] = s_axis_bram_33_tdata;
            assign s_axis_bram_33_tready = tready[33];
            
            assign addr0[33][C_INPUT_BRAM_33_ADDR_WIDTH-1:0] = ap_bram_33_addr0;
            assign din0[33][C_INPUT_BRAM_33_WIDTH-1:0] = ap_bram_33_din0;
            assign ap_bram_33_dout0 = dout0[33][C_INPUT_BRAM_33_WIDTH-1:0];
            assign we0[33][C_INPUT_BRAM_33_WIDTH/8-1:0] = ap_bram_33_we0;
            assign en0[33] = ap_bram_33_en0;
            assign addr1[33][C_INPUT_BRAM_33_ADDR_WIDTH-1:0] = ap_bram_33_addr1;
            assign din1[33][C_INPUT_BRAM_33_WIDTH-1:0] = ap_bram_33_din1;
            assign ap_bram_33_dout1 = dout1[33][C_INPUT_BRAM_33_WIDTH-1:0];
            assign we1[33][C_INPUT_BRAM_33_WIDTH/8-1:0] = ap_bram_33_we1;
            assign en1[33] = ap_bram_33_en1;
            
            assign dwconv1_tready[33] = m_axis_bram_33_tready;
            assign m_axis_bram_33_tlast = dwconv1_tlast[33];
            assign m_axis_bram_33_tvalid = dwconv1_tvalid[33];
            assign m_axis_bram_33_tkeep = dwconv1_tkeep[33][C_OUTPUT_BRAM_33_DMWIDTH/8-1:0];
            assign m_axis_bram_33_tstrb = dwconv1_tstrb[33][C_OUTPUT_BRAM_33_DMWIDTH/8-1:0];
            assign m_axis_bram_33_tdata = dwconv1_tdata[33][C_OUTPUT_BRAM_33_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 34) begin
            assign tlast[34] = s_axis_bram_34_tlast;
            assign tvalid[34] = s_axis_bram_34_tvalid;
            assign tkeep[34][C_INPUT_BRAM_34_DMWIDTH/8-1:0] = s_axis_bram_34_tkeep;
            assign tstrb[34][C_INPUT_BRAM_34_DMWIDTH/8-1:0] = s_axis_bram_34_tstrb;
            assign tdata[34][C_INPUT_BRAM_34_DMWIDTH-1:0] = s_axis_bram_34_tdata;
            assign s_axis_bram_34_tready = tready[34];
            
            assign addr0[34][C_INPUT_BRAM_34_ADDR_WIDTH-1:0] = ap_bram_34_addr0;
            assign din0[34][C_INPUT_BRAM_34_WIDTH-1:0] = ap_bram_34_din0;
            assign ap_bram_34_dout0 = dout0[34][C_INPUT_BRAM_34_WIDTH-1:0];
            assign we0[34][C_INPUT_BRAM_34_WIDTH/8-1:0] = ap_bram_34_we0;
            assign en0[34] = ap_bram_34_en0;
            assign addr1[34][C_INPUT_BRAM_34_ADDR_WIDTH-1:0] = ap_bram_34_addr1;
            assign din1[34][C_INPUT_BRAM_34_WIDTH-1:0] = ap_bram_34_din1;
            assign ap_bram_34_dout1 = dout1[34][C_INPUT_BRAM_34_WIDTH-1:0];
            assign we1[34][C_INPUT_BRAM_34_WIDTH/8-1:0] = ap_bram_34_we1;
            assign en1[34] = ap_bram_34_en1;
            
            assign dwconv1_tready[34] = m_axis_bram_34_tready;
            assign m_axis_bram_34_tlast = dwconv1_tlast[34];
            assign m_axis_bram_34_tvalid = dwconv1_tvalid[34];
            assign m_axis_bram_34_tkeep = dwconv1_tkeep[34][C_OUTPUT_BRAM_34_DMWIDTH/8-1:0];
            assign m_axis_bram_34_tstrb = dwconv1_tstrb[34][C_OUTPUT_BRAM_34_DMWIDTH/8-1:0];
            assign m_axis_bram_34_tdata = dwconv1_tdata[34][C_OUTPUT_BRAM_34_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 35) begin
            assign tlast[35] = s_axis_bram_35_tlast;
            assign tvalid[35] = s_axis_bram_35_tvalid;
            assign tkeep[35][C_INPUT_BRAM_35_DMWIDTH/8-1:0] = s_axis_bram_35_tkeep;
            assign tstrb[35][C_INPUT_BRAM_35_DMWIDTH/8-1:0] = s_axis_bram_35_tstrb;
            assign tdata[35][C_INPUT_BRAM_35_DMWIDTH-1:0] = s_axis_bram_35_tdata;
            assign s_axis_bram_35_tready = tready[35];
            
            assign addr0[35][C_INPUT_BRAM_35_ADDR_WIDTH-1:0] = ap_bram_35_addr0;
            assign din0[35][C_INPUT_BRAM_35_WIDTH-1:0] = ap_bram_35_din0;
            assign ap_bram_35_dout0 = dout0[35][C_INPUT_BRAM_35_WIDTH-1:0];
            assign we0[35][C_INPUT_BRAM_35_WIDTH/8-1:0] = ap_bram_35_we0;
            assign en0[35] = ap_bram_35_en0;
            assign addr1[35][C_INPUT_BRAM_35_ADDR_WIDTH-1:0] = ap_bram_35_addr1;
            assign din1[35][C_INPUT_BRAM_35_WIDTH-1:0] = ap_bram_35_din1;
            assign ap_bram_35_dout1 = dout1[35][C_INPUT_BRAM_35_WIDTH-1:0];
            assign we1[35][C_INPUT_BRAM_35_WIDTH/8-1:0] = ap_bram_35_we1;
            assign en1[35] = ap_bram_35_en1;
            
            assign dwconv1_tready[35] = m_axis_bram_35_tready;
            assign m_axis_bram_35_tlast = dwconv1_tlast[35];
            assign m_axis_bram_35_tvalid = dwconv1_tvalid[35];
            assign m_axis_bram_35_tkeep = dwconv1_tkeep[35][C_OUTPUT_BRAM_35_DMWIDTH/8-1:0];
            assign m_axis_bram_35_tstrb = dwconv1_tstrb[35][C_OUTPUT_BRAM_35_DMWIDTH/8-1:0];
            assign m_axis_bram_35_tdata = dwconv1_tdata[35][C_OUTPUT_BRAM_35_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 36) begin
            assign tlast[36] = s_axis_bram_36_tlast;
            assign tvalid[36] = s_axis_bram_36_tvalid;
            assign tkeep[36][C_INPUT_BRAM_36_DMWIDTH/8-1:0] = s_axis_bram_36_tkeep;
            assign tstrb[36][C_INPUT_BRAM_36_DMWIDTH/8-1:0] = s_axis_bram_36_tstrb;
            assign tdata[36][C_INPUT_BRAM_36_DMWIDTH-1:0] = s_axis_bram_36_tdata;
            assign s_axis_bram_36_tready = tready[36];
            
            assign addr0[36][C_INPUT_BRAM_36_ADDR_WIDTH-1:0] = ap_bram_36_addr0;
            assign din0[36][C_INPUT_BRAM_36_WIDTH-1:0] = ap_bram_36_din0;
            assign ap_bram_36_dout0 = dout0[36][C_INPUT_BRAM_36_WIDTH-1:0];
            assign we0[36][C_INPUT_BRAM_36_WIDTH/8-1:0] = ap_bram_36_we0;
            assign en0[36] = ap_bram_36_en0;
            assign addr1[36][C_INPUT_BRAM_36_ADDR_WIDTH-1:0] = ap_bram_36_addr1;
            assign din1[36][C_INPUT_BRAM_36_WIDTH-1:0] = ap_bram_36_din1;
            assign ap_bram_36_dout1 = dout1[36][C_INPUT_BRAM_36_WIDTH-1:0];
            assign we1[36][C_INPUT_BRAM_36_WIDTH/8-1:0] = ap_bram_36_we1;
            assign en1[36] = ap_bram_36_en1;
            
            assign dwconv1_tready[36] = m_axis_bram_36_tready;
            assign m_axis_bram_36_tlast = dwconv1_tlast[36];
            assign m_axis_bram_36_tvalid = dwconv1_tvalid[36];
            assign m_axis_bram_36_tkeep = dwconv1_tkeep[36][C_OUTPUT_BRAM_36_DMWIDTH/8-1:0];
            assign m_axis_bram_36_tstrb = dwconv1_tstrb[36][C_OUTPUT_BRAM_36_DMWIDTH/8-1:0];
            assign m_axis_bram_36_tdata = dwconv1_tdata[36][C_OUTPUT_BRAM_36_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 37) begin
            assign tlast[37] = s_axis_bram_37_tlast;
            assign tvalid[37] = s_axis_bram_37_tvalid;
            assign tkeep[37][C_INPUT_BRAM_37_DMWIDTH/8-1:0] = s_axis_bram_37_tkeep;
            assign tstrb[37][C_INPUT_BRAM_37_DMWIDTH/8-1:0] = s_axis_bram_37_tstrb;
            assign tdata[37][C_INPUT_BRAM_37_DMWIDTH-1:0] = s_axis_bram_37_tdata;
            assign s_axis_bram_37_tready = tready[37];
            
            assign addr0[37][C_INPUT_BRAM_37_ADDR_WIDTH-1:0] = ap_bram_37_addr0;
            assign din0[37][C_INPUT_BRAM_37_WIDTH-1:0] = ap_bram_37_din0;
            assign ap_bram_37_dout0 = dout0[37][C_INPUT_BRAM_37_WIDTH-1:0];
            assign we0[37][C_INPUT_BRAM_37_WIDTH/8-1:0] = ap_bram_37_we0;
            assign en0[37] = ap_bram_37_en0;
            assign addr1[37][C_INPUT_BRAM_37_ADDR_WIDTH-1:0] = ap_bram_37_addr1;
            assign din1[37][C_INPUT_BRAM_37_WIDTH-1:0] = ap_bram_37_din1;
            assign ap_bram_37_dout1 = dout1[37][C_INPUT_BRAM_37_WIDTH-1:0];
            assign we1[37][C_INPUT_BRAM_37_WIDTH/8-1:0] = ap_bram_37_we1;
            assign en1[37] = ap_bram_37_en1;
            
            assign dwconv1_tready[37] = m_axis_bram_37_tready;
            assign m_axis_bram_37_tlast = dwconv1_tlast[37];
            assign m_axis_bram_37_tvalid = dwconv1_tvalid[37];
            assign m_axis_bram_37_tkeep = dwconv1_tkeep[37][C_OUTPUT_BRAM_37_DMWIDTH/8-1:0];
            assign m_axis_bram_37_tstrb = dwconv1_tstrb[37][C_OUTPUT_BRAM_37_DMWIDTH/8-1:0];
            assign m_axis_bram_37_tdata = dwconv1_tdata[37][C_OUTPUT_BRAM_37_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 38) begin
            assign tlast[38] = s_axis_bram_38_tlast;
            assign tvalid[38] = s_axis_bram_38_tvalid;
            assign tkeep[38][C_INPUT_BRAM_38_DMWIDTH/8-1:0] = s_axis_bram_38_tkeep;
            assign tstrb[38][C_INPUT_BRAM_38_DMWIDTH/8-1:0] = s_axis_bram_38_tstrb;
            assign tdata[38][C_INPUT_BRAM_38_DMWIDTH-1:0] = s_axis_bram_38_tdata;
            assign s_axis_bram_38_tready = tready[38];
            
            assign addr0[38][C_INPUT_BRAM_38_ADDR_WIDTH-1:0] = ap_bram_38_addr0;
            assign din0[38][C_INPUT_BRAM_38_WIDTH-1:0] = ap_bram_38_din0;
            assign ap_bram_38_dout0 = dout0[38][C_INPUT_BRAM_38_WIDTH-1:0];
            assign we0[38][C_INPUT_BRAM_38_WIDTH/8-1:0] = ap_bram_38_we0;
            assign en0[38] = ap_bram_38_en0;
            assign addr1[38][C_INPUT_BRAM_38_ADDR_WIDTH-1:0] = ap_bram_38_addr1;
            assign din1[38][C_INPUT_BRAM_38_WIDTH-1:0] = ap_bram_38_din1;
            assign ap_bram_38_dout1 = dout1[38][C_INPUT_BRAM_38_WIDTH-1:0];
            assign we1[38][C_INPUT_BRAM_38_WIDTH/8-1:0] = ap_bram_38_we1;
            assign en1[38] = ap_bram_38_en1;
            
            assign dwconv1_tready[38] = m_axis_bram_38_tready;
            assign m_axis_bram_38_tlast = dwconv1_tlast[38];
            assign m_axis_bram_38_tvalid = dwconv1_tvalid[38];
            assign m_axis_bram_38_tkeep = dwconv1_tkeep[38][C_OUTPUT_BRAM_38_DMWIDTH/8-1:0];
            assign m_axis_bram_38_tstrb = dwconv1_tstrb[38][C_OUTPUT_BRAM_38_DMWIDTH/8-1:0];
            assign m_axis_bram_38_tdata = dwconv1_tdata[38][C_OUTPUT_BRAM_38_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 39) begin
            assign tlast[39] = s_axis_bram_39_tlast;
            assign tvalid[39] = s_axis_bram_39_tvalid;
            assign tkeep[39][C_INPUT_BRAM_39_DMWIDTH/8-1:0] = s_axis_bram_39_tkeep;
            assign tstrb[39][C_INPUT_BRAM_39_DMWIDTH/8-1:0] = s_axis_bram_39_tstrb;
            assign tdata[39][C_INPUT_BRAM_39_DMWIDTH-1:0] = s_axis_bram_39_tdata;
            assign s_axis_bram_39_tready = tready[39];
            
            assign addr0[39][C_INPUT_BRAM_39_ADDR_WIDTH-1:0] = ap_bram_39_addr0;
            assign din0[39][C_INPUT_BRAM_39_WIDTH-1:0] = ap_bram_39_din0;
            assign ap_bram_39_dout0 = dout0[39][C_INPUT_BRAM_39_WIDTH-1:0];
            assign we0[39][C_INPUT_BRAM_39_WIDTH/8-1:0] = ap_bram_39_we0;
            assign en0[39] = ap_bram_39_en0;
            assign addr1[39][C_INPUT_BRAM_39_ADDR_WIDTH-1:0] = ap_bram_39_addr1;
            assign din1[39][C_INPUT_BRAM_39_WIDTH-1:0] = ap_bram_39_din1;
            assign ap_bram_39_dout1 = dout1[39][C_INPUT_BRAM_39_WIDTH-1:0];
            assign we1[39][C_INPUT_BRAM_39_WIDTH/8-1:0] = ap_bram_39_we1;
            assign en1[39] = ap_bram_39_en1;
            
            assign dwconv1_tready[39] = m_axis_bram_39_tready;
            assign m_axis_bram_39_tlast = dwconv1_tlast[39];
            assign m_axis_bram_39_tvalid = dwconv1_tvalid[39];
            assign m_axis_bram_39_tkeep = dwconv1_tkeep[39][C_OUTPUT_BRAM_39_DMWIDTH/8-1:0];
            assign m_axis_bram_39_tstrb = dwconv1_tstrb[39][C_OUTPUT_BRAM_39_DMWIDTH/8-1:0];
            assign m_axis_bram_39_tdata = dwconv1_tdata[39][C_OUTPUT_BRAM_39_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 40) begin
            assign tlast[40] = s_axis_bram_40_tlast;
            assign tvalid[40] = s_axis_bram_40_tvalid;
            assign tkeep[40][C_INPUT_BRAM_40_DMWIDTH/8-1:0] = s_axis_bram_40_tkeep;
            assign tstrb[40][C_INPUT_BRAM_40_DMWIDTH/8-1:0] = s_axis_bram_40_tstrb;
            assign tdata[40][C_INPUT_BRAM_40_DMWIDTH-1:0] = s_axis_bram_40_tdata;
            assign s_axis_bram_40_tready = tready[40];
            
            assign addr0[40][C_INPUT_BRAM_40_ADDR_WIDTH-1:0] = ap_bram_40_addr0;
            assign din0[40][C_INPUT_BRAM_40_WIDTH-1:0] = ap_bram_40_din0;
            assign ap_bram_40_dout0 = dout0[40][C_INPUT_BRAM_40_WIDTH-1:0];
            assign we0[40][C_INPUT_BRAM_40_WIDTH/8-1:0] = ap_bram_40_we0;
            assign en0[40] = ap_bram_40_en0;
            assign addr1[40][C_INPUT_BRAM_40_ADDR_WIDTH-1:0] = ap_bram_40_addr1;
            assign din1[40][C_INPUT_BRAM_40_WIDTH-1:0] = ap_bram_40_din1;
            assign ap_bram_40_dout1 = dout1[40][C_INPUT_BRAM_40_WIDTH-1:0];
            assign we1[40][C_INPUT_BRAM_40_WIDTH/8-1:0] = ap_bram_40_we1;
            assign en1[40] = ap_bram_40_en1;
            
            assign dwconv1_tready[40] = m_axis_bram_40_tready;
            assign m_axis_bram_40_tlast = dwconv1_tlast[40];
            assign m_axis_bram_40_tvalid = dwconv1_tvalid[40];
            assign m_axis_bram_40_tkeep = dwconv1_tkeep[40][C_OUTPUT_BRAM_40_DMWIDTH/8-1:0];
            assign m_axis_bram_40_tstrb = dwconv1_tstrb[40][C_OUTPUT_BRAM_40_DMWIDTH/8-1:0];
            assign m_axis_bram_40_tdata = dwconv1_tdata[40][C_OUTPUT_BRAM_40_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 41) begin
            assign tlast[41] = s_axis_bram_41_tlast;
            assign tvalid[41] = s_axis_bram_41_tvalid;
            assign tkeep[41][C_INPUT_BRAM_41_DMWIDTH/8-1:0] = s_axis_bram_41_tkeep;
            assign tstrb[41][C_INPUT_BRAM_41_DMWIDTH/8-1:0] = s_axis_bram_41_tstrb;
            assign tdata[41][C_INPUT_BRAM_41_DMWIDTH-1:0] = s_axis_bram_41_tdata;
            assign s_axis_bram_41_tready = tready[41];
            
            assign addr0[41][C_INPUT_BRAM_41_ADDR_WIDTH-1:0] = ap_bram_41_addr0;
            assign din0[41][C_INPUT_BRAM_41_WIDTH-1:0] = ap_bram_41_din0;
            assign ap_bram_41_dout0 = dout0[41][C_INPUT_BRAM_41_WIDTH-1:0];
            assign we0[41][C_INPUT_BRAM_41_WIDTH/8-1:0] = ap_bram_41_we0;
            assign en0[41] = ap_bram_41_en0;
            assign addr1[41][C_INPUT_BRAM_41_ADDR_WIDTH-1:0] = ap_bram_41_addr1;
            assign din1[41][C_INPUT_BRAM_41_WIDTH-1:0] = ap_bram_41_din1;
            assign ap_bram_41_dout1 = dout1[41][C_INPUT_BRAM_41_WIDTH-1:0];
            assign we1[41][C_INPUT_BRAM_41_WIDTH/8-1:0] = ap_bram_41_we1;
            assign en1[41] = ap_bram_41_en1;
            
            assign dwconv1_tready[41] = m_axis_bram_41_tready;
            assign m_axis_bram_41_tlast = dwconv1_tlast[41];
            assign m_axis_bram_41_tvalid = dwconv1_tvalid[41];
            assign m_axis_bram_41_tkeep = dwconv1_tkeep[41][C_OUTPUT_BRAM_41_DMWIDTH/8-1:0];
            assign m_axis_bram_41_tstrb = dwconv1_tstrb[41][C_OUTPUT_BRAM_41_DMWIDTH/8-1:0];
            assign m_axis_bram_41_tdata = dwconv1_tdata[41][C_OUTPUT_BRAM_41_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 42) begin
            assign tlast[42] = s_axis_bram_42_tlast;
            assign tvalid[42] = s_axis_bram_42_tvalid;
            assign tkeep[42][C_INPUT_BRAM_42_DMWIDTH/8-1:0] = s_axis_bram_42_tkeep;
            assign tstrb[42][C_INPUT_BRAM_42_DMWIDTH/8-1:0] = s_axis_bram_42_tstrb;
            assign tdata[42][C_INPUT_BRAM_42_DMWIDTH-1:0] = s_axis_bram_42_tdata;
            assign s_axis_bram_42_tready = tready[42];
            
            assign addr0[42][C_INPUT_BRAM_42_ADDR_WIDTH-1:0] = ap_bram_42_addr0;
            assign din0[42][C_INPUT_BRAM_42_WIDTH-1:0] = ap_bram_42_din0;
            assign ap_bram_42_dout0 = dout0[42][C_INPUT_BRAM_42_WIDTH-1:0];
            assign we0[42][C_INPUT_BRAM_42_WIDTH/8-1:0] = ap_bram_42_we0;
            assign en0[42] = ap_bram_42_en0;
            assign addr1[42][C_INPUT_BRAM_42_ADDR_WIDTH-1:0] = ap_bram_42_addr1;
            assign din1[42][C_INPUT_BRAM_42_WIDTH-1:0] = ap_bram_42_din1;
            assign ap_bram_42_dout1 = dout1[42][C_INPUT_BRAM_42_WIDTH-1:0];
            assign we1[42][C_INPUT_BRAM_42_WIDTH/8-1:0] = ap_bram_42_we1;
            assign en1[42] = ap_bram_42_en1;
            
            assign dwconv1_tready[42] = m_axis_bram_42_tready;
            assign m_axis_bram_42_tlast = dwconv1_tlast[42];
            assign m_axis_bram_42_tvalid = dwconv1_tvalid[42];
            assign m_axis_bram_42_tkeep = dwconv1_tkeep[42][C_OUTPUT_BRAM_42_DMWIDTH/8-1:0];
            assign m_axis_bram_42_tstrb = dwconv1_tstrb[42][C_OUTPUT_BRAM_42_DMWIDTH/8-1:0];
            assign m_axis_bram_42_tdata = dwconv1_tdata[42][C_OUTPUT_BRAM_42_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 43) begin
            assign tlast[43] = s_axis_bram_43_tlast;
            assign tvalid[43] = s_axis_bram_43_tvalid;
            assign tkeep[43][C_INPUT_BRAM_43_DMWIDTH/8-1:0] = s_axis_bram_43_tkeep;
            assign tstrb[43][C_INPUT_BRAM_43_DMWIDTH/8-1:0] = s_axis_bram_43_tstrb;
            assign tdata[43][C_INPUT_BRAM_43_DMWIDTH-1:0] = s_axis_bram_43_tdata;
            assign s_axis_bram_43_tready = tready[43];
            
            assign addr0[43][C_INPUT_BRAM_43_ADDR_WIDTH-1:0] = ap_bram_43_addr0;
            assign din0[43][C_INPUT_BRAM_43_WIDTH-1:0] = ap_bram_43_din0;
            assign ap_bram_43_dout0 = dout0[43][C_INPUT_BRAM_43_WIDTH-1:0];
            assign we0[43][C_INPUT_BRAM_43_WIDTH/8-1:0] = ap_bram_43_we0;
            assign en0[43] = ap_bram_43_en0;
            assign addr1[43][C_INPUT_BRAM_43_ADDR_WIDTH-1:0] = ap_bram_43_addr1;
            assign din1[43][C_INPUT_BRAM_43_WIDTH-1:0] = ap_bram_43_din1;
            assign ap_bram_43_dout1 = dout1[43][C_INPUT_BRAM_43_WIDTH-1:0];
            assign we1[43][C_INPUT_BRAM_43_WIDTH/8-1:0] = ap_bram_43_we1;
            assign en1[43] = ap_bram_43_en1;
            
            assign dwconv1_tready[43] = m_axis_bram_43_tready;
            assign m_axis_bram_43_tlast = dwconv1_tlast[43];
            assign m_axis_bram_43_tvalid = dwconv1_tvalid[43];
            assign m_axis_bram_43_tkeep = dwconv1_tkeep[43][C_OUTPUT_BRAM_43_DMWIDTH/8-1:0];
            assign m_axis_bram_43_tstrb = dwconv1_tstrb[43][C_OUTPUT_BRAM_43_DMWIDTH/8-1:0];
            assign m_axis_bram_43_tdata = dwconv1_tdata[43][C_OUTPUT_BRAM_43_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 44) begin
            assign tlast[44] = s_axis_bram_44_tlast;
            assign tvalid[44] = s_axis_bram_44_tvalid;
            assign tkeep[44][C_INPUT_BRAM_44_DMWIDTH/8-1:0] = s_axis_bram_44_tkeep;
            assign tstrb[44][C_INPUT_BRAM_44_DMWIDTH/8-1:0] = s_axis_bram_44_tstrb;
            assign tdata[44][C_INPUT_BRAM_44_DMWIDTH-1:0] = s_axis_bram_44_tdata;
            assign s_axis_bram_44_tready = tready[44];
            
            assign addr0[44][C_INPUT_BRAM_44_ADDR_WIDTH-1:0] = ap_bram_44_addr0;
            assign din0[44][C_INPUT_BRAM_44_WIDTH-1:0] = ap_bram_44_din0;
            assign ap_bram_44_dout0 = dout0[44][C_INPUT_BRAM_44_WIDTH-1:0];
            assign we0[44][C_INPUT_BRAM_44_WIDTH/8-1:0] = ap_bram_44_we0;
            assign en0[44] = ap_bram_44_en0;
            assign addr1[44][C_INPUT_BRAM_44_ADDR_WIDTH-1:0] = ap_bram_44_addr1;
            assign din1[44][C_INPUT_BRAM_44_WIDTH-1:0] = ap_bram_44_din1;
            assign ap_bram_44_dout1 = dout1[44][C_INPUT_BRAM_44_WIDTH-1:0];
            assign we1[44][C_INPUT_BRAM_44_WIDTH/8-1:0] = ap_bram_44_we1;
            assign en1[44] = ap_bram_44_en1;
            
            assign dwconv1_tready[44] = m_axis_bram_44_tready;
            assign m_axis_bram_44_tlast = dwconv1_tlast[44];
            assign m_axis_bram_44_tvalid = dwconv1_tvalid[44];
            assign m_axis_bram_44_tkeep = dwconv1_tkeep[44][C_OUTPUT_BRAM_44_DMWIDTH/8-1:0];
            assign m_axis_bram_44_tstrb = dwconv1_tstrb[44][C_OUTPUT_BRAM_44_DMWIDTH/8-1:0];
            assign m_axis_bram_44_tdata = dwconv1_tdata[44][C_OUTPUT_BRAM_44_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 45) begin
            assign tlast[45] = s_axis_bram_45_tlast;
            assign tvalid[45] = s_axis_bram_45_tvalid;
            assign tkeep[45][C_INPUT_BRAM_45_DMWIDTH/8-1:0] = s_axis_bram_45_tkeep;
            assign tstrb[45][C_INPUT_BRAM_45_DMWIDTH/8-1:0] = s_axis_bram_45_tstrb;
            assign tdata[45][C_INPUT_BRAM_45_DMWIDTH-1:0] = s_axis_bram_45_tdata;
            assign s_axis_bram_45_tready = tready[45];
            
            assign addr0[45][C_INPUT_BRAM_45_ADDR_WIDTH-1:0] = ap_bram_45_addr0;
            assign din0[45][C_INPUT_BRAM_45_WIDTH-1:0] = ap_bram_45_din0;
            assign ap_bram_45_dout0 = dout0[45][C_INPUT_BRAM_45_WIDTH-1:0];
            assign we0[45][C_INPUT_BRAM_45_WIDTH/8-1:0] = ap_bram_45_we0;
            assign en0[45] = ap_bram_45_en0;
            assign addr1[45][C_INPUT_BRAM_45_ADDR_WIDTH-1:0] = ap_bram_45_addr1;
            assign din1[45][C_INPUT_BRAM_45_WIDTH-1:0] = ap_bram_45_din1;
            assign ap_bram_45_dout1 = dout1[45][C_INPUT_BRAM_45_WIDTH-1:0];
            assign we1[45][C_INPUT_BRAM_45_WIDTH/8-1:0] = ap_bram_45_we1;
            assign en1[45] = ap_bram_45_en1;
            
            assign dwconv1_tready[45] = m_axis_bram_45_tready;
            assign m_axis_bram_45_tlast = dwconv1_tlast[45];
            assign m_axis_bram_45_tvalid = dwconv1_tvalid[45];
            assign m_axis_bram_45_tkeep = dwconv1_tkeep[45][C_OUTPUT_BRAM_45_DMWIDTH/8-1:0];
            assign m_axis_bram_45_tstrb = dwconv1_tstrb[45][C_OUTPUT_BRAM_45_DMWIDTH/8-1:0];
            assign m_axis_bram_45_tdata = dwconv1_tdata[45][C_OUTPUT_BRAM_45_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 46) begin
            assign tlast[46] = s_axis_bram_46_tlast;
            assign tvalid[46] = s_axis_bram_46_tvalid;
            assign tkeep[46][C_INPUT_BRAM_46_DMWIDTH/8-1:0] = s_axis_bram_46_tkeep;
            assign tstrb[46][C_INPUT_BRAM_46_DMWIDTH/8-1:0] = s_axis_bram_46_tstrb;
            assign tdata[46][C_INPUT_BRAM_46_DMWIDTH-1:0] = s_axis_bram_46_tdata;
            assign s_axis_bram_46_tready = tready[46];
            
            assign addr0[46][C_INPUT_BRAM_46_ADDR_WIDTH-1:0] = ap_bram_46_addr0;
            assign din0[46][C_INPUT_BRAM_46_WIDTH-1:0] = ap_bram_46_din0;
            assign ap_bram_46_dout0 = dout0[46][C_INPUT_BRAM_46_WIDTH-1:0];
            assign we0[46][C_INPUT_BRAM_46_WIDTH/8-1:0] = ap_bram_46_we0;
            assign en0[46] = ap_bram_46_en0;
            assign addr1[46][C_INPUT_BRAM_46_ADDR_WIDTH-1:0] = ap_bram_46_addr1;
            assign din1[46][C_INPUT_BRAM_46_WIDTH-1:0] = ap_bram_46_din1;
            assign ap_bram_46_dout1 = dout1[46][C_INPUT_BRAM_46_WIDTH-1:0];
            assign we1[46][C_INPUT_BRAM_46_WIDTH/8-1:0] = ap_bram_46_we1;
            assign en1[46] = ap_bram_46_en1;
            
            assign dwconv1_tready[46] = m_axis_bram_46_tready;
            assign m_axis_bram_46_tlast = dwconv1_tlast[46];
            assign m_axis_bram_46_tvalid = dwconv1_tvalid[46];
            assign m_axis_bram_46_tkeep = dwconv1_tkeep[46][C_OUTPUT_BRAM_46_DMWIDTH/8-1:0];
            assign m_axis_bram_46_tstrb = dwconv1_tstrb[46][C_OUTPUT_BRAM_46_DMWIDTH/8-1:0];
            assign m_axis_bram_46_tdata = dwconv1_tdata[46][C_OUTPUT_BRAM_46_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 47) begin
            assign tlast[47] = s_axis_bram_47_tlast;
            assign tvalid[47] = s_axis_bram_47_tvalid;
            assign tkeep[47][C_INPUT_BRAM_47_DMWIDTH/8-1:0] = s_axis_bram_47_tkeep;
            assign tstrb[47][C_INPUT_BRAM_47_DMWIDTH/8-1:0] = s_axis_bram_47_tstrb;
            assign tdata[47][C_INPUT_BRAM_47_DMWIDTH-1:0] = s_axis_bram_47_tdata;
            assign s_axis_bram_47_tready = tready[47];
            
            assign addr0[47][C_INPUT_BRAM_47_ADDR_WIDTH-1:0] = ap_bram_47_addr0;
            assign din0[47][C_INPUT_BRAM_47_WIDTH-1:0] = ap_bram_47_din0;
            assign ap_bram_47_dout0 = dout0[47][C_INPUT_BRAM_47_WIDTH-1:0];
            assign we0[47][C_INPUT_BRAM_47_WIDTH/8-1:0] = ap_bram_47_we0;
            assign en0[47] = ap_bram_47_en0;
            assign addr1[47][C_INPUT_BRAM_47_ADDR_WIDTH-1:0] = ap_bram_47_addr1;
            assign din1[47][C_INPUT_BRAM_47_WIDTH-1:0] = ap_bram_47_din1;
            assign ap_bram_47_dout1 = dout1[47][C_INPUT_BRAM_47_WIDTH-1:0];
            assign we1[47][C_INPUT_BRAM_47_WIDTH/8-1:0] = ap_bram_47_we1;
            assign en1[47] = ap_bram_47_en1;
            
            assign dwconv1_tready[47] = m_axis_bram_47_tready;
            assign m_axis_bram_47_tlast = dwconv1_tlast[47];
            assign m_axis_bram_47_tvalid = dwconv1_tvalid[47];
            assign m_axis_bram_47_tkeep = dwconv1_tkeep[47][C_OUTPUT_BRAM_47_DMWIDTH/8-1:0];
            assign m_axis_bram_47_tstrb = dwconv1_tstrb[47][C_OUTPUT_BRAM_47_DMWIDTH/8-1:0];
            assign m_axis_bram_47_tdata = dwconv1_tdata[47][C_OUTPUT_BRAM_47_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 48) begin
            assign tlast[48] = s_axis_bram_48_tlast;
            assign tvalid[48] = s_axis_bram_48_tvalid;
            assign tkeep[48][C_INPUT_BRAM_48_DMWIDTH/8-1:0] = s_axis_bram_48_tkeep;
            assign tstrb[48][C_INPUT_BRAM_48_DMWIDTH/8-1:0] = s_axis_bram_48_tstrb;
            assign tdata[48][C_INPUT_BRAM_48_DMWIDTH-1:0] = s_axis_bram_48_tdata;
            assign s_axis_bram_48_tready = tready[48];
            
            assign addr0[48][C_INPUT_BRAM_48_ADDR_WIDTH-1:0] = ap_bram_48_addr0;
            assign din0[48][C_INPUT_BRAM_48_WIDTH-1:0] = ap_bram_48_din0;
            assign ap_bram_48_dout0 = dout0[48][C_INPUT_BRAM_48_WIDTH-1:0];
            assign we0[48][C_INPUT_BRAM_48_WIDTH/8-1:0] = ap_bram_48_we0;
            assign en0[48] = ap_bram_48_en0;
            assign addr1[48][C_INPUT_BRAM_48_ADDR_WIDTH-1:0] = ap_bram_48_addr1;
            assign din1[48][C_INPUT_BRAM_48_WIDTH-1:0] = ap_bram_48_din1;
            assign ap_bram_48_dout1 = dout1[48][C_INPUT_BRAM_48_WIDTH-1:0];
            assign we1[48][C_INPUT_BRAM_48_WIDTH/8-1:0] = ap_bram_48_we1;
            assign en1[48] = ap_bram_48_en1;
            
            assign dwconv1_tready[48] = m_axis_bram_48_tready;
            assign m_axis_bram_48_tlast = dwconv1_tlast[48];
            assign m_axis_bram_48_tvalid = dwconv1_tvalid[48];
            assign m_axis_bram_48_tkeep = dwconv1_tkeep[48][C_OUTPUT_BRAM_48_DMWIDTH/8-1:0];
            assign m_axis_bram_48_tstrb = dwconv1_tstrb[48][C_OUTPUT_BRAM_48_DMWIDTH/8-1:0];
            assign m_axis_bram_48_tdata = dwconv1_tdata[48][C_OUTPUT_BRAM_48_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 49) begin
            assign tlast[49] = s_axis_bram_49_tlast;
            assign tvalid[49] = s_axis_bram_49_tvalid;
            assign tkeep[49][C_INPUT_BRAM_49_DMWIDTH/8-1:0] = s_axis_bram_49_tkeep;
            assign tstrb[49][C_INPUT_BRAM_49_DMWIDTH/8-1:0] = s_axis_bram_49_tstrb;
            assign tdata[49][C_INPUT_BRAM_49_DMWIDTH-1:0] = s_axis_bram_49_tdata;
            assign s_axis_bram_49_tready = tready[49];
            
            assign addr0[49][C_INPUT_BRAM_49_ADDR_WIDTH-1:0] = ap_bram_49_addr0;
            assign din0[49][C_INPUT_BRAM_49_WIDTH-1:0] = ap_bram_49_din0;
            assign ap_bram_49_dout0 = dout0[49][C_INPUT_BRAM_49_WIDTH-1:0];
            assign we0[49][C_INPUT_BRAM_49_WIDTH/8-1:0] = ap_bram_49_we0;
            assign en0[49] = ap_bram_49_en0;
            assign addr1[49][C_INPUT_BRAM_49_ADDR_WIDTH-1:0] = ap_bram_49_addr1;
            assign din1[49][C_INPUT_BRAM_49_WIDTH-1:0] = ap_bram_49_din1;
            assign ap_bram_49_dout1 = dout1[49][C_INPUT_BRAM_49_WIDTH-1:0];
            assign we1[49][C_INPUT_BRAM_49_WIDTH/8-1:0] = ap_bram_49_we1;
            assign en1[49] = ap_bram_49_en1;
            
            assign dwconv1_tready[49] = m_axis_bram_49_tready;
            assign m_axis_bram_49_tlast = dwconv1_tlast[49];
            assign m_axis_bram_49_tvalid = dwconv1_tvalid[49];
            assign m_axis_bram_49_tkeep = dwconv1_tkeep[49][C_OUTPUT_BRAM_49_DMWIDTH/8-1:0];
            assign m_axis_bram_49_tstrb = dwconv1_tstrb[49][C_OUTPUT_BRAM_49_DMWIDTH/8-1:0];
            assign m_axis_bram_49_tdata = dwconv1_tdata[49][C_OUTPUT_BRAM_49_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 50) begin
            assign tlast[50] = s_axis_bram_50_tlast;
            assign tvalid[50] = s_axis_bram_50_tvalid;
            assign tkeep[50][C_INPUT_BRAM_50_DMWIDTH/8-1:0] = s_axis_bram_50_tkeep;
            assign tstrb[50][C_INPUT_BRAM_50_DMWIDTH/8-1:0] = s_axis_bram_50_tstrb;
            assign tdata[50][C_INPUT_BRAM_50_DMWIDTH-1:0] = s_axis_bram_50_tdata;
            assign s_axis_bram_50_tready = tready[50];
            
            assign addr0[50][C_INPUT_BRAM_50_ADDR_WIDTH-1:0] = ap_bram_50_addr0;
            assign din0[50][C_INPUT_BRAM_50_WIDTH-1:0] = ap_bram_50_din0;
            assign ap_bram_50_dout0 = dout0[50][C_INPUT_BRAM_50_WIDTH-1:0];
            assign we0[50][C_INPUT_BRAM_50_WIDTH/8-1:0] = ap_bram_50_we0;
            assign en0[50] = ap_bram_50_en0;
            assign addr1[50][C_INPUT_BRAM_50_ADDR_WIDTH-1:0] = ap_bram_50_addr1;
            assign din1[50][C_INPUT_BRAM_50_WIDTH-1:0] = ap_bram_50_din1;
            assign ap_bram_50_dout1 = dout1[50][C_INPUT_BRAM_50_WIDTH-1:0];
            assign we1[50][C_INPUT_BRAM_50_WIDTH/8-1:0] = ap_bram_50_we1;
            assign en1[50] = ap_bram_50_en1;
            
            assign dwconv1_tready[50] = m_axis_bram_50_tready;
            assign m_axis_bram_50_tlast = dwconv1_tlast[50];
            assign m_axis_bram_50_tvalid = dwconv1_tvalid[50];
            assign m_axis_bram_50_tkeep = dwconv1_tkeep[50][C_OUTPUT_BRAM_50_DMWIDTH/8-1:0];
            assign m_axis_bram_50_tstrb = dwconv1_tstrb[50][C_OUTPUT_BRAM_50_DMWIDTH/8-1:0];
            assign m_axis_bram_50_tdata = dwconv1_tdata[50][C_OUTPUT_BRAM_50_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 51) begin
            assign tlast[51] = s_axis_bram_51_tlast;
            assign tvalid[51] = s_axis_bram_51_tvalid;
            assign tkeep[51][C_INPUT_BRAM_51_DMWIDTH/8-1:0] = s_axis_bram_51_tkeep;
            assign tstrb[51][C_INPUT_BRAM_51_DMWIDTH/8-1:0] = s_axis_bram_51_tstrb;
            assign tdata[51][C_INPUT_BRAM_51_DMWIDTH-1:0] = s_axis_bram_51_tdata;
            assign s_axis_bram_51_tready = tready[51];
            
            assign addr0[51][C_INPUT_BRAM_51_ADDR_WIDTH-1:0] = ap_bram_51_addr0;
            assign din0[51][C_INPUT_BRAM_51_WIDTH-1:0] = ap_bram_51_din0;
            assign ap_bram_51_dout0 = dout0[51][C_INPUT_BRAM_51_WIDTH-1:0];
            assign we0[51][C_INPUT_BRAM_51_WIDTH/8-1:0] = ap_bram_51_we0;
            assign en0[51] = ap_bram_51_en0;
            assign addr1[51][C_INPUT_BRAM_51_ADDR_WIDTH-1:0] = ap_bram_51_addr1;
            assign din1[51][C_INPUT_BRAM_51_WIDTH-1:0] = ap_bram_51_din1;
            assign ap_bram_51_dout1 = dout1[51][C_INPUT_BRAM_51_WIDTH-1:0];
            assign we1[51][C_INPUT_BRAM_51_WIDTH/8-1:0] = ap_bram_51_we1;
            assign en1[51] = ap_bram_51_en1;
            
            assign dwconv1_tready[51] = m_axis_bram_51_tready;
            assign m_axis_bram_51_tlast = dwconv1_tlast[51];
            assign m_axis_bram_51_tvalid = dwconv1_tvalid[51];
            assign m_axis_bram_51_tkeep = dwconv1_tkeep[51][C_OUTPUT_BRAM_51_DMWIDTH/8-1:0];
            assign m_axis_bram_51_tstrb = dwconv1_tstrb[51][C_OUTPUT_BRAM_51_DMWIDTH/8-1:0];
            assign m_axis_bram_51_tdata = dwconv1_tdata[51][C_OUTPUT_BRAM_51_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 52) begin
            assign tlast[52] = s_axis_bram_52_tlast;
            assign tvalid[52] = s_axis_bram_52_tvalid;
            assign tkeep[52][C_INPUT_BRAM_52_DMWIDTH/8-1:0] = s_axis_bram_52_tkeep;
            assign tstrb[52][C_INPUT_BRAM_52_DMWIDTH/8-1:0] = s_axis_bram_52_tstrb;
            assign tdata[52][C_INPUT_BRAM_52_DMWIDTH-1:0] = s_axis_bram_52_tdata;
            assign s_axis_bram_52_tready = tready[52];
            
            assign addr0[52][C_INPUT_BRAM_52_ADDR_WIDTH-1:0] = ap_bram_52_addr0;
            assign din0[52][C_INPUT_BRAM_52_WIDTH-1:0] = ap_bram_52_din0;
            assign ap_bram_52_dout0 = dout0[52][C_INPUT_BRAM_52_WIDTH-1:0];
            assign we0[52][C_INPUT_BRAM_52_WIDTH/8-1:0] = ap_bram_52_we0;
            assign en0[52] = ap_bram_52_en0;
            assign addr1[52][C_INPUT_BRAM_52_ADDR_WIDTH-1:0] = ap_bram_52_addr1;
            assign din1[52][C_INPUT_BRAM_52_WIDTH-1:0] = ap_bram_52_din1;
            assign ap_bram_52_dout1 = dout1[52][C_INPUT_BRAM_52_WIDTH-1:0];
            assign we1[52][C_INPUT_BRAM_52_WIDTH/8-1:0] = ap_bram_52_we1;
            assign en1[52] = ap_bram_52_en1;
            
            assign dwconv1_tready[52] = m_axis_bram_52_tready;
            assign m_axis_bram_52_tlast = dwconv1_tlast[52];
            assign m_axis_bram_52_tvalid = dwconv1_tvalid[52];
            assign m_axis_bram_52_tkeep = dwconv1_tkeep[52][C_OUTPUT_BRAM_52_DMWIDTH/8-1:0];
            assign m_axis_bram_52_tstrb = dwconv1_tstrb[52][C_OUTPUT_BRAM_52_DMWIDTH/8-1:0];
            assign m_axis_bram_52_tdata = dwconv1_tdata[52][C_OUTPUT_BRAM_52_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 53) begin
            assign tlast[53] = s_axis_bram_53_tlast;
            assign tvalid[53] = s_axis_bram_53_tvalid;
            assign tkeep[53][C_INPUT_BRAM_53_DMWIDTH/8-1:0] = s_axis_bram_53_tkeep;
            assign tstrb[53][C_INPUT_BRAM_53_DMWIDTH/8-1:0] = s_axis_bram_53_tstrb;
            assign tdata[53][C_INPUT_BRAM_53_DMWIDTH-1:0] = s_axis_bram_53_tdata;
            assign s_axis_bram_53_tready = tready[53];
            
            assign addr0[53][C_INPUT_BRAM_53_ADDR_WIDTH-1:0] = ap_bram_53_addr0;
            assign din0[53][C_INPUT_BRAM_53_WIDTH-1:0] = ap_bram_53_din0;
            assign ap_bram_53_dout0 = dout0[53][C_INPUT_BRAM_53_WIDTH-1:0];
            assign we0[53][C_INPUT_BRAM_53_WIDTH/8-1:0] = ap_bram_53_we0;
            assign en0[53] = ap_bram_53_en0;
            assign addr1[53][C_INPUT_BRAM_53_ADDR_WIDTH-1:0] = ap_bram_53_addr1;
            assign din1[53][C_INPUT_BRAM_53_WIDTH-1:0] = ap_bram_53_din1;
            assign ap_bram_53_dout1 = dout1[53][C_INPUT_BRAM_53_WIDTH-1:0];
            assign we1[53][C_INPUT_BRAM_53_WIDTH/8-1:0] = ap_bram_53_we1;
            assign en1[53] = ap_bram_53_en1;
            
            assign dwconv1_tready[53] = m_axis_bram_53_tready;
            assign m_axis_bram_53_tlast = dwconv1_tlast[53];
            assign m_axis_bram_53_tvalid = dwconv1_tvalid[53];
            assign m_axis_bram_53_tkeep = dwconv1_tkeep[53][C_OUTPUT_BRAM_53_DMWIDTH/8-1:0];
            assign m_axis_bram_53_tstrb = dwconv1_tstrb[53][C_OUTPUT_BRAM_53_DMWIDTH/8-1:0];
            assign m_axis_bram_53_tdata = dwconv1_tdata[53][C_OUTPUT_BRAM_53_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 54) begin
            assign tlast[54] = s_axis_bram_54_tlast;
            assign tvalid[54] = s_axis_bram_54_tvalid;
            assign tkeep[54][C_INPUT_BRAM_54_DMWIDTH/8-1:0] = s_axis_bram_54_tkeep;
            assign tstrb[54][C_INPUT_BRAM_54_DMWIDTH/8-1:0] = s_axis_bram_54_tstrb;
            assign tdata[54][C_INPUT_BRAM_54_DMWIDTH-1:0] = s_axis_bram_54_tdata;
            assign s_axis_bram_54_tready = tready[54];
            
            assign addr0[54][C_INPUT_BRAM_54_ADDR_WIDTH-1:0] = ap_bram_54_addr0;
            assign din0[54][C_INPUT_BRAM_54_WIDTH-1:0] = ap_bram_54_din0;
            assign ap_bram_54_dout0 = dout0[54][C_INPUT_BRAM_54_WIDTH-1:0];
            assign we0[54][C_INPUT_BRAM_54_WIDTH/8-1:0] = ap_bram_54_we0;
            assign en0[54] = ap_bram_54_en0;
            assign addr1[54][C_INPUT_BRAM_54_ADDR_WIDTH-1:0] = ap_bram_54_addr1;
            assign din1[54][C_INPUT_BRAM_54_WIDTH-1:0] = ap_bram_54_din1;
            assign ap_bram_54_dout1 = dout1[54][C_INPUT_BRAM_54_WIDTH-1:0];
            assign we1[54][C_INPUT_BRAM_54_WIDTH/8-1:0] = ap_bram_54_we1;
            assign en1[54] = ap_bram_54_en1;
            
            assign dwconv1_tready[54] = m_axis_bram_54_tready;
            assign m_axis_bram_54_tlast = dwconv1_tlast[54];
            assign m_axis_bram_54_tvalid = dwconv1_tvalid[54];
            assign m_axis_bram_54_tkeep = dwconv1_tkeep[54][C_OUTPUT_BRAM_54_DMWIDTH/8-1:0];
            assign m_axis_bram_54_tstrb = dwconv1_tstrb[54][C_OUTPUT_BRAM_54_DMWIDTH/8-1:0];
            assign m_axis_bram_54_tdata = dwconv1_tdata[54][C_OUTPUT_BRAM_54_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 55) begin
            assign tlast[55] = s_axis_bram_55_tlast;
            assign tvalid[55] = s_axis_bram_55_tvalid;
            assign tkeep[55][C_INPUT_BRAM_55_DMWIDTH/8-1:0] = s_axis_bram_55_tkeep;
            assign tstrb[55][C_INPUT_BRAM_55_DMWIDTH/8-1:0] = s_axis_bram_55_tstrb;
            assign tdata[55][C_INPUT_BRAM_55_DMWIDTH-1:0] = s_axis_bram_55_tdata;
            assign s_axis_bram_55_tready = tready[55];
            
            assign addr0[55][C_INPUT_BRAM_55_ADDR_WIDTH-1:0] = ap_bram_55_addr0;
            assign din0[55][C_INPUT_BRAM_55_WIDTH-1:0] = ap_bram_55_din0;
            assign ap_bram_55_dout0 = dout0[55][C_INPUT_BRAM_55_WIDTH-1:0];
            assign we0[55][C_INPUT_BRAM_55_WIDTH/8-1:0] = ap_bram_55_we0;
            assign en0[55] = ap_bram_55_en0;
            assign addr1[55][C_INPUT_BRAM_55_ADDR_WIDTH-1:0] = ap_bram_55_addr1;
            assign din1[55][C_INPUT_BRAM_55_WIDTH-1:0] = ap_bram_55_din1;
            assign ap_bram_55_dout1 = dout1[55][C_INPUT_BRAM_55_WIDTH-1:0];
            assign we1[55][C_INPUT_BRAM_55_WIDTH/8-1:0] = ap_bram_55_we1;
            assign en1[55] = ap_bram_55_en1;
            
            assign dwconv1_tready[55] = m_axis_bram_55_tready;
            assign m_axis_bram_55_tlast = dwconv1_tlast[55];
            assign m_axis_bram_55_tvalid = dwconv1_tvalid[55];
            assign m_axis_bram_55_tkeep = dwconv1_tkeep[55][C_OUTPUT_BRAM_55_DMWIDTH/8-1:0];
            assign m_axis_bram_55_tstrb = dwconv1_tstrb[55][C_OUTPUT_BRAM_55_DMWIDTH/8-1:0];
            assign m_axis_bram_55_tdata = dwconv1_tdata[55][C_OUTPUT_BRAM_55_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 56) begin
            assign tlast[56] = s_axis_bram_56_tlast;
            assign tvalid[56] = s_axis_bram_56_tvalid;
            assign tkeep[56][C_INPUT_BRAM_56_DMWIDTH/8-1:0] = s_axis_bram_56_tkeep;
            assign tstrb[56][C_INPUT_BRAM_56_DMWIDTH/8-1:0] = s_axis_bram_56_tstrb;
            assign tdata[56][C_INPUT_BRAM_56_DMWIDTH-1:0] = s_axis_bram_56_tdata;
            assign s_axis_bram_56_tready = tready[56];
            
            assign addr0[56][C_INPUT_BRAM_56_ADDR_WIDTH-1:0] = ap_bram_56_addr0;
            assign din0[56][C_INPUT_BRAM_56_WIDTH-1:0] = ap_bram_56_din0;
            assign ap_bram_56_dout0 = dout0[56][C_INPUT_BRAM_56_WIDTH-1:0];
            assign we0[56][C_INPUT_BRAM_56_WIDTH/8-1:0] = ap_bram_56_we0;
            assign en0[56] = ap_bram_56_en0;
            assign addr1[56][C_INPUT_BRAM_56_ADDR_WIDTH-1:0] = ap_bram_56_addr1;
            assign din1[56][C_INPUT_BRAM_56_WIDTH-1:0] = ap_bram_56_din1;
            assign ap_bram_56_dout1 = dout1[56][C_INPUT_BRAM_56_WIDTH-1:0];
            assign we1[56][C_INPUT_BRAM_56_WIDTH/8-1:0] = ap_bram_56_we1;
            assign en1[56] = ap_bram_56_en1;
            
            assign dwconv1_tready[56] = m_axis_bram_56_tready;
            assign m_axis_bram_56_tlast = dwconv1_tlast[56];
            assign m_axis_bram_56_tvalid = dwconv1_tvalid[56];
            assign m_axis_bram_56_tkeep = dwconv1_tkeep[56][C_OUTPUT_BRAM_56_DMWIDTH/8-1:0];
            assign m_axis_bram_56_tstrb = dwconv1_tstrb[56][C_OUTPUT_BRAM_56_DMWIDTH/8-1:0];
            assign m_axis_bram_56_tdata = dwconv1_tdata[56][C_OUTPUT_BRAM_56_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 57) begin
            assign tlast[57] = s_axis_bram_57_tlast;
            assign tvalid[57] = s_axis_bram_57_tvalid;
            assign tkeep[57][C_INPUT_BRAM_57_DMWIDTH/8-1:0] = s_axis_bram_57_tkeep;
            assign tstrb[57][C_INPUT_BRAM_57_DMWIDTH/8-1:0] = s_axis_bram_57_tstrb;
            assign tdata[57][C_INPUT_BRAM_57_DMWIDTH-1:0] = s_axis_bram_57_tdata;
            assign s_axis_bram_57_tready = tready[57];
            
            assign addr0[57][C_INPUT_BRAM_57_ADDR_WIDTH-1:0] = ap_bram_57_addr0;
            assign din0[57][C_INPUT_BRAM_57_WIDTH-1:0] = ap_bram_57_din0;
            assign ap_bram_57_dout0 = dout0[57][C_INPUT_BRAM_57_WIDTH-1:0];
            assign we0[57][C_INPUT_BRAM_57_WIDTH/8-1:0] = ap_bram_57_we0;
            assign en0[57] = ap_bram_57_en0;
            assign addr1[57][C_INPUT_BRAM_57_ADDR_WIDTH-1:0] = ap_bram_57_addr1;
            assign din1[57][C_INPUT_BRAM_57_WIDTH-1:0] = ap_bram_57_din1;
            assign ap_bram_57_dout1 = dout1[57][C_INPUT_BRAM_57_WIDTH-1:0];
            assign we1[57][C_INPUT_BRAM_57_WIDTH/8-1:0] = ap_bram_57_we1;
            assign en1[57] = ap_bram_57_en1;
            
            assign dwconv1_tready[57] = m_axis_bram_57_tready;
            assign m_axis_bram_57_tlast = dwconv1_tlast[57];
            assign m_axis_bram_57_tvalid = dwconv1_tvalid[57];
            assign m_axis_bram_57_tkeep = dwconv1_tkeep[57][C_OUTPUT_BRAM_57_DMWIDTH/8-1:0];
            assign m_axis_bram_57_tstrb = dwconv1_tstrb[57][C_OUTPUT_BRAM_57_DMWIDTH/8-1:0];
            assign m_axis_bram_57_tdata = dwconv1_tdata[57][C_OUTPUT_BRAM_57_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 58) begin
            assign tlast[58] = s_axis_bram_58_tlast;
            assign tvalid[58] = s_axis_bram_58_tvalid;
            assign tkeep[58][C_INPUT_BRAM_58_DMWIDTH/8-1:0] = s_axis_bram_58_tkeep;
            assign tstrb[58][C_INPUT_BRAM_58_DMWIDTH/8-1:0] = s_axis_bram_58_tstrb;
            assign tdata[58][C_INPUT_BRAM_58_DMWIDTH-1:0] = s_axis_bram_58_tdata;
            assign s_axis_bram_58_tready = tready[58];
            
            assign addr0[58][C_INPUT_BRAM_58_ADDR_WIDTH-1:0] = ap_bram_58_addr0;
            assign din0[58][C_INPUT_BRAM_58_WIDTH-1:0] = ap_bram_58_din0;
            assign ap_bram_58_dout0 = dout0[58][C_INPUT_BRAM_58_WIDTH-1:0];
            assign we0[58][C_INPUT_BRAM_58_WIDTH/8-1:0] = ap_bram_58_we0;
            assign en0[58] = ap_bram_58_en0;
            assign addr1[58][C_INPUT_BRAM_58_ADDR_WIDTH-1:0] = ap_bram_58_addr1;
            assign din1[58][C_INPUT_BRAM_58_WIDTH-1:0] = ap_bram_58_din1;
            assign ap_bram_58_dout1 = dout1[58][C_INPUT_BRAM_58_WIDTH-1:0];
            assign we1[58][C_INPUT_BRAM_58_WIDTH/8-1:0] = ap_bram_58_we1;
            assign en1[58] = ap_bram_58_en1;
            
            assign dwconv1_tready[58] = m_axis_bram_58_tready;
            assign m_axis_bram_58_tlast = dwconv1_tlast[58];
            assign m_axis_bram_58_tvalid = dwconv1_tvalid[58];
            assign m_axis_bram_58_tkeep = dwconv1_tkeep[58][C_OUTPUT_BRAM_58_DMWIDTH/8-1:0];
            assign m_axis_bram_58_tstrb = dwconv1_tstrb[58][C_OUTPUT_BRAM_58_DMWIDTH/8-1:0];
            assign m_axis_bram_58_tdata = dwconv1_tdata[58][C_OUTPUT_BRAM_58_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 59) begin
            assign tlast[59] = s_axis_bram_59_tlast;
            assign tvalid[59] = s_axis_bram_59_tvalid;
            assign tkeep[59][C_INPUT_BRAM_59_DMWIDTH/8-1:0] = s_axis_bram_59_tkeep;
            assign tstrb[59][C_INPUT_BRAM_59_DMWIDTH/8-1:0] = s_axis_bram_59_tstrb;
            assign tdata[59][C_INPUT_BRAM_59_DMWIDTH-1:0] = s_axis_bram_59_tdata;
            assign s_axis_bram_59_tready = tready[59];
            
            assign addr0[59][C_INPUT_BRAM_59_ADDR_WIDTH-1:0] = ap_bram_59_addr0;
            assign din0[59][C_INPUT_BRAM_59_WIDTH-1:0] = ap_bram_59_din0;
            assign ap_bram_59_dout0 = dout0[59][C_INPUT_BRAM_59_WIDTH-1:0];
            assign we0[59][C_INPUT_BRAM_59_WIDTH/8-1:0] = ap_bram_59_we0;
            assign en0[59] = ap_bram_59_en0;
            assign addr1[59][C_INPUT_BRAM_59_ADDR_WIDTH-1:0] = ap_bram_59_addr1;
            assign din1[59][C_INPUT_BRAM_59_WIDTH-1:0] = ap_bram_59_din1;
            assign ap_bram_59_dout1 = dout1[59][C_INPUT_BRAM_59_WIDTH-1:0];
            assign we1[59][C_INPUT_BRAM_59_WIDTH/8-1:0] = ap_bram_59_we1;
            assign en1[59] = ap_bram_59_en1;
            
            assign dwconv1_tready[59] = m_axis_bram_59_tready;
            assign m_axis_bram_59_tlast = dwconv1_tlast[59];
            assign m_axis_bram_59_tvalid = dwconv1_tvalid[59];
            assign m_axis_bram_59_tkeep = dwconv1_tkeep[59][C_OUTPUT_BRAM_59_DMWIDTH/8-1:0];
            assign m_axis_bram_59_tstrb = dwconv1_tstrb[59][C_OUTPUT_BRAM_59_DMWIDTH/8-1:0];
            assign m_axis_bram_59_tdata = dwconv1_tdata[59][C_OUTPUT_BRAM_59_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 60) begin
            assign tlast[60] = s_axis_bram_60_tlast;
            assign tvalid[60] = s_axis_bram_60_tvalid;
            assign tkeep[60][C_INPUT_BRAM_60_DMWIDTH/8-1:0] = s_axis_bram_60_tkeep;
            assign tstrb[60][C_INPUT_BRAM_60_DMWIDTH/8-1:0] = s_axis_bram_60_tstrb;
            assign tdata[60][C_INPUT_BRAM_60_DMWIDTH-1:0] = s_axis_bram_60_tdata;
            assign s_axis_bram_60_tready = tready[60];
            
            assign addr0[60][C_INPUT_BRAM_60_ADDR_WIDTH-1:0] = ap_bram_60_addr0;
            assign din0[60][C_INPUT_BRAM_60_WIDTH-1:0] = ap_bram_60_din0;
            assign ap_bram_60_dout0 = dout0[60][C_INPUT_BRAM_60_WIDTH-1:0];
            assign we0[60][C_INPUT_BRAM_60_WIDTH/8-1:0] = ap_bram_60_we0;
            assign en0[60] = ap_bram_60_en0;
            assign addr1[60][C_INPUT_BRAM_60_ADDR_WIDTH-1:0] = ap_bram_60_addr1;
            assign din1[60][C_INPUT_BRAM_60_WIDTH-1:0] = ap_bram_60_din1;
            assign ap_bram_60_dout1 = dout1[60][C_INPUT_BRAM_60_WIDTH-1:0];
            assign we1[60][C_INPUT_BRAM_60_WIDTH/8-1:0] = ap_bram_60_we1;
            assign en1[60] = ap_bram_60_en1;
            
            assign dwconv1_tready[60] = m_axis_bram_60_tready;
            assign m_axis_bram_60_tlast = dwconv1_tlast[60];
            assign m_axis_bram_60_tvalid = dwconv1_tvalid[60];
            assign m_axis_bram_60_tkeep = dwconv1_tkeep[60][C_OUTPUT_BRAM_60_DMWIDTH/8-1:0];
            assign m_axis_bram_60_tstrb = dwconv1_tstrb[60][C_OUTPUT_BRAM_60_DMWIDTH/8-1:0];
            assign m_axis_bram_60_tdata = dwconv1_tdata[60][C_OUTPUT_BRAM_60_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 61) begin
            assign tlast[61] = s_axis_bram_61_tlast;
            assign tvalid[61] = s_axis_bram_61_tvalid;
            assign tkeep[61][C_INPUT_BRAM_61_DMWIDTH/8-1:0] = s_axis_bram_61_tkeep;
            assign tstrb[61][C_INPUT_BRAM_61_DMWIDTH/8-1:0] = s_axis_bram_61_tstrb;
            assign tdata[61][C_INPUT_BRAM_61_DMWIDTH-1:0] = s_axis_bram_61_tdata;
            assign s_axis_bram_61_tready = tready[61];
            
            assign addr0[61][C_INPUT_BRAM_61_ADDR_WIDTH-1:0] = ap_bram_61_addr0;
            assign din0[61][C_INPUT_BRAM_61_WIDTH-1:0] = ap_bram_61_din0;
            assign ap_bram_61_dout0 = dout0[61][C_INPUT_BRAM_61_WIDTH-1:0];
            assign we0[61][C_INPUT_BRAM_61_WIDTH/8-1:0] = ap_bram_61_we0;
            assign en0[61] = ap_bram_61_en0;
            assign addr1[61][C_INPUT_BRAM_61_ADDR_WIDTH-1:0] = ap_bram_61_addr1;
            assign din1[61][C_INPUT_BRAM_61_WIDTH-1:0] = ap_bram_61_din1;
            assign ap_bram_61_dout1 = dout1[61][C_INPUT_BRAM_61_WIDTH-1:0];
            assign we1[61][C_INPUT_BRAM_61_WIDTH/8-1:0] = ap_bram_61_we1;
            assign en1[61] = ap_bram_61_en1;
            
            assign dwconv1_tready[61] = m_axis_bram_61_tready;
            assign m_axis_bram_61_tlast = dwconv1_tlast[61];
            assign m_axis_bram_61_tvalid = dwconv1_tvalid[61];
            assign m_axis_bram_61_tkeep = dwconv1_tkeep[61][C_OUTPUT_BRAM_61_DMWIDTH/8-1:0];
            assign m_axis_bram_61_tstrb = dwconv1_tstrb[61][C_OUTPUT_BRAM_61_DMWIDTH/8-1:0];
            assign m_axis_bram_61_tdata = dwconv1_tdata[61][C_OUTPUT_BRAM_61_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 62) begin
            assign tlast[62] = s_axis_bram_62_tlast;
            assign tvalid[62] = s_axis_bram_62_tvalid;
            assign tkeep[62][C_INPUT_BRAM_62_DMWIDTH/8-1:0] = s_axis_bram_62_tkeep;
            assign tstrb[62][C_INPUT_BRAM_62_DMWIDTH/8-1:0] = s_axis_bram_62_tstrb;
            assign tdata[62][C_INPUT_BRAM_62_DMWIDTH-1:0] = s_axis_bram_62_tdata;
            assign s_axis_bram_62_tready = tready[62];
            
            assign addr0[62][C_INPUT_BRAM_62_ADDR_WIDTH-1:0] = ap_bram_62_addr0;
            assign din0[62][C_INPUT_BRAM_62_WIDTH-1:0] = ap_bram_62_din0;
            assign ap_bram_62_dout0 = dout0[62][C_INPUT_BRAM_62_WIDTH-1:0];
            assign we0[62][C_INPUT_BRAM_62_WIDTH/8-1:0] = ap_bram_62_we0;
            assign en0[62] = ap_bram_62_en0;
            assign addr1[62][C_INPUT_BRAM_62_ADDR_WIDTH-1:0] = ap_bram_62_addr1;
            assign din1[62][C_INPUT_BRAM_62_WIDTH-1:0] = ap_bram_62_din1;
            assign ap_bram_62_dout1 = dout1[62][C_INPUT_BRAM_62_WIDTH-1:0];
            assign we1[62][C_INPUT_BRAM_62_WIDTH/8-1:0] = ap_bram_62_we1;
            assign en1[62] = ap_bram_62_en1;
            
            assign dwconv1_tready[62] = m_axis_bram_62_tready;
            assign m_axis_bram_62_tlast = dwconv1_tlast[62];
            assign m_axis_bram_62_tvalid = dwconv1_tvalid[62];
            assign m_axis_bram_62_tkeep = dwconv1_tkeep[62][C_OUTPUT_BRAM_62_DMWIDTH/8-1:0];
            assign m_axis_bram_62_tstrb = dwconv1_tstrb[62][C_OUTPUT_BRAM_62_DMWIDTH/8-1:0];
            assign m_axis_bram_62_tdata = dwconv1_tdata[62][C_OUTPUT_BRAM_62_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 63) begin
            assign tlast[63] = s_axis_bram_63_tlast;
            assign tvalid[63] = s_axis_bram_63_tvalid;
            assign tkeep[63][C_INPUT_BRAM_63_DMWIDTH/8-1:0] = s_axis_bram_63_tkeep;
            assign tstrb[63][C_INPUT_BRAM_63_DMWIDTH/8-1:0] = s_axis_bram_63_tstrb;
            assign tdata[63][C_INPUT_BRAM_63_DMWIDTH-1:0] = s_axis_bram_63_tdata;
            assign s_axis_bram_63_tready = tready[63];
            
            assign addr0[63][C_INPUT_BRAM_63_ADDR_WIDTH-1:0] = ap_bram_63_addr0;
            assign din0[63][C_INPUT_BRAM_63_WIDTH-1:0] = ap_bram_63_din0;
            assign ap_bram_63_dout0 = dout0[63][C_INPUT_BRAM_63_WIDTH-1:0];
            assign we0[63][C_INPUT_BRAM_63_WIDTH/8-1:0] = ap_bram_63_we0;
            assign en0[63] = ap_bram_63_en0;
            assign addr1[63][C_INPUT_BRAM_63_ADDR_WIDTH-1:0] = ap_bram_63_addr1;
            assign din1[63][C_INPUT_BRAM_63_WIDTH-1:0] = ap_bram_63_din1;
            assign ap_bram_63_dout1 = dout1[63][C_INPUT_BRAM_63_WIDTH-1:0];
            assign we1[63][C_INPUT_BRAM_63_WIDTH/8-1:0] = ap_bram_63_we1;
            assign en1[63] = ap_bram_63_en1;
            
            assign dwconv1_tready[63] = m_axis_bram_63_tready;
            assign m_axis_bram_63_tlast = dwconv1_tlast[63];
            assign m_axis_bram_63_tvalid = dwconv1_tvalid[63];
            assign m_axis_bram_63_tkeep = dwconv1_tkeep[63][C_OUTPUT_BRAM_63_DMWIDTH/8-1:0];
            assign m_axis_bram_63_tstrb = dwconv1_tstrb[63][C_OUTPUT_BRAM_63_DMWIDTH/8-1:0];
            assign m_axis_bram_63_tdata = dwconv1_tdata[63][C_OUTPUT_BRAM_63_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 64) begin
            assign tlast[64] = s_axis_bram_64_tlast;
            assign tvalid[64] = s_axis_bram_64_tvalid;
            assign tkeep[64][C_INPUT_BRAM_64_DMWIDTH/8-1:0] = s_axis_bram_64_tkeep;
            assign tstrb[64][C_INPUT_BRAM_64_DMWIDTH/8-1:0] = s_axis_bram_64_tstrb;
            assign tdata[64][C_INPUT_BRAM_64_DMWIDTH-1:0] = s_axis_bram_64_tdata;
            assign s_axis_bram_64_tready = tready[64];
            
            assign addr0[64][C_INPUT_BRAM_64_ADDR_WIDTH-1:0] = ap_bram_64_addr0;
            assign din0[64][C_INPUT_BRAM_64_WIDTH-1:0] = ap_bram_64_din0;
            assign ap_bram_64_dout0 = dout0[64][C_INPUT_BRAM_64_WIDTH-1:0];
            assign we0[64][C_INPUT_BRAM_64_WIDTH/8-1:0] = ap_bram_64_we0;
            assign en0[64] = ap_bram_64_en0;
            assign addr1[64][C_INPUT_BRAM_64_ADDR_WIDTH-1:0] = ap_bram_64_addr1;
            assign din1[64][C_INPUT_BRAM_64_WIDTH-1:0] = ap_bram_64_din1;
            assign ap_bram_64_dout1 = dout1[64][C_INPUT_BRAM_64_WIDTH-1:0];
            assign we1[64][C_INPUT_BRAM_64_WIDTH/8-1:0] = ap_bram_64_we1;
            assign en1[64] = ap_bram_64_en1;
            
            assign dwconv1_tready[64] = m_axis_bram_64_tready;
            assign m_axis_bram_64_tlast = dwconv1_tlast[64];
            assign m_axis_bram_64_tvalid = dwconv1_tvalid[64];
            assign m_axis_bram_64_tkeep = dwconv1_tkeep[64][C_OUTPUT_BRAM_64_DMWIDTH/8-1:0];
            assign m_axis_bram_64_tstrb = dwconv1_tstrb[64][C_OUTPUT_BRAM_64_DMWIDTH/8-1:0];
            assign m_axis_bram_64_tdata = dwconv1_tdata[64][C_OUTPUT_BRAM_64_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 65) begin
            assign tlast[65] = s_axis_bram_65_tlast;
            assign tvalid[65] = s_axis_bram_65_tvalid;
            assign tkeep[65][C_INPUT_BRAM_65_DMWIDTH/8-1:0] = s_axis_bram_65_tkeep;
            assign tstrb[65][C_INPUT_BRAM_65_DMWIDTH/8-1:0] = s_axis_bram_65_tstrb;
            assign tdata[65][C_INPUT_BRAM_65_DMWIDTH-1:0] = s_axis_bram_65_tdata;
            assign s_axis_bram_65_tready = tready[65];
            
            assign addr0[65][C_INPUT_BRAM_65_ADDR_WIDTH-1:0] = ap_bram_65_addr0;
            assign din0[65][C_INPUT_BRAM_65_WIDTH-1:0] = ap_bram_65_din0;
            assign ap_bram_65_dout0 = dout0[65][C_INPUT_BRAM_65_WIDTH-1:0];
            assign we0[65][C_INPUT_BRAM_65_WIDTH/8-1:0] = ap_bram_65_we0;
            assign en0[65] = ap_bram_65_en0;
            assign addr1[65][C_INPUT_BRAM_65_ADDR_WIDTH-1:0] = ap_bram_65_addr1;
            assign din1[65][C_INPUT_BRAM_65_WIDTH-1:0] = ap_bram_65_din1;
            assign ap_bram_65_dout1 = dout1[65][C_INPUT_BRAM_65_WIDTH-1:0];
            assign we1[65][C_INPUT_BRAM_65_WIDTH/8-1:0] = ap_bram_65_we1;
            assign en1[65] = ap_bram_65_en1;
            
            assign dwconv1_tready[65] = m_axis_bram_65_tready;
            assign m_axis_bram_65_tlast = dwconv1_tlast[65];
            assign m_axis_bram_65_tvalid = dwconv1_tvalid[65];
            assign m_axis_bram_65_tkeep = dwconv1_tkeep[65][C_OUTPUT_BRAM_65_DMWIDTH/8-1:0];
            assign m_axis_bram_65_tstrb = dwconv1_tstrb[65][C_OUTPUT_BRAM_65_DMWIDTH/8-1:0];
            assign m_axis_bram_65_tdata = dwconv1_tdata[65][C_OUTPUT_BRAM_65_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 66) begin
            assign tlast[66] = s_axis_bram_66_tlast;
            assign tvalid[66] = s_axis_bram_66_tvalid;
            assign tkeep[66][C_INPUT_BRAM_66_DMWIDTH/8-1:0] = s_axis_bram_66_tkeep;
            assign tstrb[66][C_INPUT_BRAM_66_DMWIDTH/8-1:0] = s_axis_bram_66_tstrb;
            assign tdata[66][C_INPUT_BRAM_66_DMWIDTH-1:0] = s_axis_bram_66_tdata;
            assign s_axis_bram_66_tready = tready[66];
            
            assign addr0[66][C_INPUT_BRAM_66_ADDR_WIDTH-1:0] = ap_bram_66_addr0;
            assign din0[66][C_INPUT_BRAM_66_WIDTH-1:0] = ap_bram_66_din0;
            assign ap_bram_66_dout0 = dout0[66][C_INPUT_BRAM_66_WIDTH-1:0];
            assign we0[66][C_INPUT_BRAM_66_WIDTH/8-1:0] = ap_bram_66_we0;
            assign en0[66] = ap_bram_66_en0;
            assign addr1[66][C_INPUT_BRAM_66_ADDR_WIDTH-1:0] = ap_bram_66_addr1;
            assign din1[66][C_INPUT_BRAM_66_WIDTH-1:0] = ap_bram_66_din1;
            assign ap_bram_66_dout1 = dout1[66][C_INPUT_BRAM_66_WIDTH-1:0];
            assign we1[66][C_INPUT_BRAM_66_WIDTH/8-1:0] = ap_bram_66_we1;
            assign en1[66] = ap_bram_66_en1;
            
            assign dwconv1_tready[66] = m_axis_bram_66_tready;
            assign m_axis_bram_66_tlast = dwconv1_tlast[66];
            assign m_axis_bram_66_tvalid = dwconv1_tvalid[66];
            assign m_axis_bram_66_tkeep = dwconv1_tkeep[66][C_OUTPUT_BRAM_66_DMWIDTH/8-1:0];
            assign m_axis_bram_66_tstrb = dwconv1_tstrb[66][C_OUTPUT_BRAM_66_DMWIDTH/8-1:0];
            assign m_axis_bram_66_tdata = dwconv1_tdata[66][C_OUTPUT_BRAM_66_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 67) begin
            assign tlast[67] = s_axis_bram_67_tlast;
            assign tvalid[67] = s_axis_bram_67_tvalid;
            assign tkeep[67][C_INPUT_BRAM_67_DMWIDTH/8-1:0] = s_axis_bram_67_tkeep;
            assign tstrb[67][C_INPUT_BRAM_67_DMWIDTH/8-1:0] = s_axis_bram_67_tstrb;
            assign tdata[67][C_INPUT_BRAM_67_DMWIDTH-1:0] = s_axis_bram_67_tdata;
            assign s_axis_bram_67_tready = tready[67];
            
            assign addr0[67][C_INPUT_BRAM_67_ADDR_WIDTH-1:0] = ap_bram_67_addr0;
            assign din0[67][C_INPUT_BRAM_67_WIDTH-1:0] = ap_bram_67_din0;
            assign ap_bram_67_dout0 = dout0[67][C_INPUT_BRAM_67_WIDTH-1:0];
            assign we0[67][C_INPUT_BRAM_67_WIDTH/8-1:0] = ap_bram_67_we0;
            assign en0[67] = ap_bram_67_en0;
            assign addr1[67][C_INPUT_BRAM_67_ADDR_WIDTH-1:0] = ap_bram_67_addr1;
            assign din1[67][C_INPUT_BRAM_67_WIDTH-1:0] = ap_bram_67_din1;
            assign ap_bram_67_dout1 = dout1[67][C_INPUT_BRAM_67_WIDTH-1:0];
            assign we1[67][C_INPUT_BRAM_67_WIDTH/8-1:0] = ap_bram_67_we1;
            assign en1[67] = ap_bram_67_en1;
            
            assign dwconv1_tready[67] = m_axis_bram_67_tready;
            assign m_axis_bram_67_tlast = dwconv1_tlast[67];
            assign m_axis_bram_67_tvalid = dwconv1_tvalid[67];
            assign m_axis_bram_67_tkeep = dwconv1_tkeep[67][C_OUTPUT_BRAM_67_DMWIDTH/8-1:0];
            assign m_axis_bram_67_tstrb = dwconv1_tstrb[67][C_OUTPUT_BRAM_67_DMWIDTH/8-1:0];
            assign m_axis_bram_67_tdata = dwconv1_tdata[67][C_OUTPUT_BRAM_67_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 68) begin
            assign tlast[68] = s_axis_bram_68_tlast;
            assign tvalid[68] = s_axis_bram_68_tvalid;
            assign tkeep[68][C_INPUT_BRAM_68_DMWIDTH/8-1:0] = s_axis_bram_68_tkeep;
            assign tstrb[68][C_INPUT_BRAM_68_DMWIDTH/8-1:0] = s_axis_bram_68_tstrb;
            assign tdata[68][C_INPUT_BRAM_68_DMWIDTH-1:0] = s_axis_bram_68_tdata;
            assign s_axis_bram_68_tready = tready[68];
            
            assign addr0[68][C_INPUT_BRAM_68_ADDR_WIDTH-1:0] = ap_bram_68_addr0;
            assign din0[68][C_INPUT_BRAM_68_WIDTH-1:0] = ap_bram_68_din0;
            assign ap_bram_68_dout0 = dout0[68][C_INPUT_BRAM_68_WIDTH-1:0];
            assign we0[68][C_INPUT_BRAM_68_WIDTH/8-1:0] = ap_bram_68_we0;
            assign en0[68] = ap_bram_68_en0;
            assign addr1[68][C_INPUT_BRAM_68_ADDR_WIDTH-1:0] = ap_bram_68_addr1;
            assign din1[68][C_INPUT_BRAM_68_WIDTH-1:0] = ap_bram_68_din1;
            assign ap_bram_68_dout1 = dout1[68][C_INPUT_BRAM_68_WIDTH-1:0];
            assign we1[68][C_INPUT_BRAM_68_WIDTH/8-1:0] = ap_bram_68_we1;
            assign en1[68] = ap_bram_68_en1;
            
            assign dwconv1_tready[68] = m_axis_bram_68_tready;
            assign m_axis_bram_68_tlast = dwconv1_tlast[68];
            assign m_axis_bram_68_tvalid = dwconv1_tvalid[68];
            assign m_axis_bram_68_tkeep = dwconv1_tkeep[68][C_OUTPUT_BRAM_68_DMWIDTH/8-1:0];
            assign m_axis_bram_68_tstrb = dwconv1_tstrb[68][C_OUTPUT_BRAM_68_DMWIDTH/8-1:0];
            assign m_axis_bram_68_tdata = dwconv1_tdata[68][C_OUTPUT_BRAM_68_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 69) begin
            assign tlast[69] = s_axis_bram_69_tlast;
            assign tvalid[69] = s_axis_bram_69_tvalid;
            assign tkeep[69][C_INPUT_BRAM_69_DMWIDTH/8-1:0] = s_axis_bram_69_tkeep;
            assign tstrb[69][C_INPUT_BRAM_69_DMWIDTH/8-1:0] = s_axis_bram_69_tstrb;
            assign tdata[69][C_INPUT_BRAM_69_DMWIDTH-1:0] = s_axis_bram_69_tdata;
            assign s_axis_bram_69_tready = tready[69];
            
            assign addr0[69][C_INPUT_BRAM_69_ADDR_WIDTH-1:0] = ap_bram_69_addr0;
            assign din0[69][C_INPUT_BRAM_69_WIDTH-1:0] = ap_bram_69_din0;
            assign ap_bram_69_dout0 = dout0[69][C_INPUT_BRAM_69_WIDTH-1:0];
            assign we0[69][C_INPUT_BRAM_69_WIDTH/8-1:0] = ap_bram_69_we0;
            assign en0[69] = ap_bram_69_en0;
            assign addr1[69][C_INPUT_BRAM_69_ADDR_WIDTH-1:0] = ap_bram_69_addr1;
            assign din1[69][C_INPUT_BRAM_69_WIDTH-1:0] = ap_bram_69_din1;
            assign ap_bram_69_dout1 = dout1[69][C_INPUT_BRAM_69_WIDTH-1:0];
            assign we1[69][C_INPUT_BRAM_69_WIDTH/8-1:0] = ap_bram_69_we1;
            assign en1[69] = ap_bram_69_en1;
            
            assign dwconv1_tready[69] = m_axis_bram_69_tready;
            assign m_axis_bram_69_tlast = dwconv1_tlast[69];
            assign m_axis_bram_69_tvalid = dwconv1_tvalid[69];
            assign m_axis_bram_69_tkeep = dwconv1_tkeep[69][C_OUTPUT_BRAM_69_DMWIDTH/8-1:0];
            assign m_axis_bram_69_tstrb = dwconv1_tstrb[69][C_OUTPUT_BRAM_69_DMWIDTH/8-1:0];
            assign m_axis_bram_69_tdata = dwconv1_tdata[69][C_OUTPUT_BRAM_69_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 70) begin
            assign tlast[70] = s_axis_bram_70_tlast;
            assign tvalid[70] = s_axis_bram_70_tvalid;
            assign tkeep[70][C_INPUT_BRAM_70_DMWIDTH/8-1:0] = s_axis_bram_70_tkeep;
            assign tstrb[70][C_INPUT_BRAM_70_DMWIDTH/8-1:0] = s_axis_bram_70_tstrb;
            assign tdata[70][C_INPUT_BRAM_70_DMWIDTH-1:0] = s_axis_bram_70_tdata;
            assign s_axis_bram_70_tready = tready[70];
            
            assign addr0[70][C_INPUT_BRAM_70_ADDR_WIDTH-1:0] = ap_bram_70_addr0;
            assign din0[70][C_INPUT_BRAM_70_WIDTH-1:0] = ap_bram_70_din0;
            assign ap_bram_70_dout0 = dout0[70][C_INPUT_BRAM_70_WIDTH-1:0];
            assign we0[70][C_INPUT_BRAM_70_WIDTH/8-1:0] = ap_bram_70_we0;
            assign en0[70] = ap_bram_70_en0;
            assign addr1[70][C_INPUT_BRAM_70_ADDR_WIDTH-1:0] = ap_bram_70_addr1;
            assign din1[70][C_INPUT_BRAM_70_WIDTH-1:0] = ap_bram_70_din1;
            assign ap_bram_70_dout1 = dout1[70][C_INPUT_BRAM_70_WIDTH-1:0];
            assign we1[70][C_INPUT_BRAM_70_WIDTH/8-1:0] = ap_bram_70_we1;
            assign en1[70] = ap_bram_70_en1;
            
            assign dwconv1_tready[70] = m_axis_bram_70_tready;
            assign m_axis_bram_70_tlast = dwconv1_tlast[70];
            assign m_axis_bram_70_tvalid = dwconv1_tvalid[70];
            assign m_axis_bram_70_tkeep = dwconv1_tkeep[70][C_OUTPUT_BRAM_70_DMWIDTH/8-1:0];
            assign m_axis_bram_70_tstrb = dwconv1_tstrb[70][C_OUTPUT_BRAM_70_DMWIDTH/8-1:0];
            assign m_axis_bram_70_tdata = dwconv1_tdata[70][C_OUTPUT_BRAM_70_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 71) begin
            assign tlast[71] = s_axis_bram_71_tlast;
            assign tvalid[71] = s_axis_bram_71_tvalid;
            assign tkeep[71][C_INPUT_BRAM_71_DMWIDTH/8-1:0] = s_axis_bram_71_tkeep;
            assign tstrb[71][C_INPUT_BRAM_71_DMWIDTH/8-1:0] = s_axis_bram_71_tstrb;
            assign tdata[71][C_INPUT_BRAM_71_DMWIDTH-1:0] = s_axis_bram_71_tdata;
            assign s_axis_bram_71_tready = tready[71];
            
            assign addr0[71][C_INPUT_BRAM_71_ADDR_WIDTH-1:0] = ap_bram_71_addr0;
            assign din0[71][C_INPUT_BRAM_71_WIDTH-1:0] = ap_bram_71_din0;
            assign ap_bram_71_dout0 = dout0[71][C_INPUT_BRAM_71_WIDTH-1:0];
            assign we0[71][C_INPUT_BRAM_71_WIDTH/8-1:0] = ap_bram_71_we0;
            assign en0[71] = ap_bram_71_en0;
            assign addr1[71][C_INPUT_BRAM_71_ADDR_WIDTH-1:0] = ap_bram_71_addr1;
            assign din1[71][C_INPUT_BRAM_71_WIDTH-1:0] = ap_bram_71_din1;
            assign ap_bram_71_dout1 = dout1[71][C_INPUT_BRAM_71_WIDTH-1:0];
            assign we1[71][C_INPUT_BRAM_71_WIDTH/8-1:0] = ap_bram_71_we1;
            assign en1[71] = ap_bram_71_en1;
            
            assign dwconv1_tready[71] = m_axis_bram_71_tready;
            assign m_axis_bram_71_tlast = dwconv1_tlast[71];
            assign m_axis_bram_71_tvalid = dwconv1_tvalid[71];
            assign m_axis_bram_71_tkeep = dwconv1_tkeep[71][C_OUTPUT_BRAM_71_DMWIDTH/8-1:0];
            assign m_axis_bram_71_tstrb = dwconv1_tstrb[71][C_OUTPUT_BRAM_71_DMWIDTH/8-1:0];
            assign m_axis_bram_71_tdata = dwconv1_tdata[71][C_OUTPUT_BRAM_71_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 72) begin
            assign tlast[72] = s_axis_bram_72_tlast;
            assign tvalid[72] = s_axis_bram_72_tvalid;
            assign tkeep[72][C_INPUT_BRAM_72_DMWIDTH/8-1:0] = s_axis_bram_72_tkeep;
            assign tstrb[72][C_INPUT_BRAM_72_DMWIDTH/8-1:0] = s_axis_bram_72_tstrb;
            assign tdata[72][C_INPUT_BRAM_72_DMWIDTH-1:0] = s_axis_bram_72_tdata;
            assign s_axis_bram_72_tready = tready[72];
            
            assign addr0[72][C_INPUT_BRAM_72_ADDR_WIDTH-1:0] = ap_bram_72_addr0;
            assign din0[72][C_INPUT_BRAM_72_WIDTH-1:0] = ap_bram_72_din0;
            assign ap_bram_72_dout0 = dout0[72][C_INPUT_BRAM_72_WIDTH-1:0];
            assign we0[72][C_INPUT_BRAM_72_WIDTH/8-1:0] = ap_bram_72_we0;
            assign en0[72] = ap_bram_72_en0;
            assign addr1[72][C_INPUT_BRAM_72_ADDR_WIDTH-1:0] = ap_bram_72_addr1;
            assign din1[72][C_INPUT_BRAM_72_WIDTH-1:0] = ap_bram_72_din1;
            assign ap_bram_72_dout1 = dout1[72][C_INPUT_BRAM_72_WIDTH-1:0];
            assign we1[72][C_INPUT_BRAM_72_WIDTH/8-1:0] = ap_bram_72_we1;
            assign en1[72] = ap_bram_72_en1;
            
            assign dwconv1_tready[72] = m_axis_bram_72_tready;
            assign m_axis_bram_72_tlast = dwconv1_tlast[72];
            assign m_axis_bram_72_tvalid = dwconv1_tvalid[72];
            assign m_axis_bram_72_tkeep = dwconv1_tkeep[72][C_OUTPUT_BRAM_72_DMWIDTH/8-1:0];
            assign m_axis_bram_72_tstrb = dwconv1_tstrb[72][C_OUTPUT_BRAM_72_DMWIDTH/8-1:0];
            assign m_axis_bram_72_tdata = dwconv1_tdata[72][C_OUTPUT_BRAM_72_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 73) begin
            assign tlast[73] = s_axis_bram_73_tlast;
            assign tvalid[73] = s_axis_bram_73_tvalid;
            assign tkeep[73][C_INPUT_BRAM_73_DMWIDTH/8-1:0] = s_axis_bram_73_tkeep;
            assign tstrb[73][C_INPUT_BRAM_73_DMWIDTH/8-1:0] = s_axis_bram_73_tstrb;
            assign tdata[73][C_INPUT_BRAM_73_DMWIDTH-1:0] = s_axis_bram_73_tdata;
            assign s_axis_bram_73_tready = tready[73];
            
            assign addr0[73][C_INPUT_BRAM_73_ADDR_WIDTH-1:0] = ap_bram_73_addr0;
            assign din0[73][C_INPUT_BRAM_73_WIDTH-1:0] = ap_bram_73_din0;
            assign ap_bram_73_dout0 = dout0[73][C_INPUT_BRAM_73_WIDTH-1:0];
            assign we0[73][C_INPUT_BRAM_73_WIDTH/8-1:0] = ap_bram_73_we0;
            assign en0[73] = ap_bram_73_en0;
            assign addr1[73][C_INPUT_BRAM_73_ADDR_WIDTH-1:0] = ap_bram_73_addr1;
            assign din1[73][C_INPUT_BRAM_73_WIDTH-1:0] = ap_bram_73_din1;
            assign ap_bram_73_dout1 = dout1[73][C_INPUT_BRAM_73_WIDTH-1:0];
            assign we1[73][C_INPUT_BRAM_73_WIDTH/8-1:0] = ap_bram_73_we1;
            assign en1[73] = ap_bram_73_en1;
            
            assign dwconv1_tready[73] = m_axis_bram_73_tready;
            assign m_axis_bram_73_tlast = dwconv1_tlast[73];
            assign m_axis_bram_73_tvalid = dwconv1_tvalid[73];
            assign m_axis_bram_73_tkeep = dwconv1_tkeep[73][C_OUTPUT_BRAM_73_DMWIDTH/8-1:0];
            assign m_axis_bram_73_tstrb = dwconv1_tstrb[73][C_OUTPUT_BRAM_73_DMWIDTH/8-1:0];
            assign m_axis_bram_73_tdata = dwconv1_tdata[73][C_OUTPUT_BRAM_73_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 74) begin
            assign tlast[74] = s_axis_bram_74_tlast;
            assign tvalid[74] = s_axis_bram_74_tvalid;
            assign tkeep[74][C_INPUT_BRAM_74_DMWIDTH/8-1:0] = s_axis_bram_74_tkeep;
            assign tstrb[74][C_INPUT_BRAM_74_DMWIDTH/8-1:0] = s_axis_bram_74_tstrb;
            assign tdata[74][C_INPUT_BRAM_74_DMWIDTH-1:0] = s_axis_bram_74_tdata;
            assign s_axis_bram_74_tready = tready[74];
            
            assign addr0[74][C_INPUT_BRAM_74_ADDR_WIDTH-1:0] = ap_bram_74_addr0;
            assign din0[74][C_INPUT_BRAM_74_WIDTH-1:0] = ap_bram_74_din0;
            assign ap_bram_74_dout0 = dout0[74][C_INPUT_BRAM_74_WIDTH-1:0];
            assign we0[74][C_INPUT_BRAM_74_WIDTH/8-1:0] = ap_bram_74_we0;
            assign en0[74] = ap_bram_74_en0;
            assign addr1[74][C_INPUT_BRAM_74_ADDR_WIDTH-1:0] = ap_bram_74_addr1;
            assign din1[74][C_INPUT_BRAM_74_WIDTH-1:0] = ap_bram_74_din1;
            assign ap_bram_74_dout1 = dout1[74][C_INPUT_BRAM_74_WIDTH-1:0];
            assign we1[74][C_INPUT_BRAM_74_WIDTH/8-1:0] = ap_bram_74_we1;
            assign en1[74] = ap_bram_74_en1;
            
            assign dwconv1_tready[74] = m_axis_bram_74_tready;
            assign m_axis_bram_74_tlast = dwconv1_tlast[74];
            assign m_axis_bram_74_tvalid = dwconv1_tvalid[74];
            assign m_axis_bram_74_tkeep = dwconv1_tkeep[74][C_OUTPUT_BRAM_74_DMWIDTH/8-1:0];
            assign m_axis_bram_74_tstrb = dwconv1_tstrb[74][C_OUTPUT_BRAM_74_DMWIDTH/8-1:0];
            assign m_axis_bram_74_tdata = dwconv1_tdata[74][C_OUTPUT_BRAM_74_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 75) begin
            assign tlast[75] = s_axis_bram_75_tlast;
            assign tvalid[75] = s_axis_bram_75_tvalid;
            assign tkeep[75][C_INPUT_BRAM_75_DMWIDTH/8-1:0] = s_axis_bram_75_tkeep;
            assign tstrb[75][C_INPUT_BRAM_75_DMWIDTH/8-1:0] = s_axis_bram_75_tstrb;
            assign tdata[75][C_INPUT_BRAM_75_DMWIDTH-1:0] = s_axis_bram_75_tdata;
            assign s_axis_bram_75_tready = tready[75];
            
            assign addr0[75][C_INPUT_BRAM_75_ADDR_WIDTH-1:0] = ap_bram_75_addr0;
            assign din0[75][C_INPUT_BRAM_75_WIDTH-1:0] = ap_bram_75_din0;
            assign ap_bram_75_dout0 = dout0[75][C_INPUT_BRAM_75_WIDTH-1:0];
            assign we0[75][C_INPUT_BRAM_75_WIDTH/8-1:0] = ap_bram_75_we0;
            assign en0[75] = ap_bram_75_en0;
            assign addr1[75][C_INPUT_BRAM_75_ADDR_WIDTH-1:0] = ap_bram_75_addr1;
            assign din1[75][C_INPUT_BRAM_75_WIDTH-1:0] = ap_bram_75_din1;
            assign ap_bram_75_dout1 = dout1[75][C_INPUT_BRAM_75_WIDTH-1:0];
            assign we1[75][C_INPUT_BRAM_75_WIDTH/8-1:0] = ap_bram_75_we1;
            assign en1[75] = ap_bram_75_en1;
            
            assign dwconv1_tready[75] = m_axis_bram_75_tready;
            assign m_axis_bram_75_tlast = dwconv1_tlast[75];
            assign m_axis_bram_75_tvalid = dwconv1_tvalid[75];
            assign m_axis_bram_75_tkeep = dwconv1_tkeep[75][C_OUTPUT_BRAM_75_DMWIDTH/8-1:0];
            assign m_axis_bram_75_tstrb = dwconv1_tstrb[75][C_OUTPUT_BRAM_75_DMWIDTH/8-1:0];
            assign m_axis_bram_75_tdata = dwconv1_tdata[75][C_OUTPUT_BRAM_75_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 76) begin
            assign tlast[76] = s_axis_bram_76_tlast;
            assign tvalid[76] = s_axis_bram_76_tvalid;
            assign tkeep[76][C_INPUT_BRAM_76_DMWIDTH/8-1:0] = s_axis_bram_76_tkeep;
            assign tstrb[76][C_INPUT_BRAM_76_DMWIDTH/8-1:0] = s_axis_bram_76_tstrb;
            assign tdata[76][C_INPUT_BRAM_76_DMWIDTH-1:0] = s_axis_bram_76_tdata;
            assign s_axis_bram_76_tready = tready[76];
            
            assign addr0[76][C_INPUT_BRAM_76_ADDR_WIDTH-1:0] = ap_bram_76_addr0;
            assign din0[76][C_INPUT_BRAM_76_WIDTH-1:0] = ap_bram_76_din0;
            assign ap_bram_76_dout0 = dout0[76][C_INPUT_BRAM_76_WIDTH-1:0];
            assign we0[76][C_INPUT_BRAM_76_WIDTH/8-1:0] = ap_bram_76_we0;
            assign en0[76] = ap_bram_76_en0;
            assign addr1[76][C_INPUT_BRAM_76_ADDR_WIDTH-1:0] = ap_bram_76_addr1;
            assign din1[76][C_INPUT_BRAM_76_WIDTH-1:0] = ap_bram_76_din1;
            assign ap_bram_76_dout1 = dout1[76][C_INPUT_BRAM_76_WIDTH-1:0];
            assign we1[76][C_INPUT_BRAM_76_WIDTH/8-1:0] = ap_bram_76_we1;
            assign en1[76] = ap_bram_76_en1;
            
            assign dwconv1_tready[76] = m_axis_bram_76_tready;
            assign m_axis_bram_76_tlast = dwconv1_tlast[76];
            assign m_axis_bram_76_tvalid = dwconv1_tvalid[76];
            assign m_axis_bram_76_tkeep = dwconv1_tkeep[76][C_OUTPUT_BRAM_76_DMWIDTH/8-1:0];
            assign m_axis_bram_76_tstrb = dwconv1_tstrb[76][C_OUTPUT_BRAM_76_DMWIDTH/8-1:0];
            assign m_axis_bram_76_tdata = dwconv1_tdata[76][C_OUTPUT_BRAM_76_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 77) begin
            assign tlast[77] = s_axis_bram_77_tlast;
            assign tvalid[77] = s_axis_bram_77_tvalid;
            assign tkeep[77][C_INPUT_BRAM_77_DMWIDTH/8-1:0] = s_axis_bram_77_tkeep;
            assign tstrb[77][C_INPUT_BRAM_77_DMWIDTH/8-1:0] = s_axis_bram_77_tstrb;
            assign tdata[77][C_INPUT_BRAM_77_DMWIDTH-1:0] = s_axis_bram_77_tdata;
            assign s_axis_bram_77_tready = tready[77];
            
            assign addr0[77][C_INPUT_BRAM_77_ADDR_WIDTH-1:0] = ap_bram_77_addr0;
            assign din0[77][C_INPUT_BRAM_77_WIDTH-1:0] = ap_bram_77_din0;
            assign ap_bram_77_dout0 = dout0[77][C_INPUT_BRAM_77_WIDTH-1:0];
            assign we0[77][C_INPUT_BRAM_77_WIDTH/8-1:0] = ap_bram_77_we0;
            assign en0[77] = ap_bram_77_en0;
            assign addr1[77][C_INPUT_BRAM_77_ADDR_WIDTH-1:0] = ap_bram_77_addr1;
            assign din1[77][C_INPUT_BRAM_77_WIDTH-1:0] = ap_bram_77_din1;
            assign ap_bram_77_dout1 = dout1[77][C_INPUT_BRAM_77_WIDTH-1:0];
            assign we1[77][C_INPUT_BRAM_77_WIDTH/8-1:0] = ap_bram_77_we1;
            assign en1[77] = ap_bram_77_en1;
            
            assign dwconv1_tready[77] = m_axis_bram_77_tready;
            assign m_axis_bram_77_tlast = dwconv1_tlast[77];
            assign m_axis_bram_77_tvalid = dwconv1_tvalid[77];
            assign m_axis_bram_77_tkeep = dwconv1_tkeep[77][C_OUTPUT_BRAM_77_DMWIDTH/8-1:0];
            assign m_axis_bram_77_tstrb = dwconv1_tstrb[77][C_OUTPUT_BRAM_77_DMWIDTH/8-1:0];
            assign m_axis_bram_77_tdata = dwconv1_tdata[77][C_OUTPUT_BRAM_77_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 78) begin
            assign tlast[78] = s_axis_bram_78_tlast;
            assign tvalid[78] = s_axis_bram_78_tvalid;
            assign tkeep[78][C_INPUT_BRAM_78_DMWIDTH/8-1:0] = s_axis_bram_78_tkeep;
            assign tstrb[78][C_INPUT_BRAM_78_DMWIDTH/8-1:0] = s_axis_bram_78_tstrb;
            assign tdata[78][C_INPUT_BRAM_78_DMWIDTH-1:0] = s_axis_bram_78_tdata;
            assign s_axis_bram_78_tready = tready[78];
            
            assign addr0[78][C_INPUT_BRAM_78_ADDR_WIDTH-1:0] = ap_bram_78_addr0;
            assign din0[78][C_INPUT_BRAM_78_WIDTH-1:0] = ap_bram_78_din0;
            assign ap_bram_78_dout0 = dout0[78][C_INPUT_BRAM_78_WIDTH-1:0];
            assign we0[78][C_INPUT_BRAM_78_WIDTH/8-1:0] = ap_bram_78_we0;
            assign en0[78] = ap_bram_78_en0;
            assign addr1[78][C_INPUT_BRAM_78_ADDR_WIDTH-1:0] = ap_bram_78_addr1;
            assign din1[78][C_INPUT_BRAM_78_WIDTH-1:0] = ap_bram_78_din1;
            assign ap_bram_78_dout1 = dout1[78][C_INPUT_BRAM_78_WIDTH-1:0];
            assign we1[78][C_INPUT_BRAM_78_WIDTH/8-1:0] = ap_bram_78_we1;
            assign en1[78] = ap_bram_78_en1;
            
            assign dwconv1_tready[78] = m_axis_bram_78_tready;
            assign m_axis_bram_78_tlast = dwconv1_tlast[78];
            assign m_axis_bram_78_tvalid = dwconv1_tvalid[78];
            assign m_axis_bram_78_tkeep = dwconv1_tkeep[78][C_OUTPUT_BRAM_78_DMWIDTH/8-1:0];
            assign m_axis_bram_78_tstrb = dwconv1_tstrb[78][C_OUTPUT_BRAM_78_DMWIDTH/8-1:0];
            assign m_axis_bram_78_tdata = dwconv1_tdata[78][C_OUTPUT_BRAM_78_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 79) begin
            assign tlast[79] = s_axis_bram_79_tlast;
            assign tvalid[79] = s_axis_bram_79_tvalid;
            assign tkeep[79][C_INPUT_BRAM_79_DMWIDTH/8-1:0] = s_axis_bram_79_tkeep;
            assign tstrb[79][C_INPUT_BRAM_79_DMWIDTH/8-1:0] = s_axis_bram_79_tstrb;
            assign tdata[79][C_INPUT_BRAM_79_DMWIDTH-1:0] = s_axis_bram_79_tdata;
            assign s_axis_bram_79_tready = tready[79];
            
            assign addr0[79][C_INPUT_BRAM_79_ADDR_WIDTH-1:0] = ap_bram_79_addr0;
            assign din0[79][C_INPUT_BRAM_79_WIDTH-1:0] = ap_bram_79_din0;
            assign ap_bram_79_dout0 = dout0[79][C_INPUT_BRAM_79_WIDTH-1:0];
            assign we0[79][C_INPUT_BRAM_79_WIDTH/8-1:0] = ap_bram_79_we0;
            assign en0[79] = ap_bram_79_en0;
            assign addr1[79][C_INPUT_BRAM_79_ADDR_WIDTH-1:0] = ap_bram_79_addr1;
            assign din1[79][C_INPUT_BRAM_79_WIDTH-1:0] = ap_bram_79_din1;
            assign ap_bram_79_dout1 = dout1[79][C_INPUT_BRAM_79_WIDTH-1:0];
            assign we1[79][C_INPUT_BRAM_79_WIDTH/8-1:0] = ap_bram_79_we1;
            assign en1[79] = ap_bram_79_en1;
            
            assign dwconv1_tready[79] = m_axis_bram_79_tready;
            assign m_axis_bram_79_tlast = dwconv1_tlast[79];
            assign m_axis_bram_79_tvalid = dwconv1_tvalid[79];
            assign m_axis_bram_79_tkeep = dwconv1_tkeep[79][C_OUTPUT_BRAM_79_DMWIDTH/8-1:0];
            assign m_axis_bram_79_tstrb = dwconv1_tstrb[79][C_OUTPUT_BRAM_79_DMWIDTH/8-1:0];
            assign m_axis_bram_79_tdata = dwconv1_tdata[79][C_OUTPUT_BRAM_79_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 80) begin
            assign tlast[80] = s_axis_bram_80_tlast;
            assign tvalid[80] = s_axis_bram_80_tvalid;
            assign tkeep[80][C_INPUT_BRAM_80_DMWIDTH/8-1:0] = s_axis_bram_80_tkeep;
            assign tstrb[80][C_INPUT_BRAM_80_DMWIDTH/8-1:0] = s_axis_bram_80_tstrb;
            assign tdata[80][C_INPUT_BRAM_80_DMWIDTH-1:0] = s_axis_bram_80_tdata;
            assign s_axis_bram_80_tready = tready[80];
            
            assign addr0[80][C_INPUT_BRAM_80_ADDR_WIDTH-1:0] = ap_bram_80_addr0;
            assign din0[80][C_INPUT_BRAM_80_WIDTH-1:0] = ap_bram_80_din0;
            assign ap_bram_80_dout0 = dout0[80][C_INPUT_BRAM_80_WIDTH-1:0];
            assign we0[80][C_INPUT_BRAM_80_WIDTH/8-1:0] = ap_bram_80_we0;
            assign en0[80] = ap_bram_80_en0;
            assign addr1[80][C_INPUT_BRAM_80_ADDR_WIDTH-1:0] = ap_bram_80_addr1;
            assign din1[80][C_INPUT_BRAM_80_WIDTH-1:0] = ap_bram_80_din1;
            assign ap_bram_80_dout1 = dout1[80][C_INPUT_BRAM_80_WIDTH-1:0];
            assign we1[80][C_INPUT_BRAM_80_WIDTH/8-1:0] = ap_bram_80_we1;
            assign en1[80] = ap_bram_80_en1;
            
            assign dwconv1_tready[80] = m_axis_bram_80_tready;
            assign m_axis_bram_80_tlast = dwconv1_tlast[80];
            assign m_axis_bram_80_tvalid = dwconv1_tvalid[80];
            assign m_axis_bram_80_tkeep = dwconv1_tkeep[80][C_OUTPUT_BRAM_80_DMWIDTH/8-1:0];
            assign m_axis_bram_80_tstrb = dwconv1_tstrb[80][C_OUTPUT_BRAM_80_DMWIDTH/8-1:0];
            assign m_axis_bram_80_tdata = dwconv1_tdata[80][C_OUTPUT_BRAM_80_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 81) begin
            assign tlast[81] = s_axis_bram_81_tlast;
            assign tvalid[81] = s_axis_bram_81_tvalid;
            assign tkeep[81][C_INPUT_BRAM_81_DMWIDTH/8-1:0] = s_axis_bram_81_tkeep;
            assign tstrb[81][C_INPUT_BRAM_81_DMWIDTH/8-1:0] = s_axis_bram_81_tstrb;
            assign tdata[81][C_INPUT_BRAM_81_DMWIDTH-1:0] = s_axis_bram_81_tdata;
            assign s_axis_bram_81_tready = tready[81];
            
            assign addr0[81][C_INPUT_BRAM_81_ADDR_WIDTH-1:0] = ap_bram_81_addr0;
            assign din0[81][C_INPUT_BRAM_81_WIDTH-1:0] = ap_bram_81_din0;
            assign ap_bram_81_dout0 = dout0[81][C_INPUT_BRAM_81_WIDTH-1:0];
            assign we0[81][C_INPUT_BRAM_81_WIDTH/8-1:0] = ap_bram_81_we0;
            assign en0[81] = ap_bram_81_en0;
            assign addr1[81][C_INPUT_BRAM_81_ADDR_WIDTH-1:0] = ap_bram_81_addr1;
            assign din1[81][C_INPUT_BRAM_81_WIDTH-1:0] = ap_bram_81_din1;
            assign ap_bram_81_dout1 = dout1[81][C_INPUT_BRAM_81_WIDTH-1:0];
            assign we1[81][C_INPUT_BRAM_81_WIDTH/8-1:0] = ap_bram_81_we1;
            assign en1[81] = ap_bram_81_en1;
            
            assign dwconv1_tready[81] = m_axis_bram_81_tready;
            assign m_axis_bram_81_tlast = dwconv1_tlast[81];
            assign m_axis_bram_81_tvalid = dwconv1_tvalid[81];
            assign m_axis_bram_81_tkeep = dwconv1_tkeep[81][C_OUTPUT_BRAM_81_DMWIDTH/8-1:0];
            assign m_axis_bram_81_tstrb = dwconv1_tstrb[81][C_OUTPUT_BRAM_81_DMWIDTH/8-1:0];
            assign m_axis_bram_81_tdata = dwconv1_tdata[81][C_OUTPUT_BRAM_81_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 82) begin
            assign tlast[82] = s_axis_bram_82_tlast;
            assign tvalid[82] = s_axis_bram_82_tvalid;
            assign tkeep[82][C_INPUT_BRAM_82_DMWIDTH/8-1:0] = s_axis_bram_82_tkeep;
            assign tstrb[82][C_INPUT_BRAM_82_DMWIDTH/8-1:0] = s_axis_bram_82_tstrb;
            assign tdata[82][C_INPUT_BRAM_82_DMWIDTH-1:0] = s_axis_bram_82_tdata;
            assign s_axis_bram_82_tready = tready[82];
            
            assign addr0[82][C_INPUT_BRAM_82_ADDR_WIDTH-1:0] = ap_bram_82_addr0;
            assign din0[82][C_INPUT_BRAM_82_WIDTH-1:0] = ap_bram_82_din0;
            assign ap_bram_82_dout0 = dout0[82][C_INPUT_BRAM_82_WIDTH-1:0];
            assign we0[82][C_INPUT_BRAM_82_WIDTH/8-1:0] = ap_bram_82_we0;
            assign en0[82] = ap_bram_82_en0;
            assign addr1[82][C_INPUT_BRAM_82_ADDR_WIDTH-1:0] = ap_bram_82_addr1;
            assign din1[82][C_INPUT_BRAM_82_WIDTH-1:0] = ap_bram_82_din1;
            assign ap_bram_82_dout1 = dout1[82][C_INPUT_BRAM_82_WIDTH-1:0];
            assign we1[82][C_INPUT_BRAM_82_WIDTH/8-1:0] = ap_bram_82_we1;
            assign en1[82] = ap_bram_82_en1;
            
            assign dwconv1_tready[82] = m_axis_bram_82_tready;
            assign m_axis_bram_82_tlast = dwconv1_tlast[82];
            assign m_axis_bram_82_tvalid = dwconv1_tvalid[82];
            assign m_axis_bram_82_tkeep = dwconv1_tkeep[82][C_OUTPUT_BRAM_82_DMWIDTH/8-1:0];
            assign m_axis_bram_82_tstrb = dwconv1_tstrb[82][C_OUTPUT_BRAM_82_DMWIDTH/8-1:0];
            assign m_axis_bram_82_tdata = dwconv1_tdata[82][C_OUTPUT_BRAM_82_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 83) begin
            assign tlast[83] = s_axis_bram_83_tlast;
            assign tvalid[83] = s_axis_bram_83_tvalid;
            assign tkeep[83][C_INPUT_BRAM_83_DMWIDTH/8-1:0] = s_axis_bram_83_tkeep;
            assign tstrb[83][C_INPUT_BRAM_83_DMWIDTH/8-1:0] = s_axis_bram_83_tstrb;
            assign tdata[83][C_INPUT_BRAM_83_DMWIDTH-1:0] = s_axis_bram_83_tdata;
            assign s_axis_bram_83_tready = tready[83];
            
            assign addr0[83][C_INPUT_BRAM_83_ADDR_WIDTH-1:0] = ap_bram_83_addr0;
            assign din0[83][C_INPUT_BRAM_83_WIDTH-1:0] = ap_bram_83_din0;
            assign ap_bram_83_dout0 = dout0[83][C_INPUT_BRAM_83_WIDTH-1:0];
            assign we0[83][C_INPUT_BRAM_83_WIDTH/8-1:0] = ap_bram_83_we0;
            assign en0[83] = ap_bram_83_en0;
            assign addr1[83][C_INPUT_BRAM_83_ADDR_WIDTH-1:0] = ap_bram_83_addr1;
            assign din1[83][C_INPUT_BRAM_83_WIDTH-1:0] = ap_bram_83_din1;
            assign ap_bram_83_dout1 = dout1[83][C_INPUT_BRAM_83_WIDTH-1:0];
            assign we1[83][C_INPUT_BRAM_83_WIDTH/8-1:0] = ap_bram_83_we1;
            assign en1[83] = ap_bram_83_en1;
            
            assign dwconv1_tready[83] = m_axis_bram_83_tready;
            assign m_axis_bram_83_tlast = dwconv1_tlast[83];
            assign m_axis_bram_83_tvalid = dwconv1_tvalid[83];
            assign m_axis_bram_83_tkeep = dwconv1_tkeep[83][C_OUTPUT_BRAM_83_DMWIDTH/8-1:0];
            assign m_axis_bram_83_tstrb = dwconv1_tstrb[83][C_OUTPUT_BRAM_83_DMWIDTH/8-1:0];
            assign m_axis_bram_83_tdata = dwconv1_tdata[83][C_OUTPUT_BRAM_83_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 84) begin
            assign tlast[84] = s_axis_bram_84_tlast;
            assign tvalid[84] = s_axis_bram_84_tvalid;
            assign tkeep[84][C_INPUT_BRAM_84_DMWIDTH/8-1:0] = s_axis_bram_84_tkeep;
            assign tstrb[84][C_INPUT_BRAM_84_DMWIDTH/8-1:0] = s_axis_bram_84_tstrb;
            assign tdata[84][C_INPUT_BRAM_84_DMWIDTH-1:0] = s_axis_bram_84_tdata;
            assign s_axis_bram_84_tready = tready[84];
            
            assign addr0[84][C_INPUT_BRAM_84_ADDR_WIDTH-1:0] = ap_bram_84_addr0;
            assign din0[84][C_INPUT_BRAM_84_WIDTH-1:0] = ap_bram_84_din0;
            assign ap_bram_84_dout0 = dout0[84][C_INPUT_BRAM_84_WIDTH-1:0];
            assign we0[84][C_INPUT_BRAM_84_WIDTH/8-1:0] = ap_bram_84_we0;
            assign en0[84] = ap_bram_84_en0;
            assign addr1[84][C_INPUT_BRAM_84_ADDR_WIDTH-1:0] = ap_bram_84_addr1;
            assign din1[84][C_INPUT_BRAM_84_WIDTH-1:0] = ap_bram_84_din1;
            assign ap_bram_84_dout1 = dout1[84][C_INPUT_BRAM_84_WIDTH-1:0];
            assign we1[84][C_INPUT_BRAM_84_WIDTH/8-1:0] = ap_bram_84_we1;
            assign en1[84] = ap_bram_84_en1;
            
            assign dwconv1_tready[84] = m_axis_bram_84_tready;
            assign m_axis_bram_84_tlast = dwconv1_tlast[84];
            assign m_axis_bram_84_tvalid = dwconv1_tvalid[84];
            assign m_axis_bram_84_tkeep = dwconv1_tkeep[84][C_OUTPUT_BRAM_84_DMWIDTH/8-1:0];
            assign m_axis_bram_84_tstrb = dwconv1_tstrb[84][C_OUTPUT_BRAM_84_DMWIDTH/8-1:0];
            assign m_axis_bram_84_tdata = dwconv1_tdata[84][C_OUTPUT_BRAM_84_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 85) begin
            assign tlast[85] = s_axis_bram_85_tlast;
            assign tvalid[85] = s_axis_bram_85_tvalid;
            assign tkeep[85][C_INPUT_BRAM_85_DMWIDTH/8-1:0] = s_axis_bram_85_tkeep;
            assign tstrb[85][C_INPUT_BRAM_85_DMWIDTH/8-1:0] = s_axis_bram_85_tstrb;
            assign tdata[85][C_INPUT_BRAM_85_DMWIDTH-1:0] = s_axis_bram_85_tdata;
            assign s_axis_bram_85_tready = tready[85];
            
            assign addr0[85][C_INPUT_BRAM_85_ADDR_WIDTH-1:0] = ap_bram_85_addr0;
            assign din0[85][C_INPUT_BRAM_85_WIDTH-1:0] = ap_bram_85_din0;
            assign ap_bram_85_dout0 = dout0[85][C_INPUT_BRAM_85_WIDTH-1:0];
            assign we0[85][C_INPUT_BRAM_85_WIDTH/8-1:0] = ap_bram_85_we0;
            assign en0[85] = ap_bram_85_en0;
            assign addr1[85][C_INPUT_BRAM_85_ADDR_WIDTH-1:0] = ap_bram_85_addr1;
            assign din1[85][C_INPUT_BRAM_85_WIDTH-1:0] = ap_bram_85_din1;
            assign ap_bram_85_dout1 = dout1[85][C_INPUT_BRAM_85_WIDTH-1:0];
            assign we1[85][C_INPUT_BRAM_85_WIDTH/8-1:0] = ap_bram_85_we1;
            assign en1[85] = ap_bram_85_en1;
            
            assign dwconv1_tready[85] = m_axis_bram_85_tready;
            assign m_axis_bram_85_tlast = dwconv1_tlast[85];
            assign m_axis_bram_85_tvalid = dwconv1_tvalid[85];
            assign m_axis_bram_85_tkeep = dwconv1_tkeep[85][C_OUTPUT_BRAM_85_DMWIDTH/8-1:0];
            assign m_axis_bram_85_tstrb = dwconv1_tstrb[85][C_OUTPUT_BRAM_85_DMWIDTH/8-1:0];
            assign m_axis_bram_85_tdata = dwconv1_tdata[85][C_OUTPUT_BRAM_85_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 86) begin
            assign tlast[86] = s_axis_bram_86_tlast;
            assign tvalid[86] = s_axis_bram_86_tvalid;
            assign tkeep[86][C_INPUT_BRAM_86_DMWIDTH/8-1:0] = s_axis_bram_86_tkeep;
            assign tstrb[86][C_INPUT_BRAM_86_DMWIDTH/8-1:0] = s_axis_bram_86_tstrb;
            assign tdata[86][C_INPUT_BRAM_86_DMWIDTH-1:0] = s_axis_bram_86_tdata;
            assign s_axis_bram_86_tready = tready[86];
            
            assign addr0[86][C_INPUT_BRAM_86_ADDR_WIDTH-1:0] = ap_bram_86_addr0;
            assign din0[86][C_INPUT_BRAM_86_WIDTH-1:0] = ap_bram_86_din0;
            assign ap_bram_86_dout0 = dout0[86][C_INPUT_BRAM_86_WIDTH-1:0];
            assign we0[86][C_INPUT_BRAM_86_WIDTH/8-1:0] = ap_bram_86_we0;
            assign en0[86] = ap_bram_86_en0;
            assign addr1[86][C_INPUT_BRAM_86_ADDR_WIDTH-1:0] = ap_bram_86_addr1;
            assign din1[86][C_INPUT_BRAM_86_WIDTH-1:0] = ap_bram_86_din1;
            assign ap_bram_86_dout1 = dout1[86][C_INPUT_BRAM_86_WIDTH-1:0];
            assign we1[86][C_INPUT_BRAM_86_WIDTH/8-1:0] = ap_bram_86_we1;
            assign en1[86] = ap_bram_86_en1;
            
            assign dwconv1_tready[86] = m_axis_bram_86_tready;
            assign m_axis_bram_86_tlast = dwconv1_tlast[86];
            assign m_axis_bram_86_tvalid = dwconv1_tvalid[86];
            assign m_axis_bram_86_tkeep = dwconv1_tkeep[86][C_OUTPUT_BRAM_86_DMWIDTH/8-1:0];
            assign m_axis_bram_86_tstrb = dwconv1_tstrb[86][C_OUTPUT_BRAM_86_DMWIDTH/8-1:0];
            assign m_axis_bram_86_tdata = dwconv1_tdata[86][C_OUTPUT_BRAM_86_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 87) begin
            assign tlast[87] = s_axis_bram_87_tlast;
            assign tvalid[87] = s_axis_bram_87_tvalid;
            assign tkeep[87][C_INPUT_BRAM_87_DMWIDTH/8-1:0] = s_axis_bram_87_tkeep;
            assign tstrb[87][C_INPUT_BRAM_87_DMWIDTH/8-1:0] = s_axis_bram_87_tstrb;
            assign tdata[87][C_INPUT_BRAM_87_DMWIDTH-1:0] = s_axis_bram_87_tdata;
            assign s_axis_bram_87_tready = tready[87];
            
            assign addr0[87][C_INPUT_BRAM_87_ADDR_WIDTH-1:0] = ap_bram_87_addr0;
            assign din0[87][C_INPUT_BRAM_87_WIDTH-1:0] = ap_bram_87_din0;
            assign ap_bram_87_dout0 = dout0[87][C_INPUT_BRAM_87_WIDTH-1:0];
            assign we0[87][C_INPUT_BRAM_87_WIDTH/8-1:0] = ap_bram_87_we0;
            assign en0[87] = ap_bram_87_en0;
            assign addr1[87][C_INPUT_BRAM_87_ADDR_WIDTH-1:0] = ap_bram_87_addr1;
            assign din1[87][C_INPUT_BRAM_87_WIDTH-1:0] = ap_bram_87_din1;
            assign ap_bram_87_dout1 = dout1[87][C_INPUT_BRAM_87_WIDTH-1:0];
            assign we1[87][C_INPUT_BRAM_87_WIDTH/8-1:0] = ap_bram_87_we1;
            assign en1[87] = ap_bram_87_en1;
            
            assign dwconv1_tready[87] = m_axis_bram_87_tready;
            assign m_axis_bram_87_tlast = dwconv1_tlast[87];
            assign m_axis_bram_87_tvalid = dwconv1_tvalid[87];
            assign m_axis_bram_87_tkeep = dwconv1_tkeep[87][C_OUTPUT_BRAM_87_DMWIDTH/8-1:0];
            assign m_axis_bram_87_tstrb = dwconv1_tstrb[87][C_OUTPUT_BRAM_87_DMWIDTH/8-1:0];
            assign m_axis_bram_87_tdata = dwconv1_tdata[87][C_OUTPUT_BRAM_87_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 88) begin
            assign tlast[88] = s_axis_bram_88_tlast;
            assign tvalid[88] = s_axis_bram_88_tvalid;
            assign tkeep[88][C_INPUT_BRAM_88_DMWIDTH/8-1:0] = s_axis_bram_88_tkeep;
            assign tstrb[88][C_INPUT_BRAM_88_DMWIDTH/8-1:0] = s_axis_bram_88_tstrb;
            assign tdata[88][C_INPUT_BRAM_88_DMWIDTH-1:0] = s_axis_bram_88_tdata;
            assign s_axis_bram_88_tready = tready[88];
            
            assign addr0[88][C_INPUT_BRAM_88_ADDR_WIDTH-1:0] = ap_bram_88_addr0;
            assign din0[88][C_INPUT_BRAM_88_WIDTH-1:0] = ap_bram_88_din0;
            assign ap_bram_88_dout0 = dout0[88][C_INPUT_BRAM_88_WIDTH-1:0];
            assign we0[88][C_INPUT_BRAM_88_WIDTH/8-1:0] = ap_bram_88_we0;
            assign en0[88] = ap_bram_88_en0;
            assign addr1[88][C_INPUT_BRAM_88_ADDR_WIDTH-1:0] = ap_bram_88_addr1;
            assign din1[88][C_INPUT_BRAM_88_WIDTH-1:0] = ap_bram_88_din1;
            assign ap_bram_88_dout1 = dout1[88][C_INPUT_BRAM_88_WIDTH-1:0];
            assign we1[88][C_INPUT_BRAM_88_WIDTH/8-1:0] = ap_bram_88_we1;
            assign en1[88] = ap_bram_88_en1;
            
            assign dwconv1_tready[88] = m_axis_bram_88_tready;
            assign m_axis_bram_88_tlast = dwconv1_tlast[88];
            assign m_axis_bram_88_tvalid = dwconv1_tvalid[88];
            assign m_axis_bram_88_tkeep = dwconv1_tkeep[88][C_OUTPUT_BRAM_88_DMWIDTH/8-1:0];
            assign m_axis_bram_88_tstrb = dwconv1_tstrb[88][C_OUTPUT_BRAM_88_DMWIDTH/8-1:0];
            assign m_axis_bram_88_tdata = dwconv1_tdata[88][C_OUTPUT_BRAM_88_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 89) begin
            assign tlast[89] = s_axis_bram_89_tlast;
            assign tvalid[89] = s_axis_bram_89_tvalid;
            assign tkeep[89][C_INPUT_BRAM_89_DMWIDTH/8-1:0] = s_axis_bram_89_tkeep;
            assign tstrb[89][C_INPUT_BRAM_89_DMWIDTH/8-1:0] = s_axis_bram_89_tstrb;
            assign tdata[89][C_INPUT_BRAM_89_DMWIDTH-1:0] = s_axis_bram_89_tdata;
            assign s_axis_bram_89_tready = tready[89];
            
            assign addr0[89][C_INPUT_BRAM_89_ADDR_WIDTH-1:0] = ap_bram_89_addr0;
            assign din0[89][C_INPUT_BRAM_89_WIDTH-1:0] = ap_bram_89_din0;
            assign ap_bram_89_dout0 = dout0[89][C_INPUT_BRAM_89_WIDTH-1:0];
            assign we0[89][C_INPUT_BRAM_89_WIDTH/8-1:0] = ap_bram_89_we0;
            assign en0[89] = ap_bram_89_en0;
            assign addr1[89][C_INPUT_BRAM_89_ADDR_WIDTH-1:0] = ap_bram_89_addr1;
            assign din1[89][C_INPUT_BRAM_89_WIDTH-1:0] = ap_bram_89_din1;
            assign ap_bram_89_dout1 = dout1[89][C_INPUT_BRAM_89_WIDTH-1:0];
            assign we1[89][C_INPUT_BRAM_89_WIDTH/8-1:0] = ap_bram_89_we1;
            assign en1[89] = ap_bram_89_en1;
            
            assign dwconv1_tready[89] = m_axis_bram_89_tready;
            assign m_axis_bram_89_tlast = dwconv1_tlast[89];
            assign m_axis_bram_89_tvalid = dwconv1_tvalid[89];
            assign m_axis_bram_89_tkeep = dwconv1_tkeep[89][C_OUTPUT_BRAM_89_DMWIDTH/8-1:0];
            assign m_axis_bram_89_tstrb = dwconv1_tstrb[89][C_OUTPUT_BRAM_89_DMWIDTH/8-1:0];
            assign m_axis_bram_89_tdata = dwconv1_tdata[89][C_OUTPUT_BRAM_89_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 90) begin
            assign tlast[90] = s_axis_bram_90_tlast;
            assign tvalid[90] = s_axis_bram_90_tvalid;
            assign tkeep[90][C_INPUT_BRAM_90_DMWIDTH/8-1:0] = s_axis_bram_90_tkeep;
            assign tstrb[90][C_INPUT_BRAM_90_DMWIDTH/8-1:0] = s_axis_bram_90_tstrb;
            assign tdata[90][C_INPUT_BRAM_90_DMWIDTH-1:0] = s_axis_bram_90_tdata;
            assign s_axis_bram_90_tready = tready[90];
            
            assign addr0[90][C_INPUT_BRAM_90_ADDR_WIDTH-1:0] = ap_bram_90_addr0;
            assign din0[90][C_INPUT_BRAM_90_WIDTH-1:0] = ap_bram_90_din0;
            assign ap_bram_90_dout0 = dout0[90][C_INPUT_BRAM_90_WIDTH-1:0];
            assign we0[90][C_INPUT_BRAM_90_WIDTH/8-1:0] = ap_bram_90_we0;
            assign en0[90] = ap_bram_90_en0;
            assign addr1[90][C_INPUT_BRAM_90_ADDR_WIDTH-1:0] = ap_bram_90_addr1;
            assign din1[90][C_INPUT_BRAM_90_WIDTH-1:0] = ap_bram_90_din1;
            assign ap_bram_90_dout1 = dout1[90][C_INPUT_BRAM_90_WIDTH-1:0];
            assign we1[90][C_INPUT_BRAM_90_WIDTH/8-1:0] = ap_bram_90_we1;
            assign en1[90] = ap_bram_90_en1;
            
            assign dwconv1_tready[90] = m_axis_bram_90_tready;
            assign m_axis_bram_90_tlast = dwconv1_tlast[90];
            assign m_axis_bram_90_tvalid = dwconv1_tvalid[90];
            assign m_axis_bram_90_tkeep = dwconv1_tkeep[90][C_OUTPUT_BRAM_90_DMWIDTH/8-1:0];
            assign m_axis_bram_90_tstrb = dwconv1_tstrb[90][C_OUTPUT_BRAM_90_DMWIDTH/8-1:0];
            assign m_axis_bram_90_tdata = dwconv1_tdata[90][C_OUTPUT_BRAM_90_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 91) begin
            assign tlast[91] = s_axis_bram_91_tlast;
            assign tvalid[91] = s_axis_bram_91_tvalid;
            assign tkeep[91][C_INPUT_BRAM_91_DMWIDTH/8-1:0] = s_axis_bram_91_tkeep;
            assign tstrb[91][C_INPUT_BRAM_91_DMWIDTH/8-1:0] = s_axis_bram_91_tstrb;
            assign tdata[91][C_INPUT_BRAM_91_DMWIDTH-1:0] = s_axis_bram_91_tdata;
            assign s_axis_bram_91_tready = tready[91];
            
            assign addr0[91][C_INPUT_BRAM_91_ADDR_WIDTH-1:0] = ap_bram_91_addr0;
            assign din0[91][C_INPUT_BRAM_91_WIDTH-1:0] = ap_bram_91_din0;
            assign ap_bram_91_dout0 = dout0[91][C_INPUT_BRAM_91_WIDTH-1:0];
            assign we0[91][C_INPUT_BRAM_91_WIDTH/8-1:0] = ap_bram_91_we0;
            assign en0[91] = ap_bram_91_en0;
            assign addr1[91][C_INPUT_BRAM_91_ADDR_WIDTH-1:0] = ap_bram_91_addr1;
            assign din1[91][C_INPUT_BRAM_91_WIDTH-1:0] = ap_bram_91_din1;
            assign ap_bram_91_dout1 = dout1[91][C_INPUT_BRAM_91_WIDTH-1:0];
            assign we1[91][C_INPUT_BRAM_91_WIDTH/8-1:0] = ap_bram_91_we1;
            assign en1[91] = ap_bram_91_en1;
            
            assign dwconv1_tready[91] = m_axis_bram_91_tready;
            assign m_axis_bram_91_tlast = dwconv1_tlast[91];
            assign m_axis_bram_91_tvalid = dwconv1_tvalid[91];
            assign m_axis_bram_91_tkeep = dwconv1_tkeep[91][C_OUTPUT_BRAM_91_DMWIDTH/8-1:0];
            assign m_axis_bram_91_tstrb = dwconv1_tstrb[91][C_OUTPUT_BRAM_91_DMWIDTH/8-1:0];
            assign m_axis_bram_91_tdata = dwconv1_tdata[91][C_OUTPUT_BRAM_91_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 92) begin
            assign tlast[92] = s_axis_bram_92_tlast;
            assign tvalid[92] = s_axis_bram_92_tvalid;
            assign tkeep[92][C_INPUT_BRAM_92_DMWIDTH/8-1:0] = s_axis_bram_92_tkeep;
            assign tstrb[92][C_INPUT_BRAM_92_DMWIDTH/8-1:0] = s_axis_bram_92_tstrb;
            assign tdata[92][C_INPUT_BRAM_92_DMWIDTH-1:0] = s_axis_bram_92_tdata;
            assign s_axis_bram_92_tready = tready[92];
            
            assign addr0[92][C_INPUT_BRAM_92_ADDR_WIDTH-1:0] = ap_bram_92_addr0;
            assign din0[92][C_INPUT_BRAM_92_WIDTH-1:0] = ap_bram_92_din0;
            assign ap_bram_92_dout0 = dout0[92][C_INPUT_BRAM_92_WIDTH-1:0];
            assign we0[92][C_INPUT_BRAM_92_WIDTH/8-1:0] = ap_bram_92_we0;
            assign en0[92] = ap_bram_92_en0;
            assign addr1[92][C_INPUT_BRAM_92_ADDR_WIDTH-1:0] = ap_bram_92_addr1;
            assign din1[92][C_INPUT_BRAM_92_WIDTH-1:0] = ap_bram_92_din1;
            assign ap_bram_92_dout1 = dout1[92][C_INPUT_BRAM_92_WIDTH-1:0];
            assign we1[92][C_INPUT_BRAM_92_WIDTH/8-1:0] = ap_bram_92_we1;
            assign en1[92] = ap_bram_92_en1;
            
            assign dwconv1_tready[92] = m_axis_bram_92_tready;
            assign m_axis_bram_92_tlast = dwconv1_tlast[92];
            assign m_axis_bram_92_tvalid = dwconv1_tvalid[92];
            assign m_axis_bram_92_tkeep = dwconv1_tkeep[92][C_OUTPUT_BRAM_92_DMWIDTH/8-1:0];
            assign m_axis_bram_92_tstrb = dwconv1_tstrb[92][C_OUTPUT_BRAM_92_DMWIDTH/8-1:0];
            assign m_axis_bram_92_tdata = dwconv1_tdata[92][C_OUTPUT_BRAM_92_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 93) begin
            assign tlast[93] = s_axis_bram_93_tlast;
            assign tvalid[93] = s_axis_bram_93_tvalid;
            assign tkeep[93][C_INPUT_BRAM_93_DMWIDTH/8-1:0] = s_axis_bram_93_tkeep;
            assign tstrb[93][C_INPUT_BRAM_93_DMWIDTH/8-1:0] = s_axis_bram_93_tstrb;
            assign tdata[93][C_INPUT_BRAM_93_DMWIDTH-1:0] = s_axis_bram_93_tdata;
            assign s_axis_bram_93_tready = tready[93];
            
            assign addr0[93][C_INPUT_BRAM_93_ADDR_WIDTH-1:0] = ap_bram_93_addr0;
            assign din0[93][C_INPUT_BRAM_93_WIDTH-1:0] = ap_bram_93_din0;
            assign ap_bram_93_dout0 = dout0[93][C_INPUT_BRAM_93_WIDTH-1:0];
            assign we0[93][C_INPUT_BRAM_93_WIDTH/8-1:0] = ap_bram_93_we0;
            assign en0[93] = ap_bram_93_en0;
            assign addr1[93][C_INPUT_BRAM_93_ADDR_WIDTH-1:0] = ap_bram_93_addr1;
            assign din1[93][C_INPUT_BRAM_93_WIDTH-1:0] = ap_bram_93_din1;
            assign ap_bram_93_dout1 = dout1[93][C_INPUT_BRAM_93_WIDTH-1:0];
            assign we1[93][C_INPUT_BRAM_93_WIDTH/8-1:0] = ap_bram_93_we1;
            assign en1[93] = ap_bram_93_en1;
            
            assign dwconv1_tready[93] = m_axis_bram_93_tready;
            assign m_axis_bram_93_tlast = dwconv1_tlast[93];
            assign m_axis_bram_93_tvalid = dwconv1_tvalid[93];
            assign m_axis_bram_93_tkeep = dwconv1_tkeep[93][C_OUTPUT_BRAM_93_DMWIDTH/8-1:0];
            assign m_axis_bram_93_tstrb = dwconv1_tstrb[93][C_OUTPUT_BRAM_93_DMWIDTH/8-1:0];
            assign m_axis_bram_93_tdata = dwconv1_tdata[93][C_OUTPUT_BRAM_93_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 94) begin
            assign tlast[94] = s_axis_bram_94_tlast;
            assign tvalid[94] = s_axis_bram_94_tvalid;
            assign tkeep[94][C_INPUT_BRAM_94_DMWIDTH/8-1:0] = s_axis_bram_94_tkeep;
            assign tstrb[94][C_INPUT_BRAM_94_DMWIDTH/8-1:0] = s_axis_bram_94_tstrb;
            assign tdata[94][C_INPUT_BRAM_94_DMWIDTH-1:0] = s_axis_bram_94_tdata;
            assign s_axis_bram_94_tready = tready[94];
            
            assign addr0[94][C_INPUT_BRAM_94_ADDR_WIDTH-1:0] = ap_bram_94_addr0;
            assign din0[94][C_INPUT_BRAM_94_WIDTH-1:0] = ap_bram_94_din0;
            assign ap_bram_94_dout0 = dout0[94][C_INPUT_BRAM_94_WIDTH-1:0];
            assign we0[94][C_INPUT_BRAM_94_WIDTH/8-1:0] = ap_bram_94_we0;
            assign en0[94] = ap_bram_94_en0;
            assign addr1[94][C_INPUT_BRAM_94_ADDR_WIDTH-1:0] = ap_bram_94_addr1;
            assign din1[94][C_INPUT_BRAM_94_WIDTH-1:0] = ap_bram_94_din1;
            assign ap_bram_94_dout1 = dout1[94][C_INPUT_BRAM_94_WIDTH-1:0];
            assign we1[94][C_INPUT_BRAM_94_WIDTH/8-1:0] = ap_bram_94_we1;
            assign en1[94] = ap_bram_94_en1;
            
            assign dwconv1_tready[94] = m_axis_bram_94_tready;
            assign m_axis_bram_94_tlast = dwconv1_tlast[94];
            assign m_axis_bram_94_tvalid = dwconv1_tvalid[94];
            assign m_axis_bram_94_tkeep = dwconv1_tkeep[94][C_OUTPUT_BRAM_94_DMWIDTH/8-1:0];
            assign m_axis_bram_94_tstrb = dwconv1_tstrb[94][C_OUTPUT_BRAM_94_DMWIDTH/8-1:0];
            assign m_axis_bram_94_tdata = dwconv1_tdata[94][C_OUTPUT_BRAM_94_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 95) begin
            assign tlast[95] = s_axis_bram_95_tlast;
            assign tvalid[95] = s_axis_bram_95_tvalid;
            assign tkeep[95][C_INPUT_BRAM_95_DMWIDTH/8-1:0] = s_axis_bram_95_tkeep;
            assign tstrb[95][C_INPUT_BRAM_95_DMWIDTH/8-1:0] = s_axis_bram_95_tstrb;
            assign tdata[95][C_INPUT_BRAM_95_DMWIDTH-1:0] = s_axis_bram_95_tdata;
            assign s_axis_bram_95_tready = tready[95];
            
            assign addr0[95][C_INPUT_BRAM_95_ADDR_WIDTH-1:0] = ap_bram_95_addr0;
            assign din0[95][C_INPUT_BRAM_95_WIDTH-1:0] = ap_bram_95_din0;
            assign ap_bram_95_dout0 = dout0[95][C_INPUT_BRAM_95_WIDTH-1:0];
            assign we0[95][C_INPUT_BRAM_95_WIDTH/8-1:0] = ap_bram_95_we0;
            assign en0[95] = ap_bram_95_en0;
            assign addr1[95][C_INPUT_BRAM_95_ADDR_WIDTH-1:0] = ap_bram_95_addr1;
            assign din1[95][C_INPUT_BRAM_95_WIDTH-1:0] = ap_bram_95_din1;
            assign ap_bram_95_dout1 = dout1[95][C_INPUT_BRAM_95_WIDTH-1:0];
            assign we1[95][C_INPUT_BRAM_95_WIDTH/8-1:0] = ap_bram_95_we1;
            assign en1[95] = ap_bram_95_en1;
            
            assign dwconv1_tready[95] = m_axis_bram_95_tready;
            assign m_axis_bram_95_tlast = dwconv1_tlast[95];
            assign m_axis_bram_95_tvalid = dwconv1_tvalid[95];
            assign m_axis_bram_95_tkeep = dwconv1_tkeep[95][C_OUTPUT_BRAM_95_DMWIDTH/8-1:0];
            assign m_axis_bram_95_tstrb = dwconv1_tstrb[95][C_OUTPUT_BRAM_95_DMWIDTH/8-1:0];
            assign m_axis_bram_95_tdata = dwconv1_tdata[95][C_OUTPUT_BRAM_95_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 96) begin
            assign tlast[96] = s_axis_bram_96_tlast;
            assign tvalid[96] = s_axis_bram_96_tvalid;
            assign tkeep[96][C_INPUT_BRAM_96_DMWIDTH/8-1:0] = s_axis_bram_96_tkeep;
            assign tstrb[96][C_INPUT_BRAM_96_DMWIDTH/8-1:0] = s_axis_bram_96_tstrb;
            assign tdata[96][C_INPUT_BRAM_96_DMWIDTH-1:0] = s_axis_bram_96_tdata;
            assign s_axis_bram_96_tready = tready[96];
            
            assign addr0[96][C_INPUT_BRAM_96_ADDR_WIDTH-1:0] = ap_bram_96_addr0;
            assign din0[96][C_INPUT_BRAM_96_WIDTH-1:0] = ap_bram_96_din0;
            assign ap_bram_96_dout0 = dout0[96][C_INPUT_BRAM_96_WIDTH-1:0];
            assign we0[96][C_INPUT_BRAM_96_WIDTH/8-1:0] = ap_bram_96_we0;
            assign en0[96] = ap_bram_96_en0;
            assign addr1[96][C_INPUT_BRAM_96_ADDR_WIDTH-1:0] = ap_bram_96_addr1;
            assign din1[96][C_INPUT_BRAM_96_WIDTH-1:0] = ap_bram_96_din1;
            assign ap_bram_96_dout1 = dout1[96][C_INPUT_BRAM_96_WIDTH-1:0];
            assign we1[96][C_INPUT_BRAM_96_WIDTH/8-1:0] = ap_bram_96_we1;
            assign en1[96] = ap_bram_96_en1;
            
            assign dwconv1_tready[96] = m_axis_bram_96_tready;
            assign m_axis_bram_96_tlast = dwconv1_tlast[96];
            assign m_axis_bram_96_tvalid = dwconv1_tvalid[96];
            assign m_axis_bram_96_tkeep = dwconv1_tkeep[96][C_OUTPUT_BRAM_96_DMWIDTH/8-1:0];
            assign m_axis_bram_96_tstrb = dwconv1_tstrb[96][C_OUTPUT_BRAM_96_DMWIDTH/8-1:0];
            assign m_axis_bram_96_tdata = dwconv1_tdata[96][C_OUTPUT_BRAM_96_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 97) begin
            assign tlast[97] = s_axis_bram_97_tlast;
            assign tvalid[97] = s_axis_bram_97_tvalid;
            assign tkeep[97][C_INPUT_BRAM_97_DMWIDTH/8-1:0] = s_axis_bram_97_tkeep;
            assign tstrb[97][C_INPUT_BRAM_97_DMWIDTH/8-1:0] = s_axis_bram_97_tstrb;
            assign tdata[97][C_INPUT_BRAM_97_DMWIDTH-1:0] = s_axis_bram_97_tdata;
            assign s_axis_bram_97_tready = tready[97];
            
            assign addr0[97][C_INPUT_BRAM_97_ADDR_WIDTH-1:0] = ap_bram_97_addr0;
            assign din0[97][C_INPUT_BRAM_97_WIDTH-1:0] = ap_bram_97_din0;
            assign ap_bram_97_dout0 = dout0[97][C_INPUT_BRAM_97_WIDTH-1:0];
            assign we0[97][C_INPUT_BRAM_97_WIDTH/8-1:0] = ap_bram_97_we0;
            assign en0[97] = ap_bram_97_en0;
            assign addr1[97][C_INPUT_BRAM_97_ADDR_WIDTH-1:0] = ap_bram_97_addr1;
            assign din1[97][C_INPUT_BRAM_97_WIDTH-1:0] = ap_bram_97_din1;
            assign ap_bram_97_dout1 = dout1[97][C_INPUT_BRAM_97_WIDTH-1:0];
            assign we1[97][C_INPUT_BRAM_97_WIDTH/8-1:0] = ap_bram_97_we1;
            assign en1[97] = ap_bram_97_en1;
            
            assign dwconv1_tready[97] = m_axis_bram_97_tready;
            assign m_axis_bram_97_tlast = dwconv1_tlast[97];
            assign m_axis_bram_97_tvalid = dwconv1_tvalid[97];
            assign m_axis_bram_97_tkeep = dwconv1_tkeep[97][C_OUTPUT_BRAM_97_DMWIDTH/8-1:0];
            assign m_axis_bram_97_tstrb = dwconv1_tstrb[97][C_OUTPUT_BRAM_97_DMWIDTH/8-1:0];
            assign m_axis_bram_97_tdata = dwconv1_tdata[97][C_OUTPUT_BRAM_97_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 98) begin
            assign tlast[98] = s_axis_bram_98_tlast;
            assign tvalid[98] = s_axis_bram_98_tvalid;
            assign tkeep[98][C_INPUT_BRAM_98_DMWIDTH/8-1:0] = s_axis_bram_98_tkeep;
            assign tstrb[98][C_INPUT_BRAM_98_DMWIDTH/8-1:0] = s_axis_bram_98_tstrb;
            assign tdata[98][C_INPUT_BRAM_98_DMWIDTH-1:0] = s_axis_bram_98_tdata;
            assign s_axis_bram_98_tready = tready[98];
            
            assign addr0[98][C_INPUT_BRAM_98_ADDR_WIDTH-1:0] = ap_bram_98_addr0;
            assign din0[98][C_INPUT_BRAM_98_WIDTH-1:0] = ap_bram_98_din0;
            assign ap_bram_98_dout0 = dout0[98][C_INPUT_BRAM_98_WIDTH-1:0];
            assign we0[98][C_INPUT_BRAM_98_WIDTH/8-1:0] = ap_bram_98_we0;
            assign en0[98] = ap_bram_98_en0;
            assign addr1[98][C_INPUT_BRAM_98_ADDR_WIDTH-1:0] = ap_bram_98_addr1;
            assign din1[98][C_INPUT_BRAM_98_WIDTH-1:0] = ap_bram_98_din1;
            assign ap_bram_98_dout1 = dout1[98][C_INPUT_BRAM_98_WIDTH-1:0];
            assign we1[98][C_INPUT_BRAM_98_WIDTH/8-1:0] = ap_bram_98_we1;
            assign en1[98] = ap_bram_98_en1;
            
            assign dwconv1_tready[98] = m_axis_bram_98_tready;
            assign m_axis_bram_98_tlast = dwconv1_tlast[98];
            assign m_axis_bram_98_tvalid = dwconv1_tvalid[98];
            assign m_axis_bram_98_tkeep = dwconv1_tkeep[98][C_OUTPUT_BRAM_98_DMWIDTH/8-1:0];
            assign m_axis_bram_98_tstrb = dwconv1_tstrb[98][C_OUTPUT_BRAM_98_DMWIDTH/8-1:0];
            assign m_axis_bram_98_tdata = dwconv1_tdata[98][C_OUTPUT_BRAM_98_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 99) begin
            assign tlast[99] = s_axis_bram_99_tlast;
            assign tvalid[99] = s_axis_bram_99_tvalid;
            assign tkeep[99][C_INPUT_BRAM_99_DMWIDTH/8-1:0] = s_axis_bram_99_tkeep;
            assign tstrb[99][C_INPUT_BRAM_99_DMWIDTH/8-1:0] = s_axis_bram_99_tstrb;
            assign tdata[99][C_INPUT_BRAM_99_DMWIDTH-1:0] = s_axis_bram_99_tdata;
            assign s_axis_bram_99_tready = tready[99];
            
            assign addr0[99][C_INPUT_BRAM_99_ADDR_WIDTH-1:0] = ap_bram_99_addr0;
            assign din0[99][C_INPUT_BRAM_99_WIDTH-1:0] = ap_bram_99_din0;
            assign ap_bram_99_dout0 = dout0[99][C_INPUT_BRAM_99_WIDTH-1:0];
            assign we0[99][C_INPUT_BRAM_99_WIDTH/8-1:0] = ap_bram_99_we0;
            assign en0[99] = ap_bram_99_en0;
            assign addr1[99][C_INPUT_BRAM_99_ADDR_WIDTH-1:0] = ap_bram_99_addr1;
            assign din1[99][C_INPUT_BRAM_99_WIDTH-1:0] = ap_bram_99_din1;
            assign ap_bram_99_dout1 = dout1[99][C_INPUT_BRAM_99_WIDTH-1:0];
            assign we1[99][C_INPUT_BRAM_99_WIDTH/8-1:0] = ap_bram_99_we1;
            assign en1[99] = ap_bram_99_en1;
            
            assign dwconv1_tready[99] = m_axis_bram_99_tready;
            assign m_axis_bram_99_tlast = dwconv1_tlast[99];
            assign m_axis_bram_99_tvalid = dwconv1_tvalid[99];
            assign m_axis_bram_99_tkeep = dwconv1_tkeep[99][C_OUTPUT_BRAM_99_DMWIDTH/8-1:0];
            assign m_axis_bram_99_tstrb = dwconv1_tstrb[99][C_OUTPUT_BRAM_99_DMWIDTH/8-1:0];
            assign m_axis_bram_99_tdata = dwconv1_tdata[99][C_OUTPUT_BRAM_99_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 100) begin
            assign tlast[100] = s_axis_bram_100_tlast;
            assign tvalid[100] = s_axis_bram_100_tvalid;
            assign tkeep[100][C_INPUT_BRAM_100_DMWIDTH/8-1:0] = s_axis_bram_100_tkeep;
            assign tstrb[100][C_INPUT_BRAM_100_DMWIDTH/8-1:0] = s_axis_bram_100_tstrb;
            assign tdata[100][C_INPUT_BRAM_100_DMWIDTH-1:0] = s_axis_bram_100_tdata;
            assign s_axis_bram_100_tready = tready[100];
            
            assign addr0[100][C_INPUT_BRAM_100_ADDR_WIDTH-1:0] = ap_bram_100_addr0;
            assign din0[100][C_INPUT_BRAM_100_WIDTH-1:0] = ap_bram_100_din0;
            assign ap_bram_100_dout0 = dout0[100][C_INPUT_BRAM_100_WIDTH-1:0];
            assign we0[100][C_INPUT_BRAM_100_WIDTH/8-1:0] = ap_bram_100_we0;
            assign en0[100] = ap_bram_100_en0;
            assign addr1[100][C_INPUT_BRAM_100_ADDR_WIDTH-1:0] = ap_bram_100_addr1;
            assign din1[100][C_INPUT_BRAM_100_WIDTH-1:0] = ap_bram_100_din1;
            assign ap_bram_100_dout1 = dout1[100][C_INPUT_BRAM_100_WIDTH-1:0];
            assign we1[100][C_INPUT_BRAM_100_WIDTH/8-1:0] = ap_bram_100_we1;
            assign en1[100] = ap_bram_100_en1;
            
            assign dwconv1_tready[100] = m_axis_bram_100_tready;
            assign m_axis_bram_100_tlast = dwconv1_tlast[100];
            assign m_axis_bram_100_tvalid = dwconv1_tvalid[100];
            assign m_axis_bram_100_tkeep = dwconv1_tkeep[100][C_OUTPUT_BRAM_100_DMWIDTH/8-1:0];
            assign m_axis_bram_100_tstrb = dwconv1_tstrb[100][C_OUTPUT_BRAM_100_DMWIDTH/8-1:0];
            assign m_axis_bram_100_tdata = dwconv1_tdata[100][C_OUTPUT_BRAM_100_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 101) begin
            assign tlast[101] = s_axis_bram_101_tlast;
            assign tvalid[101] = s_axis_bram_101_tvalid;
            assign tkeep[101][C_INPUT_BRAM_101_DMWIDTH/8-1:0] = s_axis_bram_101_tkeep;
            assign tstrb[101][C_INPUT_BRAM_101_DMWIDTH/8-1:0] = s_axis_bram_101_tstrb;
            assign tdata[101][C_INPUT_BRAM_101_DMWIDTH-1:0] = s_axis_bram_101_tdata;
            assign s_axis_bram_101_tready = tready[101];
            
            assign addr0[101][C_INPUT_BRAM_101_ADDR_WIDTH-1:0] = ap_bram_101_addr0;
            assign din0[101][C_INPUT_BRAM_101_WIDTH-1:0] = ap_bram_101_din0;
            assign ap_bram_101_dout0 = dout0[101][C_INPUT_BRAM_101_WIDTH-1:0];
            assign we0[101][C_INPUT_BRAM_101_WIDTH/8-1:0] = ap_bram_101_we0;
            assign en0[101] = ap_bram_101_en0;
            assign addr1[101][C_INPUT_BRAM_101_ADDR_WIDTH-1:0] = ap_bram_101_addr1;
            assign din1[101][C_INPUT_BRAM_101_WIDTH-1:0] = ap_bram_101_din1;
            assign ap_bram_101_dout1 = dout1[101][C_INPUT_BRAM_101_WIDTH-1:0];
            assign we1[101][C_INPUT_BRAM_101_WIDTH/8-1:0] = ap_bram_101_we1;
            assign en1[101] = ap_bram_101_en1;
            
            assign dwconv1_tready[101] = m_axis_bram_101_tready;
            assign m_axis_bram_101_tlast = dwconv1_tlast[101];
            assign m_axis_bram_101_tvalid = dwconv1_tvalid[101];
            assign m_axis_bram_101_tkeep = dwconv1_tkeep[101][C_OUTPUT_BRAM_101_DMWIDTH/8-1:0];
            assign m_axis_bram_101_tstrb = dwconv1_tstrb[101][C_OUTPUT_BRAM_101_DMWIDTH/8-1:0];
            assign m_axis_bram_101_tdata = dwconv1_tdata[101][C_OUTPUT_BRAM_101_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 102) begin
            assign tlast[102] = s_axis_bram_102_tlast;
            assign tvalid[102] = s_axis_bram_102_tvalid;
            assign tkeep[102][C_INPUT_BRAM_102_DMWIDTH/8-1:0] = s_axis_bram_102_tkeep;
            assign tstrb[102][C_INPUT_BRAM_102_DMWIDTH/8-1:0] = s_axis_bram_102_tstrb;
            assign tdata[102][C_INPUT_BRAM_102_DMWIDTH-1:0] = s_axis_bram_102_tdata;
            assign s_axis_bram_102_tready = tready[102];
            
            assign addr0[102][C_INPUT_BRAM_102_ADDR_WIDTH-1:0] = ap_bram_102_addr0;
            assign din0[102][C_INPUT_BRAM_102_WIDTH-1:0] = ap_bram_102_din0;
            assign ap_bram_102_dout0 = dout0[102][C_INPUT_BRAM_102_WIDTH-1:0];
            assign we0[102][C_INPUT_BRAM_102_WIDTH/8-1:0] = ap_bram_102_we0;
            assign en0[102] = ap_bram_102_en0;
            assign addr1[102][C_INPUT_BRAM_102_ADDR_WIDTH-1:0] = ap_bram_102_addr1;
            assign din1[102][C_INPUT_BRAM_102_WIDTH-1:0] = ap_bram_102_din1;
            assign ap_bram_102_dout1 = dout1[102][C_INPUT_BRAM_102_WIDTH-1:0];
            assign we1[102][C_INPUT_BRAM_102_WIDTH/8-1:0] = ap_bram_102_we1;
            assign en1[102] = ap_bram_102_en1;
            
            assign dwconv1_tready[102] = m_axis_bram_102_tready;
            assign m_axis_bram_102_tlast = dwconv1_tlast[102];
            assign m_axis_bram_102_tvalid = dwconv1_tvalid[102];
            assign m_axis_bram_102_tkeep = dwconv1_tkeep[102][C_OUTPUT_BRAM_102_DMWIDTH/8-1:0];
            assign m_axis_bram_102_tstrb = dwconv1_tstrb[102][C_OUTPUT_BRAM_102_DMWIDTH/8-1:0];
            assign m_axis_bram_102_tdata = dwconv1_tdata[102][C_OUTPUT_BRAM_102_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 103) begin
            assign tlast[103] = s_axis_bram_103_tlast;
            assign tvalid[103] = s_axis_bram_103_tvalid;
            assign tkeep[103][C_INPUT_BRAM_103_DMWIDTH/8-1:0] = s_axis_bram_103_tkeep;
            assign tstrb[103][C_INPUT_BRAM_103_DMWIDTH/8-1:0] = s_axis_bram_103_tstrb;
            assign tdata[103][C_INPUT_BRAM_103_DMWIDTH-1:0] = s_axis_bram_103_tdata;
            assign s_axis_bram_103_tready = tready[103];
            
            assign addr0[103][C_INPUT_BRAM_103_ADDR_WIDTH-1:0] = ap_bram_103_addr0;
            assign din0[103][C_INPUT_BRAM_103_WIDTH-1:0] = ap_bram_103_din0;
            assign ap_bram_103_dout0 = dout0[103][C_INPUT_BRAM_103_WIDTH-1:0];
            assign we0[103][C_INPUT_BRAM_103_WIDTH/8-1:0] = ap_bram_103_we0;
            assign en0[103] = ap_bram_103_en0;
            assign addr1[103][C_INPUT_BRAM_103_ADDR_WIDTH-1:0] = ap_bram_103_addr1;
            assign din1[103][C_INPUT_BRAM_103_WIDTH-1:0] = ap_bram_103_din1;
            assign ap_bram_103_dout1 = dout1[103][C_INPUT_BRAM_103_WIDTH-1:0];
            assign we1[103][C_INPUT_BRAM_103_WIDTH/8-1:0] = ap_bram_103_we1;
            assign en1[103] = ap_bram_103_en1;
            
            assign dwconv1_tready[103] = m_axis_bram_103_tready;
            assign m_axis_bram_103_tlast = dwconv1_tlast[103];
            assign m_axis_bram_103_tvalid = dwconv1_tvalid[103];
            assign m_axis_bram_103_tkeep = dwconv1_tkeep[103][C_OUTPUT_BRAM_103_DMWIDTH/8-1:0];
            assign m_axis_bram_103_tstrb = dwconv1_tstrb[103][C_OUTPUT_BRAM_103_DMWIDTH/8-1:0];
            assign m_axis_bram_103_tdata = dwconv1_tdata[103][C_OUTPUT_BRAM_103_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 104) begin
            assign tlast[104] = s_axis_bram_104_tlast;
            assign tvalid[104] = s_axis_bram_104_tvalid;
            assign tkeep[104][C_INPUT_BRAM_104_DMWIDTH/8-1:0] = s_axis_bram_104_tkeep;
            assign tstrb[104][C_INPUT_BRAM_104_DMWIDTH/8-1:0] = s_axis_bram_104_tstrb;
            assign tdata[104][C_INPUT_BRAM_104_DMWIDTH-1:0] = s_axis_bram_104_tdata;
            assign s_axis_bram_104_tready = tready[104];
            
            assign addr0[104][C_INPUT_BRAM_104_ADDR_WIDTH-1:0] = ap_bram_104_addr0;
            assign din0[104][C_INPUT_BRAM_104_WIDTH-1:0] = ap_bram_104_din0;
            assign ap_bram_104_dout0 = dout0[104][C_INPUT_BRAM_104_WIDTH-1:0];
            assign we0[104][C_INPUT_BRAM_104_WIDTH/8-1:0] = ap_bram_104_we0;
            assign en0[104] = ap_bram_104_en0;
            assign addr1[104][C_INPUT_BRAM_104_ADDR_WIDTH-1:0] = ap_bram_104_addr1;
            assign din1[104][C_INPUT_BRAM_104_WIDTH-1:0] = ap_bram_104_din1;
            assign ap_bram_104_dout1 = dout1[104][C_INPUT_BRAM_104_WIDTH-1:0];
            assign we1[104][C_INPUT_BRAM_104_WIDTH/8-1:0] = ap_bram_104_we1;
            assign en1[104] = ap_bram_104_en1;
            
            assign dwconv1_tready[104] = m_axis_bram_104_tready;
            assign m_axis_bram_104_tlast = dwconv1_tlast[104];
            assign m_axis_bram_104_tvalid = dwconv1_tvalid[104];
            assign m_axis_bram_104_tkeep = dwconv1_tkeep[104][C_OUTPUT_BRAM_104_DMWIDTH/8-1:0];
            assign m_axis_bram_104_tstrb = dwconv1_tstrb[104][C_OUTPUT_BRAM_104_DMWIDTH/8-1:0];
            assign m_axis_bram_104_tdata = dwconv1_tdata[104][C_OUTPUT_BRAM_104_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 105) begin
            assign tlast[105] = s_axis_bram_105_tlast;
            assign tvalid[105] = s_axis_bram_105_tvalid;
            assign tkeep[105][C_INPUT_BRAM_105_DMWIDTH/8-1:0] = s_axis_bram_105_tkeep;
            assign tstrb[105][C_INPUT_BRAM_105_DMWIDTH/8-1:0] = s_axis_bram_105_tstrb;
            assign tdata[105][C_INPUT_BRAM_105_DMWIDTH-1:0] = s_axis_bram_105_tdata;
            assign s_axis_bram_105_tready = tready[105];
            
            assign addr0[105][C_INPUT_BRAM_105_ADDR_WIDTH-1:0] = ap_bram_105_addr0;
            assign din0[105][C_INPUT_BRAM_105_WIDTH-1:0] = ap_bram_105_din0;
            assign ap_bram_105_dout0 = dout0[105][C_INPUT_BRAM_105_WIDTH-1:0];
            assign we0[105][C_INPUT_BRAM_105_WIDTH/8-1:0] = ap_bram_105_we0;
            assign en0[105] = ap_bram_105_en0;
            assign addr1[105][C_INPUT_BRAM_105_ADDR_WIDTH-1:0] = ap_bram_105_addr1;
            assign din1[105][C_INPUT_BRAM_105_WIDTH-1:0] = ap_bram_105_din1;
            assign ap_bram_105_dout1 = dout1[105][C_INPUT_BRAM_105_WIDTH-1:0];
            assign we1[105][C_INPUT_BRAM_105_WIDTH/8-1:0] = ap_bram_105_we1;
            assign en1[105] = ap_bram_105_en1;
            
            assign dwconv1_tready[105] = m_axis_bram_105_tready;
            assign m_axis_bram_105_tlast = dwconv1_tlast[105];
            assign m_axis_bram_105_tvalid = dwconv1_tvalid[105];
            assign m_axis_bram_105_tkeep = dwconv1_tkeep[105][C_OUTPUT_BRAM_105_DMWIDTH/8-1:0];
            assign m_axis_bram_105_tstrb = dwconv1_tstrb[105][C_OUTPUT_BRAM_105_DMWIDTH/8-1:0];
            assign m_axis_bram_105_tdata = dwconv1_tdata[105][C_OUTPUT_BRAM_105_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 106) begin
            assign tlast[106] = s_axis_bram_106_tlast;
            assign tvalid[106] = s_axis_bram_106_tvalid;
            assign tkeep[106][C_INPUT_BRAM_106_DMWIDTH/8-1:0] = s_axis_bram_106_tkeep;
            assign tstrb[106][C_INPUT_BRAM_106_DMWIDTH/8-1:0] = s_axis_bram_106_tstrb;
            assign tdata[106][C_INPUT_BRAM_106_DMWIDTH-1:0] = s_axis_bram_106_tdata;
            assign s_axis_bram_106_tready = tready[106];
            
            assign addr0[106][C_INPUT_BRAM_106_ADDR_WIDTH-1:0] = ap_bram_106_addr0;
            assign din0[106][C_INPUT_BRAM_106_WIDTH-1:0] = ap_bram_106_din0;
            assign ap_bram_106_dout0 = dout0[106][C_INPUT_BRAM_106_WIDTH-1:0];
            assign we0[106][C_INPUT_BRAM_106_WIDTH/8-1:0] = ap_bram_106_we0;
            assign en0[106] = ap_bram_106_en0;
            assign addr1[106][C_INPUT_BRAM_106_ADDR_WIDTH-1:0] = ap_bram_106_addr1;
            assign din1[106][C_INPUT_BRAM_106_WIDTH-1:0] = ap_bram_106_din1;
            assign ap_bram_106_dout1 = dout1[106][C_INPUT_BRAM_106_WIDTH-1:0];
            assign we1[106][C_INPUT_BRAM_106_WIDTH/8-1:0] = ap_bram_106_we1;
            assign en1[106] = ap_bram_106_en1;
            
            assign dwconv1_tready[106] = m_axis_bram_106_tready;
            assign m_axis_bram_106_tlast = dwconv1_tlast[106];
            assign m_axis_bram_106_tvalid = dwconv1_tvalid[106];
            assign m_axis_bram_106_tkeep = dwconv1_tkeep[106][C_OUTPUT_BRAM_106_DMWIDTH/8-1:0];
            assign m_axis_bram_106_tstrb = dwconv1_tstrb[106][C_OUTPUT_BRAM_106_DMWIDTH/8-1:0];
            assign m_axis_bram_106_tdata = dwconv1_tdata[106][C_OUTPUT_BRAM_106_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 107) begin
            assign tlast[107] = s_axis_bram_107_tlast;
            assign tvalid[107] = s_axis_bram_107_tvalid;
            assign tkeep[107][C_INPUT_BRAM_107_DMWIDTH/8-1:0] = s_axis_bram_107_tkeep;
            assign tstrb[107][C_INPUT_BRAM_107_DMWIDTH/8-1:0] = s_axis_bram_107_tstrb;
            assign tdata[107][C_INPUT_BRAM_107_DMWIDTH-1:0] = s_axis_bram_107_tdata;
            assign s_axis_bram_107_tready = tready[107];
            
            assign addr0[107][C_INPUT_BRAM_107_ADDR_WIDTH-1:0] = ap_bram_107_addr0;
            assign din0[107][C_INPUT_BRAM_107_WIDTH-1:0] = ap_bram_107_din0;
            assign ap_bram_107_dout0 = dout0[107][C_INPUT_BRAM_107_WIDTH-1:0];
            assign we0[107][C_INPUT_BRAM_107_WIDTH/8-1:0] = ap_bram_107_we0;
            assign en0[107] = ap_bram_107_en0;
            assign addr1[107][C_INPUT_BRAM_107_ADDR_WIDTH-1:0] = ap_bram_107_addr1;
            assign din1[107][C_INPUT_BRAM_107_WIDTH-1:0] = ap_bram_107_din1;
            assign ap_bram_107_dout1 = dout1[107][C_INPUT_BRAM_107_WIDTH-1:0];
            assign we1[107][C_INPUT_BRAM_107_WIDTH/8-1:0] = ap_bram_107_we1;
            assign en1[107] = ap_bram_107_en1;
            
            assign dwconv1_tready[107] = m_axis_bram_107_tready;
            assign m_axis_bram_107_tlast = dwconv1_tlast[107];
            assign m_axis_bram_107_tvalid = dwconv1_tvalid[107];
            assign m_axis_bram_107_tkeep = dwconv1_tkeep[107][C_OUTPUT_BRAM_107_DMWIDTH/8-1:0];
            assign m_axis_bram_107_tstrb = dwconv1_tstrb[107][C_OUTPUT_BRAM_107_DMWIDTH/8-1:0];
            assign m_axis_bram_107_tdata = dwconv1_tdata[107][C_OUTPUT_BRAM_107_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 108) begin
            assign tlast[108] = s_axis_bram_108_tlast;
            assign tvalid[108] = s_axis_bram_108_tvalid;
            assign tkeep[108][C_INPUT_BRAM_108_DMWIDTH/8-1:0] = s_axis_bram_108_tkeep;
            assign tstrb[108][C_INPUT_BRAM_108_DMWIDTH/8-1:0] = s_axis_bram_108_tstrb;
            assign tdata[108][C_INPUT_BRAM_108_DMWIDTH-1:0] = s_axis_bram_108_tdata;
            assign s_axis_bram_108_tready = tready[108];
            
            assign addr0[108][C_INPUT_BRAM_108_ADDR_WIDTH-1:0] = ap_bram_108_addr0;
            assign din0[108][C_INPUT_BRAM_108_WIDTH-1:0] = ap_bram_108_din0;
            assign ap_bram_108_dout0 = dout0[108][C_INPUT_BRAM_108_WIDTH-1:0];
            assign we0[108][C_INPUT_BRAM_108_WIDTH/8-1:0] = ap_bram_108_we0;
            assign en0[108] = ap_bram_108_en0;
            assign addr1[108][C_INPUT_BRAM_108_ADDR_WIDTH-1:0] = ap_bram_108_addr1;
            assign din1[108][C_INPUT_BRAM_108_WIDTH-1:0] = ap_bram_108_din1;
            assign ap_bram_108_dout1 = dout1[108][C_INPUT_BRAM_108_WIDTH-1:0];
            assign we1[108][C_INPUT_BRAM_108_WIDTH/8-1:0] = ap_bram_108_we1;
            assign en1[108] = ap_bram_108_en1;
            
            assign dwconv1_tready[108] = m_axis_bram_108_tready;
            assign m_axis_bram_108_tlast = dwconv1_tlast[108];
            assign m_axis_bram_108_tvalid = dwconv1_tvalid[108];
            assign m_axis_bram_108_tkeep = dwconv1_tkeep[108][C_OUTPUT_BRAM_108_DMWIDTH/8-1:0];
            assign m_axis_bram_108_tstrb = dwconv1_tstrb[108][C_OUTPUT_BRAM_108_DMWIDTH/8-1:0];
            assign m_axis_bram_108_tdata = dwconv1_tdata[108][C_OUTPUT_BRAM_108_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 109) begin
            assign tlast[109] = s_axis_bram_109_tlast;
            assign tvalid[109] = s_axis_bram_109_tvalid;
            assign tkeep[109][C_INPUT_BRAM_109_DMWIDTH/8-1:0] = s_axis_bram_109_tkeep;
            assign tstrb[109][C_INPUT_BRAM_109_DMWIDTH/8-1:0] = s_axis_bram_109_tstrb;
            assign tdata[109][C_INPUT_BRAM_109_DMWIDTH-1:0] = s_axis_bram_109_tdata;
            assign s_axis_bram_109_tready = tready[109];
            
            assign addr0[109][C_INPUT_BRAM_109_ADDR_WIDTH-1:0] = ap_bram_109_addr0;
            assign din0[109][C_INPUT_BRAM_109_WIDTH-1:0] = ap_bram_109_din0;
            assign ap_bram_109_dout0 = dout0[109][C_INPUT_BRAM_109_WIDTH-1:0];
            assign we0[109][C_INPUT_BRAM_109_WIDTH/8-1:0] = ap_bram_109_we0;
            assign en0[109] = ap_bram_109_en0;
            assign addr1[109][C_INPUT_BRAM_109_ADDR_WIDTH-1:0] = ap_bram_109_addr1;
            assign din1[109][C_INPUT_BRAM_109_WIDTH-1:0] = ap_bram_109_din1;
            assign ap_bram_109_dout1 = dout1[109][C_INPUT_BRAM_109_WIDTH-1:0];
            assign we1[109][C_INPUT_BRAM_109_WIDTH/8-1:0] = ap_bram_109_we1;
            assign en1[109] = ap_bram_109_en1;
            
            assign dwconv1_tready[109] = m_axis_bram_109_tready;
            assign m_axis_bram_109_tlast = dwconv1_tlast[109];
            assign m_axis_bram_109_tvalid = dwconv1_tvalid[109];
            assign m_axis_bram_109_tkeep = dwconv1_tkeep[109][C_OUTPUT_BRAM_109_DMWIDTH/8-1:0];
            assign m_axis_bram_109_tstrb = dwconv1_tstrb[109][C_OUTPUT_BRAM_109_DMWIDTH/8-1:0];
            assign m_axis_bram_109_tdata = dwconv1_tdata[109][C_OUTPUT_BRAM_109_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 110) begin
            assign tlast[110] = s_axis_bram_110_tlast;
            assign tvalid[110] = s_axis_bram_110_tvalid;
            assign tkeep[110][C_INPUT_BRAM_110_DMWIDTH/8-1:0] = s_axis_bram_110_tkeep;
            assign tstrb[110][C_INPUT_BRAM_110_DMWIDTH/8-1:0] = s_axis_bram_110_tstrb;
            assign tdata[110][C_INPUT_BRAM_110_DMWIDTH-1:0] = s_axis_bram_110_tdata;
            assign s_axis_bram_110_tready = tready[110];
            
            assign addr0[110][C_INPUT_BRAM_110_ADDR_WIDTH-1:0] = ap_bram_110_addr0;
            assign din0[110][C_INPUT_BRAM_110_WIDTH-1:0] = ap_bram_110_din0;
            assign ap_bram_110_dout0 = dout0[110][C_INPUT_BRAM_110_WIDTH-1:0];
            assign we0[110][C_INPUT_BRAM_110_WIDTH/8-1:0] = ap_bram_110_we0;
            assign en0[110] = ap_bram_110_en0;
            assign addr1[110][C_INPUT_BRAM_110_ADDR_WIDTH-1:0] = ap_bram_110_addr1;
            assign din1[110][C_INPUT_BRAM_110_WIDTH-1:0] = ap_bram_110_din1;
            assign ap_bram_110_dout1 = dout1[110][C_INPUT_BRAM_110_WIDTH-1:0];
            assign we1[110][C_INPUT_BRAM_110_WIDTH/8-1:0] = ap_bram_110_we1;
            assign en1[110] = ap_bram_110_en1;
            
            assign dwconv1_tready[110] = m_axis_bram_110_tready;
            assign m_axis_bram_110_tlast = dwconv1_tlast[110];
            assign m_axis_bram_110_tvalid = dwconv1_tvalid[110];
            assign m_axis_bram_110_tkeep = dwconv1_tkeep[110][C_OUTPUT_BRAM_110_DMWIDTH/8-1:0];
            assign m_axis_bram_110_tstrb = dwconv1_tstrb[110][C_OUTPUT_BRAM_110_DMWIDTH/8-1:0];
            assign m_axis_bram_110_tdata = dwconv1_tdata[110][C_OUTPUT_BRAM_110_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 111) begin
            assign tlast[111] = s_axis_bram_111_tlast;
            assign tvalid[111] = s_axis_bram_111_tvalid;
            assign tkeep[111][C_INPUT_BRAM_111_DMWIDTH/8-1:0] = s_axis_bram_111_tkeep;
            assign tstrb[111][C_INPUT_BRAM_111_DMWIDTH/8-1:0] = s_axis_bram_111_tstrb;
            assign tdata[111][C_INPUT_BRAM_111_DMWIDTH-1:0] = s_axis_bram_111_tdata;
            assign s_axis_bram_111_tready = tready[111];
            
            assign addr0[111][C_INPUT_BRAM_111_ADDR_WIDTH-1:0] = ap_bram_111_addr0;
            assign din0[111][C_INPUT_BRAM_111_WIDTH-1:0] = ap_bram_111_din0;
            assign ap_bram_111_dout0 = dout0[111][C_INPUT_BRAM_111_WIDTH-1:0];
            assign we0[111][C_INPUT_BRAM_111_WIDTH/8-1:0] = ap_bram_111_we0;
            assign en0[111] = ap_bram_111_en0;
            assign addr1[111][C_INPUT_BRAM_111_ADDR_WIDTH-1:0] = ap_bram_111_addr1;
            assign din1[111][C_INPUT_BRAM_111_WIDTH-1:0] = ap_bram_111_din1;
            assign ap_bram_111_dout1 = dout1[111][C_INPUT_BRAM_111_WIDTH-1:0];
            assign we1[111][C_INPUT_BRAM_111_WIDTH/8-1:0] = ap_bram_111_we1;
            assign en1[111] = ap_bram_111_en1;
            
            assign dwconv1_tready[111] = m_axis_bram_111_tready;
            assign m_axis_bram_111_tlast = dwconv1_tlast[111];
            assign m_axis_bram_111_tvalid = dwconv1_tvalid[111];
            assign m_axis_bram_111_tkeep = dwconv1_tkeep[111][C_OUTPUT_BRAM_111_DMWIDTH/8-1:0];
            assign m_axis_bram_111_tstrb = dwconv1_tstrb[111][C_OUTPUT_BRAM_111_DMWIDTH/8-1:0];
            assign m_axis_bram_111_tdata = dwconv1_tdata[111][C_OUTPUT_BRAM_111_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 112) begin
            assign tlast[112] = s_axis_bram_112_tlast;
            assign tvalid[112] = s_axis_bram_112_tvalid;
            assign tkeep[112][C_INPUT_BRAM_112_DMWIDTH/8-1:0] = s_axis_bram_112_tkeep;
            assign tstrb[112][C_INPUT_BRAM_112_DMWIDTH/8-1:0] = s_axis_bram_112_tstrb;
            assign tdata[112][C_INPUT_BRAM_112_DMWIDTH-1:0] = s_axis_bram_112_tdata;
            assign s_axis_bram_112_tready = tready[112];
            
            assign addr0[112][C_INPUT_BRAM_112_ADDR_WIDTH-1:0] = ap_bram_112_addr0;
            assign din0[112][C_INPUT_BRAM_112_WIDTH-1:0] = ap_bram_112_din0;
            assign ap_bram_112_dout0 = dout0[112][C_INPUT_BRAM_112_WIDTH-1:0];
            assign we0[112][C_INPUT_BRAM_112_WIDTH/8-1:0] = ap_bram_112_we0;
            assign en0[112] = ap_bram_112_en0;
            assign addr1[112][C_INPUT_BRAM_112_ADDR_WIDTH-1:0] = ap_bram_112_addr1;
            assign din1[112][C_INPUT_BRAM_112_WIDTH-1:0] = ap_bram_112_din1;
            assign ap_bram_112_dout1 = dout1[112][C_INPUT_BRAM_112_WIDTH-1:0];
            assign we1[112][C_INPUT_BRAM_112_WIDTH/8-1:0] = ap_bram_112_we1;
            assign en1[112] = ap_bram_112_en1;
            
            assign dwconv1_tready[112] = m_axis_bram_112_tready;
            assign m_axis_bram_112_tlast = dwconv1_tlast[112];
            assign m_axis_bram_112_tvalid = dwconv1_tvalid[112];
            assign m_axis_bram_112_tkeep = dwconv1_tkeep[112][C_OUTPUT_BRAM_112_DMWIDTH/8-1:0];
            assign m_axis_bram_112_tstrb = dwconv1_tstrb[112][C_OUTPUT_BRAM_112_DMWIDTH/8-1:0];
            assign m_axis_bram_112_tdata = dwconv1_tdata[112][C_OUTPUT_BRAM_112_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 113) begin
            assign tlast[113] = s_axis_bram_113_tlast;
            assign tvalid[113] = s_axis_bram_113_tvalid;
            assign tkeep[113][C_INPUT_BRAM_113_DMWIDTH/8-1:0] = s_axis_bram_113_tkeep;
            assign tstrb[113][C_INPUT_BRAM_113_DMWIDTH/8-1:0] = s_axis_bram_113_tstrb;
            assign tdata[113][C_INPUT_BRAM_113_DMWIDTH-1:0] = s_axis_bram_113_tdata;
            assign s_axis_bram_113_tready = tready[113];
            
            assign addr0[113][C_INPUT_BRAM_113_ADDR_WIDTH-1:0] = ap_bram_113_addr0;
            assign din0[113][C_INPUT_BRAM_113_WIDTH-1:0] = ap_bram_113_din0;
            assign ap_bram_113_dout0 = dout0[113][C_INPUT_BRAM_113_WIDTH-1:0];
            assign we0[113][C_INPUT_BRAM_113_WIDTH/8-1:0] = ap_bram_113_we0;
            assign en0[113] = ap_bram_113_en0;
            assign addr1[113][C_INPUT_BRAM_113_ADDR_WIDTH-1:0] = ap_bram_113_addr1;
            assign din1[113][C_INPUT_BRAM_113_WIDTH-1:0] = ap_bram_113_din1;
            assign ap_bram_113_dout1 = dout1[113][C_INPUT_BRAM_113_WIDTH-1:0];
            assign we1[113][C_INPUT_BRAM_113_WIDTH/8-1:0] = ap_bram_113_we1;
            assign en1[113] = ap_bram_113_en1;
            
            assign dwconv1_tready[113] = m_axis_bram_113_tready;
            assign m_axis_bram_113_tlast = dwconv1_tlast[113];
            assign m_axis_bram_113_tvalid = dwconv1_tvalid[113];
            assign m_axis_bram_113_tkeep = dwconv1_tkeep[113][C_OUTPUT_BRAM_113_DMWIDTH/8-1:0];
            assign m_axis_bram_113_tstrb = dwconv1_tstrb[113][C_OUTPUT_BRAM_113_DMWIDTH/8-1:0];
            assign m_axis_bram_113_tdata = dwconv1_tdata[113][C_OUTPUT_BRAM_113_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 114) begin
            assign tlast[114] = s_axis_bram_114_tlast;
            assign tvalid[114] = s_axis_bram_114_tvalid;
            assign tkeep[114][C_INPUT_BRAM_114_DMWIDTH/8-1:0] = s_axis_bram_114_tkeep;
            assign tstrb[114][C_INPUT_BRAM_114_DMWIDTH/8-1:0] = s_axis_bram_114_tstrb;
            assign tdata[114][C_INPUT_BRAM_114_DMWIDTH-1:0] = s_axis_bram_114_tdata;
            assign s_axis_bram_114_tready = tready[114];
            
            assign addr0[114][C_INPUT_BRAM_114_ADDR_WIDTH-1:0] = ap_bram_114_addr0;
            assign din0[114][C_INPUT_BRAM_114_WIDTH-1:0] = ap_bram_114_din0;
            assign ap_bram_114_dout0 = dout0[114][C_INPUT_BRAM_114_WIDTH-1:0];
            assign we0[114][C_INPUT_BRAM_114_WIDTH/8-1:0] = ap_bram_114_we0;
            assign en0[114] = ap_bram_114_en0;
            assign addr1[114][C_INPUT_BRAM_114_ADDR_WIDTH-1:0] = ap_bram_114_addr1;
            assign din1[114][C_INPUT_BRAM_114_WIDTH-1:0] = ap_bram_114_din1;
            assign ap_bram_114_dout1 = dout1[114][C_INPUT_BRAM_114_WIDTH-1:0];
            assign we1[114][C_INPUT_BRAM_114_WIDTH/8-1:0] = ap_bram_114_we1;
            assign en1[114] = ap_bram_114_en1;
            
            assign dwconv1_tready[114] = m_axis_bram_114_tready;
            assign m_axis_bram_114_tlast = dwconv1_tlast[114];
            assign m_axis_bram_114_tvalid = dwconv1_tvalid[114];
            assign m_axis_bram_114_tkeep = dwconv1_tkeep[114][C_OUTPUT_BRAM_114_DMWIDTH/8-1:0];
            assign m_axis_bram_114_tstrb = dwconv1_tstrb[114][C_OUTPUT_BRAM_114_DMWIDTH/8-1:0];
            assign m_axis_bram_114_tdata = dwconv1_tdata[114][C_OUTPUT_BRAM_114_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 115) begin
            assign tlast[115] = s_axis_bram_115_tlast;
            assign tvalid[115] = s_axis_bram_115_tvalid;
            assign tkeep[115][C_INPUT_BRAM_115_DMWIDTH/8-1:0] = s_axis_bram_115_tkeep;
            assign tstrb[115][C_INPUT_BRAM_115_DMWIDTH/8-1:0] = s_axis_bram_115_tstrb;
            assign tdata[115][C_INPUT_BRAM_115_DMWIDTH-1:0] = s_axis_bram_115_tdata;
            assign s_axis_bram_115_tready = tready[115];
            
            assign addr0[115][C_INPUT_BRAM_115_ADDR_WIDTH-1:0] = ap_bram_115_addr0;
            assign din0[115][C_INPUT_BRAM_115_WIDTH-1:0] = ap_bram_115_din0;
            assign ap_bram_115_dout0 = dout0[115][C_INPUT_BRAM_115_WIDTH-1:0];
            assign we0[115][C_INPUT_BRAM_115_WIDTH/8-1:0] = ap_bram_115_we0;
            assign en0[115] = ap_bram_115_en0;
            assign addr1[115][C_INPUT_BRAM_115_ADDR_WIDTH-1:0] = ap_bram_115_addr1;
            assign din1[115][C_INPUT_BRAM_115_WIDTH-1:0] = ap_bram_115_din1;
            assign ap_bram_115_dout1 = dout1[115][C_INPUT_BRAM_115_WIDTH-1:0];
            assign we1[115][C_INPUT_BRAM_115_WIDTH/8-1:0] = ap_bram_115_we1;
            assign en1[115] = ap_bram_115_en1;
            
            assign dwconv1_tready[115] = m_axis_bram_115_tready;
            assign m_axis_bram_115_tlast = dwconv1_tlast[115];
            assign m_axis_bram_115_tvalid = dwconv1_tvalid[115];
            assign m_axis_bram_115_tkeep = dwconv1_tkeep[115][C_OUTPUT_BRAM_115_DMWIDTH/8-1:0];
            assign m_axis_bram_115_tstrb = dwconv1_tstrb[115][C_OUTPUT_BRAM_115_DMWIDTH/8-1:0];
            assign m_axis_bram_115_tdata = dwconv1_tdata[115][C_OUTPUT_BRAM_115_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 116) begin
            assign tlast[116] = s_axis_bram_116_tlast;
            assign tvalid[116] = s_axis_bram_116_tvalid;
            assign tkeep[116][C_INPUT_BRAM_116_DMWIDTH/8-1:0] = s_axis_bram_116_tkeep;
            assign tstrb[116][C_INPUT_BRAM_116_DMWIDTH/8-1:0] = s_axis_bram_116_tstrb;
            assign tdata[116][C_INPUT_BRAM_116_DMWIDTH-1:0] = s_axis_bram_116_tdata;
            assign s_axis_bram_116_tready = tready[116];
            
            assign addr0[116][C_INPUT_BRAM_116_ADDR_WIDTH-1:0] = ap_bram_116_addr0;
            assign din0[116][C_INPUT_BRAM_116_WIDTH-1:0] = ap_bram_116_din0;
            assign ap_bram_116_dout0 = dout0[116][C_INPUT_BRAM_116_WIDTH-1:0];
            assign we0[116][C_INPUT_BRAM_116_WIDTH/8-1:0] = ap_bram_116_we0;
            assign en0[116] = ap_bram_116_en0;
            assign addr1[116][C_INPUT_BRAM_116_ADDR_WIDTH-1:0] = ap_bram_116_addr1;
            assign din1[116][C_INPUT_BRAM_116_WIDTH-1:0] = ap_bram_116_din1;
            assign ap_bram_116_dout1 = dout1[116][C_INPUT_BRAM_116_WIDTH-1:0];
            assign we1[116][C_INPUT_BRAM_116_WIDTH/8-1:0] = ap_bram_116_we1;
            assign en1[116] = ap_bram_116_en1;
            
            assign dwconv1_tready[116] = m_axis_bram_116_tready;
            assign m_axis_bram_116_tlast = dwconv1_tlast[116];
            assign m_axis_bram_116_tvalid = dwconv1_tvalid[116];
            assign m_axis_bram_116_tkeep = dwconv1_tkeep[116][C_OUTPUT_BRAM_116_DMWIDTH/8-1:0];
            assign m_axis_bram_116_tstrb = dwconv1_tstrb[116][C_OUTPUT_BRAM_116_DMWIDTH/8-1:0];
            assign m_axis_bram_116_tdata = dwconv1_tdata[116][C_OUTPUT_BRAM_116_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 117) begin
            assign tlast[117] = s_axis_bram_117_tlast;
            assign tvalid[117] = s_axis_bram_117_tvalid;
            assign tkeep[117][C_INPUT_BRAM_117_DMWIDTH/8-1:0] = s_axis_bram_117_tkeep;
            assign tstrb[117][C_INPUT_BRAM_117_DMWIDTH/8-1:0] = s_axis_bram_117_tstrb;
            assign tdata[117][C_INPUT_BRAM_117_DMWIDTH-1:0] = s_axis_bram_117_tdata;
            assign s_axis_bram_117_tready = tready[117];
            
            assign addr0[117][C_INPUT_BRAM_117_ADDR_WIDTH-1:0] = ap_bram_117_addr0;
            assign din0[117][C_INPUT_BRAM_117_WIDTH-1:0] = ap_bram_117_din0;
            assign ap_bram_117_dout0 = dout0[117][C_INPUT_BRAM_117_WIDTH-1:0];
            assign we0[117][C_INPUT_BRAM_117_WIDTH/8-1:0] = ap_bram_117_we0;
            assign en0[117] = ap_bram_117_en0;
            assign addr1[117][C_INPUT_BRAM_117_ADDR_WIDTH-1:0] = ap_bram_117_addr1;
            assign din1[117][C_INPUT_BRAM_117_WIDTH-1:0] = ap_bram_117_din1;
            assign ap_bram_117_dout1 = dout1[117][C_INPUT_BRAM_117_WIDTH-1:0];
            assign we1[117][C_INPUT_BRAM_117_WIDTH/8-1:0] = ap_bram_117_we1;
            assign en1[117] = ap_bram_117_en1;
            
            assign dwconv1_tready[117] = m_axis_bram_117_tready;
            assign m_axis_bram_117_tlast = dwconv1_tlast[117];
            assign m_axis_bram_117_tvalid = dwconv1_tvalid[117];
            assign m_axis_bram_117_tkeep = dwconv1_tkeep[117][C_OUTPUT_BRAM_117_DMWIDTH/8-1:0];
            assign m_axis_bram_117_tstrb = dwconv1_tstrb[117][C_OUTPUT_BRAM_117_DMWIDTH/8-1:0];
            assign m_axis_bram_117_tdata = dwconv1_tdata[117][C_OUTPUT_BRAM_117_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 118) begin
            assign tlast[118] = s_axis_bram_118_tlast;
            assign tvalid[118] = s_axis_bram_118_tvalid;
            assign tkeep[118][C_INPUT_BRAM_118_DMWIDTH/8-1:0] = s_axis_bram_118_tkeep;
            assign tstrb[118][C_INPUT_BRAM_118_DMWIDTH/8-1:0] = s_axis_bram_118_tstrb;
            assign tdata[118][C_INPUT_BRAM_118_DMWIDTH-1:0] = s_axis_bram_118_tdata;
            assign s_axis_bram_118_tready = tready[118];
            
            assign addr0[118][C_INPUT_BRAM_118_ADDR_WIDTH-1:0] = ap_bram_118_addr0;
            assign din0[118][C_INPUT_BRAM_118_WIDTH-1:0] = ap_bram_118_din0;
            assign ap_bram_118_dout0 = dout0[118][C_INPUT_BRAM_118_WIDTH-1:0];
            assign we0[118][C_INPUT_BRAM_118_WIDTH/8-1:0] = ap_bram_118_we0;
            assign en0[118] = ap_bram_118_en0;
            assign addr1[118][C_INPUT_BRAM_118_ADDR_WIDTH-1:0] = ap_bram_118_addr1;
            assign din1[118][C_INPUT_BRAM_118_WIDTH-1:0] = ap_bram_118_din1;
            assign ap_bram_118_dout1 = dout1[118][C_INPUT_BRAM_118_WIDTH-1:0];
            assign we1[118][C_INPUT_BRAM_118_WIDTH/8-1:0] = ap_bram_118_we1;
            assign en1[118] = ap_bram_118_en1;
            
            assign dwconv1_tready[118] = m_axis_bram_118_tready;
            assign m_axis_bram_118_tlast = dwconv1_tlast[118];
            assign m_axis_bram_118_tvalid = dwconv1_tvalid[118];
            assign m_axis_bram_118_tkeep = dwconv1_tkeep[118][C_OUTPUT_BRAM_118_DMWIDTH/8-1:0];
            assign m_axis_bram_118_tstrb = dwconv1_tstrb[118][C_OUTPUT_BRAM_118_DMWIDTH/8-1:0];
            assign m_axis_bram_118_tdata = dwconv1_tdata[118][C_OUTPUT_BRAM_118_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 119) begin
            assign tlast[119] = s_axis_bram_119_tlast;
            assign tvalid[119] = s_axis_bram_119_tvalid;
            assign tkeep[119][C_INPUT_BRAM_119_DMWIDTH/8-1:0] = s_axis_bram_119_tkeep;
            assign tstrb[119][C_INPUT_BRAM_119_DMWIDTH/8-1:0] = s_axis_bram_119_tstrb;
            assign tdata[119][C_INPUT_BRAM_119_DMWIDTH-1:0] = s_axis_bram_119_tdata;
            assign s_axis_bram_119_tready = tready[119];
            
            assign addr0[119][C_INPUT_BRAM_119_ADDR_WIDTH-1:0] = ap_bram_119_addr0;
            assign din0[119][C_INPUT_BRAM_119_WIDTH-1:0] = ap_bram_119_din0;
            assign ap_bram_119_dout0 = dout0[119][C_INPUT_BRAM_119_WIDTH-1:0];
            assign we0[119][C_INPUT_BRAM_119_WIDTH/8-1:0] = ap_bram_119_we0;
            assign en0[119] = ap_bram_119_en0;
            assign addr1[119][C_INPUT_BRAM_119_ADDR_WIDTH-1:0] = ap_bram_119_addr1;
            assign din1[119][C_INPUT_BRAM_119_WIDTH-1:0] = ap_bram_119_din1;
            assign ap_bram_119_dout1 = dout1[119][C_INPUT_BRAM_119_WIDTH-1:0];
            assign we1[119][C_INPUT_BRAM_119_WIDTH/8-1:0] = ap_bram_119_we1;
            assign en1[119] = ap_bram_119_en1;
            
            assign dwconv1_tready[119] = m_axis_bram_119_tready;
            assign m_axis_bram_119_tlast = dwconv1_tlast[119];
            assign m_axis_bram_119_tvalid = dwconv1_tvalid[119];
            assign m_axis_bram_119_tkeep = dwconv1_tkeep[119][C_OUTPUT_BRAM_119_DMWIDTH/8-1:0];
            assign m_axis_bram_119_tstrb = dwconv1_tstrb[119][C_OUTPUT_BRAM_119_DMWIDTH/8-1:0];
            assign m_axis_bram_119_tdata = dwconv1_tdata[119][C_OUTPUT_BRAM_119_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 120) begin
            assign tlast[120] = s_axis_bram_120_tlast;
            assign tvalid[120] = s_axis_bram_120_tvalid;
            assign tkeep[120][C_INPUT_BRAM_120_DMWIDTH/8-1:0] = s_axis_bram_120_tkeep;
            assign tstrb[120][C_INPUT_BRAM_120_DMWIDTH/8-1:0] = s_axis_bram_120_tstrb;
            assign tdata[120][C_INPUT_BRAM_120_DMWIDTH-1:0] = s_axis_bram_120_tdata;
            assign s_axis_bram_120_tready = tready[120];
            
            assign addr0[120][C_INPUT_BRAM_120_ADDR_WIDTH-1:0] = ap_bram_120_addr0;
            assign din0[120][C_INPUT_BRAM_120_WIDTH-1:0] = ap_bram_120_din0;
            assign ap_bram_120_dout0 = dout0[120][C_INPUT_BRAM_120_WIDTH-1:0];
            assign we0[120][C_INPUT_BRAM_120_WIDTH/8-1:0] = ap_bram_120_we0;
            assign en0[120] = ap_bram_120_en0;
            assign addr1[120][C_INPUT_BRAM_120_ADDR_WIDTH-1:0] = ap_bram_120_addr1;
            assign din1[120][C_INPUT_BRAM_120_WIDTH-1:0] = ap_bram_120_din1;
            assign ap_bram_120_dout1 = dout1[120][C_INPUT_BRAM_120_WIDTH-1:0];
            assign we1[120][C_INPUT_BRAM_120_WIDTH/8-1:0] = ap_bram_120_we1;
            assign en1[120] = ap_bram_120_en1;
            
            assign dwconv1_tready[120] = m_axis_bram_120_tready;
            assign m_axis_bram_120_tlast = dwconv1_tlast[120];
            assign m_axis_bram_120_tvalid = dwconv1_tvalid[120];
            assign m_axis_bram_120_tkeep = dwconv1_tkeep[120][C_OUTPUT_BRAM_120_DMWIDTH/8-1:0];
            assign m_axis_bram_120_tstrb = dwconv1_tstrb[120][C_OUTPUT_BRAM_120_DMWIDTH/8-1:0];
            assign m_axis_bram_120_tdata = dwconv1_tdata[120][C_OUTPUT_BRAM_120_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 121) begin
            assign tlast[121] = s_axis_bram_121_tlast;
            assign tvalid[121] = s_axis_bram_121_tvalid;
            assign tkeep[121][C_INPUT_BRAM_121_DMWIDTH/8-1:0] = s_axis_bram_121_tkeep;
            assign tstrb[121][C_INPUT_BRAM_121_DMWIDTH/8-1:0] = s_axis_bram_121_tstrb;
            assign tdata[121][C_INPUT_BRAM_121_DMWIDTH-1:0] = s_axis_bram_121_tdata;
            assign s_axis_bram_121_tready = tready[121];
            
            assign addr0[121][C_INPUT_BRAM_121_ADDR_WIDTH-1:0] = ap_bram_121_addr0;
            assign din0[121][C_INPUT_BRAM_121_WIDTH-1:0] = ap_bram_121_din0;
            assign ap_bram_121_dout0 = dout0[121][C_INPUT_BRAM_121_WIDTH-1:0];
            assign we0[121][C_INPUT_BRAM_121_WIDTH/8-1:0] = ap_bram_121_we0;
            assign en0[121] = ap_bram_121_en0;
            assign addr1[121][C_INPUT_BRAM_121_ADDR_WIDTH-1:0] = ap_bram_121_addr1;
            assign din1[121][C_INPUT_BRAM_121_WIDTH-1:0] = ap_bram_121_din1;
            assign ap_bram_121_dout1 = dout1[121][C_INPUT_BRAM_121_WIDTH-1:0];
            assign we1[121][C_INPUT_BRAM_121_WIDTH/8-1:0] = ap_bram_121_we1;
            assign en1[121] = ap_bram_121_en1;
            
            assign dwconv1_tready[121] = m_axis_bram_121_tready;
            assign m_axis_bram_121_tlast = dwconv1_tlast[121];
            assign m_axis_bram_121_tvalid = dwconv1_tvalid[121];
            assign m_axis_bram_121_tkeep = dwconv1_tkeep[121][C_OUTPUT_BRAM_121_DMWIDTH/8-1:0];
            assign m_axis_bram_121_tstrb = dwconv1_tstrb[121][C_OUTPUT_BRAM_121_DMWIDTH/8-1:0];
            assign m_axis_bram_121_tdata = dwconv1_tdata[121][C_OUTPUT_BRAM_121_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 122) begin
            assign tlast[122] = s_axis_bram_122_tlast;
            assign tvalid[122] = s_axis_bram_122_tvalid;
            assign tkeep[122][C_INPUT_BRAM_122_DMWIDTH/8-1:0] = s_axis_bram_122_tkeep;
            assign tstrb[122][C_INPUT_BRAM_122_DMWIDTH/8-1:0] = s_axis_bram_122_tstrb;
            assign tdata[122][C_INPUT_BRAM_122_DMWIDTH-1:0] = s_axis_bram_122_tdata;
            assign s_axis_bram_122_tready = tready[122];
            
            assign addr0[122][C_INPUT_BRAM_122_ADDR_WIDTH-1:0] = ap_bram_122_addr0;
            assign din0[122][C_INPUT_BRAM_122_WIDTH-1:0] = ap_bram_122_din0;
            assign ap_bram_122_dout0 = dout0[122][C_INPUT_BRAM_122_WIDTH-1:0];
            assign we0[122][C_INPUT_BRAM_122_WIDTH/8-1:0] = ap_bram_122_we0;
            assign en0[122] = ap_bram_122_en0;
            assign addr1[122][C_INPUT_BRAM_122_ADDR_WIDTH-1:0] = ap_bram_122_addr1;
            assign din1[122][C_INPUT_BRAM_122_WIDTH-1:0] = ap_bram_122_din1;
            assign ap_bram_122_dout1 = dout1[122][C_INPUT_BRAM_122_WIDTH-1:0];
            assign we1[122][C_INPUT_BRAM_122_WIDTH/8-1:0] = ap_bram_122_we1;
            assign en1[122] = ap_bram_122_en1;
            
            assign dwconv1_tready[122] = m_axis_bram_122_tready;
            assign m_axis_bram_122_tlast = dwconv1_tlast[122];
            assign m_axis_bram_122_tvalid = dwconv1_tvalid[122];
            assign m_axis_bram_122_tkeep = dwconv1_tkeep[122][C_OUTPUT_BRAM_122_DMWIDTH/8-1:0];
            assign m_axis_bram_122_tstrb = dwconv1_tstrb[122][C_OUTPUT_BRAM_122_DMWIDTH/8-1:0];
            assign m_axis_bram_122_tdata = dwconv1_tdata[122][C_OUTPUT_BRAM_122_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 123) begin
            assign tlast[123] = s_axis_bram_123_tlast;
            assign tvalid[123] = s_axis_bram_123_tvalid;
            assign tkeep[123][C_INPUT_BRAM_123_DMWIDTH/8-1:0] = s_axis_bram_123_tkeep;
            assign tstrb[123][C_INPUT_BRAM_123_DMWIDTH/8-1:0] = s_axis_bram_123_tstrb;
            assign tdata[123][C_INPUT_BRAM_123_DMWIDTH-1:0] = s_axis_bram_123_tdata;
            assign s_axis_bram_123_tready = tready[123];
            
            assign addr0[123][C_INPUT_BRAM_123_ADDR_WIDTH-1:0] = ap_bram_123_addr0;
            assign din0[123][C_INPUT_BRAM_123_WIDTH-1:0] = ap_bram_123_din0;
            assign ap_bram_123_dout0 = dout0[123][C_INPUT_BRAM_123_WIDTH-1:0];
            assign we0[123][C_INPUT_BRAM_123_WIDTH/8-1:0] = ap_bram_123_we0;
            assign en0[123] = ap_bram_123_en0;
            assign addr1[123][C_INPUT_BRAM_123_ADDR_WIDTH-1:0] = ap_bram_123_addr1;
            assign din1[123][C_INPUT_BRAM_123_WIDTH-1:0] = ap_bram_123_din1;
            assign ap_bram_123_dout1 = dout1[123][C_INPUT_BRAM_123_WIDTH-1:0];
            assign we1[123][C_INPUT_BRAM_123_WIDTH/8-1:0] = ap_bram_123_we1;
            assign en1[123] = ap_bram_123_en1;
            
            assign dwconv1_tready[123] = m_axis_bram_123_tready;
            assign m_axis_bram_123_tlast = dwconv1_tlast[123];
            assign m_axis_bram_123_tvalid = dwconv1_tvalid[123];
            assign m_axis_bram_123_tkeep = dwconv1_tkeep[123][C_OUTPUT_BRAM_123_DMWIDTH/8-1:0];
            assign m_axis_bram_123_tstrb = dwconv1_tstrb[123][C_OUTPUT_BRAM_123_DMWIDTH/8-1:0];
            assign m_axis_bram_123_tdata = dwconv1_tdata[123][C_OUTPUT_BRAM_123_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 124) begin
            assign tlast[124] = s_axis_bram_124_tlast;
            assign tvalid[124] = s_axis_bram_124_tvalid;
            assign tkeep[124][C_INPUT_BRAM_124_DMWIDTH/8-1:0] = s_axis_bram_124_tkeep;
            assign tstrb[124][C_INPUT_BRAM_124_DMWIDTH/8-1:0] = s_axis_bram_124_tstrb;
            assign tdata[124][C_INPUT_BRAM_124_DMWIDTH-1:0] = s_axis_bram_124_tdata;
            assign s_axis_bram_124_tready = tready[124];
            
            assign addr0[124][C_INPUT_BRAM_124_ADDR_WIDTH-1:0] = ap_bram_124_addr0;
            assign din0[124][C_INPUT_BRAM_124_WIDTH-1:0] = ap_bram_124_din0;
            assign ap_bram_124_dout0 = dout0[124][C_INPUT_BRAM_124_WIDTH-1:0];
            assign we0[124][C_INPUT_BRAM_124_WIDTH/8-1:0] = ap_bram_124_we0;
            assign en0[124] = ap_bram_124_en0;
            assign addr1[124][C_INPUT_BRAM_124_ADDR_WIDTH-1:0] = ap_bram_124_addr1;
            assign din1[124][C_INPUT_BRAM_124_WIDTH-1:0] = ap_bram_124_din1;
            assign ap_bram_124_dout1 = dout1[124][C_INPUT_BRAM_124_WIDTH-1:0];
            assign we1[124][C_INPUT_BRAM_124_WIDTH/8-1:0] = ap_bram_124_we1;
            assign en1[124] = ap_bram_124_en1;
            
            assign dwconv1_tready[124] = m_axis_bram_124_tready;
            assign m_axis_bram_124_tlast = dwconv1_tlast[124];
            assign m_axis_bram_124_tvalid = dwconv1_tvalid[124];
            assign m_axis_bram_124_tkeep = dwconv1_tkeep[124][C_OUTPUT_BRAM_124_DMWIDTH/8-1:0];
            assign m_axis_bram_124_tstrb = dwconv1_tstrb[124][C_OUTPUT_BRAM_124_DMWIDTH/8-1:0];
            assign m_axis_bram_124_tdata = dwconv1_tdata[124][C_OUTPUT_BRAM_124_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 125) begin
            assign tlast[125] = s_axis_bram_125_tlast;
            assign tvalid[125] = s_axis_bram_125_tvalid;
            assign tkeep[125][C_INPUT_BRAM_125_DMWIDTH/8-1:0] = s_axis_bram_125_tkeep;
            assign tstrb[125][C_INPUT_BRAM_125_DMWIDTH/8-1:0] = s_axis_bram_125_tstrb;
            assign tdata[125][C_INPUT_BRAM_125_DMWIDTH-1:0] = s_axis_bram_125_tdata;
            assign s_axis_bram_125_tready = tready[125];
            
            assign addr0[125][C_INPUT_BRAM_125_ADDR_WIDTH-1:0] = ap_bram_125_addr0;
            assign din0[125][C_INPUT_BRAM_125_WIDTH-1:0] = ap_bram_125_din0;
            assign ap_bram_125_dout0 = dout0[125][C_INPUT_BRAM_125_WIDTH-1:0];
            assign we0[125][C_INPUT_BRAM_125_WIDTH/8-1:0] = ap_bram_125_we0;
            assign en0[125] = ap_bram_125_en0;
            assign addr1[125][C_INPUT_BRAM_125_ADDR_WIDTH-1:0] = ap_bram_125_addr1;
            assign din1[125][C_INPUT_BRAM_125_WIDTH-1:0] = ap_bram_125_din1;
            assign ap_bram_125_dout1 = dout1[125][C_INPUT_BRAM_125_WIDTH-1:0];
            assign we1[125][C_INPUT_BRAM_125_WIDTH/8-1:0] = ap_bram_125_we1;
            assign en1[125] = ap_bram_125_en1;
            
            assign dwconv1_tready[125] = m_axis_bram_125_tready;
            assign m_axis_bram_125_tlast = dwconv1_tlast[125];
            assign m_axis_bram_125_tvalid = dwconv1_tvalid[125];
            assign m_axis_bram_125_tkeep = dwconv1_tkeep[125][C_OUTPUT_BRAM_125_DMWIDTH/8-1:0];
            assign m_axis_bram_125_tstrb = dwconv1_tstrb[125][C_OUTPUT_BRAM_125_DMWIDTH/8-1:0];
            assign m_axis_bram_125_tdata = dwconv1_tdata[125][C_OUTPUT_BRAM_125_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 126) begin
            assign tlast[126] = s_axis_bram_126_tlast;
            assign tvalid[126] = s_axis_bram_126_tvalid;
            assign tkeep[126][C_INPUT_BRAM_126_DMWIDTH/8-1:0] = s_axis_bram_126_tkeep;
            assign tstrb[126][C_INPUT_BRAM_126_DMWIDTH/8-1:0] = s_axis_bram_126_tstrb;
            assign tdata[126][C_INPUT_BRAM_126_DMWIDTH-1:0] = s_axis_bram_126_tdata;
            assign s_axis_bram_126_tready = tready[126];
            
            assign addr0[126][C_INPUT_BRAM_126_ADDR_WIDTH-1:0] = ap_bram_126_addr0;
            assign din0[126][C_INPUT_BRAM_126_WIDTH-1:0] = ap_bram_126_din0;
            assign ap_bram_126_dout0 = dout0[126][C_INPUT_BRAM_126_WIDTH-1:0];
            assign we0[126][C_INPUT_BRAM_126_WIDTH/8-1:0] = ap_bram_126_we0;
            assign en0[126] = ap_bram_126_en0;
            assign addr1[126][C_INPUT_BRAM_126_ADDR_WIDTH-1:0] = ap_bram_126_addr1;
            assign din1[126][C_INPUT_BRAM_126_WIDTH-1:0] = ap_bram_126_din1;
            assign ap_bram_126_dout1 = dout1[126][C_INPUT_BRAM_126_WIDTH-1:0];
            assign we1[126][C_INPUT_BRAM_126_WIDTH/8-1:0] = ap_bram_126_we1;
            assign en1[126] = ap_bram_126_en1;
            
            assign dwconv1_tready[126] = m_axis_bram_126_tready;
            assign m_axis_bram_126_tlast = dwconv1_tlast[126];
            assign m_axis_bram_126_tvalid = dwconv1_tvalid[126];
            assign m_axis_bram_126_tkeep = dwconv1_tkeep[126][C_OUTPUT_BRAM_126_DMWIDTH/8-1:0];
            assign m_axis_bram_126_tstrb = dwconv1_tstrb[126][C_OUTPUT_BRAM_126_DMWIDTH/8-1:0];
            assign m_axis_bram_126_tdata = dwconv1_tdata[126][C_OUTPUT_BRAM_126_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 127) begin
            assign tlast[127] = s_axis_bram_127_tlast;
            assign tvalid[127] = s_axis_bram_127_tvalid;
            assign tkeep[127][C_INPUT_BRAM_127_DMWIDTH/8-1:0] = s_axis_bram_127_tkeep;
            assign tstrb[127][C_INPUT_BRAM_127_DMWIDTH/8-1:0] = s_axis_bram_127_tstrb;
            assign tdata[127][C_INPUT_BRAM_127_DMWIDTH-1:0] = s_axis_bram_127_tdata;
            assign s_axis_bram_127_tready = tready[127];
            
            assign addr0[127][C_INPUT_BRAM_127_ADDR_WIDTH-1:0] = ap_bram_127_addr0;
            assign din0[127][C_INPUT_BRAM_127_WIDTH-1:0] = ap_bram_127_din0;
            assign ap_bram_127_dout0 = dout0[127][C_INPUT_BRAM_127_WIDTH-1:0];
            assign we0[127][C_INPUT_BRAM_127_WIDTH/8-1:0] = ap_bram_127_we0;
            assign en0[127] = ap_bram_127_en0;
            assign addr1[127][C_INPUT_BRAM_127_ADDR_WIDTH-1:0] = ap_bram_127_addr1;
            assign din1[127][C_INPUT_BRAM_127_WIDTH-1:0] = ap_bram_127_din1;
            assign ap_bram_127_dout1 = dout1[127][C_INPUT_BRAM_127_WIDTH-1:0];
            assign we1[127][C_INPUT_BRAM_127_WIDTH/8-1:0] = ap_bram_127_we1;
            assign en1[127] = ap_bram_127_en1;
            
            assign dwconv1_tready[127] = m_axis_bram_127_tready;
            assign m_axis_bram_127_tlast = dwconv1_tlast[127];
            assign m_axis_bram_127_tvalid = dwconv1_tvalid[127];
            assign m_axis_bram_127_tkeep = dwconv1_tkeep[127][C_OUTPUT_BRAM_127_DMWIDTH/8-1:0];
            assign m_axis_bram_127_tstrb = dwconv1_tstrb[127][C_OUTPUT_BRAM_127_DMWIDTH/8-1:0];
            assign m_axis_bram_127_tdata = dwconv1_tdata[127][C_OUTPUT_BRAM_127_DMWIDTH-1:0];
        end
    endgenerate
    
    //instantiate the axis2fifo modules
    genvar idx;
    generate
        for(idx=0; idx<C_NUM_INPUT_BRAMs; idx=idx+1) begin: IN_FIFO_GEN
            //check if data width converter is needed
            if(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx] != C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]) begin
                 axis_dwidth_converter_v1_1_9_axis_dwidth_converter #(
                    .C_S_AXIS_TDATA_WIDTH(C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                    .C_M_AXIS_TDATA_WIDTH(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                    .C_AXIS_TID_WIDTH(1),
                    .C_AXIS_TDEST_WIDTH(1),
                    .C_S_AXIS_TUSER_WIDTH(1),
                    .C_M_AXIS_TUSER_WIDTH(1),
                    .C_AXIS_SIGNAL_SET(32'h1F)  //Enabled: TLAST, TKEEP, TSTRB, TDATA, TREADY
                ) data_width_conv_0i (
                    .aclk(dm_clk),
                    .aresetn(aresetn),
                    .aclken(1),
                    .s_axis_tvalid(tvalid[idx]),
                    .s_axis_tready(tready[idx]),
                    .s_axis_tdata(tdata[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                    .s_axis_tstrb(tstrb[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                    .s_axis_tkeep(tkeep[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                    .s_axis_tlast(tlast[idx]),
//                    .s_axis_tid(),
//                    .s_axis_tdest(),
//                    .s_axis_tuser(),
                    .m_axis_tvalid(dwconv0_tvalid[idx]),
                    .m_axis_tready(dwconv0_tready[idx]),
                    .m_axis_tdata(dwconv0_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
//                    .m_axis_tstrb(),
//                    .m_axis_tkeep(),
                    .m_axis_tlast(dwconv0_tlast[idx])
//                    .m_axis_tid(),
//                    .m_axis_tdest(),
//                    .m_axis_tuser()
                );
                
                if( C_INOUT_BIT_ARRAY[idx] ) begin
                    axis_dwidth_converter_v1_1_9_axis_dwidth_converter #(
                        .C_S_AXIS_TDATA_WIDTH(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                        .C_M_AXIS_TDATA_WIDTH(C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                        .C_AXIS_TID_WIDTH(1),
                        .C_AXIS_TDEST_WIDTH(1),
                        .C_S_AXIS_TUSER_WIDTH(1),
                        .C_M_AXIS_TUSER_WIDTH(1),
                        .C_AXIS_SIGNAL_SET(32'h1F)  //Enabled: TLAST, TKEEP, TSTRB, TDATA, TREADY
                    ) data_width_conv_1i (
                        .aclk(dm_clk),
                        .aresetn(aresetn),
                        .aclken(1),
                        .s_axis_tvalid(buf1_tvalid[idx]),
                        .s_axis_tready(buf1_tready[idx]),
                        .s_axis_tdata(buf1_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                        .s_axis_tstrb({C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}}),
                        .s_axis_tkeep({C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}}),
                        .s_axis_tlast(buf1_tlast[idx]),
                        .m_axis_tvalid(dwconv1_tvalid[idx]),
                        .m_axis_tready(dwconv1_tready[idx]),
                        .m_axis_tdata(dwconv1_tdata[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                        .m_axis_tstrb(dwconv1_tkeep[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                        .m_axis_tkeep(dwconv1_tstrb[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                        .m_axis_tlast(dwconv1_tlast[idx])
                    );
                end
            end
            else begin
                //if no buffering, wire the input signals straight through
                assign dwconv0_tlast[idx] = tlast[idx];
                assign dwconv0_tvalid[idx] = tvalid[idx];
                assign tready[idx] = dwconv0_tready[idx];   //output
                assign dwconv0_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0] = tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0];

                assign dwconv1_tlast[idx] = buf1_tlast[idx];
                assign dwconv1_tvalid[idx] = buf1_tvalid[idx];
                assign buf1_tready[idx] = dwconv1_tready[idx];   //input
                assign dwconv1_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0] = buf1_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0];
                assign dwconv1_tkeep[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0] = {C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}};
                assign dwconv1_tstrb[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0] = {C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}};
            end
            
            //always use fifo
            axis_fifo #(
                .C_DATA_WIDTH(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_DATA_DEPTH(16)
            ) axis_fifo0_i (
                .aresetn(aresetn),
                .inclk(dm_clk), 
                .in_tdata(dwconv0_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .in_tlast(dwconv0_tlast[idx]),  
                .in_tvalid(dwconv0_tvalid[idx]),
                .in_tready(dwconv0_tready[idx]),
                .outclk(acc_clk), 
                .out_tdata(buf0_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .out_tready(buf0_tready[idx]),
                .out_tvalid(buf0_tvalid[idx]),
                .out_tlast(buf0_tlast[idx])
            );
            
            if( C_INOUT_BIT_ARRAY[idx] ) begin
                axis_fifo #(
                    .C_DATA_WIDTH(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                    .C_DATA_DEPTH(16)
                ) axis_fifo1_i (
                    .aresetn(aresetn),
                    .inclk(acc_clk),
                    .in_tdata(out_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                    .in_tlast(out_tlast[idx]),  
                    .in_tvalid(out_tvalid[idx]),
                    .in_tready(out_tready[idx]),
                    .outclk(dm_clk), 
                    .out_tdata(buf1_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                    .out_tready(buf1_tready[idx]),
                    .out_tvalid(buf1_tvalid[idx]),
                    .out_tlast(buf1_tlast[idx])
                );
            end
            
            axis2bram #( 
                .C_S_AXIS_DATA_WIDTH(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_M_AXIS_DATA_WIDTH(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_BRAM_DATA_DEPTH(C_DEPTH_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_BRAM_DATA_WIDTH(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_IS_INOUT(C_INOUT_BIT_ARRAY[idx:idx]),
                .C_MB_DEPTH(C_MB_DEPTH_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_BRAM_ADDR_WIDTH(C_ADDR_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_NUM_PORTS(C_PORTS_BIT_ARRAY[32*(idx+1)-1:32*idx])
            ) axis2bram_i (
                .ACC_CLK(acc_clk),
                .ARESETN(acc_rstn),
                .CTRL_ACC_START(acc_start),
                .CTRL_ACC_DONE(acc_done),
                .CTRL_INREADY(in_bram_ready[idx]),
                .CTRL_OUTREADY(inout_bram_ready[idx]),
                //.AXI Stream interface
                .S_AXIS_TLAST(buf0_tlast[idx]),
                .S_AXIS_TVALID(buf0_tvalid[idx]),
                .S_AXIS_TDATA(buf0_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .S_AXIS_TREADY(buf0_tready[idx]),
                //.AXI Stream interface
                .M_AXIS_TLAST(out_tlast[idx]),
                .M_AXIS_TVALID(out_tvalid[idx]),
                .M_AXIS_TDATA(out_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .M_AXIS_TREADY(out_tready[idx]),
                //ACC BRAM IF-0
                .bram0_addr(addr0[idx][C_ADDR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram0_din(din0[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram0_dout(dout0[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram0_we(we0[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                .bram0_en(en0[idx]),
                //ACC BRAM IF-1
                .bram1_addr(addr1[idx][C_ADDR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram1_din(din1[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram1_dout(dout1[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram1_we(we1[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                .bram1_en(en1[idx])
            );
        end
    endgenerate
endmodule