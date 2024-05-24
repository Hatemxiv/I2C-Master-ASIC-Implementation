/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12
// Date      : Sat May 11 18:29:04 2024
/////////////////////////////////////////////////////////////


module i2c_master_top ( wb_clk_i, wb_rst_i, arst_i, wb_adr_i, wb_dat_i, 
        wb_dat_o, wb_we_i, wb_stb_i, wb_cyc_i, wb_ack_o, wb_inta_o, scl_pad_i, 
        scl_pad_o, scl_padoen_o, sda_pad_i, sda_pad_o, sda_padoen_o, VDD, VSS
 );
  input [2:0] wb_adr_i;
  input [7:0] wb_dat_i;
  output [7:0] wb_dat_o;
  input wb_clk_i, wb_rst_i, arst_i, wb_we_i, wb_stb_i, wb_cyc_i, scl_pad_i,
         sda_pad_i, VDD, VSS;
  output wb_ack_o, wb_inta_o, scl_pad_o, scl_padoen_o, sda_pad_o, sda_padoen_o;
  wire   N20, sr_1, sr_0, N43, N44, N48, N49, N50, done, i2c_al, irxack, N114,
         N115, N116, N117, N121, byte_controller_N107, byte_controller_N106,
         byte_controller_N105, byte_controller_N104, byte_controller_shift,
         byte_controller_ld, byte_controller_core_rxd,
         byte_controller_core_txd, byte_controller_core_ack,
         byte_controller_bit_controller_N228,
         byte_controller_bit_controller_N139,
         byte_controller_bit_controller_sda_chk,
         byte_controller_bit_controller_cmd_stop,
         byte_controller_bit_controller_N132,
         byte_controller_bit_controller_N130,
         byte_controller_bit_controller_N129,
         byte_controller_bit_controller_sta_condition,
         byte_controller_bit_controller_N126,
         byte_controller_bit_controller_N125,
         byte_controller_bit_controller_N124,
         byte_controller_bit_controller_N123,
         byte_controller_bit_controller_sSDA,
         byte_controller_bit_controller_dSDA,
         byte_controller_bit_controller_N106,
         byte_controller_bit_controller_N105,
         byte_controller_bit_controller_N104,
         byte_controller_bit_controller_N103,
         byte_controller_bit_controller_N102,
         byte_controller_bit_controller_N101,
         byte_controller_bit_controller_N100,
         byte_controller_bit_controller_N99,
         byte_controller_bit_controller_N98,
         byte_controller_bit_controller_N97,
         byte_controller_bit_controller_N96,
         byte_controller_bit_controller_N95,
         byte_controller_bit_controller_N94,
         byte_controller_bit_controller_N93,
         byte_controller_bit_controller_N74,
         byte_controller_bit_controller_N73,
         byte_controller_bit_controller_N72,
         byte_controller_bit_controller_N71,
         byte_controller_bit_controller_clk_en,
         byte_controller_bit_controller_dSCL,
         byte_controller_bit_controller_N30,
         byte_controller_bit_controller_slave_wait,
         byte_controller_bit_controller_sSCL,
         byte_controller_bit_controller_dscl_oen, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n281, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n541,
         n542, n543, n544, n545, n546, n547, n548, n549, n550, n551, n552,
         n553, n554, n555, n556, n557;
  wire   [15:0] prer;
  wire   [7:0] ctr;
  wire   [7:0] rxr;
  wire   [7:5] sr;
  wire   [7:0] txr;
  wire   [7:0] cr;
  wire   [4:0] byte_controller_c_state;
  wire   [2:0] byte_controller_dcnt;
  wire   [3:0] byte_controller_core_cmd;
  wire   [16:0] byte_controller_bit_controller_c_state;
  wire   [2:0] byte_controller_bit_controller_fSDA;
  wire   [2:0] byte_controller_bit_controller_fSCL;
  wire   [13:0] byte_controller_bit_controller_filter_cnt;
  wire   [1:0] byte_controller_bit_controller_cSDA;
  wire   [1:0] byte_controller_bit_controller_cSCL;
  wire   [15:0] byte_controller_bit_controller_cnt;
  assign sda_pad_o = 1'b0;
  assign scl_pad_o = 1'b0;

  DFFX1 wb_ack_o_reg ( .D(N20), .CLK(wb_clk_i), .Q(wb_ack_o), .QN(n556) );
  DFFX1 wb_dat_o_reg_0_ ( .D(N43), .CLK(wb_clk_i), .Q(wb_dat_o[0]) );
  DFFX1 wb_dat_o_reg_1_ ( .D(N44), .CLK(wb_clk_i), .Q(wb_dat_o[1]) );
  DFFX1 wb_dat_o_reg_2_ ( .D(n278), .CLK(wb_clk_i), .Q(wb_dat_o[2]) );
  DFFX1 wb_dat_o_reg_3_ ( .D(n277), .CLK(wb_clk_i), .Q(wb_dat_o[3]) );
  DFFX1 wb_dat_o_reg_4_ ( .D(n276), .CLK(wb_clk_i), .Q(wb_dat_o[4]) );
  DFFX1 wb_dat_o_reg_5_ ( .D(N48), .CLK(wb_clk_i), .Q(wb_dat_o[5]) );
  DFFX1 wb_dat_o_reg_6_ ( .D(N49), .CLK(wb_clk_i), .Q(wb_dat_o[6]) );
  DFFX1 wb_dat_o_reg_7_ ( .D(N50), .CLK(wb_clk_i), .Q(wb_dat_o[7]) );
  DFFARX1 ctr_reg_7_ ( .D(n275), .CLK(wb_clk_i), .RSTB(n279), .Q(ctr[7]) );
  DFFARX1 ctr_reg_6_ ( .D(n274), .CLK(wb_clk_i), .RSTB(arst_i), .Q(ctr[6]) );
  DFFARX1 ctr_reg_5_ ( .D(n273), .CLK(wb_clk_i), .RSTB(n279), .Q(ctr[5]) );
  DFFARX1 ctr_reg_4_ ( .D(n272), .CLK(wb_clk_i), .RSTB(n279), .Q(ctr[4]) );
  DFFARX1 ctr_reg_3_ ( .D(n271), .CLK(wb_clk_i), .RSTB(n279), .Q(ctr[3]) );
  DFFARX1 ctr_reg_2_ ( .D(n270), .CLK(wb_clk_i), .RSTB(n279), .Q(ctr[2]) );
  DFFARX1 ctr_reg_1_ ( .D(n269), .CLK(wb_clk_i), .RSTB(n279), .Q(ctr[1]) );
  DFFARX1 ctr_reg_0_ ( .D(n268), .CLK(wb_clk_i), .RSTB(n279), .Q(ctr[0]) );
  DFFARX1 txr_reg_7_ ( .D(n267), .CLK(wb_clk_i), .RSTB(n279), .Q(txr[7]) );
  DFFARX1 txr_reg_6_ ( .D(n266), .CLK(wb_clk_i), .RSTB(n279), .Q(txr[6]) );
  DFFARX1 txr_reg_5_ ( .D(n265), .CLK(wb_clk_i), .RSTB(n279), .Q(txr[5]) );
  DFFARX1 txr_reg_4_ ( .D(n264), .CLK(wb_clk_i), .RSTB(n279), .Q(txr[4]) );
  DFFARX1 txr_reg_3_ ( .D(n263), .CLK(wb_clk_i), .RSTB(n279), .Q(txr[3]) );
  DFFARX1 txr_reg_2_ ( .D(n262), .CLK(wb_clk_i), .RSTB(n279), .Q(txr[2]) );
  DFFARX1 txr_reg_1_ ( .D(n261), .CLK(wb_clk_i), .RSTB(n279), .Q(txr[1]) );
  DFFARX1 txr_reg_0_ ( .D(n260), .CLK(wb_clk_i), .RSTB(n279), .Q(txr[0]) );
  DFFARX1 cr_reg_3_ ( .D(n243), .CLK(wb_clk_i), .RSTB(n279), .Q(cr[3]) );
  DFFARX1 cr_reg_2_ ( .D(n242), .CLK(wb_clk_i), .RSTB(n279), .Q(cr[2]) );
  DFFARX1 cr_reg_1_ ( .D(n241), .CLK(wb_clk_i), .RSTB(n279), .Q(cr[1]) );
  DFFARX1 cr_reg_0_ ( .D(n240), .CLK(wb_clk_i), .RSTB(n279), .Q(cr[0]) );
  DFFARX1 byte_controller_bit_controller_filter_cnt_reg_13_ ( .D(
        byte_controller_bit_controller_N106), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_filter_cnt[13]) );
  DFFARX1 byte_controller_bit_controller_filter_cnt_reg_0_ ( .D(
        byte_controller_bit_controller_N93), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_filter_cnt[0]), .QN(n548) );
  DFFARX1 byte_controller_bit_controller_filter_cnt_reg_1_ ( .D(
        byte_controller_bit_controller_N94), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_filter_cnt[1]) );
  DFFARX1 byte_controller_bit_controller_filter_cnt_reg_2_ ( .D(
        byte_controller_bit_controller_N95), .CLK(wb_clk_i), .RSTB(arst_i), 
        .Q(byte_controller_bit_controller_filter_cnt[2]) );
  DFFARX1 byte_controller_bit_controller_filter_cnt_reg_3_ ( .D(
        byte_controller_bit_controller_N96), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_filter_cnt[3]) );
  DFFARX1 byte_controller_bit_controller_filter_cnt_reg_4_ ( .D(
        byte_controller_bit_controller_N97), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_filter_cnt[4]) );
  DFFARX1 byte_controller_bit_controller_filter_cnt_reg_5_ ( .D(
        byte_controller_bit_controller_N98), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_filter_cnt[5]) );
  DFFARX1 byte_controller_bit_controller_filter_cnt_reg_6_ ( .D(
        byte_controller_bit_controller_N99), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_filter_cnt[6]) );
  DFFARX1 byte_controller_bit_controller_filter_cnt_reg_7_ ( .D(
        byte_controller_bit_controller_N100), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_filter_cnt[7]) );
  DFFARX1 byte_controller_bit_controller_filter_cnt_reg_8_ ( .D(
        byte_controller_bit_controller_N101), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_filter_cnt[8]) );
  DFFARX1 byte_controller_bit_controller_filter_cnt_reg_9_ ( .D(
        byte_controller_bit_controller_N102), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_filter_cnt[9]) );
  DFFARX1 byte_controller_bit_controller_filter_cnt_reg_10_ ( .D(
        byte_controller_bit_controller_N103), .CLK(wb_clk_i), .RSTB(arst_i), 
        .Q(byte_controller_bit_controller_filter_cnt[10]) );
  DFFARX1 byte_controller_bit_controller_filter_cnt_reg_11_ ( .D(
        byte_controller_bit_controller_N104), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_filter_cnt[11]) );
  DFFARX1 byte_controller_bit_controller_filter_cnt_reg_12_ ( .D(
        byte_controller_bit_controller_N105), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_filter_cnt[12]) );
  DFFARX1 byte_controller_bit_controller_cSCL_reg_0_ ( .D(
        byte_controller_bit_controller_N71), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_cSCL[0]) );
  DFFARX1 byte_controller_bit_controller_cSCL_reg_1_ ( .D(
        byte_controller_bit_controller_N72), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_cSCL[1]) );
  DFFARX1 byte_controller_bit_controller_cSDA_reg_0_ ( .D(
        byte_controller_bit_controller_N73), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_cSDA[0]) );
  DFFARX1 byte_controller_bit_controller_cSDA_reg_1_ ( .D(
        byte_controller_bit_controller_N74), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_cSDA[1]) );
  DFFARX1 byte_controller_bit_controller_sto_condition_reg ( .D(
        byte_controller_bit_controller_N130), .CLK(wb_clk_i), .RSTB(n279), 
        .QN(n553) );
  DFFARX1 byte_controller_bit_controller_sta_condition_reg ( .D(
        byte_controller_bit_controller_N129), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_sta_condition) );
  DFFARX1 byte_controller_bit_controller_busy_reg ( .D(
        byte_controller_bit_controller_N132), .CLK(wb_clk_i), .RSTB(n279), .Q(
        sr[6]) );
  DFFARX1 byte_controller_bit_controller_slave_wait_reg ( .D(
        byte_controller_bit_controller_N30), .CLK(wb_clk_i), .RSTB(n279), .Q(
        byte_controller_bit_controller_slave_wait) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_15_ ( .D(n178), .CLK(wb_clk_i), .RSTB(arst_i), .Q(byte_controller_bit_controller_cnt[15]) );
  DFFARX1 byte_controller_bit_controller_cmd_stop_reg ( .D(n194), .CLK(
        wb_clk_i), .RSTB(arst_i), .Q(byte_controller_bit_controller_cmd_stop)
         );
  DFFARX1 byte_controller_bit_controller_al_reg ( .D(
        byte_controller_bit_controller_N139), .CLK(wb_clk_i), .RSTB(arst_i), 
        .Q(i2c_al) );
  DFFARX1 byte_controller_core_cmd_reg_3_ ( .D(n195), .CLK(wb_clk_i), .RSTB(
        arst_i), .Q(byte_controller_core_cmd[3]), .QN(n549) );
  DFFARX1 byte_controller_bit_controller_c_state_reg_5_ ( .D(n234), .CLK(
        wb_clk_i), .RSTB(arst_i), .Q(byte_controller_bit_controller_c_state[5]) );
  DFFARX1 byte_controller_bit_controller_c_state_reg_6_ ( .D(n233), .CLK(
        wb_clk_i), .RSTB(arst_i), .Q(byte_controller_bit_controller_c_state[6]) );
  DFFARX1 byte_controller_bit_controller_c_state_reg_7_ ( .D(n232), .CLK(
        wb_clk_i), .RSTB(arst_i), .Q(byte_controller_bit_controller_c_state[7]) );
  DFFARX1 byte_controller_bit_controller_c_state_reg_8_ ( .D(n231), .CLK(
        wb_clk_i), .RSTB(arst_i), .Q(byte_controller_bit_controller_c_state[8]) );
  DFFARX1 byte_controller_bit_controller_c_state_reg_13_ ( .D(n226), .CLK(
        wb_clk_i), .RSTB(arst_i), .Q(
        byte_controller_bit_controller_c_state[13]) );
  DFFARX1 byte_controller_bit_controller_c_state_reg_14_ ( .D(n225), .CLK(
        wb_clk_i), .RSTB(arst_i), .Q(
        byte_controller_bit_controller_c_state[14]) );
  DFFARX1 byte_controller_bit_controller_c_state_reg_15_ ( .D(n224), .CLK(
        wb_clk_i), .RSTB(arst_i), .Q(
        byte_controller_bit_controller_c_state[15]) );
  DFFARX1 byte_controller_bit_controller_c_state_reg_16_ ( .D(n223), .CLK(
        wb_clk_i), .RSTB(arst_i), .Q(
        byte_controller_bit_controller_c_state[16]) );
  DFFARX1 byte_controller_bit_controller_cmd_ack_reg ( .D(
        byte_controller_bit_controller_N228), .CLK(wb_clk_i), .RSTB(arst_i), 
        .Q(byte_controller_core_ack), .QN(n547) );
  DFFARX1 byte_controller_shift_reg ( .D(byte_controller_N105), .CLK(wb_clk_i), 
        .RSTB(arst_i), .Q(byte_controller_shift) );
  DFFARX1 byte_controller_dcnt_reg_0_ ( .D(n207), .CLK(wb_clk_i), .RSTB(arst_i), .Q(byte_controller_dcnt[0]) );
  DFFARX1 byte_controller_c_state_reg_3_ ( .D(n214), .CLK(wb_clk_i), .RSTB(
        arst_i), .Q(byte_controller_c_state[3]), .QN(n542) );
  DFFARX1 byte_controller_c_state_reg_4_ ( .D(n213), .CLK(wb_clk_i), .RSTB(
        arst_i), .Q(byte_controller_c_state[4]) );
  DFFARX1 byte_controller_cmd_ack_reg ( .D(byte_controller_N107), .CLK(
        wb_clk_i), .RSTB(arst_i), .Q(done) );
  DFFARX1 irq_flag_reg ( .D(N117), .CLK(wb_clk_i), .RSTB(arst_i), .Q(sr_0) );
  DFFARX1 wb_inta_o_reg ( .D(N121), .CLK(wb_clk_i), .RSTB(arst_i), .Q(
        wb_inta_o) );
  DFFARX1 cr_reg_4_ ( .D(n212), .CLK(wb_clk_i), .RSTB(arst_i), .Q(cr[4]) );
  DFFARX1 cr_reg_5_ ( .D(n211), .CLK(wb_clk_i), .RSTB(arst_i), .Q(cr[5]), .QN(
        n555) );
  DFFARX1 tip_reg ( .D(N116), .CLK(wb_clk_i), .RSTB(arst_i), .Q(sr_1) );
  DFFARX1 cr_reg_6_ ( .D(n210), .CLK(wb_clk_i), .RSTB(n281), .Q(cr[6]), .QN(
        n544) );
  DFFARX1 cr_reg_7_ ( .D(n209), .CLK(wb_clk_i), .RSTB(arst_i), .Q(cr[7]), .QN(
        n545) );
  DFFARX1 al_reg ( .D(N114), .CLK(wb_clk_i), .RSTB(arst_i), .Q(sr[5]) );
  DFFARX1 byte_controller_core_cmd_reg_1_ ( .D(n197), .CLK(wb_clk_i), .RSTB(
        arst_i), .Q(byte_controller_core_cmd[1]) );
  DFFARX1 byte_controller_c_state_reg_0_ ( .D(n217), .CLK(wb_clk_i), .RSTB(
        arst_i), .Q(byte_controller_c_state[0]), .QN(n546) );
  DFFARX1 byte_controller_ld_reg ( .D(byte_controller_N106), .CLK(wb_clk_i), 
        .RSTB(arst_i), .Q(byte_controller_ld) );
  DFFARX1 byte_controller_dcnt_reg_1_ ( .D(n208), .CLK(wb_clk_i), .RSTB(arst_i), .Q(byte_controller_dcnt[1]), .QN(n554) );
  DFFARX1 byte_controller_dcnt_reg_2_ ( .D(n206), .CLK(wb_clk_i), .RSTB(arst_i), .Q(byte_controller_dcnt[2]) );
  DFFARX1 byte_controller_c_state_reg_2_ ( .D(n215), .CLK(wb_clk_i), .RSTB(
        arst_i), .Q(byte_controller_c_state[2]), .QN(n551) );
  DFFARX1 byte_controller_c_state_reg_1_ ( .D(n216), .CLK(wb_clk_i), .RSTB(
        arst_i), .Q(byte_controller_c_state[1]) );
  DFFARX1 byte_controller_core_cmd_reg_0_ ( .D(n198), .CLK(wb_clk_i), .RSTB(
        arst_i), .Q(byte_controller_core_cmd[0]) );
  DFFARX1 byte_controller_core_cmd_reg_2_ ( .D(n196), .CLK(wb_clk_i), .RSTB(
        arst_i), .Q(byte_controller_core_cmd[2]) );
  DFFARX1 byte_controller_bit_controller_c_state_reg_0_ ( .D(n239), .CLK(
        wb_clk_i), .RSTB(n279), .Q(byte_controller_bit_controller_c_state[0])
         );
  DFFARX1 byte_controller_bit_controller_c_state_reg_1_ ( .D(n238), .CLK(
        wb_clk_i), .RSTB(n281), .Q(byte_controller_bit_controller_c_state[1])
         );
  DFFARX1 byte_controller_bit_controller_c_state_reg_2_ ( .D(n237), .CLK(
        wb_clk_i), .RSTB(n281), .Q(byte_controller_bit_controller_c_state[2])
         );
  DFFARX1 byte_controller_bit_controller_c_state_reg_3_ ( .D(n236), .CLK(
        wb_clk_i), .RSTB(arst_i), .Q(byte_controller_bit_controller_c_state[3]) );
  DFFARX1 byte_controller_bit_controller_c_state_reg_4_ ( .D(n235), .CLK(
        wb_clk_i), .RSTB(arst_i), .Q(byte_controller_bit_controller_c_state[4]) );
  DFFARX1 byte_controller_bit_controller_c_state_reg_9_ ( .D(n230), .CLK(
        wb_clk_i), .RSTB(arst_i), .Q(byte_controller_bit_controller_c_state[9]) );
  DFFARX1 byte_controller_bit_controller_c_state_reg_10_ ( .D(n229), .CLK(
        wb_clk_i), .RSTB(n279), .Q(byte_controller_bit_controller_c_state[10])
         );
  DFFARX1 byte_controller_bit_controller_c_state_reg_11_ ( .D(n228), .CLK(
        wb_clk_i), .RSTB(n279), .Q(byte_controller_bit_controller_c_state[11])
         );
  DFFARX1 byte_controller_bit_controller_c_state_reg_12_ ( .D(n227), .CLK(
        wb_clk_i), .RSTB(n279), .Q(byte_controller_bit_controller_c_state[12])
         );
  DFFARX1 byte_controller_sr_reg_0_ ( .D(n205), .CLK(wb_clk_i), .RSTB(arst_i), 
        .Q(rxr[0]) );
  DFFARX1 byte_controller_sr_reg_1_ ( .D(n199), .CLK(wb_clk_i), .RSTB(n281), 
        .Q(rxr[1]) );
  DFFARX1 byte_controller_sr_reg_2_ ( .D(n200), .CLK(wb_clk_i), .RSTB(arst_i), 
        .Q(rxr[2]) );
  DFFARX1 byte_controller_sr_reg_3_ ( .D(n201), .CLK(wb_clk_i), .RSTB(arst_i), 
        .Q(rxr[3]) );
  DFFARX1 byte_controller_sr_reg_4_ ( .D(n202), .CLK(wb_clk_i), .RSTB(arst_i), 
        .Q(rxr[4]) );
  DFFARX1 byte_controller_sr_reg_5_ ( .D(n203), .CLK(wb_clk_i), .RSTB(n281), 
        .Q(rxr[5]) );
  DFFARX1 byte_controller_sr_reg_6_ ( .D(n204), .CLK(wb_clk_i), .RSTB(arst_i), 
        .Q(rxr[6]) );
  DFFARX1 byte_controller_sr_reg_7_ ( .D(n219), .CLK(wb_clk_i), .RSTB(n281), 
        .Q(rxr[7]) );
  DFFARX1 byte_controller_core_txd_reg ( .D(byte_controller_N104), .CLK(
        wb_clk_i), .RSTB(n279), .Q(byte_controller_core_txd) );
  DFFARX1 byte_controller_ack_out_reg ( .D(n218), .CLK(wb_clk_i), .RSTB(arst_i), .Q(irxack) );
  DFFARX1 rxack_reg ( .D(N115), .CLK(wb_clk_i), .RSTB(n281), .Q(sr[7]) );
  DFFARX1 byte_controller_bit_controller_sda_chk_reg ( .D(n222), .CLK(wb_clk_i), .RSTB(arst_i), .Q(byte_controller_bit_controller_sda_chk) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_14_ ( .D(n193), .CLK(wb_clk_i), .RSTB(n281), .Q(byte_controller_bit_controller_cnt[14]) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_0_ ( .D(n192), .CLK(wb_clk_i), 
        .RSTB(arst_i), .Q(byte_controller_bit_controller_cnt[0]) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_1_ ( .D(n191), .CLK(wb_clk_i), 
        .RSTB(n281), .Q(byte_controller_bit_controller_cnt[1]) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_2_ ( .D(n190), .CLK(wb_clk_i), 
        .RSTB(arst_i), .Q(byte_controller_bit_controller_cnt[2]) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_3_ ( .D(n189), .CLK(wb_clk_i), 
        .RSTB(arst_i), .Q(byte_controller_bit_controller_cnt[3]) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_4_ ( .D(n188), .CLK(wb_clk_i), 
        .RSTB(arst_i), .Q(byte_controller_bit_controller_cnt[4]) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_5_ ( .D(n187), .CLK(wb_clk_i), 
        .RSTB(arst_i), .Q(byte_controller_bit_controller_cnt[5]) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_6_ ( .D(n186), .CLK(wb_clk_i), 
        .RSTB(arst_i), .Q(byte_controller_bit_controller_cnt[6]) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_7_ ( .D(n185), .CLK(wb_clk_i), 
        .RSTB(arst_i), .Q(byte_controller_bit_controller_cnt[7]) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_8_ ( .D(n184), .CLK(wb_clk_i), 
        .RSTB(arst_i), .Q(byte_controller_bit_controller_cnt[8]) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_9_ ( .D(n183), .CLK(wb_clk_i), 
        .RSTB(arst_i), .Q(byte_controller_bit_controller_cnt[9]) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_10_ ( .D(n182), .CLK(wb_clk_i), .RSTB(arst_i), .Q(byte_controller_bit_controller_cnt[10]) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_11_ ( .D(n181), .CLK(wb_clk_i), .RSTB(arst_i), .Q(byte_controller_bit_controller_cnt[11]) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_12_ ( .D(n180), .CLK(wb_clk_i), .RSTB(arst_i), .Q(byte_controller_bit_controller_cnt[12]) );
  DFFARX1 byte_controller_bit_controller_cnt_reg_13_ ( .D(n179), .CLK(wb_clk_i), .RSTB(arst_i), .Q(byte_controller_bit_controller_cnt[13]) );
  DFFASX1 prer_reg_15_ ( .D(n259), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[15])
         );
  DFFASX1 prer_reg_14_ ( .D(n258), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[14])
         );
  DFFASX1 prer_reg_13_ ( .D(n257), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[13])
         );
  DFFASX1 prer_reg_12_ ( .D(n256), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[12])
         );
  DFFASX1 prer_reg_11_ ( .D(n255), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[11])
         );
  DFFASX1 prer_reg_10_ ( .D(n254), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[10])
         );
  DFFASX1 prer_reg_9_ ( .D(n253), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[9])
         );
  DFFASX1 prer_reg_8_ ( .D(n252), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[8])
         );
  DFFASX1 prer_reg_7_ ( .D(n251), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[7])
         );
  DFFASX1 prer_reg_6_ ( .D(n250), .CLK(wb_clk_i), .SETB(n281), .Q(prer[6]) );
  DFFASX1 prer_reg_5_ ( .D(n249), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[5])
         );
  DFFASX1 prer_reg_4_ ( .D(n248), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[4])
         );
  DFFASX1 prer_reg_3_ ( .D(n247), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[3])
         );
  DFFASX1 prer_reg_2_ ( .D(n246), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[2])
         );
  DFFASX1 prer_reg_1_ ( .D(n245), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[1])
         );
  DFFASX1 prer_reg_0_ ( .D(n244), .CLK(wb_clk_i), .SETB(arst_i), .Q(prer[0])
         );
  DFFASX1 byte_controller_bit_controller_fSCL_reg_0_ ( .D(n174), .CLK(wb_clk_i), .SETB(arst_i), .Q(byte_controller_bit_controller_fSCL[0]) );
  DFFASX1 byte_controller_bit_controller_fSCL_reg_1_ ( .D(n173), .CLK(wb_clk_i), .SETB(arst_i), .Q(byte_controller_bit_controller_fSCL[1]) );
  DFFASX1 byte_controller_bit_controller_fSCL_reg_2_ ( .D(n172), .CLK(wb_clk_i), .SETB(arst_i), .Q(byte_controller_bit_controller_fSCL[2]) );
  DFFASX1 byte_controller_bit_controller_sSCL_reg ( .D(
        byte_controller_bit_controller_N123), .CLK(wb_clk_i), .SETB(arst_i), 
        .Q(byte_controller_bit_controller_sSCL), .QN(n541) );
  DFFASX1 byte_controller_bit_controller_dSCL_reg ( .D(
        byte_controller_bit_controller_N125), .CLK(wb_clk_i), .SETB(arst_i), 
        .Q(byte_controller_bit_controller_dSCL) );
  DFFASX1 byte_controller_bit_controller_fSDA_reg_0_ ( .D(n177), .CLK(wb_clk_i), .SETB(arst_i), .Q(byte_controller_bit_controller_fSDA[0]) );
  DFFASX1 byte_controller_bit_controller_fSDA_reg_1_ ( .D(n176), .CLK(wb_clk_i), .SETB(arst_i), .Q(byte_controller_bit_controller_fSDA[1]) );
  DFFASX1 byte_controller_bit_controller_fSDA_reg_2_ ( .D(n175), .CLK(wb_clk_i), .SETB(arst_i), .Q(byte_controller_bit_controller_fSDA[2]) );
  DFFASX1 byte_controller_bit_controller_sSDA_reg ( .D(
        byte_controller_bit_controller_N124), .CLK(wb_clk_i), .SETB(arst_i), 
        .Q(byte_controller_bit_controller_sSDA), .QN(n550) );
  DFFASX1 byte_controller_bit_controller_dSDA_reg ( .D(
        byte_controller_bit_controller_N126), .CLK(wb_clk_i), .SETB(arst_i), 
        .Q(byte_controller_bit_controller_dSDA) );
  DFFASX1 byte_controller_bit_controller_clk_en_reg ( .D(n557), .CLK(wb_clk_i), 
        .SETB(arst_i), .Q(byte_controller_bit_controller_clk_en), .QN(n543) );
  DFFASX1 byte_controller_bit_controller_sda_oen_reg ( .D(n221), .CLK(wb_clk_i), .SETB(arst_i), .Q(sda_padoen_o) );
  DFFASX1 byte_controller_bit_controller_scl_oen_reg ( .D(n220), .CLK(wb_clk_i), .SETB(arst_i), .Q(scl_padoen_o), .QN(n552) );
  DFFX1 byte_controller_bit_controller_dout_reg ( .D(n171), .CLK(wb_clk_i), 
        .Q(byte_controller_core_rxd) );
  DFFX1 byte_controller_bit_controller_dscl_oen_reg ( .D(scl_padoen_o), .CLK(
        wb_clk_i), .Q(byte_controller_bit_controller_dscl_oen) );
  NAND2X0 U324 ( .IN1(n371), .IN2(n504), .QN(n537) );
  INVX0 U325 ( .INP(wb_rst_i), .ZN(n504) );
  NBUFFX8 U326 ( .INP(n281), .Z(n279) );
  AND2X1 U327 ( .IN1(ctr[7]), .IN2(n538), .Q(n409) );
  NAND2X0 U328 ( .IN1(n328), .IN2(n327), .QN(n181) );
  NAND2X0 U329 ( .IN1(n323), .IN2(n322), .QN(n183) );
  NAND2X0 U330 ( .IN1(n313), .IN2(n312), .QN(n189) );
  NAND2X0 U331 ( .IN1(n319), .IN2(n318), .QN(n185) );
  NAND2X0 U332 ( .IN1(n333), .IN2(n332), .QN(n187) );
  NAND2X0 U333 ( .IN1(n316), .IN2(n315), .QN(n179) );
  NAND2X0 U334 ( .IN1(n304), .IN2(n303), .QN(n195) );
  NAND2X0 U335 ( .IN1(n309), .IN2(n308), .QN(n196) );
  NAND2X0 U336 ( .IN1(n402), .IN2(n400), .QN(n401) );
  NAND2X0 U337 ( .IN1(n399), .IN2(n397), .QN(n398) );
  NAND2X0 U338 ( .IN1(byte_controller_bit_controller_filter_cnt[10]), .IN2(
        n396), .QN(n397) );
  NAND2X0 U339 ( .IN1(n482), .IN2(n301), .QN(n305) );
  NAND2X0 U340 ( .IN1(n396), .IN2(n394), .QN(n395) );
  NAND2X0 U341 ( .IN1(byte_controller_bit_controller_filter_cnt[9]), .IN2(n393), .QN(n394) );
  NAND2X0 U342 ( .IN1(n393), .IN2(n391), .QN(n392) );
  NAND2X0 U343 ( .IN1(n503), .IN2(byte_controller_core_cmd[3]), .QN(n303) );
  NAND2X0 U344 ( .IN1(n503), .IN2(byte_controller_core_cmd[2]), .QN(n308) );
  NAND2X0 U345 ( .IN1(n296), .IN2(n295), .QN(n206) );
  NAND2X0 U346 ( .IN1(byte_controller_bit_controller_filter_cnt[8]), .IN2(n390), .QN(n391) );
  NAND2X0 U347 ( .IN1(n390), .IN2(n388), .QN(n389) );
  NAND2X0 U348 ( .IN1(n455), .IN2(n549), .QN(n456) );
  NAND2X0 U349 ( .IN1(n298), .IN2(n297), .QN(n476) );
  NAND2X0 U350 ( .IN1(n288), .IN2(n287), .QN(
        byte_controller_bit_controller_N139) );
  NAND2X0 U351 ( .IN1(n387), .IN2(n385), .QN(n386) );
  NAND2X0 U352 ( .IN1(n468), .IN2(n292), .QN(n238) );
  NAND2X0 U353 ( .IN1(n291), .IN2(n290), .QN(n207) );
  NAND2X0 U354 ( .IN1(n470), .IN2(n469), .QN(n464) );
  NAND2X0 U355 ( .IN1(byte_controller_bit_controller_filter_cnt[7]), .IN2(n387), .QN(n388) );
  NAND2X0 U356 ( .IN1(n384), .IN2(n382), .QN(n383) );
  NAND2X0 U357 ( .IN1(n458), .IN2(byte_controller_bit_controller_c_state[0]), 
        .QN(n468) );
  NAND2X0 U358 ( .IN1(byte_controller_bit_controller_filter_cnt[6]), .IN2(n384), .QN(n385) );
  NAND2X0 U359 ( .IN1(byte_controller_core_ack), .IN2(n360), .QN(n299) );
  NAND2X0 U360 ( .IN1(n356), .IN2(n499), .QN(n295) );
  NAND2X0 U361 ( .IN1(byte_controller_bit_controller_c_state[1]), .IN2(n463), 
        .QN(n292) );
  NAND2X0 U362 ( .IN1(n458), .IN2(n450), .QN(n470) );
  NAND2X0 U363 ( .IN1(n546), .IN2(n487), .QN(n301) );
  NAND2X0 U364 ( .IN1(n467), .IN2(n466), .QN(n472) );
  NAND2X0 U365 ( .IN1(byte_controller_c_state[3]), .IN2(n358), .QN(n473) );
  NAND2X0 U366 ( .IN1(n425), .IN2(n424), .QN(n428) );
  NAND2X0 U367 ( .IN1(n425), .IN2(n411), .QN(n413) );
  NAND2X0 U368 ( .IN1(n425), .IN2(n416), .QN(n418) );
  NAND2X0 U369 ( .IN1(n381), .IN2(n379), .QN(n380) );
  NAND2X0 U370 ( .IN1(n493), .IN2(n504), .QN(n447) );
  NAND2X0 U371 ( .IN1(byte_controller_bit_controller_filter_cnt[5]), .IN2(n381), .QN(n382) );
  NAND2X0 U372 ( .IN1(n300), .IN2(n545), .QN(n487) );
  NAND2X0 U373 ( .IN1(n363), .IN2(cr[3]), .QN(n364) );
  NAND2X0 U374 ( .IN1(txr[3]), .IN2(n422), .QN(n419) );
  NAND2X0 U375 ( .IN1(cr[3]), .IN2(n421), .QN(n420) );
  NAND2X0 U376 ( .IN1(cr[2]), .IN2(n421), .QN(n415) );
  NAND2X0 U377 ( .IN1(txr[4]), .IN2(n422), .QN(n429) );
  NAND2X0 U378 ( .IN1(txr[2]), .IN2(n422), .QN(n414) );
  NAND2X0 U379 ( .IN1(cr[4]), .IN2(n421), .QN(n430) );
  NAND2X0 U380 ( .IN1(byte_controller_dcnt[0]), .IN2(n498), .QN(n290) );
  NAND2X0 U381 ( .IN1(n486), .IN2(n544), .QN(n297) );
  NAND2X0 U382 ( .IN1(byte_controller_shift), .IN2(n289), .QN(n293) );
  NAND2X0 U383 ( .IN1(byte_controller_bit_controller_filter_cnt[4]), .IN2(n378), .QN(n379) );
  NAND2X0 U384 ( .IN1(byte_controller_core_txd), .IN2(n460), .QN(n461) );
  NAND2X0 U385 ( .IN1(n426), .IN2(rxr[2]), .QN(n412) );
  NAND2X0 U386 ( .IN1(n426), .IN2(rxr[3]), .QN(n417) );
  NAND2X0 U387 ( .IN1(n426), .IN2(rxr[4]), .QN(n427) );
  NAND2X0 U388 ( .IN1(byte_controller_c_state[1]), .IN2(n547), .QN(n359) );
  NAND2X0 U389 ( .IN1(n504), .IN2(n550), .QN(
        byte_controller_bit_controller_N126) );
  NAND2X0 U390 ( .IN1(n553), .IN2(n504), .QN(n334) );
  INVX0 U392 ( .INP(n510), .ZN(n512) );
  INVX0 U393 ( .INP(n537), .ZN(n538) );
  NBUFFX2 U394 ( .INP(arst_i), .Z(n281) );
  OR4X1 U395 ( .IN1(byte_controller_bit_controller_cnt[1]), .IN2(
        byte_controller_bit_controller_cnt[2]), .IN3(
        byte_controller_bit_controller_cnt[3]), .IN4(
        byte_controller_bit_controller_cnt[0]), .Q(n330) );
  OR3X1 U396 ( .IN1(byte_controller_bit_controller_cnt[5]), .IN2(
        byte_controller_bit_controller_cnt[4]), .IN3(n330), .Q(n329) );
  OR3X1 U397 ( .IN1(byte_controller_bit_controller_cnt[7]), .IN2(
        byte_controller_bit_controller_cnt[6]), .IN3(n329), .Q(n320) );
  OR3X1 U398 ( .IN1(byte_controller_bit_controller_cnt[9]), .IN2(
        byte_controller_bit_controller_cnt[8]), .IN3(n320), .Q(n325) );
  OR3X1 U399 ( .IN1(byte_controller_bit_controller_cnt[11]), .IN2(
        byte_controller_bit_controller_cnt[10]), .IN3(n325), .Q(n324) );
  OR3X1 U400 ( .IN1(byte_controller_bit_controller_cnt[13]), .IN2(
        byte_controller_bit_controller_cnt[12]), .IN3(n324), .Q(n534) );
  OR3X1 U401 ( .IN1(byte_controller_bit_controller_cnt[15]), .IN2(
        byte_controller_bit_controller_cnt[14]), .IN3(n534), .Q(n284) );
  NAND3X0 U402 ( .IN1(byte_controller_bit_controller_dSCL), .IN2(scl_padoen_o), 
        .IN3(n541), .QN(n283) );
  NAND4X0 U403 ( .IN1(ctr[7]), .IN2(n504), .IN3(n284), .IN4(n283), .QN(n557)
         );
  INVX0 U404 ( .INP(byte_controller_bit_controller_N126), .ZN(n366) );
  NAND3X0 U405 ( .IN1(byte_controller_bit_controller_sda_chk), .IN2(n366), 
        .IN3(sda_padoen_o), .QN(n288) );
  OR3X1 U406 ( .IN1(byte_controller_bit_controller_c_state[1]), .IN2(
        byte_controller_bit_controller_c_state[11]), .IN3(
        byte_controller_bit_controller_c_state[10]), .Q(n459) );
  OR4X1 U407 ( .IN1(byte_controller_bit_controller_c_state[3]), .IN2(
        byte_controller_bit_controller_c_state[7]), .IN3(
        byte_controller_bit_controller_c_state[6]), .IN4(
        byte_controller_bit_controller_c_state[2]), .Q(n285) );
  NOR4X0 U408 ( .IN1(byte_controller_bit_controller_c_state[14]), .IN2(
        byte_controller_bit_controller_c_state[15]), .IN3(n459), .IN4(n285), 
        .QN(n466) );
  NOR4X0 U409 ( .IN1(byte_controller_bit_controller_c_state[16]), .IN2(
        byte_controller_bit_controller_c_state[12]), .IN3(
        byte_controller_bit_controller_c_state[8]), .IN4(
        byte_controller_bit_controller_c_state[4]), .QN(n370) );
  NOR4X0 U410 ( .IN1(byte_controller_bit_controller_c_state[0]), .IN2(
        byte_controller_bit_controller_c_state[5]), .IN3(
        byte_controller_bit_controller_c_state[13]), .IN4(
        byte_controller_bit_controller_c_state[9]), .QN(n286) );
  AND3X1 U411 ( .IN1(n466), .IN2(n370), .IN3(n286), .Q(n450) );
  OR4X1 U412 ( .IN1(wb_rst_i), .IN2(n450), .IN3(
        byte_controller_bit_controller_cmd_stop), .IN4(n553), .Q(n287) );
  AND2X1 U413 ( .IN1(byte_controller_ld), .IN2(n504), .Q(n500) );
  NOR2X0 U414 ( .IN1(wb_rst_i), .IN2(byte_controller_ld), .QN(n289) );
  NOR2X0 U415 ( .IN1(byte_controller_dcnt[0]), .IN2(n293), .QN(n496) );
  NOR2X0 U416 ( .IN1(n500), .IN2(n496), .QN(n291) );
  NOR3X0 U417 ( .IN1(wb_rst_i), .IN2(byte_controller_ld), .IN3(
        byte_controller_shift), .QN(n498) );
  NOR2X0 U418 ( .IN1(wb_rst_i), .IN2(i2c_al), .QN(n478) );
  INVX0 U419 ( .INP(n478), .ZN(n477) );
  NOR2X0 U420 ( .IN1(n477), .IN2(n543), .QN(n458) );
  NOR2X0 U421 ( .IN1(byte_controller_bit_controller_clk_en), .IN2(n477), .QN(
        n463) );
  INVX0 U422 ( .INP(n293), .ZN(n499) );
  AO21X1 U423 ( .IN1(byte_controller_dcnt[0]), .IN2(n499), .IN3(n498), .Q(n497) );
  OA221X1 U424 ( .IN1(n497), .IN2(byte_controller_dcnt[1]), .IN3(n497), .IN4(
        n499), .IN5(byte_controller_dcnt[2]), .Q(n294) );
  NOR2X0 U425 ( .IN1(n500), .IN2(n294), .QN(n296) );
  NOR3X0 U426 ( .IN1(byte_controller_dcnt[0]), .IN2(byte_controller_dcnt[2]), 
        .IN3(byte_controller_dcnt[1]), .QN(n356) );
  OR2X1 U427 ( .IN1(byte_controller_c_state[2]), .IN2(
        byte_controller_c_state[1]), .Q(n484) );
  NOR4X0 U428 ( .IN1(byte_controller_c_state[4]), .IN2(
        byte_controller_c_state[0]), .IN3(byte_controller_c_state[3]), .IN4(
        n484), .QN(n300) );
  INVX0 U429 ( .INP(n300), .ZN(n360) );
  NOR2X0 U430 ( .IN1(done), .IN2(n360), .QN(n298) );
  NOR2X0 U431 ( .IN1(cr[5]), .IN2(cr[4]), .QN(n486) );
  AND3X1 U432 ( .IN1(n299), .IN2(n478), .IN3(n476), .Q(n503) );
  NOR2X0 U433 ( .IN1(n503), .IN2(n477), .QN(n482) );
  NOR2X0 U434 ( .IN1(n555), .IN2(n305), .QN(n479) );
  INVX0 U435 ( .INP(n356), .ZN(n483) );
  OA221X1 U436 ( .IN1(n356), .IN2(byte_controller_c_state[1]), .IN3(n483), 
        .IN4(byte_controller_c_state[2]), .IN5(n482), .Q(n302) );
  NOR2X0 U437 ( .IN1(n479), .IN2(n302), .QN(n304) );
  NOR2X0 U438 ( .IN1(byte_controller_c_state[0]), .IN2(cr[4]), .QN(n306) );
  NOR3X0 U439 ( .IN1(n306), .IN2(n305), .IN3(cr[5]), .QN(n480) );
  OA221X1 U440 ( .IN1(n356), .IN2(byte_controller_c_state[2]), .IN3(n483), 
        .IN4(byte_controller_c_state[1]), .IN5(n482), .Q(n307) );
  NOR2X0 U441 ( .IN1(n480), .IN2(n307), .QN(n309) );
  NOR2X0 U442 ( .IN1(byte_controller_bit_controller_slave_wait), .IN2(n557), 
        .QN(n510) );
  NOR2X0 U443 ( .IN1(n330), .IN2(n512), .QN(n520) );
  NOR3X0 U444 ( .IN1(byte_controller_bit_controller_slave_wait), .IN2(
        byte_controller_bit_controller_cnt[0]), .IN3(
        byte_controller_bit_controller_cnt[1]), .QN(n310) );
  NOR2X0 U445 ( .IN1(n310), .IN2(n557), .QN(n516) );
  OA221X1 U446 ( .IN1(n516), .IN2(byte_controller_bit_controller_cnt[2]), 
        .IN3(n516), .IN4(n510), .IN5(byte_controller_bit_controller_cnt[3]), 
        .Q(n311) );
  NOR2X0 U447 ( .IN1(n520), .IN2(n311), .QN(n313) );
  NAND2X0 U448 ( .IN1(prer[3]), .IN2(n557), .QN(n312) );
  INVX0 U449 ( .INP(n557), .ZN(n513) );
  OA21X1 U450 ( .IN1(byte_controller_bit_controller_slave_wait), .IN2(n324), 
        .IN3(n513), .Q(n531) );
  OA221X1 U451 ( .IN1(n531), .IN2(byte_controller_bit_controller_cnt[12]), 
        .IN3(n531), .IN4(n510), .IN5(byte_controller_bit_controller_cnt[13]), 
        .Q(n314) );
  NOR2X0 U452 ( .IN1(n534), .IN2(n512), .QN(n507) );
  NOR2X0 U453 ( .IN1(n314), .IN2(n507), .QN(n316) );
  NAND2X0 U454 ( .IN1(prer[13]), .IN2(n557), .QN(n315) );
  NOR2X0 U455 ( .IN1(n320), .IN2(n512), .QN(n526) );
  OA21X1 U456 ( .IN1(byte_controller_bit_controller_slave_wait), .IN2(n329), 
        .IN3(n513), .Q(n522) );
  OA221X1 U457 ( .IN1(n522), .IN2(byte_controller_bit_controller_cnt[6]), 
        .IN3(n522), .IN4(n510), .IN5(byte_controller_bit_controller_cnt[7]), 
        .Q(n317) );
  NOR2X0 U458 ( .IN1(n526), .IN2(n317), .QN(n319) );
  NAND2X0 U459 ( .IN1(prer[7]), .IN2(n557), .QN(n318) );
  NOR2X0 U460 ( .IN1(n325), .IN2(n512), .QN(n529) );
  OA21X1 U461 ( .IN1(byte_controller_bit_controller_slave_wait), .IN2(n320), 
        .IN3(n513), .Q(n525) );
  OA221X1 U462 ( .IN1(n525), .IN2(byte_controller_bit_controller_cnt[8]), 
        .IN3(n525), .IN4(n510), .IN5(byte_controller_bit_controller_cnt[9]), 
        .Q(n321) );
  NOR2X0 U463 ( .IN1(n529), .IN2(n321), .QN(n323) );
  NAND2X0 U464 ( .IN1(prer[9]), .IN2(n557), .QN(n322) );
  NOR2X0 U465 ( .IN1(n324), .IN2(n512), .QN(n532) );
  OA21X1 U466 ( .IN1(byte_controller_bit_controller_slave_wait), .IN2(n325), 
        .IN3(n513), .Q(n528) );
  OA221X1 U467 ( .IN1(n528), .IN2(byte_controller_bit_controller_cnt[10]), 
        .IN3(n528), .IN4(n510), .IN5(byte_controller_bit_controller_cnt[11]), 
        .Q(n326) );
  NOR2X0 U468 ( .IN1(n532), .IN2(n326), .QN(n328) );
  NAND2X0 U469 ( .IN1(prer[11]), .IN2(n557), .QN(n327) );
  NOR2X0 U470 ( .IN1(n329), .IN2(n512), .QN(n523) );
  OA21X1 U471 ( .IN1(byte_controller_bit_controller_slave_wait), .IN2(n330), 
        .IN3(n513), .Q(n519) );
  OA221X1 U472 ( .IN1(n519), .IN2(byte_controller_bit_controller_cnt[4]), 
        .IN3(n519), .IN4(n510), .IN5(byte_controller_bit_controller_cnt[5]), 
        .Q(n331) );
  NOR2X0 U473 ( .IN1(n523), .IN2(n331), .QN(n333) );
  NAND2X0 U474 ( .IN1(prer[5]), .IN2(n557), .QN(n332) );
  NOR2X0 U475 ( .IN1(byte_controller_bit_controller_sta_condition), .IN2(sr[6]), .QN(n335) );
  NOR2X0 U476 ( .IN1(n335), .IN2(n334), .QN(
        byte_controller_bit_controller_N132) );
  AND3X1 U478 ( .IN1(wb_stb_i), .IN2(wb_cyc_i), .IN3(n556), .Q(N20) );
  NOR2X0 U479 ( .IN1(byte_controller_bit_controller_dscl_oen), .IN2(n552), 
        .QN(n336) );
  OA21X1 U480 ( .IN1(byte_controller_bit_controller_slave_wait), .IN2(n336), 
        .IN3(n541), .Q(byte_controller_bit_controller_N30) );
  INVX0 U481 ( .INP(wb_adr_i[0]), .ZN(n337) );
  NAND2X0 U482 ( .IN1(n337), .IN2(wb_adr_i[1]), .QN(n431) );
  INVX0 U483 ( .INP(n431), .ZN(n423) );
  NOR2X0 U484 ( .IN1(wb_adr_i[1]), .IN2(wb_adr_i[0]), .QN(n444) );
  NOR2X0 U485 ( .IN1(wb_adr_i[1]), .IN2(n337), .QN(n438) );
  AO222X1 U486 ( .IN1(cr[0]), .IN2(n423), .IN3(n444), .IN4(sr_0), .IN5(txr[0]), 
        .IN6(n438), .Q(n340) );
  INVX0 U487 ( .INP(wb_adr_i[2]), .ZN(n425) );
  AO222X1 U488 ( .IN1(prer[8]), .IN2(n438), .IN3(n423), .IN4(ctr[0]), .IN5(
        prer[0]), .IN6(n444), .Q(n339) );
  AND3X1 U489 ( .IN1(wb_adr_i[1]), .IN2(wb_adr_i[0]), .IN3(n425), .Q(n426) );
  AND2X1 U490 ( .IN1(rxr[0]), .IN2(n426), .Q(n338) );
  AO221X1 U491 ( .IN1(wb_adr_i[2]), .IN2(n340), .IN3(n425), .IN4(n339), .IN5(
        n338), .Q(N43) );
  AO222X1 U492 ( .IN1(n423), .IN2(cr[1]), .IN3(n438), .IN4(txr[1]), .IN5(sr_1), 
        .IN6(n444), .Q(n343) );
  AO222X1 U493 ( .IN1(prer[9]), .IN2(n438), .IN3(n423), .IN4(ctr[1]), .IN5(
        prer[1]), .IN6(n444), .Q(n342) );
  AND2X1 U494 ( .IN1(n426), .IN2(rxr[1]), .Q(n341) );
  AO221X1 U495 ( .IN1(wb_adr_i[2]), .IN2(n343), .IN3(n425), .IN4(n342), .IN5(
        n341), .Q(N44) );
  AO222X1 U496 ( .IN1(cr[5]), .IN2(n423), .IN3(n444), .IN4(sr[5]), .IN5(n438), 
        .IN6(txr[5]), .Q(n346) );
  AO222X1 U497 ( .IN1(prer[5]), .IN2(n444), .IN3(n423), .IN4(ctr[5]), .IN5(
        n438), .IN6(prer[13]), .Q(n345) );
  AND2X1 U498 ( .IN1(n426), .IN2(rxr[5]), .Q(n344) );
  AO221X1 U499 ( .IN1(wb_adr_i[2]), .IN2(n346), .IN3(n425), .IN4(n345), .IN5(
        n344), .Q(N48) );
  AO222X1 U500 ( .IN1(cr[6]), .IN2(n423), .IN3(n444), .IN4(sr[6]), .IN5(n438), 
        .IN6(txr[6]), .Q(n349) );
  AO222X1 U501 ( .IN1(prer[6]), .IN2(n444), .IN3(n423), .IN4(ctr[6]), .IN5(
        n438), .IN6(prer[14]), .Q(n348) );
  AND2X1 U502 ( .IN1(n426), .IN2(rxr[6]), .Q(n347) );
  AO221X1 U503 ( .IN1(wb_adr_i[2]), .IN2(n349), .IN3(n425), .IN4(n348), .IN5(
        n347), .Q(N49) );
  AO222X1 U504 ( .IN1(cr[7]), .IN2(n423), .IN3(n444), .IN4(sr[7]), .IN5(n438), 
        .IN6(txr[7]), .Q(n352) );
  AO222X1 U505 ( .IN1(ctr[7]), .IN2(n423), .IN3(prer[15]), .IN4(n438), .IN5(
        n444), .IN6(prer[7]), .Q(n351) );
  AND2X1 U506 ( .IN1(n426), .IN2(rxr[7]), .Q(n350) );
  AO221X1 U507 ( .IN1(wb_adr_i[2]), .IN2(n352), .IN3(n425), .IN4(n351), .IN5(
        n350), .Q(N50) );
  NOR2X0 U508 ( .IN1(i2c_al), .IN2(done), .QN(n492) );
  INVX0 U509 ( .INP(n492), .ZN(n353) );
  NOR2X0 U510 ( .IN1(n353), .IN2(sr_0), .QN(n354) );
  NOR3X0 U511 ( .IN1(n354), .IN2(wb_rst_i), .IN3(cr[0]), .QN(N117) );
  NOR2X0 U512 ( .IN1(wb_rst_i), .IN2(n486), .QN(N116) );
  AND2X1 U513 ( .IN1(irxack), .IN2(n504), .Q(N115) );
  OA221X1 U514 ( .IN1(i2c_al), .IN2(sr[5]), .IN3(i2c_al), .IN4(n545), .IN5(
        n504), .Q(N114) );
  NOR2X0 U515 ( .IN1(n477), .IN2(n547), .QN(n358) );
  OA221X1 U516 ( .IN1(byte_controller_c_state[4]), .IN2(
        byte_controller_c_state[3]), .IN3(byte_controller_c_state[4]), .IN4(
        n544), .IN5(n358), .Q(byte_controller_N107) );
  NOR2X0 U517 ( .IN1(n477), .IN2(n476), .QN(n355) );
  AO21X1 U518 ( .IN1(byte_controller_c_state[0]), .IN2(n358), .IN3(n355), .Q(
        byte_controller_N106) );
  NOR2X0 U519 ( .IN1(n356), .IN2(n551), .QN(n357) );
  OA21X1 U520 ( .IN1(byte_controller_c_state[1]), .IN2(n357), .IN3(n358), .Q(
        byte_controller_N105) );
  NOR2X0 U521 ( .IN1(byte_controller_c_state[4]), .IN2(
        byte_controller_c_state[0]), .QN(n361) );
  NAND4X0 U522 ( .IN1(n361), .IN2(n360), .IN3(n551), .IN4(n359), .QN(n362) );
  NAND3X0 U523 ( .IN1(rxr[7]), .IN2(n478), .IN3(n362), .QN(n365) );
  OA221X1 U524 ( .IN1(byte_controller_c_state[3]), .IN2(
        byte_controller_c_state[1]), .IN3(byte_controller_c_state[3]), .IN4(
        byte_controller_core_ack), .IN5(n478), .Q(n363) );
  NAND3X0 U525 ( .IN1(n473), .IN2(n365), .IN3(n364), .QN(byte_controller_N104)
         );
  NOR4X0 U526 ( .IN1(wb_rst_i), .IN2(byte_controller_bit_controller_dSDA), 
        .IN3(n541), .IN4(n550), .QN(byte_controller_bit_controller_N130) );
  AND3X1 U527 ( .IN1(byte_controller_bit_controller_sSCL), .IN2(n366), .IN3(
        byte_controller_bit_controller_dSDA), .Q(
        byte_controller_bit_controller_N129) );
  NAND2X0 U528 ( .IN1(n504), .IN2(n541), .QN(
        byte_controller_bit_controller_N125) );
  OR2X1 U529 ( .IN1(byte_controller_bit_controller_fSDA[0]), .IN2(
        byte_controller_bit_controller_fSDA[2]), .Q(n367) );
  AO221X1 U530 ( .IN1(n367), .IN2(byte_controller_bit_controller_fSDA[1]), 
        .IN3(byte_controller_bit_controller_fSDA[2]), .IN4(
        byte_controller_bit_controller_fSDA[0]), .IN5(wb_rst_i), .Q(
        byte_controller_bit_controller_N124) );
  OR2X1 U531 ( .IN1(byte_controller_bit_controller_fSCL[0]), .IN2(
        byte_controller_bit_controller_fSCL[2]), .Q(n368) );
  AO221X1 U532 ( .IN1(n368), .IN2(byte_controller_bit_controller_fSCL[1]), 
        .IN3(byte_controller_bit_controller_fSCL[2]), .IN4(
        byte_controller_bit_controller_fSCL[0]), .IN5(wb_rst_i), .Q(
        byte_controller_bit_controller_N123) );
  AND2X1 U533 ( .IN1(sda_pad_i), .IN2(n504), .Q(
        byte_controller_bit_controller_N73) );
  AND2X1 U534 ( .IN1(byte_controller_bit_controller_cSDA[0]), .IN2(n504), .Q(
        byte_controller_bit_controller_N74) );
  AND2X1 U535 ( .IN1(scl_pad_i), .IN2(n504), .Q(
        byte_controller_bit_controller_N71) );
  AND2X1 U536 ( .IN1(byte_controller_bit_controller_cSCL[0]), .IN2(n504), .Q(
        byte_controller_bit_controller_N72) );
  INVX0 U537 ( .INP(n458), .ZN(n369) );
  NOR2X0 U538 ( .IN1(n370), .IN2(n369), .QN(
        byte_controller_bit_controller_N228) );
  OR4X1 U539 ( .IN1(byte_controller_bit_controller_filter_cnt[0]), .IN2(
        byte_controller_bit_controller_filter_cnt[3]), .IN3(
        byte_controller_bit_controller_filter_cnt[2]), .IN4(
        byte_controller_bit_controller_filter_cnt[1]), .Q(n378) );
  OR2X1 U540 ( .IN1(byte_controller_bit_controller_filter_cnt[4]), .IN2(n378), 
        .Q(n381) );
  OR2X1 U541 ( .IN1(byte_controller_bit_controller_filter_cnt[5]), .IN2(n381), 
        .Q(n384) );
  OR2X1 U542 ( .IN1(byte_controller_bit_controller_filter_cnt[6]), .IN2(n384), 
        .Q(n387) );
  OR2X1 U543 ( .IN1(byte_controller_bit_controller_filter_cnt[7]), .IN2(n387), 
        .Q(n390) );
  OR2X1 U544 ( .IN1(byte_controller_bit_controller_filter_cnt[8]), .IN2(n390), 
        .Q(n393) );
  OR2X1 U545 ( .IN1(byte_controller_bit_controller_filter_cnt[9]), .IN2(n393), 
        .Q(n396) );
  OR2X1 U546 ( .IN1(byte_controller_bit_controller_filter_cnt[10]), .IN2(n396), 
        .Q(n399) );
  OR2X1 U547 ( .IN1(byte_controller_bit_controller_filter_cnt[11]), .IN2(n399), 
        .Q(n402) );
  NOR2X0 U548 ( .IN1(byte_controller_bit_controller_filter_cnt[12]), .IN2(n402), .QN(n408) );
  INVX0 U549 ( .INP(n408), .ZN(n404) );
  NOR2X0 U550 ( .IN1(byte_controller_bit_controller_filter_cnt[13]), .IN2(n404), .QN(n371) );
  NAND2X0 U551 ( .IN1(ctr[7]), .IN2(n504), .QN(n407) );
  NOR2X0 U552 ( .IN1(n371), .IN2(n407), .QN(n406) );
  AO22X1 U553 ( .IN1(n409), .IN2(prer[2]), .IN3(n406), .IN4(n548), .Q(
        byte_controller_bit_controller_N93) );
  MUX21X1 U554 ( .IN1(n548), .IN2(byte_controller_bit_controller_filter_cnt[0]), .S(byte_controller_bit_controller_filter_cnt[1]), .Q(n372) );
  AO22X1 U555 ( .IN1(n406), .IN2(n372), .IN3(n409), .IN4(prer[3]), .Q(
        byte_controller_bit_controller_N94) );
  OR2X1 U556 ( .IN1(byte_controller_bit_controller_filter_cnt[0]), .IN2(
        byte_controller_bit_controller_filter_cnt[1]), .Q(n373) );
  NOR2X0 U557 ( .IN1(byte_controller_bit_controller_filter_cnt[2]), .IN2(n373), 
        .QN(n376) );
  AO21X1 U558 ( .IN1(byte_controller_bit_controller_filter_cnt[2]), .IN2(n373), 
        .IN3(n376), .Q(n374) );
  AO22X1 U559 ( .IN1(n406), .IN2(n374), .IN3(n409), .IN4(prer[4]), .Q(
        byte_controller_bit_controller_N95) );
  INVX0 U560 ( .INP(n376), .ZN(n375) );
  MUX21X1 U561 ( .IN1(n376), .IN2(n375), .S(
        byte_controller_bit_controller_filter_cnt[3]), .Q(n377) );
  AO22X1 U562 ( .IN1(n406), .IN2(n377), .IN3(n409), .IN4(prer[5]), .Q(
        byte_controller_bit_controller_N96) );
  AO22X1 U563 ( .IN1(n406), .IN2(n380), .IN3(n409), .IN4(prer[6]), .Q(
        byte_controller_bit_controller_N97) );
  AO22X1 U564 ( .IN1(n406), .IN2(n383), .IN3(n409), .IN4(prer[7]), .Q(
        byte_controller_bit_controller_N98) );
  AO22X1 U565 ( .IN1(n406), .IN2(n386), .IN3(n409), .IN4(prer[8]), .Q(
        byte_controller_bit_controller_N99) );
  AO22X1 U566 ( .IN1(n406), .IN2(n389), .IN3(n409), .IN4(prer[9]), .Q(
        byte_controller_bit_controller_N100) );
  AO22X1 U567 ( .IN1(n406), .IN2(n392), .IN3(n409), .IN4(prer[10]), .Q(
        byte_controller_bit_controller_N101) );
  AO22X1 U568 ( .IN1(n406), .IN2(n395), .IN3(n409), .IN4(prer[11]), .Q(
        byte_controller_bit_controller_N102) );
  AO22X1 U569 ( .IN1(n406), .IN2(n398), .IN3(n409), .IN4(prer[12]), .Q(
        byte_controller_bit_controller_N103) );
  NAND2X0 U570 ( .IN1(byte_controller_bit_controller_filter_cnt[11]), .IN2(
        n399), .QN(n400) );
  AO22X1 U571 ( .IN1(n406), .IN2(n401), .IN3(n409), .IN4(prer[13]), .Q(
        byte_controller_bit_controller_N104) );
  NAND2X0 U572 ( .IN1(byte_controller_bit_controller_filter_cnt[12]), .IN2(
        n402), .QN(n403) );
  NAND2X0 U573 ( .IN1(n404), .IN2(n403), .QN(n405) );
  AO22X1 U574 ( .IN1(n406), .IN2(n405), .IN3(n409), .IN4(prer[14]), .Q(
        byte_controller_bit_controller_N105) );
  NOR2X0 U575 ( .IN1(n408), .IN2(n407), .QN(n410) );
  AO22X1 U576 ( .IN1(byte_controller_bit_controller_filter_cnt[13]), .IN2(n410), .IN3(n409), .IN4(prer[15]), .Q(byte_controller_bit_controller_N106) );
  AND3X1 U577 ( .IN1(sr_0), .IN2(ctr[6]), .IN3(n504), .Q(N121) );
  NOR2X0 U578 ( .IN1(n425), .IN2(n431), .QN(n421) );
  AND2X1 U579 ( .IN1(wb_adr_i[2]), .IN2(n438), .Q(n422) );
  AO222X1 U580 ( .IN1(prer[2]), .IN2(n444), .IN3(n423), .IN4(ctr[2]), .IN5(
        n438), .IN6(prer[10]), .Q(n411) );
  NAND4X0 U581 ( .IN1(n415), .IN2(n414), .IN3(n413), .IN4(n412), .QN(n278) );
  AO222X1 U582 ( .IN1(prer[3]), .IN2(n444), .IN3(n423), .IN4(ctr[3]), .IN5(
        n438), .IN6(prer[11]), .Q(n416) );
  NAND4X0 U583 ( .IN1(n420), .IN2(n419), .IN3(n418), .IN4(n417), .QN(n277) );
  AO222X1 U584 ( .IN1(prer[4]), .IN2(n444), .IN3(n423), .IN4(ctr[4]), .IN5(
        n438), .IN6(prer[12]), .Q(n424) );
  NAND4X0 U585 ( .IN1(n430), .IN2(n429), .IN3(n428), .IN4(n427), .QN(n276) );
  NAND2X0 U586 ( .IN1(wb_ack_o), .IN2(wb_we_i), .QN(n445) );
  OA21X1 U587 ( .IN1(wb_adr_i[2]), .IN2(n445), .IN3(n504), .Q(n437) );
  AO21X1 U588 ( .IN1(n504), .IN2(n431), .IN3(n437), .Q(n433) );
  INVX0 U589 ( .INP(n445), .ZN(n493) );
  NOR2X0 U590 ( .IN1(n447), .IN2(n433), .QN(n432) );
  AO22X1 U591 ( .IN1(ctr[7]), .IN2(n433), .IN3(wb_dat_i[7]), .IN4(n432), .Q(
        n275) );
  AO22X1 U592 ( .IN1(ctr[6]), .IN2(n433), .IN3(n432), .IN4(wb_dat_i[6]), .Q(
        n274) );
  AO22X1 U593 ( .IN1(ctr[5]), .IN2(n433), .IN3(n432), .IN4(wb_dat_i[5]), .Q(
        n273) );
  AO22X1 U594 ( .IN1(wb_dat_i[4]), .IN2(n432), .IN3(ctr[4]), .IN4(n433), .Q(
        n272) );
  AO22X1 U595 ( .IN1(wb_dat_i[3]), .IN2(n432), .IN3(ctr[3]), .IN4(n433), .Q(
        n271) );
  AO22X1 U596 ( .IN1(wb_dat_i[2]), .IN2(n432), .IN3(ctr[2]), .IN4(n433), .Q(
        n270) );
  AO22X1 U597 ( .IN1(ctr[1]), .IN2(n433), .IN3(n432), .IN4(wb_dat_i[1]), .Q(
        n269) );
  AO22X1 U598 ( .IN1(ctr[0]), .IN2(n433), .IN3(n432), .IN4(wb_dat_i[0]), .Q(
        n268) );
  NAND2X0 U599 ( .IN1(wb_adr_i[1]), .IN2(wb_adr_i[0]), .QN(n434) );
  AO21X1 U600 ( .IN1(n504), .IN2(n434), .IN3(n437), .Q(n436) );
  NOR2X0 U601 ( .IN1(n447), .IN2(n436), .QN(n435) );
  AO22X1 U602 ( .IN1(txr[7]), .IN2(n436), .IN3(wb_dat_i[7]), .IN4(n435), .Q(
        n267) );
  AO22X1 U603 ( .IN1(txr[6]), .IN2(n436), .IN3(wb_dat_i[6]), .IN4(n435), .Q(
        n266) );
  AO22X1 U604 ( .IN1(txr[5]), .IN2(n436), .IN3(wb_dat_i[5]), .IN4(n435), .Q(
        n265) );
  AO22X1 U605 ( .IN1(wb_dat_i[4]), .IN2(n435), .IN3(txr[4]), .IN4(n436), .Q(
        n264) );
  AO22X1 U606 ( .IN1(wb_dat_i[3]), .IN2(n435), .IN3(txr[3]), .IN4(n436), .Q(
        n263) );
  AO22X1 U607 ( .IN1(wb_dat_i[2]), .IN2(n435), .IN3(txr[2]), .IN4(n436), .Q(
        n262) );
  AO22X1 U608 ( .IN1(txr[1]), .IN2(n436), .IN3(wb_dat_i[1]), .IN4(n435), .Q(
        n261) );
  AO22X1 U609 ( .IN1(txr[0]), .IN2(n436), .IN3(wb_dat_i[0]), .IN4(n435), .Q(
        n260) );
  INVX0 U610 ( .INP(n437), .ZN(n441) );
  NAND2X1 U611 ( .IN1(n441), .IN2(n438), .QN(n439) );
  INVX0 U612 ( .INP(n439), .ZN(n440) );
  AO221X1 U613 ( .IN1(n440), .IN2(wb_dat_i[7]), .IN3(n439), .IN4(prer[15]), 
        .IN5(wb_rst_i), .Q(n259) );
  AO221X1 U614 ( .IN1(n440), .IN2(wb_dat_i[6]), .IN3(n439), .IN4(prer[14]), 
        .IN5(wb_rst_i), .Q(n258) );
  AO221X1 U615 ( .IN1(n440), .IN2(wb_dat_i[5]), .IN3(n439), .IN4(prer[13]), 
        .IN5(wb_rst_i), .Q(n257) );
  AO221X1 U616 ( .IN1(n440), .IN2(wb_dat_i[4]), .IN3(n439), .IN4(prer[12]), 
        .IN5(wb_rst_i), .Q(n256) );
  AO221X1 U617 ( .IN1(n440), .IN2(wb_dat_i[3]), .IN3(n439), .IN4(prer[11]), 
        .IN5(wb_rst_i), .Q(n255) );
  AO221X1 U618 ( .IN1(n440), .IN2(wb_dat_i[2]), .IN3(n439), .IN4(prer[10]), 
        .IN5(wb_rst_i), .Q(n254) );
  AO221X1 U619 ( .IN1(n440), .IN2(wb_dat_i[1]), .IN3(n439), .IN4(prer[9]), 
        .IN5(wb_rst_i), .Q(n253) );
  AO221X1 U620 ( .IN1(n440), .IN2(wb_dat_i[0]), .IN3(n439), .IN4(prer[8]), 
        .IN5(wb_rst_i), .Q(n252) );
  NAND2X1 U621 ( .IN1(n441), .IN2(n444), .QN(n442) );
  INVX0 U622 ( .INP(n442), .ZN(n443) );
  AO221X1 U623 ( .IN1(n443), .IN2(wb_dat_i[7]), .IN3(n442), .IN4(prer[7]), 
        .IN5(wb_rst_i), .Q(n251) );
  AO221X1 U624 ( .IN1(n443), .IN2(wb_dat_i[6]), .IN3(n442), .IN4(prer[6]), 
        .IN5(wb_rst_i), .Q(n250) );
  AO221X1 U625 ( .IN1(n443), .IN2(wb_dat_i[5]), .IN3(n442), .IN4(prer[5]), 
        .IN5(wb_rst_i), .Q(n249) );
  AO221X1 U626 ( .IN1(n443), .IN2(wb_dat_i[4]), .IN3(n442), .IN4(prer[4]), 
        .IN5(wb_rst_i), .Q(n248) );
  AO221X1 U627 ( .IN1(n443), .IN2(wb_dat_i[3]), .IN3(n442), .IN4(prer[3]), 
        .IN5(wb_rst_i), .Q(n247) );
  AO221X1 U628 ( .IN1(n443), .IN2(wb_dat_i[2]), .IN3(n442), .IN4(prer[2]), 
        .IN5(wb_rst_i), .Q(n246) );
  AO221X1 U629 ( .IN1(n443), .IN2(wb_dat_i[1]), .IN3(n442), .IN4(prer[1]), 
        .IN5(wb_rst_i), .Q(n245) );
  AO221X1 U630 ( .IN1(n443), .IN2(wb_dat_i[0]), .IN3(n442), .IN4(prer[0]), 
        .IN5(wb_rst_i), .Q(n244) );
  NAND3X0 U631 ( .IN1(ctr[7]), .IN2(wb_adr_i[2]), .IN3(n444), .QN(n446) );
  OA21X1 U632 ( .IN1(n445), .IN2(n446), .IN3(n504), .Q(n491) );
  NOR2X0 U633 ( .IN1(n447), .IN2(n446), .QN(n494) );
  AO22X1 U634 ( .IN1(cr[3]), .IN2(n491), .IN3(wb_dat_i[3]), .IN4(n494), .Q(
        n243) );
  INVX0 U635 ( .INP(n446), .ZN(n448) );
  NOR2X0 U636 ( .IN1(n448), .IN2(n447), .QN(n449) );
  AO22X1 U637 ( .IN1(wb_dat_i[2]), .IN2(n494), .IN3(cr[2]), .IN4(n449), .Q(
        n242) );
  AO22X1 U638 ( .IN1(cr[1]), .IN2(n449), .IN3(wb_dat_i[1]), .IN4(n494), .Q(
        n241) );
  AO22X1 U639 ( .IN1(cr[0]), .IN2(n449), .IN3(wb_dat_i[0]), .IN4(n494), .Q(
        n240) );
  NOR2X0 U640 ( .IN1(byte_controller_core_cmd[1]), .IN2(n470), .QN(n455) );
  NOR2X0 U641 ( .IN1(byte_controller_core_cmd[2]), .IN2(n456), .QN(n451) );
  AO22X1 U642 ( .IN1(byte_controller_core_cmd[0]), .IN2(n451), .IN3(
        byte_controller_bit_controller_c_state[0]), .IN4(n463), .Q(n239) );
  AO22X1 U643 ( .IN1(n458), .IN2(byte_controller_bit_controller_c_state[1]), 
        .IN3(byte_controller_bit_controller_c_state[2]), .IN4(n463), .Q(n237)
         );
  AO22X1 U644 ( .IN1(n458), .IN2(byte_controller_bit_controller_c_state[2]), 
        .IN3(byte_controller_bit_controller_c_state[3]), .IN4(n463), .Q(n236)
         );
  AO22X1 U645 ( .IN1(n458), .IN2(byte_controller_bit_controller_c_state[3]), 
        .IN3(byte_controller_bit_controller_c_state[4]), .IN4(n463), .Q(n235)
         );
  INVX0 U646 ( .INP(n470), .ZN(n453) );
  NOR2X0 U647 ( .IN1(byte_controller_core_cmd[2]), .IN2(
        byte_controller_core_cmd[0]), .QN(n452) );
  AND3X1 U648 ( .IN1(byte_controller_core_cmd[1]), .IN2(n452), .IN3(n549), .Q(
        n505) );
  AO22X1 U649 ( .IN1(byte_controller_bit_controller_c_state[5]), .IN2(n463), 
        .IN3(n453), .IN4(n505), .Q(n234) );
  AO22X1 U650 ( .IN1(n458), .IN2(byte_controller_bit_controller_c_state[5]), 
        .IN3(byte_controller_bit_controller_c_state[6]), .IN4(n463), .Q(n233)
         );
  AO22X1 U651 ( .IN1(n458), .IN2(byte_controller_bit_controller_c_state[6]), 
        .IN3(byte_controller_bit_controller_c_state[7]), .IN4(n463), .Q(n232)
         );
  AO22X1 U652 ( .IN1(n458), .IN2(byte_controller_bit_controller_c_state[7]), 
        .IN3(byte_controller_bit_controller_c_state[8]), .IN4(n463), .Q(n231)
         );
  NOR3X0 U653 ( .IN1(byte_controller_core_cmd[2]), .IN2(
        byte_controller_core_cmd[0]), .IN3(n549), .QN(n454) );
  AO22X1 U654 ( .IN1(byte_controller_bit_controller_c_state[9]), .IN2(n463), 
        .IN3(n455), .IN4(n454), .Q(n230) );
  AO22X1 U655 ( .IN1(n458), .IN2(byte_controller_bit_controller_c_state[9]), 
        .IN3(byte_controller_bit_controller_c_state[10]), .IN4(n463), .Q(n229)
         );
  AO22X1 U656 ( .IN1(n458), .IN2(byte_controller_bit_controller_c_state[10]), 
        .IN3(byte_controller_bit_controller_c_state[11]), .IN4(n463), .Q(n228)
         );
  AO22X1 U657 ( .IN1(n458), .IN2(byte_controller_bit_controller_c_state[11]), 
        .IN3(byte_controller_bit_controller_c_state[12]), .IN4(n463), .Q(n227)
         );
  NOR2X0 U658 ( .IN1(byte_controller_core_cmd[0]), .IN2(n456), .QN(n457) );
  AO22X1 U659 ( .IN1(byte_controller_core_cmd[2]), .IN2(n457), .IN3(
        byte_controller_bit_controller_c_state[13]), .IN4(n463), .Q(n226) );
  AO22X1 U660 ( .IN1(n458), .IN2(byte_controller_bit_controller_c_state[13]), 
        .IN3(byte_controller_bit_controller_c_state[14]), .IN4(n463), .Q(n225)
         );
  AO22X1 U661 ( .IN1(n458), .IN2(byte_controller_bit_controller_c_state[14]), 
        .IN3(byte_controller_bit_controller_c_state[15]), .IN4(n463), .Q(n224)
         );
  AO22X1 U662 ( .IN1(n458), .IN2(byte_controller_bit_controller_c_state[15]), 
        .IN3(byte_controller_bit_controller_c_state[16]), .IN4(n463), .Q(n223)
         );
  AO22X1 U663 ( .IN1(n458), .IN2(byte_controller_bit_controller_c_state[15]), 
        .IN3(n463), .IN4(byte_controller_bit_controller_sda_chk), .Q(n222) );
  NOR2X0 U664 ( .IN1(byte_controller_bit_controller_c_state[8]), .IN2(n477), 
        .QN(n467) );
  NOR4X0 U665 ( .IN1(byte_controller_bit_controller_c_state[0]), .IN2(
        byte_controller_bit_controller_c_state[12]), .IN3(
        byte_controller_bit_controller_c_state[9]), .IN4(n459), .QN(n462) );
  OR4X1 U666 ( .IN1(byte_controller_bit_controller_c_state[15]), .IN2(
        byte_controller_bit_controller_c_state[14]), .IN3(
        byte_controller_bit_controller_c_state[16]), .IN4(
        byte_controller_bit_controller_c_state[13]), .Q(n460) );
  NAND3X0 U667 ( .IN1(n467), .IN2(n462), .IN3(n461), .QN(n465) );
  INVX0 U668 ( .INP(n463), .ZN(n469) );
  MUX21X1 U669 ( .IN1(n465), .IN2(sda_padoen_o), .S(n464), .Q(n221) );
  NAND3X0 U670 ( .IN1(n470), .IN2(n469), .IN3(n468), .QN(n471) );
  MUX21X1 U671 ( .IN1(n472), .IN2(scl_padoen_o), .S(n471), .Q(n220) );
  AO222X1 U672 ( .IN1(n500), .IN2(txr[7]), .IN3(n499), .IN4(rxr[6]), .IN5(n498), .IN6(rxr[7]), .Q(n219) );
  OA21X1 U673 ( .IN1(n542), .IN2(n547), .IN3(irxack), .Q(n475) );
  INVX0 U674 ( .INP(n473), .ZN(n474) );
  AO22X1 U675 ( .IN1(n478), .IN2(n475), .IN3(n474), .IN4(
        byte_controller_core_rxd), .Q(n218) );
  NOR3X0 U676 ( .IN1(n477), .IN2(n476), .IN3(n545), .QN(n501) );
  AO21X1 U677 ( .IN1(n503), .IN2(byte_controller_c_state[0]), .IN3(n501), .Q(
        n217) );
  AO21X1 U678 ( .IN1(n478), .IN2(n483), .IN3(n503), .Q(n481) );
  AO21X1 U679 ( .IN1(byte_controller_c_state[1]), .IN2(n481), .IN3(n479), .Q(
        n216) );
  AO21X1 U680 ( .IN1(byte_controller_c_state[2]), .IN2(n481), .IN3(n480), .Q(
        n215) );
  INVX0 U681 ( .INP(n482), .ZN(n489) );
  NOR2X0 U682 ( .IN1(n489), .IN2(n483), .QN(n485) );
  AO22X1 U683 ( .IN1(byte_controller_c_state[3]), .IN2(n503), .IN3(n485), 
        .IN4(n484), .Q(n214) );
  INVX0 U684 ( .INP(n486), .ZN(n488) );
  OA22X1 U685 ( .IN1(n542), .IN2(n544), .IN3(n488), .IN4(n487), .Q(n490) );
  NOR2X0 U686 ( .IN1(n490), .IN2(n489), .QN(n502) );
  AO21X1 U687 ( .IN1(n503), .IN2(byte_controller_c_state[4]), .IN3(n502), .Q(
        n213) );
  OA21X1 U688 ( .IN1(n493), .IN2(n492), .IN3(n491), .Q(n495) );
  AO22X1 U689 ( .IN1(cr[4]), .IN2(n495), .IN3(wb_dat_i[4]), .IN4(n494), .Q(
        n212) );
  AO22X1 U690 ( .IN1(cr[5]), .IN2(n495), .IN3(wb_dat_i[5]), .IN4(n494), .Q(
        n211) );
  AO22X1 U691 ( .IN1(cr[6]), .IN2(n495), .IN3(wb_dat_i[6]), .IN4(n494), .Q(
        n210) );
  AO22X1 U692 ( .IN1(cr[7]), .IN2(n495), .IN3(wb_dat_i[7]), .IN4(n494), .Q(
        n209) );
  AO221X1 U693 ( .IN1(byte_controller_dcnt[1]), .IN2(n497), .IN3(n554), .IN4(
        n496), .IN5(n500), .Q(n208) );
  AO222X1 U694 ( .IN1(n500), .IN2(txr[0]), .IN3(n499), .IN4(
        byte_controller_core_rxd), .IN5(rxr[0]), .IN6(n498), .Q(n205) );
  AO222X1 U695 ( .IN1(n500), .IN2(txr[6]), .IN3(n499), .IN4(rxr[5]), .IN5(n498), .IN6(rxr[6]), .Q(n204) );
  AO222X1 U696 ( .IN1(n500), .IN2(txr[5]), .IN3(n499), .IN4(rxr[4]), .IN5(
        rxr[5]), .IN6(n498), .Q(n203) );
  AO222X1 U697 ( .IN1(n500), .IN2(txr[4]), .IN3(n499), .IN4(rxr[3]), .IN5(n498), .IN6(rxr[4]), .Q(n202) );
  AO222X1 U698 ( .IN1(n500), .IN2(txr[3]), .IN3(n499), .IN4(rxr[2]), .IN5(n498), .IN6(rxr[3]), .Q(n201) );
  AO222X1 U699 ( .IN1(n500), .IN2(txr[2]), .IN3(n499), .IN4(rxr[1]), .IN5(n498), .IN6(rxr[2]), .Q(n200) );
  AO222X1 U700 ( .IN1(n500), .IN2(txr[1]), .IN3(n499), .IN4(rxr[0]), .IN5(n498), .IN6(rxr[1]), .Q(n199) );
  AO21X1 U701 ( .IN1(byte_controller_core_cmd[0]), .IN2(n503), .IN3(n501), .Q(
        n198) );
  AO21X1 U702 ( .IN1(byte_controller_core_cmd[1]), .IN2(n503), .IN3(n502), .Q(
        n197) );
  OA221X1 U703 ( .IN1(byte_controller_bit_controller_clk_en), .IN2(
        byte_controller_bit_controller_cmd_stop), .IN3(n543), .IN4(n505), 
        .IN5(n504), .Q(n194) );
  OA21X1 U704 ( .IN1(byte_controller_bit_controller_slave_wait), .IN2(n534), 
        .IN3(n513), .Q(n506) );
  MUX21X1 U705 ( .IN1(n507), .IN2(n506), .S(
        byte_controller_bit_controller_cnt[14]), .Q(n508) );
  AO21X1 U706 ( .IN1(prer[14]), .IN2(n557), .IN3(n508), .Q(n193) );
  AND2X1 U707 ( .IN1(byte_controller_bit_controller_slave_wait), .IN2(n513), 
        .Q(n509) );
  MUX21X1 U708 ( .IN1(n510), .IN2(n509), .S(
        byte_controller_bit_controller_cnt[0]), .Q(n511) );
  AO21X1 U709 ( .IN1(prer[0]), .IN2(n557), .IN3(n511), .Q(n192) );
  NOR3X0 U710 ( .IN1(byte_controller_bit_controller_cnt[1]), .IN2(
        byte_controller_bit_controller_cnt[0]), .IN3(n512), .QN(n517) );
  OA21X1 U711 ( .IN1(byte_controller_bit_controller_cnt[0]), .IN2(
        byte_controller_bit_controller_slave_wait), .IN3(n513), .Q(n514) );
  AO22X1 U712 ( .IN1(byte_controller_bit_controller_cnt[1]), .IN2(n514), .IN3(
        prer[1]), .IN4(n557), .Q(n515) );
  OR2X1 U713 ( .IN1(n517), .IN2(n515), .Q(n191) );
  MUX21X1 U714 ( .IN1(n517), .IN2(n516), .S(
        byte_controller_bit_controller_cnt[2]), .Q(n518) );
  AO21X1 U715 ( .IN1(prer[2]), .IN2(n557), .IN3(n518), .Q(n190) );
  MUX21X1 U716 ( .IN1(n520), .IN2(n519), .S(
        byte_controller_bit_controller_cnt[4]), .Q(n521) );
  AO21X1 U717 ( .IN1(prer[4]), .IN2(n557), .IN3(n521), .Q(n188) );
  MUX21X1 U718 ( .IN1(n523), .IN2(n522), .S(
        byte_controller_bit_controller_cnt[6]), .Q(n524) );
  AO21X1 U719 ( .IN1(prer[6]), .IN2(n557), .IN3(n524), .Q(n186) );
  MUX21X1 U720 ( .IN1(n526), .IN2(n525), .S(
        byte_controller_bit_controller_cnt[8]), .Q(n527) );
  AO21X1 U721 ( .IN1(prer[8]), .IN2(n557), .IN3(n527), .Q(n184) );
  MUX21X1 U722 ( .IN1(n529), .IN2(n528), .S(
        byte_controller_bit_controller_cnt[10]), .Q(n530) );
  AO21X1 U723 ( .IN1(prer[10]), .IN2(n557), .IN3(n530), .Q(n182) );
  MUX21X1 U724 ( .IN1(n532), .IN2(n531), .S(
        byte_controller_bit_controller_cnt[12]), .Q(n533) );
  AO21X1 U725 ( .IN1(prer[12]), .IN2(n557), .IN3(n533), .Q(n180) );
  NOR3X0 U726 ( .IN1(byte_controller_bit_controller_cnt[14]), .IN2(
        byte_controller_bit_controller_slave_wait), .IN3(n534), .QN(n535) );
  NOR2X0 U727 ( .IN1(n535), .IN2(n557), .QN(n536) );
  AO22X1 U728 ( .IN1(prer[15]), .IN2(n557), .IN3(
        byte_controller_bit_controller_cnt[15]), .IN4(n536), .Q(n178) );
  AO221X1 U729 ( .IN1(n538), .IN2(byte_controller_bit_controller_cSDA[1]), 
        .IN3(n537), .IN4(byte_controller_bit_controller_fSDA[0]), .IN5(
        wb_rst_i), .Q(n177) );
  AO221X1 U730 ( .IN1(n538), .IN2(byte_controller_bit_controller_fSDA[0]), 
        .IN3(n537), .IN4(byte_controller_bit_controller_fSDA[1]), .IN5(
        wb_rst_i), .Q(n176) );
  AO221X1 U731 ( .IN1(n538), .IN2(byte_controller_bit_controller_fSDA[1]), 
        .IN3(n537), .IN4(byte_controller_bit_controller_fSDA[2]), .IN5(
        wb_rst_i), .Q(n175) );
  AO221X1 U732 ( .IN1(n538), .IN2(byte_controller_bit_controller_cSCL[1]), 
        .IN3(n537), .IN4(byte_controller_bit_controller_fSCL[0]), .IN5(
        wb_rst_i), .Q(n174) );
  AO221X1 U733 ( .IN1(n538), .IN2(byte_controller_bit_controller_fSCL[0]), 
        .IN3(n537), .IN4(byte_controller_bit_controller_fSCL[1]), .IN5(
        wb_rst_i), .Q(n173) );
  AO221X1 U734 ( .IN1(n538), .IN2(byte_controller_bit_controller_fSCL[1]), 
        .IN3(n537), .IN4(byte_controller_bit_controller_fSCL[2]), .IN5(
        wb_rst_i), .Q(n172) );
  NOR2X0 U735 ( .IN1(byte_controller_bit_controller_dSCL), .IN2(n541), .QN(
        n539) );
  MUX21X1 U736 ( .IN1(byte_controller_core_rxd), .IN2(
        byte_controller_bit_controller_sSDA), .S(n539), .Q(n171) );
endmodule

