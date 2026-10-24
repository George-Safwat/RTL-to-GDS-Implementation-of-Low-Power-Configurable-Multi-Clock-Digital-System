/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Wed Oct  7 05:59:03 2026
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_test_0 ( RST, CLK, SYNC_RST, test_si, test_se );
  input RST, CLK, test_si, test_se;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  SDFFRQX1M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .SI(\sync_reg[0] ), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
  SDFFRQX1M \sync_reg_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(\sync_reg[0] ) );
endmodule


module RST_SYNC_NUM_STAGES2_test_1 ( RST, CLK, SYNC_RST, test_si, test_se );
  input RST, CLK, test_si, test_se;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  SDFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .SI(\sync_reg[0] ), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
  SDFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(\sync_reg[0] ) );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8_test_1 ( CLK, RST, unsync_bus, 
        bus_enable, sync_bus, enable_pulse_d, test_si, test_so, test_se );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable, test_si, test_se;
  output enable_pulse_d, test_so;
  wire   enable_flop, n1, n4, n6, n8, n10, n12, n14, n16, n18, n22, n23, n24,
         n25;
  wire   [1:0] sync_reg;
  assign test_so = sync_reg[1];

  SDFFRQX2M enable_flop_reg ( .D(sync_reg[1]), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(n23), .Q(enable_flop) );
  SDFFRQX2M \sync_reg_reg[1]  ( .D(sync_reg[0]), .SI(sync_reg[0]), .SE(test_se), .CK(CLK), .RN(n23), .Q(sync_reg[1]) );
  SDFFRQX4M \sync_bus_reg[5]  ( .D(n14), .SI(sync_bus[4]), .SE(test_se), .CK(
        CLK), .RN(n23), .Q(sync_bus[5]) );
  SDFFRQX4M \sync_bus_reg[4]  ( .D(n12), .SI(sync_bus[3]), .SE(test_se), .CK(
        CLK), .RN(n23), .Q(sync_bus[4]) );
  SDFFRQX2M \sync_bus_reg[3]  ( .D(n10), .SI(sync_bus[2]), .SE(test_se), .CK(
        CLK), .RN(n23), .Q(sync_bus[3]) );
  SDFFRQX2M \sync_bus_reg[0]  ( .D(n4), .SI(enable_pulse_d), .SE(test_se), 
        .CK(CLK), .RN(n23), .Q(sync_bus[0]) );
  SDFFRQX2M \sync_bus_reg[7]  ( .D(n18), .SI(sync_bus[6]), .SE(test_se), .CK(
        CLK), .RN(n23), .Q(sync_bus[7]) );
  SDFFRQX4M \sync_bus_reg[6]  ( .D(n16), .SI(sync_bus[5]), .SE(test_se), .CK(
        CLK), .RN(n23), .Q(sync_bus[6]) );
  SDFFRQX4M \sync_bus_reg[2]  ( .D(n8), .SI(sync_bus[1]), .SE(test_se), .CK(
        CLK), .RN(n23), .Q(sync_bus[2]) );
  SDFFRQX4M \sync_bus_reg[1]  ( .D(n6), .SI(sync_bus[0]), .SE(test_se), .CK(
        CLK), .RN(n23), .Q(sync_bus[1]) );
  SDFFRQX2M \sync_reg_reg[0]  ( .D(bus_enable), .SI(sync_bus[7]), .SE(test_se), 
        .CK(CLK), .RN(n23), .Q(sync_reg[0]) );
  SDFFRQX4M enable_pulse_d_reg ( .D(n25), .SI(enable_flop), .SE(test_se), .CK(
        CLK), .RN(n23), .Q(enable_pulse_d) );
  INVX4M U3 ( .A(n1), .Y(n25) );
  BUFX4M U4 ( .A(n1), .Y(n22) );
  INVX6M U5 ( .A(n24), .Y(n23) );
  INVX2M U6 ( .A(RST), .Y(n24) );
  NAND2BX2M U7 ( .AN(enable_flop), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U8 ( .A0(unsync_bus[4]), .A1(n25), .B0(sync_bus[4]), .B1(n22), .Y(
        n12) );
  AO22X1M U9 ( .A0(unsync_bus[1]), .A1(n25), .B0(sync_bus[1]), .B1(n22), .Y(n6) );
  AO22X1M U10 ( .A0(unsync_bus[2]), .A1(n25), .B0(sync_bus[2]), .B1(n22), .Y(
        n8) );
  AO22X1M U11 ( .A0(unsync_bus[5]), .A1(n25), .B0(sync_bus[5]), .B1(n22), .Y(
        n14) );
  AO22X1M U12 ( .A0(unsync_bus[6]), .A1(n25), .B0(sync_bus[6]), .B1(n22), .Y(
        n16) );
  AO22X1M U25 ( .A0(unsync_bus[7]), .A1(n25), .B0(sync_bus[7]), .B1(n22), .Y(
        n18) );
  AO22X1M U26 ( .A0(unsync_bus[0]), .A1(n25), .B0(sync_bus[0]), .B1(n22), .Y(
        n4) );
  AO22X1M U27 ( .A0(unsync_bus[3]), .A1(n25), .B0(sync_bus[3]), .B1(n22), .Y(
        n10) );
endmodule


module fifo_mem_A_SIZE3_D_SIZE8_F_DEPTH8_P_SIZE4_test_1 ( w_clk, w_rstn, 
        w_full, w_inc, w_addr, r_addr, w_data, r_data, test_si2, test_si1, 
        test_so2, test_so1, test_se );
  input [2:0] w_addr;
  input [2:0] r_addr;
  input [7:0] w_data;
  output [7:0] r_data;
  input w_clk, w_rstn, w_full, w_inc, test_si2, test_si1, test_se;
  output test_so2, test_so1;
  wire   N9, N10, N11, \FIFO_MEM[7][7] , \FIFO_MEM[7][6] , \FIFO_MEM[7][5] ,
         \FIFO_MEM[7][4] , \FIFO_MEM[7][3] , \FIFO_MEM[7][2] ,
         \FIFO_MEM[7][1] , \FIFO_MEM[7][0] , \FIFO_MEM[6][7] ,
         \FIFO_MEM[6][6] , \FIFO_MEM[6][5] , \FIFO_MEM[6][4] ,
         \FIFO_MEM[6][3] , \FIFO_MEM[6][2] , \FIFO_MEM[6][1] ,
         \FIFO_MEM[6][0] , \FIFO_MEM[5][7] , \FIFO_MEM[5][6] ,
         \FIFO_MEM[5][5] , \FIFO_MEM[5][4] , \FIFO_MEM[5][3] ,
         \FIFO_MEM[5][2] , \FIFO_MEM[5][1] , \FIFO_MEM[5][0] ,
         \FIFO_MEM[4][7] , \FIFO_MEM[4][6] , \FIFO_MEM[4][5] ,
         \FIFO_MEM[4][4] , \FIFO_MEM[4][3] , \FIFO_MEM[4][2] ,
         \FIFO_MEM[4][1] , \FIFO_MEM[4][0] , \FIFO_MEM[3][7] ,
         \FIFO_MEM[3][6] , \FIFO_MEM[3][5] , \FIFO_MEM[3][4] ,
         \FIFO_MEM[3][3] , \FIFO_MEM[3][2] , \FIFO_MEM[3][1] ,
         \FIFO_MEM[3][0] , \FIFO_MEM[2][7] , \FIFO_MEM[2][6] ,
         \FIFO_MEM[2][5] , \FIFO_MEM[2][4] , \FIFO_MEM[2][3] ,
         \FIFO_MEM[2][2] , \FIFO_MEM[2][1] , \FIFO_MEM[2][0] ,
         \FIFO_MEM[1][7] , \FIFO_MEM[1][6] , \FIFO_MEM[1][5] ,
         \FIFO_MEM[1][4] , \FIFO_MEM[1][3] , \FIFO_MEM[1][2] ,
         \FIFO_MEM[1][1] , \FIFO_MEM[1][0] , \FIFO_MEM[0][7] ,
         \FIFO_MEM[0][6] , \FIFO_MEM[0][5] , \FIFO_MEM[0][4] ,
         \FIFO_MEM[0][3] , \FIFO_MEM[0][2] , \FIFO_MEM[0][1] ,
         \FIFO_MEM[0][0] , n76, n79, n80, n82, n83, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n77, n78, n81, n84, n85, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280;
  assign N9 = r_addr[0];
  assign N10 = r_addr[1];
  assign N11 = r_addr[2];
  assign test_so2 = \FIFO_MEM[7][7] ;
  assign test_so1 = \FIFO_MEM[2][4] ;

  SDFFRQX2M \FIFO_MEM_reg[5][7]  ( .D(n133), .SI(\FIFO_MEM[5][6] ), .SE(n280), 
        .CK(w_clk), .RN(n202), .Q(\FIFO_MEM[5][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][6]  ( .D(n132), .SI(\FIFO_MEM[5][5] ), .SE(n280), 
        .CK(w_clk), .RN(n202), .Q(\FIFO_MEM[5][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][5]  ( .D(n131), .SI(\FIFO_MEM[5][4] ), .SE(n279), 
        .CK(w_clk), .RN(n202), .Q(\FIFO_MEM[5][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][4]  ( .D(n130), .SI(\FIFO_MEM[5][3] ), .SE(n279), 
        .CK(w_clk), .RN(n202), .Q(\FIFO_MEM[5][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][3]  ( .D(n129), .SI(\FIFO_MEM[5][2] ), .SE(n278), 
        .CK(w_clk), .RN(n202), .Q(\FIFO_MEM[5][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][2]  ( .D(n128), .SI(\FIFO_MEM[5][1] ), .SE(n278), 
        .CK(w_clk), .RN(n202), .Q(\FIFO_MEM[5][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][1]  ( .D(n127), .SI(\FIFO_MEM[5][0] ), .SE(n277), 
        .CK(w_clk), .RN(n202), .Q(\FIFO_MEM[5][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][0]  ( .D(n126), .SI(\FIFO_MEM[4][7] ), .SE(n277), 
        .CK(w_clk), .RN(n202), .Q(\FIFO_MEM[5][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][7]  ( .D(n125), .SI(\FIFO_MEM[4][6] ), .SE(n276), 
        .CK(w_clk), .RN(n203), .Q(\FIFO_MEM[4][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][6]  ( .D(n124), .SI(\FIFO_MEM[4][5] ), .SE(n276), 
        .CK(w_clk), .RN(n203), .Q(\FIFO_MEM[4][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][5]  ( .D(n123), .SI(\FIFO_MEM[4][4] ), .SE(n275), 
        .CK(w_clk), .RN(n203), .Q(\FIFO_MEM[4][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][4]  ( .D(n122), .SI(\FIFO_MEM[4][3] ), .SE(n275), 
        .CK(w_clk), .RN(n203), .Q(\FIFO_MEM[4][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][3]  ( .D(n121), .SI(\FIFO_MEM[4][2] ), .SE(n274), 
        .CK(w_clk), .RN(n203), .Q(\FIFO_MEM[4][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][2]  ( .D(n120), .SI(\FIFO_MEM[4][1] ), .SE(n274), 
        .CK(w_clk), .RN(n203), .Q(\FIFO_MEM[4][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][1]  ( .D(n119), .SI(\FIFO_MEM[4][0] ), .SE(n273), 
        .CK(w_clk), .RN(n203), .Q(\FIFO_MEM[4][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][0]  ( .D(n118), .SI(\FIFO_MEM[3][7] ), .SE(n273), 
        .CK(w_clk), .RN(n203), .Q(\FIFO_MEM[4][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][7]  ( .D(n149), .SI(\FIFO_MEM[7][6] ), .SE(n272), 
        .CK(w_clk), .RN(n201), .Q(\FIFO_MEM[7][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][6]  ( .D(n148), .SI(\FIFO_MEM[7][5] ), .SE(n272), 
        .CK(w_clk), .RN(n201), .Q(\FIFO_MEM[7][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][5]  ( .D(n147), .SI(\FIFO_MEM[7][4] ), .SE(n271), 
        .CK(w_clk), .RN(n201), .Q(\FIFO_MEM[7][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][4]  ( .D(n146), .SI(\FIFO_MEM[7][3] ), .SE(n271), 
        .CK(w_clk), .RN(n201), .Q(\FIFO_MEM[7][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][3]  ( .D(n145), .SI(\FIFO_MEM[7][2] ), .SE(n270), 
        .CK(w_clk), .RN(n201), .Q(\FIFO_MEM[7][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][2]  ( .D(n144), .SI(\FIFO_MEM[7][1] ), .SE(n270), 
        .CK(w_clk), .RN(n201), .Q(\FIFO_MEM[7][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][1]  ( .D(n143), .SI(\FIFO_MEM[7][0] ), .SE(n269), 
        .CK(w_clk), .RN(n201), .Q(\FIFO_MEM[7][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][0]  ( .D(n142), .SI(\FIFO_MEM[6][7] ), .SE(n269), 
        .CK(w_clk), .RN(n201), .Q(\FIFO_MEM[7][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][7]  ( .D(n141), .SI(\FIFO_MEM[6][6] ), .SE(n268), 
        .CK(w_clk), .RN(n201), .Q(\FIFO_MEM[6][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][6]  ( .D(n140), .SI(\FIFO_MEM[6][5] ), .SE(n268), 
        .CK(w_clk), .RN(n201), .Q(\FIFO_MEM[6][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][5]  ( .D(n139), .SI(\FIFO_MEM[6][4] ), .SE(n267), 
        .CK(w_clk), .RN(n201), .Q(\FIFO_MEM[6][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][4]  ( .D(n138), .SI(\FIFO_MEM[6][3] ), .SE(n267), 
        .CK(w_clk), .RN(n201), .Q(\FIFO_MEM[6][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][3]  ( .D(n137), .SI(\FIFO_MEM[6][2] ), .SE(n266), 
        .CK(w_clk), .RN(n202), .Q(\FIFO_MEM[6][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][2]  ( .D(n136), .SI(\FIFO_MEM[6][1] ), .SE(n266), 
        .CK(w_clk), .RN(n202), .Q(\FIFO_MEM[6][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][1]  ( .D(n135), .SI(\FIFO_MEM[6][0] ), .SE(n265), 
        .CK(w_clk), .RN(n202), .Q(\FIFO_MEM[6][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][0]  ( .D(n134), .SI(\FIFO_MEM[5][7] ), .SE(n265), 
        .CK(w_clk), .RN(n202), .Q(\FIFO_MEM[6][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][7]  ( .D(n101), .SI(\FIFO_MEM[1][6] ), .SE(n264), 
        .CK(w_clk), .RN(n205), .Q(\FIFO_MEM[1][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][6]  ( .D(n100), .SI(\FIFO_MEM[1][5] ), .SE(n264), 
        .CK(w_clk), .RN(n205), .Q(\FIFO_MEM[1][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][5]  ( .D(n99), .SI(\FIFO_MEM[1][4] ), .SE(n263), 
        .CK(w_clk), .RN(n205), .Q(\FIFO_MEM[1][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][4]  ( .D(n98), .SI(\FIFO_MEM[1][3] ), .SE(n263), 
        .CK(w_clk), .RN(n205), .Q(\FIFO_MEM[1][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][3]  ( .D(n97), .SI(\FIFO_MEM[1][2] ), .SE(n262), 
        .CK(w_clk), .RN(n205), .Q(\FIFO_MEM[1][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][2]  ( .D(n96), .SI(\FIFO_MEM[1][1] ), .SE(n262), 
        .CK(w_clk), .RN(n205), .Q(\FIFO_MEM[1][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][1]  ( .D(n95), .SI(\FIFO_MEM[1][0] ), .SE(n261), 
        .CK(w_clk), .RN(n205), .Q(\FIFO_MEM[1][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][0]  ( .D(n94), .SI(\FIFO_MEM[0][7] ), .SE(n261), 
        .CK(w_clk), .RN(n205), .Q(\FIFO_MEM[1][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][7]  ( .D(n93), .SI(\FIFO_MEM[0][6] ), .SE(n260), 
        .CK(w_clk), .RN(n205), .Q(\FIFO_MEM[0][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][6]  ( .D(n92), .SI(\FIFO_MEM[0][5] ), .SE(n260), 
        .CK(w_clk), .RN(n205), .Q(\FIFO_MEM[0][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][5]  ( .D(n91), .SI(\FIFO_MEM[0][4] ), .SE(n259), 
        .CK(w_clk), .RN(n205), .Q(\FIFO_MEM[0][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][4]  ( .D(n90), .SI(\FIFO_MEM[0][3] ), .SE(n259), 
        .CK(w_clk), .RN(n205), .Q(\FIFO_MEM[0][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][3]  ( .D(n89), .SI(\FIFO_MEM[0][2] ), .SE(n258), 
        .CK(w_clk), .RN(n206), .Q(\FIFO_MEM[0][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][2]  ( .D(n88), .SI(\FIFO_MEM[0][1] ), .SE(n258), 
        .CK(w_clk), .RN(n206), .Q(\FIFO_MEM[0][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][1]  ( .D(n87), .SI(\FIFO_MEM[0][0] ), .SE(n257), 
        .CK(w_clk), .RN(n206), .Q(\FIFO_MEM[0][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][0]  ( .D(n86), .SI(test_si1), .SE(n257), .CK(
        w_clk), .RN(n206), .Q(\FIFO_MEM[0][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][7]  ( .D(n117), .SI(\FIFO_MEM[3][6] ), .SE(n256), 
        .CK(w_clk), .RN(n203), .Q(\FIFO_MEM[3][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][6]  ( .D(n116), .SI(\FIFO_MEM[3][5] ), .SE(n256), 
        .CK(w_clk), .RN(n203), .Q(\FIFO_MEM[3][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][5]  ( .D(n115), .SI(\FIFO_MEM[3][4] ), .SE(n255), 
        .CK(w_clk), .RN(n203), .Q(\FIFO_MEM[3][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][4]  ( .D(n114), .SI(\FIFO_MEM[3][3] ), .SE(n255), 
        .CK(w_clk), .RN(n203), .Q(\FIFO_MEM[3][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][3]  ( .D(n113), .SI(\FIFO_MEM[3][2] ), .SE(n254), 
        .CK(w_clk), .RN(n204), .Q(\FIFO_MEM[3][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][2]  ( .D(n112), .SI(\FIFO_MEM[3][1] ), .SE(n254), 
        .CK(w_clk), .RN(n204), .Q(\FIFO_MEM[3][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][1]  ( .D(n111), .SI(\FIFO_MEM[3][0] ), .SE(n253), 
        .CK(w_clk), .RN(n204), .Q(\FIFO_MEM[3][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][0]  ( .D(n110), .SI(\FIFO_MEM[2][7] ), .SE(n253), 
        .CK(w_clk), .RN(n204), .Q(\FIFO_MEM[3][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][7]  ( .D(n109), .SI(\FIFO_MEM[2][6] ), .SE(n252), 
        .CK(w_clk), .RN(n204), .Q(\FIFO_MEM[2][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][6]  ( .D(n108), .SI(\FIFO_MEM[2][5] ), .SE(n252), 
        .CK(w_clk), .RN(n204), .Q(\FIFO_MEM[2][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][5]  ( .D(n107), .SI(test_si2), .SE(n251), .CK(
        w_clk), .RN(n204), .Q(\FIFO_MEM[2][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][4]  ( .D(n106), .SI(\FIFO_MEM[2][3] ), .SE(n251), 
        .CK(w_clk), .RN(n204), .Q(\FIFO_MEM[2][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][3]  ( .D(n105), .SI(\FIFO_MEM[2][2] ), .SE(n250), 
        .CK(w_clk), .RN(n204), .Q(\FIFO_MEM[2][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][2]  ( .D(n104), .SI(\FIFO_MEM[2][1] ), .SE(n250), 
        .CK(w_clk), .RN(n204), .Q(\FIFO_MEM[2][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][1]  ( .D(n103), .SI(\FIFO_MEM[2][0] ), .SE(n249), 
        .CK(w_clk), .RN(n204), .Q(\FIFO_MEM[2][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][0]  ( .D(n102), .SI(\FIFO_MEM[1][7] ), .SE(n249), 
        .CK(w_clk), .RN(n204), .Q(\FIFO_MEM[2][0] ) );
  AOI221X2M U66 ( .A0(\FIFO_MEM[4][0] ), .A1(n181), .B0(\FIFO_MEM[6][0] ), 
        .B1(n182), .C0(n72), .Y(n73) );
  AOI221X2M U67 ( .A0(\FIFO_MEM[5][0] ), .A1(n181), .B0(\FIFO_MEM[7][0] ), 
        .B1(n182), .C0(n71), .Y(n74) );
  AOI221X2M U68 ( .A0(\FIFO_MEM[4][6] ), .A1(n180), .B0(\FIFO_MEM[6][6] ), 
        .B1(n182), .C0(n165), .Y(n166) );
  AOI221X2M U69 ( .A0(\FIFO_MEM[5][6] ), .A1(n180), .B0(\FIFO_MEM[7][6] ), 
        .B1(n182), .C0(n164), .Y(n167) );
  AOI221X2M U70 ( .A0(\FIFO_MEM[4][5] ), .A1(n180), .B0(\FIFO_MEM[6][5] ), 
        .B1(n182), .C0(n161), .Y(n162) );
  AOI221X2M U71 ( .A0(\FIFO_MEM[5][5] ), .A1(n180), .B0(\FIFO_MEM[7][5] ), 
        .B1(n182), .C0(n160), .Y(n163) );
  AOI221X2M U72 ( .A0(\FIFO_MEM[4][4] ), .A1(n180), .B0(\FIFO_MEM[6][4] ), 
        .B1(n182), .C0(n157), .Y(n158) );
  AOI221X2M U73 ( .A0(\FIFO_MEM[5][4] ), .A1(n180), .B0(\FIFO_MEM[7][4] ), 
        .B1(n182), .C0(n156), .Y(n159) );
  AOI221X2M U74 ( .A0(\FIFO_MEM[4][3] ), .A1(n181), .B0(\FIFO_MEM[6][3] ), 
        .B1(n182), .C0(n153), .Y(n154) );
  AOI221X2M U75 ( .A0(\FIFO_MEM[5][3] ), .A1(n181), .B0(\FIFO_MEM[7][3] ), 
        .B1(n182), .C0(n152), .Y(n155) );
  AOI221X2M U76 ( .A0(\FIFO_MEM[4][2] ), .A1(n181), .B0(\FIFO_MEM[6][2] ), 
        .B1(n182), .C0(n85), .Y(n150) );
  AOI221X2M U77 ( .A0(\FIFO_MEM[5][2] ), .A1(n181), .B0(\FIFO_MEM[7][2] ), 
        .B1(n182), .C0(n84), .Y(n151) );
  AOI221X2M U78 ( .A0(\FIFO_MEM[4][1] ), .A1(n181), .B0(\FIFO_MEM[6][1] ), 
        .B1(n182), .C0(n77), .Y(n78) );
  AOI221X2M U79 ( .A0(\FIFO_MEM[5][1] ), .A1(n181), .B0(\FIFO_MEM[7][1] ), 
        .B1(n182), .C0(n75), .Y(n81) );
  AOI221X2M U80 ( .A0(\FIFO_MEM[4][7] ), .A1(n180), .B0(\FIFO_MEM[6][7] ), 
        .B1(n182), .C0(n171), .Y(n174) );
  AOI221X2M U81 ( .A0(\FIFO_MEM[5][7] ), .A1(n180), .B0(\FIFO_MEM[7][7] ), 
        .B1(n182), .C0(n168), .Y(n175) );
  NOR2BX4M U82 ( .AN(n80), .B(w_addr[2]), .Y(n76) );
  AND2X2M U83 ( .A(w_addr[2]), .B(n80), .Y(n82) );
  NOR2X2M U84 ( .A(N10), .B(N11), .Y(n169) );
  NOR2X2M U85 ( .A(n177), .B(N11), .Y(n170) );
  NOR2X2M U86 ( .A(n176), .B(N10), .Y(n173) );
  INVX2M U87 ( .A(w_addr[1]), .Y(n210) );
  INVX2M U88 ( .A(w_addr[0]), .Y(n209) );
  INVX4M U89 ( .A(w_data[0]), .Y(n218) );
  INVX4M U90 ( .A(w_data[1]), .Y(n217) );
  INVX4M U91 ( .A(w_data[2]), .Y(n216) );
  INVX4M U92 ( .A(w_data[3]), .Y(n215) );
  INVX4M U93 ( .A(w_data[4]), .Y(n214) );
  INVX4M U94 ( .A(w_data[5]), .Y(n213) );
  INVX4M U95 ( .A(w_data[6]), .Y(n212) );
  INVX4M U96 ( .A(w_data[7]), .Y(n211) );
  BUFX6M U97 ( .A(n208), .Y(n205) );
  BUFX6M U98 ( .A(n207), .Y(n204) );
  BUFX6M U99 ( .A(n207), .Y(n203) );
  BUFX6M U100 ( .A(n208), .Y(n202) );
  BUFX6M U101 ( .A(w_rstn), .Y(n201) );
  BUFX2M U102 ( .A(n207), .Y(n206) );
  BUFX2M U103 ( .A(n208), .Y(n207) );
  INVX4M U104 ( .A(n66), .Y(n193) );
  INVX4M U105 ( .A(n66), .Y(n192) );
  INVX4M U106 ( .A(n65), .Y(n200) );
  INVX4M U107 ( .A(n65), .Y(n199) );
  BUFX2M U108 ( .A(w_rstn), .Y(n208) );
  BUFX4M U109 ( .A(n170), .Y(n183) );
  BUFX4M U110 ( .A(n170), .Y(n184) );
  BUFX4M U111 ( .A(n169), .Y(n185) );
  BUFX4M U112 ( .A(n169), .Y(n186) );
  CLKBUFX8M U113 ( .A(n172), .Y(n182) );
  NOR2X2M U114 ( .A(n176), .B(n177), .Y(n172) );
  BUFX4M U115 ( .A(n173), .Y(n180) );
  BUFX4M U116 ( .A(n173), .Y(n181) );
  INVX4M U117 ( .A(n70), .Y(n198) );
  INVX4M U118 ( .A(n70), .Y(n197) );
  INVX4M U119 ( .A(n69), .Y(n188) );
  INVX4M U120 ( .A(n69), .Y(n187) );
  INVX4M U121 ( .A(n67), .Y(n196) );
  INVX4M U122 ( .A(n67), .Y(n195) );
  INVX4M U123 ( .A(n68), .Y(n190) );
  INVX4M U124 ( .A(n68), .Y(n189) );
  AND3X2M U125 ( .A(n209), .B(n210), .C(n76), .Y(n65) );
  AND3X2M U126 ( .A(n209), .B(n210), .C(n82), .Y(n66) );
  INVX4M U127 ( .A(n179), .Y(n178) );
  INVX2M U128 ( .A(N10), .Y(n177) );
  INVX2M U129 ( .A(N11), .Y(n176) );
  CLKBUFX8M U130 ( .A(n79), .Y(n194) );
  NAND3X2M U131 ( .A(w_addr[0]), .B(n76), .C(w_addr[1]), .Y(n79) );
  CLKBUFX8M U132 ( .A(n83), .Y(n191) );
  NAND3X2M U133 ( .A(w_addr[0]), .B(n210), .C(n82), .Y(n83) );
  NOR2BX2M U134 ( .AN(w_inc), .B(w_full), .Y(n80) );
  OAI2BB2X1M U135 ( .B0(n218), .B1(n198), .A0N(\FIFO_MEM[1][0] ), .A1N(n198), 
        .Y(n94) );
  OAI2BB2X1M U136 ( .B0(n217), .B1(n197), .A0N(\FIFO_MEM[1][1] ), .A1N(n197), 
        .Y(n95) );
  OAI2BB2X1M U137 ( .B0(n216), .B1(n198), .A0N(\FIFO_MEM[1][2] ), .A1N(n198), 
        .Y(n96) );
  OAI2BB2X1M U138 ( .B0(n215), .B1(n197), .A0N(\FIFO_MEM[1][3] ), .A1N(n197), 
        .Y(n97) );
  OAI2BB2X1M U139 ( .B0(n214), .B1(n198), .A0N(\FIFO_MEM[1][4] ), .A1N(n198), 
        .Y(n98) );
  OAI2BB2X1M U140 ( .B0(n213), .B1(n197), .A0N(\FIFO_MEM[1][5] ), .A1N(n197), 
        .Y(n99) );
  OAI2BB2X1M U141 ( .B0(n212), .B1(n198), .A0N(\FIFO_MEM[1][6] ), .A1N(n198), 
        .Y(n100) );
  OAI2BB2X1M U142 ( .B0(n211), .B1(n197), .A0N(\FIFO_MEM[1][7] ), .A1N(n197), 
        .Y(n101) );
  OAI2BB2X1M U143 ( .B0(n218), .B1(n196), .A0N(\FIFO_MEM[2][0] ), .A1N(n196), 
        .Y(n102) );
  OAI2BB2X1M U144 ( .B0(n217), .B1(n195), .A0N(\FIFO_MEM[2][1] ), .A1N(n195), 
        .Y(n103) );
  OAI2BB2X1M U145 ( .B0(n216), .B1(n196), .A0N(\FIFO_MEM[2][2] ), .A1N(n196), 
        .Y(n104) );
  OAI2BB2X1M U146 ( .B0(n215), .B1(n195), .A0N(\FIFO_MEM[2][3] ), .A1N(n195), 
        .Y(n105) );
  OAI2BB2X1M U147 ( .B0(n214), .B1(n196), .A0N(\FIFO_MEM[2][4] ), .A1N(n196), 
        .Y(n106) );
  OAI2BB2X1M U148 ( .B0(n213), .B1(n195), .A0N(\FIFO_MEM[2][5] ), .A1N(n195), 
        .Y(n107) );
  OAI2BB2X1M U149 ( .B0(n212), .B1(n196), .A0N(\FIFO_MEM[2][6] ), .A1N(n196), 
        .Y(n108) );
  OAI2BB2X1M U150 ( .B0(n211), .B1(n195), .A0N(\FIFO_MEM[2][7] ), .A1N(n195), 
        .Y(n109) );
  OAI2BB2X1M U151 ( .B0(n218), .B1(n194), .A0N(\FIFO_MEM[3][0] ), .A1N(n194), 
        .Y(n110) );
  OAI2BB2X1M U152 ( .B0(n217), .B1(n194), .A0N(\FIFO_MEM[3][1] ), .A1N(n194), 
        .Y(n111) );
  OAI2BB2X1M U153 ( .B0(n216), .B1(n194), .A0N(\FIFO_MEM[3][2] ), .A1N(n194), 
        .Y(n112) );
  OAI2BB2X1M U154 ( .B0(n215), .B1(n194), .A0N(\FIFO_MEM[3][3] ), .A1N(n194), 
        .Y(n113) );
  OAI2BB2X1M U155 ( .B0(n214), .B1(n194), .A0N(\FIFO_MEM[3][4] ), .A1N(n194), 
        .Y(n114) );
  OAI2BB2X1M U156 ( .B0(n213), .B1(n194), .A0N(\FIFO_MEM[3][5] ), .A1N(n194), 
        .Y(n115) );
  OAI2BB2X1M U157 ( .B0(n212), .B1(n194), .A0N(\FIFO_MEM[3][6] ), .A1N(n194), 
        .Y(n116) );
  OAI2BB2X1M U158 ( .B0(n211), .B1(n194), .A0N(\FIFO_MEM[3][7] ), .A1N(n194), 
        .Y(n117) );
  OAI2BB2X1M U159 ( .B0(n218), .B1(n193), .A0N(\FIFO_MEM[4][0] ), .A1N(n193), 
        .Y(n118) );
  OAI2BB2X1M U160 ( .B0(n217), .B1(n192), .A0N(\FIFO_MEM[4][1] ), .A1N(n192), 
        .Y(n119) );
  OAI2BB2X1M U161 ( .B0(n216), .B1(n193), .A0N(\FIFO_MEM[4][2] ), .A1N(n193), 
        .Y(n120) );
  OAI2BB2X1M U162 ( .B0(n215), .B1(n192), .A0N(\FIFO_MEM[4][3] ), .A1N(n192), 
        .Y(n121) );
  OAI2BB2X1M U163 ( .B0(n214), .B1(n193), .A0N(\FIFO_MEM[4][4] ), .A1N(n193), 
        .Y(n122) );
  OAI2BB2X1M U164 ( .B0(n213), .B1(n192), .A0N(\FIFO_MEM[4][5] ), .A1N(n192), 
        .Y(n123) );
  OAI2BB2X1M U165 ( .B0(n212), .B1(n193), .A0N(\FIFO_MEM[4][6] ), .A1N(n193), 
        .Y(n124) );
  OAI2BB2X1M U166 ( .B0(n211), .B1(n192), .A0N(\FIFO_MEM[4][7] ), .A1N(n192), 
        .Y(n125) );
  OAI2BB2X1M U167 ( .B0(n218), .B1(n191), .A0N(\FIFO_MEM[5][0] ), .A1N(n191), 
        .Y(n126) );
  OAI2BB2X1M U168 ( .B0(n217), .B1(n191), .A0N(\FIFO_MEM[5][1] ), .A1N(n191), 
        .Y(n127) );
  OAI2BB2X1M U169 ( .B0(n216), .B1(n191), .A0N(\FIFO_MEM[5][2] ), .A1N(n191), 
        .Y(n128) );
  OAI2BB2X1M U170 ( .B0(n215), .B1(n191), .A0N(\FIFO_MEM[5][3] ), .A1N(n191), 
        .Y(n129) );
  OAI2BB2X1M U171 ( .B0(n214), .B1(n191), .A0N(\FIFO_MEM[5][4] ), .A1N(n191), 
        .Y(n130) );
  OAI2BB2X1M U172 ( .B0(n213), .B1(n191), .A0N(\FIFO_MEM[5][5] ), .A1N(n191), 
        .Y(n131) );
  OAI2BB2X1M U173 ( .B0(n212), .B1(n191), .A0N(\FIFO_MEM[5][6] ), .A1N(n191), 
        .Y(n132) );
  OAI2BB2X1M U174 ( .B0(n211), .B1(n191), .A0N(\FIFO_MEM[5][7] ), .A1N(n191), 
        .Y(n133) );
  OAI2BB2X1M U175 ( .B0(n218), .B1(n190), .A0N(\FIFO_MEM[6][0] ), .A1N(n190), 
        .Y(n134) );
  OAI2BB2X1M U176 ( .B0(n217), .B1(n189), .A0N(\FIFO_MEM[6][1] ), .A1N(n189), 
        .Y(n135) );
  OAI2BB2X1M U177 ( .B0(n216), .B1(n190), .A0N(\FIFO_MEM[6][2] ), .A1N(n190), 
        .Y(n136) );
  OAI2BB2X1M U178 ( .B0(n215), .B1(n189), .A0N(\FIFO_MEM[6][3] ), .A1N(n189), 
        .Y(n137) );
  OAI2BB2X1M U179 ( .B0(n214), .B1(n190), .A0N(\FIFO_MEM[6][4] ), .A1N(n190), 
        .Y(n138) );
  OAI2BB2X1M U180 ( .B0(n213), .B1(n189), .A0N(\FIFO_MEM[6][5] ), .A1N(n189), 
        .Y(n139) );
  OAI2BB2X1M U181 ( .B0(n212), .B1(n190), .A0N(\FIFO_MEM[6][6] ), .A1N(n190), 
        .Y(n140) );
  OAI2BB2X1M U182 ( .B0(n211), .B1(n189), .A0N(\FIFO_MEM[6][7] ), .A1N(n189), 
        .Y(n141) );
  OAI2BB2X1M U183 ( .B0(n218), .B1(n188), .A0N(\FIFO_MEM[7][0] ), .A1N(n188), 
        .Y(n142) );
  OAI2BB2X1M U184 ( .B0(n217), .B1(n187), .A0N(\FIFO_MEM[7][1] ), .A1N(n187), 
        .Y(n143) );
  OAI2BB2X1M U185 ( .B0(n216), .B1(n188), .A0N(\FIFO_MEM[7][2] ), .A1N(n188), 
        .Y(n144) );
  OAI2BB2X1M U186 ( .B0(n215), .B1(n187), .A0N(\FIFO_MEM[7][3] ), .A1N(n187), 
        .Y(n145) );
  OAI2BB2X1M U187 ( .B0(n214), .B1(n188), .A0N(\FIFO_MEM[7][4] ), .A1N(n188), 
        .Y(n146) );
  OAI2BB2X1M U188 ( .B0(n213), .B1(n187), .A0N(\FIFO_MEM[7][5] ), .A1N(n187), 
        .Y(n147) );
  OAI2BB2X1M U189 ( .B0(n212), .B1(n188), .A0N(\FIFO_MEM[7][6] ), .A1N(n188), 
        .Y(n148) );
  OAI2BB2X1M U190 ( .B0(n211), .B1(n187), .A0N(\FIFO_MEM[7][7] ), .A1N(n187), 
        .Y(n149) );
  OAI2BB2X1M U191 ( .B0(n200), .B1(n218), .A0N(\FIFO_MEM[0][0] ), .A1N(n200), 
        .Y(n86) );
  OAI2BB2X1M U192 ( .B0(n199), .B1(n217), .A0N(\FIFO_MEM[0][1] ), .A1N(n199), 
        .Y(n87) );
  OAI2BB2X1M U193 ( .B0(n200), .B1(n216), .A0N(\FIFO_MEM[0][2] ), .A1N(n200), 
        .Y(n88) );
  OAI2BB2X1M U194 ( .B0(n199), .B1(n215), .A0N(\FIFO_MEM[0][3] ), .A1N(n199), 
        .Y(n89) );
  OAI2BB2X1M U195 ( .B0(n200), .B1(n214), .A0N(\FIFO_MEM[0][4] ), .A1N(n200), 
        .Y(n90) );
  OAI2BB2X1M U196 ( .B0(n199), .B1(n213), .A0N(\FIFO_MEM[0][5] ), .A1N(n199), 
        .Y(n91) );
  OAI2BB2X1M U197 ( .B0(n200), .B1(n212), .A0N(\FIFO_MEM[0][6] ), .A1N(n200), 
        .Y(n92) );
  OAI2BB2X1M U198 ( .B0(n199), .B1(n211), .A0N(\FIFO_MEM[0][7] ), .A1N(n199), 
        .Y(n93) );
  AND3X2M U199 ( .A(n76), .B(n209), .C(w_addr[1]), .Y(n67) );
  AND3X2M U200 ( .A(w_addr[1]), .B(n209), .C(n82), .Y(n68) );
  AND3X2M U201 ( .A(w_addr[1]), .B(w_addr[0]), .C(n82), .Y(n69) );
  AND3X2M U202 ( .A(n76), .B(n210), .C(w_addr[0]), .Y(n70) );
  CLKBUFX6M U203 ( .A(N9), .Y(n179) );
  AO22X1M U204 ( .A0(\FIFO_MEM[3][0] ), .A1(n184), .B0(\FIFO_MEM[1][0] ), .B1(
        n186), .Y(n71) );
  AO22X1M U205 ( .A0(\FIFO_MEM[2][0] ), .A1(n184), .B0(\FIFO_MEM[0][0] ), .B1(
        n186), .Y(n72) );
  OAI22X1M U206 ( .A0(n178), .A1(n74), .B0(n179), .B1(n73), .Y(r_data[0]) );
  AO22X1M U207 ( .A0(\FIFO_MEM[3][1] ), .A1(n184), .B0(\FIFO_MEM[1][1] ), .B1(
        n186), .Y(n75) );
  AO22X1M U208 ( .A0(\FIFO_MEM[2][1] ), .A1(n184), .B0(\FIFO_MEM[0][1] ), .B1(
        n186), .Y(n77) );
  OAI22X1M U209 ( .A0(n178), .A1(n81), .B0(n179), .B1(n78), .Y(r_data[1]) );
  AO22X1M U210 ( .A0(\FIFO_MEM[3][2] ), .A1(n184), .B0(\FIFO_MEM[1][2] ), .B1(
        n186), .Y(n84) );
  AO22X1M U211 ( .A0(\FIFO_MEM[2][2] ), .A1(n184), .B0(\FIFO_MEM[0][2] ), .B1(
        n186), .Y(n85) );
  OAI22X1M U212 ( .A0(n178), .A1(n151), .B0(n179), .B1(n150), .Y(r_data[2]) );
  AO22X1M U213 ( .A0(\FIFO_MEM[3][3] ), .A1(n184), .B0(\FIFO_MEM[1][3] ), .B1(
        n186), .Y(n152) );
  AO22X1M U214 ( .A0(\FIFO_MEM[2][3] ), .A1(n184), .B0(\FIFO_MEM[0][3] ), .B1(
        n186), .Y(n153) );
  OAI22X1M U215 ( .A0(n178), .A1(n155), .B0(n179), .B1(n154), .Y(r_data[3]) );
  AO22X1M U216 ( .A0(\FIFO_MEM[3][4] ), .A1(n183), .B0(\FIFO_MEM[1][4] ), .B1(
        n185), .Y(n156) );
  AO22X1M U217 ( .A0(\FIFO_MEM[2][4] ), .A1(n183), .B0(\FIFO_MEM[0][4] ), .B1(
        n185), .Y(n157) );
  OAI22X1M U218 ( .A0(n178), .A1(n159), .B0(n179), .B1(n158), .Y(r_data[4]) );
  AO22X1M U219 ( .A0(\FIFO_MEM[3][5] ), .A1(n183), .B0(\FIFO_MEM[1][5] ), .B1(
        n185), .Y(n160) );
  AO22X1M U220 ( .A0(\FIFO_MEM[2][5] ), .A1(n183), .B0(\FIFO_MEM[0][5] ), .B1(
        n185), .Y(n161) );
  OAI22X1M U221 ( .A0(n178), .A1(n163), .B0(n179), .B1(n162), .Y(r_data[5]) );
  AO22X1M U222 ( .A0(\FIFO_MEM[3][6] ), .A1(n183), .B0(\FIFO_MEM[1][6] ), .B1(
        n185), .Y(n164) );
  AO22X1M U223 ( .A0(\FIFO_MEM[2][6] ), .A1(n183), .B0(\FIFO_MEM[0][6] ), .B1(
        n185), .Y(n165) );
  OAI22X1M U224 ( .A0(n178), .A1(n167), .B0(n179), .B1(n166), .Y(r_data[6]) );
  AO22X1M U225 ( .A0(\FIFO_MEM[3][7] ), .A1(n183), .B0(\FIFO_MEM[1][7] ), .B1(
        n185), .Y(n168) );
  AO22X1M U226 ( .A0(\FIFO_MEM[2][7] ), .A1(n183), .B0(\FIFO_MEM[0][7] ), .B1(
        n185), .Y(n171) );
  OAI22X1M U227 ( .A0(n175), .A1(n178), .B0(n179), .B1(n174), .Y(r_data[7]) );
  DLY1X1M U228 ( .A(test_se), .Y(n222) );
  DLY1X1M U229 ( .A(test_se), .Y(n223) );
  DLY1X1M U230 ( .A(test_se), .Y(n224) );
  DLY1X1M U231 ( .A(test_se), .Y(n225) );
  DLY1X1M U232 ( .A(test_se), .Y(n226) );
  DLY1X1M U233 ( .A(n224), .Y(n227) );
  DLY1X1M U234 ( .A(n226), .Y(n228) );
  DLY1X1M U235 ( .A(n223), .Y(n229) );
  DLY1X1M U236 ( .A(n224), .Y(n230) );
  DLY1X1M U237 ( .A(n222), .Y(n231) );
  DLY1X1M U238 ( .A(n225), .Y(n232) );
  DLY1X1M U239 ( .A(n226), .Y(n233) );
  DLY1X1M U240 ( .A(n223), .Y(n234) );
  DLY1X1M U241 ( .A(n222), .Y(n235) );
  DLY1X1M U242 ( .A(n225), .Y(n236) );
  DLY1X1M U243 ( .A(n227), .Y(n237) );
  DLY1X1M U244 ( .A(n227), .Y(n238) );
  DLY1X1M U245 ( .A(n228), .Y(n239) );
  DLY1X1M U246 ( .A(n228), .Y(n240) );
  DLY1X1M U247 ( .A(n229), .Y(n241) );
  DLY1X1M U248 ( .A(n229), .Y(n242) );
  DLY1X1M U249 ( .A(n230), .Y(n243) );
  DLY1X1M U250 ( .A(n230), .Y(n244) );
  DLY1X1M U251 ( .A(n231), .Y(n245) );
  DLY1X1M U252 ( .A(n231), .Y(n246) );
  DLY1X1M U253 ( .A(n232), .Y(n247) );
  DLY1X1M U254 ( .A(n232), .Y(n248) );
  DLY1X1M U255 ( .A(n233), .Y(n249) );
  DLY1X1M U256 ( .A(n233), .Y(n250) );
  DLY1X1M U257 ( .A(n234), .Y(n251) );
  DLY1X1M U258 ( .A(n234), .Y(n252) );
  DLY1X1M U259 ( .A(n235), .Y(n253) );
  DLY1X1M U260 ( .A(n235), .Y(n254) );
  DLY1X1M U261 ( .A(n236), .Y(n255) );
  DLY1X1M U262 ( .A(n236), .Y(n256) );
  DLY1X1M U263 ( .A(n237), .Y(n257) );
  DLY1X1M U264 ( .A(n237), .Y(n258) );
  DLY1X1M U265 ( .A(n238), .Y(n259) );
  DLY1X1M U266 ( .A(n238), .Y(n260) );
  DLY1X1M U267 ( .A(n239), .Y(n261) );
  DLY1X1M U268 ( .A(n239), .Y(n262) );
  DLY1X1M U269 ( .A(n240), .Y(n263) );
  DLY1X1M U270 ( .A(n240), .Y(n264) );
  DLY1X1M U271 ( .A(n241), .Y(n265) );
  DLY1X1M U272 ( .A(n241), .Y(n266) );
  DLY1X1M U273 ( .A(n242), .Y(n267) );
  DLY1X1M U274 ( .A(n242), .Y(n268) );
  DLY1X1M U275 ( .A(n243), .Y(n269) );
  DLY1X1M U276 ( .A(n243), .Y(n270) );
  DLY1X1M U277 ( .A(n244), .Y(n271) );
  DLY1X1M U278 ( .A(n244), .Y(n272) );
  DLY1X1M U279 ( .A(n245), .Y(n273) );
  DLY1X1M U280 ( .A(n245), .Y(n274) );
  DLY1X1M U281 ( .A(n246), .Y(n275) );
  DLY1X1M U282 ( .A(n246), .Y(n276) );
  DLY1X1M U283 ( .A(n247), .Y(n277) );
  DLY1X1M U284 ( .A(n247), .Y(n278) );
  DLY1X1M U285 ( .A(n248), .Y(n279) );
  DLY1X1M U286 ( .A(n248), .Y(n280) );
endmodule


module DF_Sync_DATA_SIZE4_test_1 ( sync_clk, sync_rstn, unsync_ip, sync_op, 
        test_si, test_se );
  input [3:0] unsync_ip;
  output [3:0] sync_op;
  input sync_clk, sync_rstn, test_si, test_se;
  wire   n9, n10, n13, n14, n15, n16;
  wire   [3:0] meta_flop;

  SDFFRQX2M \sync_op_reg[3]  ( .D(meta_flop[3]), .SI(sync_op[2]), .SE(n16), 
        .CK(sync_clk), .RN(n9), .Q(sync_op[3]) );
  SDFFRQX2M \sync_op_reg[2]  ( .D(meta_flop[2]), .SI(sync_op[1]), .SE(n15), 
        .CK(sync_clk), .RN(n9), .Q(sync_op[2]) );
  SDFFRQX2M \sync_op_reg[1]  ( .D(meta_flop[1]), .SI(sync_op[0]), .SE(n14), 
        .CK(sync_clk), .RN(n9), .Q(sync_op[1]) );
  SDFFRQX2M \sync_op_reg[0]  ( .D(meta_flop[0]), .SI(meta_flop[3]), .SE(n13), 
        .CK(sync_clk), .RN(n9), .Q(sync_op[0]) );
  SDFFRQX2M \meta_flop_reg[3]  ( .D(unsync_ip[3]), .SI(meta_flop[2]), .SE(n16), 
        .CK(sync_clk), .RN(n9), .Q(meta_flop[3]) );
  SDFFRQX2M \meta_flop_reg[2]  ( .D(unsync_ip[2]), .SI(meta_flop[1]), .SE(n15), 
        .CK(sync_clk), .RN(n9), .Q(meta_flop[2]) );
  SDFFRQX2M \meta_flop_reg[1]  ( .D(unsync_ip[1]), .SI(meta_flop[0]), .SE(n14), 
        .CK(sync_clk), .RN(n9), .Q(meta_flop[1]) );
  SDFFRQX2M \meta_flop_reg[0]  ( .D(unsync_ip[0]), .SI(test_si), .SE(n13), 
        .CK(sync_clk), .RN(n9), .Q(meta_flop[0]) );
  INVX4M U11 ( .A(n10), .Y(n9) );
  INVX2M U12 ( .A(sync_rstn), .Y(n10) );
  DLY1X1M U13 ( .A(test_se), .Y(n13) );
  DLY1X1M U14 ( .A(test_se), .Y(n14) );
  DLY1X1M U15 ( .A(test_se), .Y(n15) );
  DLY1X1M U16 ( .A(test_se), .Y(n16) );
endmodule


module fifo_wr_test_1 ( w_clk, w_rstn, w_inc, sync_rd_ptr, w_addr, gray_w_ptr, 
        full, test_si, test_so, test_se );
  input [3:0] sync_rd_ptr;
  output [2:0] w_addr;
  output [3:0] gray_w_ptr;
  input w_clk, w_rstn, w_inc, test_si, test_se;
  output full, test_so;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n9,
         n10, n26, n27, n30;
  wire   [3:0] comb_gray_w_ptr;

  SDFFRHQX8M \w_ptr_reg[1]  ( .D(n22), .SI(n30), .SE(test_se), .CK(w_clk), 
        .RN(n26), .Q(w_addr[1]) );
  SDFFRQX4M \w_ptr_reg[2]  ( .D(n21), .SI(w_addr[1]), .SE(test_se), .CK(w_clk), 
        .RN(n26), .Q(w_addr[2]) );
  SDFFRQX2M \gray_w_ptr_reg[3]  ( .D(test_so), .SI(gray_w_ptr[2]), .SE(test_se), .CK(w_clk), .RN(n26), .Q(gray_w_ptr[3]) );
  SDFFRQX2M \gray_w_ptr_reg[2]  ( .D(comb_gray_w_ptr[2]), .SI(gray_w_ptr[1]), 
        .SE(test_se), .CK(w_clk), .RN(n26), .Q(gray_w_ptr[2]) );
  SDFFRQX2M \gray_w_ptr_reg[1]  ( .D(comb_gray_w_ptr[1]), .SI(gray_w_ptr[0]), 
        .SE(test_se), .CK(w_clk), .RN(n26), .Q(gray_w_ptr[1]) );
  SDFFRQX2M \gray_w_ptr_reg[0]  ( .D(comb_gray_w_ptr[0]), .SI(test_si), .SE(
        test_se), .CK(w_clk), .RN(n26), .Q(gray_w_ptr[0]) );
  SDFFRQX2M \w_ptr_reg[3]  ( .D(n20), .SI(w_addr[2]), .SE(test_se), .CK(w_clk), 
        .RN(n26), .Q(comb_gray_w_ptr[3]) );
  SDFFRX1M \w_ptr_reg[0]  ( .D(n23), .SI(gray_w_ptr[3]), .SE(test_se), .CK(
        w_clk), .RN(n26), .Q(n9), .QN(n30) );
  INVX2M U11 ( .A(n9), .Y(n10) );
  INVX4M U12 ( .A(n10), .Y(w_addr[0]) );
  INVX4M U14 ( .A(n27), .Y(n26) );
  INVX2M U15 ( .A(w_rstn), .Y(n27) );
  CLKXOR2X2M U16 ( .A(comb_gray_w_ptr[3]), .B(w_addr[2]), .Y(
        comb_gray_w_ptr[2]) );
  CLKXOR2X2M U17 ( .A(w_addr[1]), .B(w_addr[2]), .Y(comb_gray_w_ptr[1]) );
  XNOR2X4M U18 ( .A(n10), .B(w_addr[1]), .Y(comb_gray_w_ptr[0]) );
  NOR2X2M U19 ( .A(n14), .B(n10), .Y(n13) );
  XNOR2X2M U20 ( .A(comb_gray_w_ptr[1]), .B(sync_rd_ptr[1]), .Y(n16) );
  INVX2M U21 ( .A(n15), .Y(full) );
  XNOR2X2M U22 ( .A(w_addr[2]), .B(n12), .Y(n21) );
  XNOR2X2M U23 ( .A(comb_gray_w_ptr[3]), .B(n11), .Y(n20) );
  NAND2BX2M U24 ( .AN(n12), .B(w_addr[2]), .Y(n11) );
  NAND4X2M U25 ( .A(n16), .B(n17), .C(n18), .D(n19), .Y(n15) );
  CLKXOR2X2M U26 ( .A(sync_rd_ptr[3]), .B(comb_gray_w_ptr[3]), .Y(n19) );
  CLKXOR2X2M U27 ( .A(sync_rd_ptr[2]), .B(comb_gray_w_ptr[2]), .Y(n18) );
  XNOR2X2M U28 ( .A(comb_gray_w_ptr[0]), .B(sync_rd_ptr[0]), .Y(n17) );
  NAND2X2M U29 ( .A(n13), .B(w_addr[1]), .Y(n12) );
  NAND2X2M U30 ( .A(w_inc), .B(n15), .Y(n14) );
  CLKXOR2X2M U31 ( .A(w_addr[1]), .B(n13), .Y(n22) );
  CLKXOR2X2M U32 ( .A(n10), .B(n14), .Y(n23) );
  DLY1X1M U33 ( .A(comb_gray_w_ptr[3]), .Y(test_so) );
endmodule


module fifo_rd_test_1 ( r_clk, r_rstn, r_inc, sync_wr_ptr, rd_addr, empty, 
        gray_rd_ptr, test_si, test_so, test_se );
  input [3:0] sync_wr_ptr;
  output [2:0] rd_addr;
  output [3:0] gray_rd_ptr;
  input r_clk, r_rstn, r_inc, test_si, test_se;
  output empty, test_so;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n9,
         n24, n25, n28;
  wire   [3:0] comb_gray_rd_ptr;

  SDFFRQX2M \rd_ptr_reg[3]  ( .D(n20), .SI(rd_addr[2]), .SE(test_se), .CK(
        r_clk), .RN(n24), .Q(comb_gray_rd_ptr[3]) );
  SDFFRQX2M \gray_rd_ptr_reg[3]  ( .D(test_so), .SI(gray_rd_ptr[2]), .SE(
        test_se), .CK(r_clk), .RN(n24), .Q(gray_rd_ptr[3]) );
  SDFFRQX2M \gray_rd_ptr_reg[2]  ( .D(comb_gray_rd_ptr[2]), .SI(gray_rd_ptr[1]), .SE(test_se), .CK(r_clk), .RN(n24), .Q(gray_rd_ptr[2]) );
  SDFFRQX2M \gray_rd_ptr_reg[1]  ( .D(comb_gray_rd_ptr[1]), .SI(gray_rd_ptr[0]), .SE(test_se), .CK(r_clk), .RN(n24), .Q(gray_rd_ptr[1]) );
  SDFFRQX2M \gray_rd_ptr_reg[0]  ( .D(comb_gray_rd_ptr[0]), .SI(test_si), .SE(
        test_se), .CK(r_clk), .RN(n24), .Q(gray_rd_ptr[0]) );
  SDFFRX1M \rd_ptr_reg[0]  ( .D(n23), .SI(gray_rd_ptr[3]), .SE(test_se), .CK(
        r_clk), .RN(n24), .Q(rd_addr[0]), .QN(n28) );
  SDFFRQX4M \rd_ptr_reg[1]  ( .D(n22), .SI(n28), .SE(test_se), .CK(r_clk), 
        .RN(n24), .Q(rd_addr[1]) );
  SDFFRQX4M \rd_ptr_reg[2]  ( .D(n21), .SI(rd_addr[1]), .SE(test_se), .CK(
        r_clk), .RN(n24), .Q(rd_addr[2]) );
  INVX2M U11 ( .A(rd_addr[0]), .Y(n9) );
  INVX4M U13 ( .A(n25), .Y(n24) );
  INVX2M U14 ( .A(r_rstn), .Y(n25) );
  INVX2M U15 ( .A(n15), .Y(empty) );
  CLKXOR2X2M U16 ( .A(rd_addr[1]), .B(rd_addr[2]), .Y(comb_gray_rd_ptr[1]) );
  CLKXOR2X2M U17 ( .A(rd_addr[2]), .B(comb_gray_rd_ptr[3]), .Y(
        comb_gray_rd_ptr[2]) );
  XNOR2X4M U18 ( .A(n9), .B(rd_addr[1]), .Y(comb_gray_rd_ptr[0]) );
  NOR2X2M U19 ( .A(n14), .B(n9), .Y(n13) );
  XNOR2X2M U20 ( .A(comb_gray_rd_ptr[1]), .B(sync_wr_ptr[1]), .Y(n16) );
  XNOR2X2M U21 ( .A(comb_gray_rd_ptr[3]), .B(n11), .Y(n20) );
  NAND2BX2M U22 ( .AN(n12), .B(rd_addr[2]), .Y(n11) );
  NAND4X2M U23 ( .A(n16), .B(n17), .C(n18), .D(n19), .Y(n15) );
  XNOR2X2M U24 ( .A(comb_gray_rd_ptr[3]), .B(sync_wr_ptr[3]), .Y(n18) );
  XNOR2X2M U25 ( .A(comb_gray_rd_ptr[2]), .B(sync_wr_ptr[2]), .Y(n19) );
  XNOR2X2M U26 ( .A(comb_gray_rd_ptr[0]), .B(sync_wr_ptr[0]), .Y(n17) );
  NAND2X2M U27 ( .A(n13), .B(rd_addr[1]), .Y(n12) );
  NAND2X2M U28 ( .A(r_inc), .B(n15), .Y(n14) );
  CLKXOR2X2M U29 ( .A(rd_addr[1]), .B(n13), .Y(n22) );
  CLKXOR2X2M U30 ( .A(n9), .B(n14), .Y(n23) );
  XNOR2X2M U31 ( .A(rd_addr[2]), .B(n12), .Y(n21) );
  DLY1X1M U32 ( .A(comb_gray_rd_ptr[3]), .Y(test_so) );
endmodule


module DF_Sync_DATA_SIZE4_test_0 ( sync_clk, sync_rstn, unsync_ip, sync_op, 
        test_si, test_se );
  input [3:0] unsync_ip;
  output [3:0] sync_op;
  input sync_clk, sync_rstn, test_si, test_se;
  wire   n9, n10, n21, n22, n23, n24;
  wire   [3:0] meta_flop;

  SDFFRQX2M \sync_op_reg[3]  ( .D(meta_flop[3]), .SI(sync_op[2]), .SE(n24), 
        .CK(sync_clk), .RN(n9), .Q(sync_op[3]) );
  SDFFRQX2M \sync_op_reg[2]  ( .D(meta_flop[2]), .SI(sync_op[1]), .SE(n23), 
        .CK(sync_clk), .RN(n9), .Q(sync_op[2]) );
  SDFFRQX2M \sync_op_reg[1]  ( .D(meta_flop[1]), .SI(sync_op[0]), .SE(n22), 
        .CK(sync_clk), .RN(n9), .Q(sync_op[1]) );
  SDFFRQX2M \sync_op_reg[0]  ( .D(meta_flop[0]), .SI(meta_flop[3]), .SE(n21), 
        .CK(sync_clk), .RN(n9), .Q(sync_op[0]) );
  SDFFRQX2M \meta_flop_reg[3]  ( .D(unsync_ip[3]), .SI(meta_flop[2]), .SE(n24), 
        .CK(sync_clk), .RN(n9), .Q(meta_flop[3]) );
  SDFFRQX2M \meta_flop_reg[2]  ( .D(unsync_ip[2]), .SI(meta_flop[1]), .SE(n23), 
        .CK(sync_clk), .RN(n9), .Q(meta_flop[2]) );
  SDFFRQX2M \meta_flop_reg[1]  ( .D(unsync_ip[1]), .SI(meta_flop[0]), .SE(n22), 
        .CK(sync_clk), .RN(n9), .Q(meta_flop[1]) );
  SDFFRQX2M \meta_flop_reg[0]  ( .D(unsync_ip[0]), .SI(test_si), .SE(n21), 
        .CK(sync_clk), .RN(n9), .Q(meta_flop[0]) );
  INVX4M U11 ( .A(n10), .Y(n9) );
  INVX2M U12 ( .A(sync_rstn), .Y(n10) );
  DLY1X1M U13 ( .A(test_se), .Y(n21) );
  DLY1X1M U14 ( .A(test_se), .Y(n22) );
  DLY1X1M U15 ( .A(test_se), .Y(n23) );
  DLY1X1M U16 ( .A(test_se), .Y(n24) );
endmodule


module Async_fifo_D_SIZE8_P_SIZE4_F_DEPTH8_test_1 ( i_w_clk, i_w_rstn, i_w_inc, 
        i_r_clk, i_r_rstn, i_r_inc, i_w_data, o_r_data, o_full, o_empty, 
        test_si2, test_si1, test_so2, test_so1, test_se );
  input [7:0] i_w_data;
  output [7:0] o_r_data;
  input i_w_clk, i_w_rstn, i_w_inc, i_r_clk, i_r_rstn, i_r_inc, test_si2,
         test_si1, test_se;
  output o_full, o_empty, test_so2, test_so1;
  wire   n1, n2, n4, n5, n6;
  wire   [2:0] w_addr;
  wire   [2:0] r_addr;
  wire   [3:0] gray_w_ptr;
  wire   [3:0] w2r_ptr;
  wire   [3:0] r2w_ptr;
  wire   [3:0] gray_rd_ptr;
  assign test_so2 = w2r_ptr[3];

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(i_w_rstn), .Y(n2) );
  fifo_mem_A_SIZE3_D_SIZE8_F_DEPTH8_P_SIZE4_test_1 u_fifo_mem ( .w_clk(i_w_clk), .w_rstn(n1), .w_full(o_full), .w_inc(i_w_inc), .w_addr(w_addr), .r_addr(
        r_addr), .w_data(i_w_data), .r_data(o_r_data), .test_si2(test_si2), 
        .test_si1(test_si1), .test_so2(n6), .test_so1(test_so1), .test_se(
        test_se) );
  DF_Sync_DATA_SIZE4_test_1 u_w2r_sync ( .sync_clk(i_r_clk), .sync_rstn(
        i_r_rstn), .unsync_ip(gray_w_ptr), .sync_op(w2r_ptr), .test_si(
        r2w_ptr[3]), .test_se(test_se) );
  fifo_wr_test_1 u_fifo_wr ( .w_clk(i_w_clk), .w_rstn(n1), .w_inc(i_w_inc), 
        .sync_rd_ptr(r2w_ptr), .w_addr(w_addr), .gray_w_ptr(gray_w_ptr), 
        .full(o_full), .test_si(n5), .test_so(n4), .test_se(test_se) );
  fifo_rd_test_1 u_fifo_rd ( .r_clk(i_r_clk), .r_rstn(i_r_rstn), .r_inc(
        i_r_inc), .sync_wr_ptr(w2r_ptr), .rd_addr(r_addr), .empty(o_empty), 
        .gray_rd_ptr(gray_rd_ptr), .test_si(n6), .test_so(n5), .test_se(
        test_se) );
  DF_Sync_DATA_SIZE4_test_0 u_r2w_sync ( .sync_clk(i_w_clk), .sync_rstn(n1), 
        .unsync_ip(gray_rd_ptr), .sync_op(r2w_ptr), .test_si(n4), .test_se(
        test_se) );
endmodule


module PULSE_GEN_test_1 ( clk, rst, lvl_sig, pulse_sig, test_si, test_so, 
        test_se );
  input clk, rst, lvl_sig, test_si, test_se;
  output pulse_sig, test_so;
  wire   pls_flop, rcv_flop;
  assign test_so = rcv_flop;

  SDFFRQX2M pls_flop_reg ( .D(rcv_flop), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(pls_flop) );
  SDFFRQX2M rcv_flop_reg ( .D(lvl_sig), .SI(pls_flop), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(rcv_flop) );
  NOR2BX2M U5 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module ClkDiv_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module ClkDiv_test_0 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk, 
        test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n1, n2, n3, n4, n5, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n58, n59, n60, n61, n62, n63, n64;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  assign test_so = odd_edge_tog;

  SDFFRQX1M div_clk_reg ( .D(n27), .SI(n60), .SE(test_se), .CK(i_ref_clk), 
        .RN(n2), .Q(div_clk) );
  SDFFSQX2M odd_edge_tog_reg ( .D(n26), .SI(n64), .SE(test_se), .CK(i_ref_clk), 
        .SN(n2), .Q(odd_edge_tog) );
  SDFFRQX2M \count_reg[6]  ( .D(n28), .SI(n59), .SE(test_se), .CK(i_ref_clk), 
        .RN(n2), .Q(count[6]) );
  SDFFRQX4M \count_reg[0]  ( .D(n34), .SI(test_si), .SE(test_se), .CK(
        i_ref_clk), .RN(n2), .Q(count[0]) );
  SDFFRQX2M \count_reg[5]  ( .D(n29), .SI(n58), .SE(test_se), .CK(i_ref_clk), 
        .RN(n2), .Q(count[5]) );
  SDFFRQX2M \count_reg[4]  ( .D(n30), .SI(n61), .SE(test_se), .CK(i_ref_clk), 
        .RN(n2), .Q(count[4]) );
  SDFFRQX2M \count_reg[3]  ( .D(n31), .SI(n63), .SE(test_se), .CK(i_ref_clk), 
        .RN(n2), .Q(count[3]) );
  SDFFRQX2M \count_reg[2]  ( .D(n32), .SI(n62), .SE(test_se), .CK(i_ref_clk), 
        .RN(n2), .Q(count[2]) );
  SDFFRQX2M \count_reg[1]  ( .D(n33), .SI(count[0]), .SE(test_se), .CK(
        i_ref_clk), .RN(n2), .Q(count[1]) );
  NOR4X2M U5 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n42) );
  NOR2X4M U6 ( .A(n5), .B(i_div_ratio[4]), .Y(n15) );
  AND3X4M U11 ( .A(n21), .B(n22), .C(n55), .Y(n20) );
  NAND4X2M U15 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n24) );
  NAND2BX2M U16 ( .AN(i_div_ratio[2]), .B(edge_flip_half[0]), .Y(n4) );
  OR2X2M U17 ( .A(n4), .B(i_div_ratio[3]), .Y(n5) );
  AO22XLM U18 ( .A0(n1), .A1(n62), .B0(N17), .B1(n20), .Y(n33) );
  AO22XLM U19 ( .A0(n1), .A1(n63), .B0(N18), .B1(n20), .Y(n32) );
  AO22XLM U20 ( .A0(n1), .A1(n61), .B0(N19), .B1(n20), .Y(n31) );
  AO22XLM U21 ( .A0(n58), .A1(n1), .B0(N20), .B1(n20), .Y(n30) );
  AO22XLM U22 ( .A0(n59), .A1(n1), .B0(N21), .B1(n20), .Y(n29) );
  AO22XLM U23 ( .A0(n60), .A1(n1), .B0(N22), .B1(n20), .Y(n28) );
  OAI2BB1XLM U24 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n4), .Y(
        edge_flip_half[1]) );
  OAI2BB1XLM U25 ( .A0N(n4), .A1N(i_div_ratio[3]), .B0(n5), .Y(
        edge_flip_half[2]) );
  INVX6M U26 ( .A(n3), .Y(n2) );
  INVX2M U27 ( .A(i_rst), .Y(n3) );
  INVX2M U28 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  INVX2M U29 ( .A(i_div_ratio[5]), .Y(n18) );
  CLKBUFX6M U30 ( .A(n19), .Y(n1) );
  OAI21X2M U31 ( .A0(n35), .A1(n36), .B0(i_clk_en), .Y(n19) );
  MX2XLM U32 ( .A(i_ref_clk), .B(n64), .S0(n55), .Y(o_div_clk) );
  AO21XLM U33 ( .A0(n5), .A1(i_div_ratio[4]), .B0(n15), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U34 ( .A(n15), .B(n18), .Y(n16) );
  OAI21X1M U35 ( .A0(n15), .A1(n18), .B0(n16), .Y(edge_flip_half[4]) );
  XNOR2X1M U36 ( .A(i_div_ratio[6]), .B(n16), .Y(edge_flip_half[5]) );
  NOR2X1M U37 ( .A(i_div_ratio[6]), .B(n16), .Y(n17) );
  CLKXOR2X2M U38 ( .A(i_div_ratio[7]), .B(n17), .Y(edge_flip_half[6]) );
  AO22X1M U39 ( .A0(n1), .A1(count[0]), .B0(N16), .B1(n20), .Y(n34) );
  CLKINVX1M U40 ( .A(n1), .Y(n55) );
  CLKXOR2X2M U41 ( .A(n23), .B(div_clk), .Y(n27) );
  AOI21X1M U42 ( .A0(n22), .A1(n21), .B0(n1), .Y(n23) );
  OR2X1M U43 ( .A(n24), .B(i_div_ratio[0]), .Y(n21) );
  XNOR2X1M U44 ( .A(odd_edge_tog), .B(n25), .Y(n26) );
  OR2X1M U45 ( .A(n22), .B(n1), .Y(n25) );
  OR3X1M U46 ( .A(i_div_ratio[2]), .B(i_div_ratio[3]), .C(i_div_ratio[1]), .Y(
        n36) );
  OR4X1M U47 ( .A(i_div_ratio[4]), .B(i_div_ratio[5]), .C(i_div_ratio[6]), .D(
        i_div_ratio[7]), .Y(n35) );
  CLKNAND2X2M U48 ( .A(n37), .B(i_div_ratio[0]), .Y(n22) );
  MXI2X1M U49 ( .A(n38), .B(n24), .S0(odd_edge_tog), .Y(n37) );
  CLKXOR2X2M U50 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n46) );
  CLKXOR2X2M U51 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n45) );
  CLKXOR2X2M U52 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n44) );
  CLKXOR2X2M U53 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n43) );
  XNOR2X1M U54 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n41) );
  XNOR2X1M U55 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n40) );
  XNOR2X1M U56 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n39) );
  NAND4X1M U57 ( .A(n47), .B(n48), .C(n49), .D(n50), .Y(n38) );
  NOR4X1M U58 ( .A(n51), .B(n52), .C(n53), .D(n54), .Y(n50) );
  CLKXOR2X2M U59 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n54) );
  CLKXOR2X2M U60 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n53) );
  CLKXOR2X2M U61 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n52) );
  CLKXOR2X2M U62 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n51) );
  XNOR2X1M U63 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n49) );
  XNOR2X1M U64 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n48) );
  XNOR2X1M U65 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n47) );
  DLY1X1M U66 ( .A(count[4]), .Y(n58) );
  DLY1X1M U67 ( .A(count[5]), .Y(n59) );
  DLY1X1M U68 ( .A(count[6]), .Y(n60) );
  DLY1X1M U69 ( .A(count[3]), .Y(n61) );
  DLY1X1M U70 ( .A(count[1]), .Y(n62) );
  DLY1X1M U71 ( .A(count[2]), .Y(n63) );
  DLY1X1M U72 ( .A(div_clk), .Y(n64) );
  ClkDiv_0_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n1, n2, n3, n4, n10, n11, n12, n13;
  assign OUT[4] = 1'b0;
  assign OUT[5] = 1'b0;
  assign OUT[6] = 1'b0;
  assign OUT[7] = 1'b0;

  NAND4BX2M U3 ( .AN(n10), .B(n3), .C(n2), .D(n12), .Y(n6) );
  NAND4BX2M U4 ( .AN(n3), .B(n10), .C(n2), .D(n12), .Y(n7) );
  INVX2M U5 ( .A(IN[2]), .Y(n2) );
  INVX2M U6 ( .A(n4), .Y(n3) );
  INVX2M U7 ( .A(IN[3]), .Y(n4) );
  INVX2M U8 ( .A(n11), .Y(n10) );
  INVX2M U9 ( .A(IN[4]), .Y(n11) );
  INVX2M U10 ( .A(IN[5]), .Y(n12) );
  INVX2M U11 ( .A(IN[1]), .Y(n1) );
  NOR4X6M U12 ( .A(n5), .B(n3), .C(IN[5]), .D(n10), .Y(OUT[3]) );
  NAND3X2M U13 ( .A(n13), .B(n1), .C(IN[2]), .Y(n5) );
  OAI211X4M U14 ( .A0(n8), .A1(n9), .B0(n13), .C0(n1), .Y(OUT[0]) );
  NOR4X2M U15 ( .A(IN[5]), .B(n10), .C(n3), .D(n2), .Y(n8) );
  NAND2X2M U16 ( .A(n7), .B(n6), .Y(n9) );
  NOR3X8M U17 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR3X8M U18 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  INVX2M U19 ( .A(IN[0]), .Y(n13) );
endmodule


module ClkDiv_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module ClkDiv_test_1 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk, 
        test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n1, n2, n4,
         n5, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n79, n80, n81, n82, n83, n84, n85;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  assign test_so = odd_edge_tog;

  SDFFRQX1M div_clk_reg ( .D(n66), .SI(n79), .SE(test_se), .CK(i_ref_clk), 
        .RN(n5), .Q(div_clk) );
  SDFFSQX2M odd_edge_tog_reg ( .D(n67), .SI(n85), .SE(test_se), .CK(i_ref_clk), 
        .SN(n5), .Q(odd_edge_tog) );
  SDFFRQX2M \count_reg[6]  ( .D(n65), .SI(n81), .SE(test_se), .CK(i_ref_clk), 
        .RN(n5), .Q(count[6]) );
  SDFFRQX2M \count_reg[5]  ( .D(n64), .SI(n80), .SE(test_se), .CK(i_ref_clk), 
        .RN(n5), .Q(count[5]) );
  SDFFRQX2M \count_reg[4]  ( .D(n63), .SI(n82), .SE(test_se), .CK(i_ref_clk), 
        .RN(n5), .Q(count[4]) );
  SDFFRQX2M \count_reg[3]  ( .D(n62), .SI(n84), .SE(test_se), .CK(i_ref_clk), 
        .RN(n5), .Q(count[3]) );
  SDFFRQX2M \count_reg[2]  ( .D(n61), .SI(n83), .SE(test_se), .CK(i_ref_clk), 
        .RN(n5), .Q(count[2]) );
  SDFFRQX2M \count_reg[1]  ( .D(n60), .SI(count[0]), .SE(test_se), .CK(
        i_ref_clk), .RN(n5), .Q(count[1]) );
  SDFFRQX1M \count_reg[0]  ( .D(n59), .SI(test_si), .SE(test_se), .CK(
        i_ref_clk), .RN(n5), .Q(count[0]) );
  INVXLM U5 ( .A(count[0]), .Y(n1) );
  INVX4M U6 ( .A(n1), .Y(n2) );
  NOR4X2M U15 ( .A(n46), .B(n47), .C(n48), .D(n49), .Y(n45) );
  NOR2X4M U16 ( .A(n17), .B(i_div_ratio[4]), .Y(n18) );
  AND3X4M U17 ( .A(n24), .B(n25), .C(n58), .Y(n23) );
  OR2X2M U18 ( .A(n16), .B(i_div_ratio[3]), .Y(n17) );
  OAI2BB1XLM U19 ( .A0N(n16), .A1N(i_div_ratio[3]), .B0(n17), .Y(
        edge_flip_half[2]) );
  NAND2BX2M U20 ( .AN(i_div_ratio[2]), .B(edge_flip_half[0]), .Y(n16) );
  OAI2BB1XLM U21 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n16), .Y(
        edge_flip_half[1]) );
  NAND4X2M U22 ( .A(n42), .B(n43), .C(n44), .D(n45), .Y(n36) );
  AO22XLM U23 ( .A0(n4), .A1(n83), .B0(N17), .B1(n23), .Y(n60) );
  AO22XLM U24 ( .A0(n4), .A1(n84), .B0(N18), .B1(n23), .Y(n61) );
  AO22XLM U25 ( .A0(n4), .A1(n82), .B0(N19), .B1(n23), .Y(n62) );
  AO22XLM U26 ( .A0(n4), .A1(n80), .B0(N20), .B1(n23), .Y(n63) );
  AO22XLM U27 ( .A0(n4), .A1(n81), .B0(N21), .B1(n23), .Y(n64) );
  AO22XLM U28 ( .A0(n79), .A1(n4), .B0(N22), .B1(n23), .Y(n65) );
  INVX2M U29 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  INVX6M U30 ( .A(n15), .Y(n5) );
  INVX2M U31 ( .A(i_rst), .Y(n15) );
  CLKBUFX6M U32 ( .A(n22), .Y(n4) );
  OAI21X2M U33 ( .A0(n38), .A1(n39), .B0(i_clk_en), .Y(n22) );
  INVX2M U34 ( .A(i_div_ratio[5]), .Y(n21) );
  MX2XLM U35 ( .A(i_ref_clk), .B(n85), .S0(n58), .Y(o_div_clk) );
  AO21XLM U36 ( .A0(n17), .A1(i_div_ratio[4]), .B0(n18), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U37 ( .A(n18), .B(n21), .Y(n19) );
  OAI21X1M U38 ( .A0(n18), .A1(n21), .B0(n19), .Y(edge_flip_half[4]) );
  XNOR2X1M U39 ( .A(i_div_ratio[6]), .B(n19), .Y(edge_flip_half[5]) );
  NOR2X1M U40 ( .A(i_div_ratio[6]), .B(n19), .Y(n20) );
  CLKXOR2X2M U41 ( .A(i_div_ratio[7]), .B(n20), .Y(edge_flip_half[6]) );
  AO22X1M U42 ( .A0(n4), .A1(n2), .B0(N16), .B1(n23), .Y(n59) );
  CLKINVX1M U43 ( .A(n4), .Y(n58) );
  CLKXOR2X2M U44 ( .A(n35), .B(div_clk), .Y(n66) );
  AOI21X1M U45 ( .A0(n25), .A1(n24), .B0(n4), .Y(n35) );
  OR2X1M U46 ( .A(n36), .B(i_div_ratio[0]), .Y(n24) );
  XNOR2X1M U47 ( .A(odd_edge_tog), .B(n37), .Y(n67) );
  OR2X1M U48 ( .A(n25), .B(n4), .Y(n37) );
  OR3X1M U49 ( .A(i_div_ratio[2]), .B(i_div_ratio[3]), .C(i_div_ratio[1]), .Y(
        n39) );
  OR4X1M U50 ( .A(i_div_ratio[4]), .B(i_div_ratio[5]), .C(i_div_ratio[6]), .D(
        i_div_ratio[7]), .Y(n38) );
  CLKNAND2X2M U51 ( .A(n40), .B(i_div_ratio[0]), .Y(n25) );
  MXI2X1M U52 ( .A(n41), .B(n36), .S0(odd_edge_tog), .Y(n40) );
  CLKXOR2X2M U53 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n49) );
  CLKXOR2X2M U54 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n48) );
  CLKXOR2X2M U55 ( .A(edge_flip_half[0]), .B(n2), .Y(n47) );
  CLKXOR2X2M U56 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n46) );
  XNOR2X1M U57 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n44) );
  XNOR2X1M U58 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n43) );
  XNOR2X1M U59 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n42) );
  NAND4X1M U60 ( .A(n50), .B(n51), .C(n52), .D(n53), .Y(n41) );
  NOR4X1M U61 ( .A(n54), .B(n55), .C(n56), .D(n57), .Y(n53) );
  CLKXOR2X2M U62 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n57) );
  CLKXOR2X2M U63 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n56) );
  CLKXOR2X2M U64 ( .A(i_div_ratio[1]), .B(n2), .Y(n55) );
  CLKXOR2X2M U65 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n54) );
  XNOR2X1M U66 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n52) );
  XNOR2X1M U67 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n51) );
  XNOR2X1M U68 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n50) );
  DLY1X1M U69 ( .A(count[6]), .Y(n79) );
  DLY1X1M U70 ( .A(count[4]), .Y(n80) );
  DLY1X1M U71 ( .A(count[5]), .Y(n81) );
  DLY1X1M U72 ( .A(count[3]), .Y(n82) );
  DLY1X1M U73 ( .A(count[1]), .Y(n83) );
  DLY1X1M U74 ( .A(count[2]), .Y(n84) );
  DLY1X1M U75 ( .A(div_clk), .Y(n85) );
  ClkDiv_1_DW01_inc_0 add_49 ( .A({count[6:1], n2}), .SUM({N22, N21, N20, N19, 
        N18, N17, N16}) );
endmodule


module sz_test_1 ( p_data, ser_data, ser_done, ser_en, clk, rst_n, test_se );
  input [7:0] p_data;
  input ser_en, clk, rst_n, test_se;
  output ser_data, ser_done;
  wire   N1, N2, N3, N6, n2, n4, n6, n8, n10, n12, n14, n16, n1, n3, n5, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n28, n29, n30, n31, n32,
         n33;

  SDFFRQX2M ser_data_reg ( .D(n10), .SI(N3), .SE(n29), .CK(clk), .RN(n1), .Q(
        ser_data) );
  SDFFRQX2M \counter_reg[2]  ( .D(n12), .SI(N2), .SE(n28), .CK(clk), .RN(n1), 
        .Q(N3) );
  SDFFRQX4M \counter_reg[0]  ( .D(n16), .SI(p_data[7]), .SE(n28), .CK(clk), 
        .RN(n1), .Q(N1) );
  SDFFRQX2M \counter_reg[1]  ( .D(n14), .SI(N1), .SE(n30), .CK(clk), .RN(n1), 
        .Q(N2) );
  SDFFRQX2M ser_done_reg ( .D(n8), .SI(ser_data), .SE(n29), .CK(clk), .RN(n1), 
        .Q(ser_done) );
  INVX4M U3 ( .A(n3), .Y(n1) );
  INVX2M U4 ( .A(rst_n), .Y(n3) );
  CLKINVX1M U5 ( .A(ser_en), .Y(n24) );
  CLKXOR2X2M U6 ( .A(n25), .B(n2), .Y(n14) );
  NAND2X2M U7 ( .A(ser_en), .B(N1), .Y(n2) );
  OAI31X2M U8 ( .A0(n26), .A1(n2), .A2(n25), .B0(n4), .Y(n8) );
  INVX2M U9 ( .A(N3), .Y(n26) );
  NAND2X2M U10 ( .A(n31), .B(n24), .Y(n4) );
  CLKXOR2X2M U11 ( .A(n6), .B(N3), .Y(n12) );
  NOR2X2M U12 ( .A(n2), .B(n25), .Y(n6) );
  AO22XLM U13 ( .A0(ser_data), .A1(n24), .B0(N6), .B1(ser_en), .Y(n10) );
  XOR2X1M U19 ( .A(ser_en), .B(N1), .Y(n16) );
  INVX2M U20 ( .A(N1), .Y(n23) );
  INVX2M U21 ( .A(n32), .Y(n22) );
  INVX2M U22 ( .A(N2), .Y(n25) );
  AOI22X1M U23 ( .A0(p_data[2]), .A1(n23), .B0(p_data[3]), .B1(N1), .Y(n17) );
  AOI22X1M U24 ( .A0(p_data[0]), .A1(n23), .B0(p_data[1]), .B1(N1), .Y(n5) );
  OA22X1M U25 ( .A0(n22), .A1(n17), .B0(N2), .B1(n5), .Y(n21) );
  AOI22X1M U26 ( .A0(p_data[6]), .A1(n23), .B0(p_data[7]), .B1(N1), .Y(n19) );
  AOI22X1M U27 ( .A0(p_data[4]), .A1(n23), .B0(p_data[5]), .B1(N1), .Y(n18) );
  OAI22X1M U28 ( .A0(n19), .A1(n22), .B0(N2), .B1(n18), .Y(n20) );
  OAI2BB2X1M U29 ( .B0(n21), .B1(N3), .A0N(n33), .A1N(n20), .Y(N6) );
  DLY1X1M U30 ( .A(test_se), .Y(n28) );
  DLY1X1M U31 ( .A(test_se), .Y(n29) );
  DLY1X1M U32 ( .A(test_se), .Y(n30) );
  DLY1X1M U33 ( .A(ser_done), .Y(n31) );
  INVXLM U34 ( .A(n25), .Y(n32) );
  INVXLM U35 ( .A(n26), .Y(n33) );
endmodule


module FSM_test_1 ( mux_sel, data_valid, parity_en, ser_en, ser_done, clk, 
        rst_n, busy, test_so, test_se );
  output [1:0] mux_sel;
  input data_valid, parity_en, ser_done, clk, rst_n, test_se;
  output ser_en, busy, test_so;
  wire   n16, n9, n10, n11, n12, n13, n5, n6, n7, n8, n14, n15, n18, n19;
  wire   [2:0] cs;
  wire   [2:0] ns;
  assign test_so = cs[2];

  SDFFRQX2M \cs_reg[2]  ( .D(ns[2]), .SI(cs[1]), .SE(test_se), .CK(clk), .RN(
        n5), .Q(cs[2]) );
  SDFFRQX4M \cs_reg[1]  ( .D(n6), .SI(cs[0]), .SE(test_se), .CK(clk), .RN(n5), 
        .Q(cs[1]) );
  SDFFRQX2M \cs_reg[0]  ( .D(ns[0]), .SI(ser_done), .SE(test_se), .CK(clk), 
        .RN(n5), .Q(cs[0]) );
  OAI32X2M U6 ( .A0(n7), .A1(cs[2]), .A2(cs[1]), .B0(n18), .B1(n9), .Y(n16) );
  BUFX4M U7 ( .A(n16), .Y(ser_en) );
  BUFX2M U8 ( .A(rst_n), .Y(n5) );
  NAND2X2M U9 ( .A(n9), .B(n10), .Y(mux_sel[1]) );
  AO21X2M U10 ( .A0(n14), .A1(n12), .B0(mux_sel[1]), .Y(busy) );
  NAND3X4M U11 ( .A(n7), .B(n8), .C(cs[1]), .Y(n9) );
  INVX2M U12 ( .A(cs[2]), .Y(n8) );
  INVX2M U13 ( .A(cs[0]), .Y(n7) );
  XNOR2X4M U14 ( .A(cs[2]), .B(n7), .Y(n12) );
  NOR3X2M U15 ( .A(n12), .B(cs[0]), .C(n13), .Y(ns[0]) );
  AOI32X1M U16 ( .A0(ser_done), .A1(cs[1]), .A2(parity_en), .B0(data_valid), 
        .B1(n14), .Y(n13) );
  NAND3X2M U17 ( .A(n19), .B(n8), .C(cs[1]), .Y(n10) );
  INVX2M U18 ( .A(n11), .Y(n6) );
  AOI2B1X1M U19 ( .A1N(n9), .A0(parity_en), .B0(ser_en), .Y(n11) );
  OAI211X4M U20 ( .A0(cs[1]), .A1(cs[0]), .B0(n10), .C0(n8), .Y(mux_sel[0]) );
  OAI31X2M U21 ( .A0(n15), .A1(parity_en), .A2(n9), .B0(n10), .Y(ns[2]) );
  INVX2M U22 ( .A(ser_done), .Y(n15) );
  INVX2M U23 ( .A(cs[1]), .Y(n14) );
  INVXLM U24 ( .A(n15), .Y(n18) );
  INVXLM U25 ( .A(n7), .Y(n19) );
endmodule


module parity ( p_data, parity_type, data_valid, parity_bit );
  input [7:0] p_data;
  input parity_type, data_valid;
  output parity_bit;
  wire   n1, n2, n3, n4;

  XNOR2X2M U1 ( .A(p_data[7]), .B(p_data[6]), .Y(n4) );
  XOR3XLM U2 ( .A(parity_type), .B(n1), .C(n2), .Y(parity_bit) );
  XOR3XLM U3 ( .A(p_data[1]), .B(p_data[0]), .C(n3), .Y(n2) );
  XOR3XLM U4 ( .A(p_data[5]), .B(p_data[4]), .C(n4), .Y(n1) );
  XNOR2X2M U5 ( .A(p_data[3]), .B(p_data[2]), .Y(n3) );
endmodule


module mux_test_1 ( mux_sel, start_bit, stop_bit, ser_data, parity_bit, tx_out, 
        clk, rst_n, test_si, test_se );
  input [1:0] mux_sel;
  input start_bit, stop_bit, ser_data, parity_bit, clk, rst_n, test_si,
         test_se;
  output tx_out;
  wire   tx_out_int, n3, n4, n2;

  SDFFSQX2M tx_out_reg ( .D(tx_out_int), .SI(test_si), .SE(test_se), .CK(clk), 
        .SN(rst_n), .Q(tx_out) );
  OAI2B2X1M U4 ( .A1N(mux_sel[1]), .A0(n3), .B0(mux_sel[1]), .B1(n4), .Y(
        tx_out_int) );
  AOI22X1M U5 ( .A0(start_bit), .A1(n2), .B0(stop_bit), .B1(mux_sel[0]), .Y(n4) );
  AOI22X1M U6 ( .A0(ser_data), .A1(n2), .B0(parity_bit), .B1(mux_sel[0]), .Y(
        n3) );
  INVX2M U7 ( .A(mux_sel[0]), .Y(n2) );
endmodule


module uart_top_DATA_WIDTH8_test_1 ( p_data, data_valid, parity_type, 
        parity_en, clk, rst_n, tx_out, busy, test_si2, test_si1, test_so1, 
        test_se );
  input [7:0] p_data;
  input data_valid, parity_type, parity_en, clk, rst_n, test_si2, test_si1,
         test_se;
  output tx_out, busy, test_so1;
  wire   ser_data, ser_done, ser_en, parity_bit, n1, n4, n6, n8, n10, n12, n14,
         n16, n18, n2, n19, n20, n25, n26, n27, n28, n29, n30, n31, n32;
  wire   [7:0] data_reg;
  wire   [1:0] mux_sel;

  SDFFRQX2M \data_reg_reg[5]  ( .D(n12), .SI(data_reg[4]), .SE(n32), .CK(clk), 
        .RN(n2), .Q(data_reg[5]) );
  SDFFRQX2M \data_reg_reg[1]  ( .D(n4), .SI(data_reg[0]), .SE(n32), .CK(clk), 
        .RN(n2), .Q(data_reg[1]) );
  SDFFRQX2M \data_reg_reg[0]  ( .D(n18), .SI(test_si1), .SE(n31), .CK(clk), 
        .RN(n2), .Q(data_reg[0]) );
  SDFFRQX2M \data_reg_reg[4]  ( .D(n10), .SI(data_reg[3]), .SE(n31), .CK(clk), 
        .RN(n2), .Q(data_reg[4]) );
  SDFFRQX2M \data_reg_reg[7]  ( .D(n16), .SI(data_reg[6]), .SE(n30), .CK(clk), 
        .RN(n2), .Q(data_reg[7]) );
  SDFFRQX2M \data_reg_reg[3]  ( .D(n8), .SI(data_reg[2]), .SE(n30), .CK(clk), 
        .RN(n2), .Q(data_reg[3]) );
  SDFFRQX2M \data_reg_reg[6]  ( .D(n14), .SI(data_reg[5]), .SE(n28), .CK(clk), 
        .RN(n2), .Q(data_reg[6]) );
  SDFFRQX2M \data_reg_reg[2]  ( .D(n6), .SI(data_reg[1]), .SE(n29), .CK(clk), 
        .RN(n2), .Q(data_reg[2]) );
  INVX4M U3 ( .A(n1), .Y(n20) );
  NAND2BX8M U4 ( .AN(busy), .B(data_valid), .Y(n1) );
  INVX6M U5 ( .A(n19), .Y(n2) );
  INVX2M U6 ( .A(rst_n), .Y(n19) );
  AO22X1M U7 ( .A0(data_reg[1]), .A1(n1), .B0(p_data[1]), .B1(n20), .Y(n4) );
  AO22X1M U8 ( .A0(data_reg[2]), .A1(n1), .B0(p_data[2]), .B1(n20), .Y(n6) );
  AO22X1M U9 ( .A0(data_reg[3]), .A1(n1), .B0(p_data[3]), .B1(n20), .Y(n8) );
  AO22X1M U10 ( .A0(data_reg[4]), .A1(n1), .B0(p_data[4]), .B1(n20), .Y(n10)
         );
  AO22X1M U11 ( .A0(data_reg[5]), .A1(n1), .B0(p_data[5]), .B1(n20), .Y(n12)
         );
  AO22X1M U12 ( .A0(data_reg[6]), .A1(n1), .B0(p_data[6]), .B1(n20), .Y(n14)
         );
  AO22X1M U21 ( .A0(data_reg[7]), .A1(n1), .B0(p_data[7]), .B1(n20), .Y(n16)
         );
  AO22X1M U22 ( .A0(data_reg[0]), .A1(n1), .B0(p_data[0]), .B1(n20), .Y(n18)
         );
  DLY1X1M U23 ( .A(n27), .Y(n25) );
  INVXLM U24 ( .A(n25), .Y(n26) );
  INVXLM U25 ( .A(test_se), .Y(n27) );
  INVXLM U26 ( .A(n25), .Y(n28) );
  DLY1X1M U27 ( .A(n26), .Y(n29) );
  DLY1X1M U28 ( .A(test_se), .Y(n30) );
  DLY1X1M U29 ( .A(test_se), .Y(n31) );
  DLY1X1M U30 ( .A(test_se), .Y(n32) );
  sz_test_1 m1 ( .p_data(data_reg), .ser_data(ser_data), .ser_done(ser_done), 
        .ser_en(ser_en), .clk(clk), .rst_n(n2), .test_se(test_se) );
  FSM_test_1 m2 ( .mux_sel(mux_sel), .data_valid(data_valid), .parity_en(
        parity_en), .ser_en(ser_en), .ser_done(ser_done), .clk(clk), .rst_n(n2), .busy(busy), .test_so(test_so1), .test_se(test_se) );
  parity m3 ( .p_data(data_reg), .parity_type(parity_type), .data_valid(
        data_valid), .parity_bit(parity_bit) );
  mux_test_1 m4 ( .mux_sel(mux_sel), .start_bit(1'b0), .stop_bit(1'b1), 
        .ser_data(ser_data), .parity_bit(parity_bit), .tx_out(tx_out), .clk(
        clk), .rst_n(n2), .test_si(test_si2), .test_se(n29) );
endmodule


module fsm_test_1 ( clk, rst_n, rx_in, edge_cnt, bit_cnt, par_en, par_err, 
        strt_glitch, stp_error, enable, data_valid, deser_en, stp_chk_en, 
        strt_chk_en, par_chk_en, dat_samp_en, prescale, test_so, test_se );
  input [4:0] edge_cnt;
  input [3:0] bit_cnt;
  input [5:0] prescale;
  input clk, rst_n, rx_in, par_en, par_err, strt_glitch, stp_error, test_se;
  output enable, data_valid, deser_en, stp_chk_en, strt_chk_en, par_chk_en,
         dat_samp_en, test_so;
  wire   N34, N35, N36, N37, N38, N39, N40, N41, N48, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n1, n2, n3, n4, n5, n6, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78;
  wire   [2:0] cs;
  wire   [2:0] ns;
  assign test_so = cs[2];

  NOR4BX4M U50 ( .AN(n61), .B(cs[2]), .C(cs[0]), .D(cs[1]), .Y(n56) );
  SDFFRQX2M \cs_reg[1]  ( .D(ns[1]), .SI(cs[0]), .SE(test_se), .CK(clk), .RN(
        n3), .Q(cs[1]) );
  SDFFRQX2M \cs_reg[0]  ( .D(ns[0]), .SI(edge_cnt[4]), .SE(test_se), .CK(clk), 
        .RN(n3), .Q(cs[0]) );
  SDFFRQX4M \cs_reg[2]  ( .D(ns[2]), .SI(cs[1]), .SE(test_se), .CK(clk), .RN(
        n3), .Q(cs[2]) );
  NOR4X2M U4 ( .A(n18), .B(n17), .C(n16), .D(n15), .Y(N41) );
  NOR2BX2M U5 ( .AN(edge_cnt[0]), .B(n1), .Y(n20) );
  NOR2X2M U6 ( .A(n10), .B(prescale[5]), .Y(N40) );
  OR2X2M U9 ( .A(n6), .B(prescale[4]), .Y(n10) );
  OAI2BB1XLM U10 ( .A0N(n6), .A1N(prescale[4]), .B0(n10), .Y(N38) );
  NOR2BX2M U11 ( .AN(n1), .B(edge_cnt[0]), .Y(n19) );
  OR2X2M U12 ( .A(n5), .B(prescale[3]), .Y(n6) );
  OAI2BB1XLM U13 ( .A0N(n5), .A1N(prescale[3]), .B0(n6), .Y(N37) );
  OR2X2M U14 ( .A(n4), .B(n2), .Y(n5) );
  OAI2BB1XLM U15 ( .A0N(n4), .A1N(n2), .B0(n5), .Y(N36) );
  NAND2BX2M U16 ( .AN(n1), .B(N34), .Y(n4) );
  NOR2BX2M U17 ( .AN(N34), .B(edge_cnt[0]), .Y(n12) );
  NOR2BX2M U18 ( .AN(edge_cnt[0]), .B(N34), .Y(n11) );
  NOR2BX2M U19 ( .AN(n57), .B(n34), .Y(n55) );
  NOR3X4M U20 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .C(n59), .Y(n57) );
  OAI21X2M U21 ( .A0(n30), .A1(n31), .B0(n64), .Y(stp_chk_en) );
  NOR2X2M U22 ( .A(n73), .B(par_err), .Y(n46) );
  NAND2BX2M U23 ( .AN(n32), .B(n33), .Y(par_chk_en) );
  INVX2M U24 ( .A(par_en), .Y(n77) );
  NOR3X6M U25 ( .A(cs[1]), .B(cs[2]), .C(n74), .Y(n29) );
  BUFX2M U26 ( .A(prescale[1]), .Y(n1) );
  BUFX2M U27 ( .A(prescale[2]), .Y(n2) );
  BUFX2M U28 ( .A(rst_n), .Y(n3) );
  INVX2M U29 ( .A(n55), .Y(n68) );
  NAND2X2M U30 ( .A(n64), .B(n36), .Y(ns[2]) );
  CLKINVX1M U31 ( .A(N41), .Y(n66) );
  NAND2X2M U32 ( .A(n62), .B(n27), .Y(strt_chk_en) );
  OAI21X2M U33 ( .A0(n28), .A1(n66), .B0(n29), .Y(n27) );
  OAI211X1M U34 ( .A0(N41), .A1(n42), .B0(n62), .C0(n45), .Y(ns[0]) );
  NOR2BX2M U35 ( .AN(n44), .B(n32), .Y(n45) );
  AOI22X2M U36 ( .A0(n52), .A1(n67), .B0(n54), .B1(n55), .Y(n48) );
  INVX2M U37 ( .A(n53), .Y(n67) );
  INVX2M U38 ( .A(n47), .Y(n62) );
  OAI31X2M U39 ( .A0(n31), .A1(rx_in), .A2(n48), .B0(n63), .Y(n47) );
  NOR3X4M U40 ( .A(n40), .B(n77), .C(n75), .Y(n32) );
  INVX2M U41 ( .A(n41), .Y(n75) );
  NAND4X2M U42 ( .A(n75), .B(n65), .C(n49), .D(n50), .Y(enable) );
  OAI211X2M U43 ( .A0(n54), .A1(n52), .B0(n78), .C0(n72), .Y(n49) );
  AND4X2M U44 ( .A(n63), .B(n36), .C(n39), .D(n42), .Y(n50) );
  INVX2M U45 ( .A(rx_in), .Y(n78) );
  NAND3X2M U46 ( .A(n54), .B(n68), .C(n72), .Y(n36) );
  NAND3X2M U47 ( .A(n52), .B(n53), .C(n72), .Y(n39) );
  INVX2M U48 ( .A(n37), .Y(n64) );
  OAI211X2M U49 ( .A0(n34), .A1(n65), .B0(n38), .C0(n39), .Y(n37) );
  NAND3BX2M U51 ( .AN(n40), .B(n77), .C(n41), .Y(n38) );
  NAND2BX2M U52 ( .AN(n28), .B(n29), .Y(n42) );
  INVX2M U53 ( .A(n56), .Y(n63) );
  INVX2M U54 ( .A(n31), .Y(n72) );
  INVX2M U55 ( .A(n35), .Y(n73) );
  INVX2M U56 ( .A(n46), .Y(n65) );
  NOR2X2M U57 ( .A(n48), .B(n31), .Y(data_valid) );
  NOR2X2M U58 ( .A(n56), .B(n29), .Y(n60) );
  NAND2X2M U59 ( .A(n46), .B(n34), .Y(n44) );
  INVX2M U60 ( .A(prescale[0]), .Y(N34) );
  OAI211X2M U61 ( .A0(n66), .A1(n42), .B0(n43), .C0(n44), .Y(ns[1]) );
  OAI21X2M U62 ( .A0(par_en), .A1(n40), .B0(n41), .Y(n43) );
  NAND4X2M U63 ( .A(n73), .B(n75), .C(n60), .D(n31), .Y(dat_samp_en) );
  INVX2M U64 ( .A(bit_cnt[1]), .Y(n70) );
  NAND3X2M U65 ( .A(bit_cnt[0]), .B(n57), .C(n58), .Y(n53) );
  NOR3BX2M U66 ( .AN(bit_cnt[3]), .B(bit_cnt[2]), .C(n70), .Y(n58) );
  NOR3X8M U67 ( .A(cs[0]), .B(cs[2]), .C(n76), .Y(n41) );
  OR3X1M U68 ( .A(edge_cnt[4]), .B(edge_cnt[3]), .C(edge_cnt[2]), .Y(n59) );
  NAND4X4M U69 ( .A(bit_cnt[3]), .B(bit_cnt[1]), .C(n69), .D(n71), .Y(n34) );
  NAND4X4M U70 ( .A(bit_cnt[0]), .B(bit_cnt[3]), .C(n70), .D(n71), .Y(n40) );
  AOI21X2M U71 ( .A0(n68), .A1(n77), .B0(stp_error), .Y(n30) );
  NOR2X4M U72 ( .A(n77), .B(stp_error), .Y(n52) );
  OAI21X2M U73 ( .A0(par_err), .A1(n34), .B0(n35), .Y(n33) );
  INVX2M U74 ( .A(bit_cnt[2]), .Y(n71) );
  INVX2M U75 ( .A(bit_cnt[0]), .Y(n69) );
  INVX2M U76 ( .A(cs[1]), .Y(n76) );
  AND3X2M U77 ( .A(N48), .B(n40), .C(n41), .Y(deser_en) );
  NOR2X2M U78 ( .A(stp_error), .B(rx_in), .Y(n61) );
  NOR3X4M U79 ( .A(n74), .B(cs[2]), .C(n76), .Y(n35) );
  NOR2X4M U80 ( .A(par_en), .B(stp_error), .Y(n54) );
  NAND3X4M U81 ( .A(n74), .B(n76), .C(cs[2]), .Y(n31) );
  INVX2M U82 ( .A(cs[0]), .Y(n74) );
  NAND4X2M U83 ( .A(n69), .B(n70), .C(n51), .D(n71), .Y(n28) );
  NOR2X2M U84 ( .A(strt_glitch), .B(bit_cnt[3]), .Y(n51) );
  OAI2BB1X1M U85 ( .A0N(prescale[0]), .A1N(n1), .B0(n4), .Y(N35) );
  AO21XLM U86 ( .A0(n10), .A1(prescale[5]), .B0(N40), .Y(N39) );
  OAI2B2X1M U87 ( .A1N(N35), .A0(n11), .B0(edge_cnt[1]), .B1(n11), .Y(n14) );
  OAI2B2X1M U88 ( .A1N(edge_cnt[1]), .A0(n12), .B0(N35), .B1(n12), .Y(n13) );
  NAND4BBX1M U89 ( .AN(N40), .BN(N39), .C(n14), .D(n13), .Y(n18) );
  CLKXOR2X2M U90 ( .A(N38), .B(edge_cnt[4]), .Y(n17) );
  CLKXOR2X2M U91 ( .A(N36), .B(edge_cnt[2]), .Y(n16) );
  CLKXOR2X2M U92 ( .A(N37), .B(edge_cnt[3]), .Y(n15) );
  CLKXOR2X2M U93 ( .A(prescale[3]), .B(edge_cnt[2]), .Y(n26) );
  OAI2B2X1M U94 ( .A1N(edge_cnt[1]), .A0(n19), .B0(n2), .B1(n19), .Y(n22) );
  OAI2B2X1M U95 ( .A1N(n2), .A0(n20), .B0(edge_cnt[1]), .B1(n20), .Y(n21) );
  CLKNAND2X2M U96 ( .A(n22), .B(n21), .Y(n25) );
  CLKXOR2X2M U97 ( .A(prescale[4]), .B(edge_cnt[3]), .Y(n24) );
  CLKXOR2X2M U98 ( .A(prescale[5]), .B(edge_cnt[4]), .Y(n23) );
  NOR4X1M U99 ( .A(n26), .B(n25), .C(n24), .D(n23), .Y(N48) );
endmodule


module edge_counter_test_1 ( clk, rst_n, edge_cnt, bit_cnt, enable, par_en, 
        prescale, test_si, test_se );
  output [4:0] edge_cnt;
  output [3:0] bit_cnt;
  input [5:0] prescale;
  input clk, rst_n, enable, par_en, test_si, test_se;
  wire   n45, N7, N8, N9, N10, N11, N12, N13, N14, N21, N22, N23, N24, N35,
         N36, N37, N38, N39, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, \add_21/carry[4] , \add_21/carry[3] ,
         \add_21/carry[2] , n2, n3, n4, n14, n15, n16, n17, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57;

  SDFFRHQX8M \edge_cnt_reg[4]  ( .D(N39), .SI(n56), .SE(n50), .CK(clk), .RN(n3), .Q(edge_cnt[4]) );
  SDFFRHQX8M \edge_cnt_reg[3]  ( .D(N38), .SI(n55), .SE(n51), .CK(clk), .RN(n3), .Q(edge_cnt[3]) );
  SDFFRHQX8M \edge_cnt_reg[2]  ( .D(N37), .SI(n53), .SE(n52), .CK(clk), .RN(n3), .Q(edge_cnt[2]) );
  SDFFRHQX8M \bit_cnt_reg[0]  ( .D(n31), .SI(test_si), .SE(n50), .CK(clk), 
        .RN(n3), .Q(bit_cnt[0]) );
  SDFFRHQX8M \bit_cnt_reg[3]  ( .D(n32), .SI(n57), .SE(n51), .CK(clk), .RN(n3), 
        .Q(bit_cnt[3]) );
  SDFFRHQX8M \bit_cnt_reg[1]  ( .D(n30), .SI(bit_cnt[0]), .SE(n52), .CK(clk), 
        .RN(n3), .Q(bit_cnt[1]) );
  SDFFRQX2M \edge_cnt_reg[0]  ( .D(N35), .SI(bit_cnt[3]), .SE(n48), .CK(clk), 
        .RN(n3), .Q(n45) );
  SDFFRQX2M \edge_cnt_reg[1]  ( .D(N36), .SI(n45), .SE(n48), .CK(clk), .RN(n3), 
        .Q(edge_cnt[1]) );
  SDFFRQX4M \bit_cnt_reg[2]  ( .D(n29), .SI(bit_cnt[1]), .SE(n49), .CK(clk), 
        .RN(n3), .Q(bit_cnt[2]) );
  NOR4X4M U7 ( .A(n40), .B(n39), .C(n38), .D(n37), .Y(N14) );
  NOR2X2M U8 ( .A(n17), .B(prescale[5]), .Y(N13) );
  OR2X2M U14 ( .A(n16), .B(prescale[4]), .Y(n17) );
  OAI2BB1XLM U15 ( .A0N(n16), .A1N(prescale[4]), .B0(n17), .Y(N11) );
  OR2X2M U16 ( .A(n15), .B(prescale[3]), .Y(n16) );
  OAI2BB1XLM U17 ( .A0N(n15), .A1N(prescale[3]), .B0(n16), .Y(N10) );
  OR2X2M U18 ( .A(n14), .B(prescale[2]), .Y(n15) );
  OAI2BB1XLM U19 ( .A0N(n14), .A1N(prescale[2]), .B0(n15), .Y(N9) );
  NAND2BX2M U20 ( .AN(prescale[1]), .B(N7), .Y(n14) );
  NOR2BX2M U21 ( .AN(edge_cnt[0]), .B(N7), .Y(n33) );
  NOR2BX2M U22 ( .AN(N7), .B(edge_cnt[0]), .Y(n34) );
  INVX2M U23 ( .A(n2), .Y(edge_cnt[0]) );
  OAI21X2M U24 ( .A0(bit_cnt[0]), .A1(n23), .B0(n42), .Y(n22) );
  NAND2X2M U25 ( .A(enable), .B(n27), .Y(n23) );
  INVX4M U26 ( .A(n4), .Y(n3) );
  INVX2M U27 ( .A(rst_n), .Y(n4) );
  INVX4M U28 ( .A(n24), .Y(n42) );
  NOR2BX2M U29 ( .AN(N21), .B(n42), .Y(N36) );
  NOR2X2M U30 ( .A(n23), .B(N14), .Y(n24) );
  NOR2BX2M U31 ( .AN(N22), .B(n42), .Y(N37) );
  NOR2BX2M U32 ( .AN(N23), .B(n42), .Y(N38) );
  NOR2BX2M U33 ( .AN(n2), .B(n42), .Y(N35) );
  INVX2M U34 ( .A(n23), .Y(n41) );
  ADDHX1M U35 ( .A(n53), .B(edge_cnt[0]), .CO(\add_21/carry[2] ), .S(N21) );
  OAI32X2M U36 ( .A0(n25), .A1(bit_cnt[3]), .A2(n21), .B0(n26), .B1(n44), .Y(
        n32) );
  INVX2M U37 ( .A(bit_cnt[3]), .Y(n44) );
  AOI21X2M U38 ( .A0(n41), .A1(n25), .B0(n22), .Y(n26) );
  NAND2X2M U39 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .Y(n25) );
  NAND3X2M U40 ( .A(bit_cnt[0]), .B(n42), .C(n41), .Y(n21) );
  INVX2M U41 ( .A(prescale[0]), .Y(N7) );
  OAI32X2M U42 ( .A0(n23), .A1(bit_cnt[0]), .A2(n24), .B0(n43), .B1(n42), .Y(
        n31) );
  OAI2BB2X1M U43 ( .B0(bit_cnt[1]), .B1(n21), .A0N(n22), .A1N(bit_cnt[1]), .Y(
        n30) );
  NOR2BX2M U44 ( .AN(N24), .B(n42), .Y(N39) );
  NOR2BX2M U45 ( .AN(enable), .B(n18), .Y(n29) );
  AOI21X2M U46 ( .A0(n57), .A1(n19), .B0(n20), .Y(n18) );
  AOI211X2M U47 ( .A0(par_en), .A1(bit_cnt[3]), .B0(n19), .C0(bit_cnt[2]), .Y(
        n20) );
  NAND3X2M U48 ( .A(bit_cnt[1]), .B(bit_cnt[0]), .C(N14), .Y(n19) );
  INVX2M U49 ( .A(n45), .Y(n2) );
  NAND4BX1M U50 ( .AN(bit_cnt[2]), .B(n28), .C(bit_cnt[1]), .D(bit_cnt[3]), 
        .Y(n27) );
  CLKXOR2X2M U51 ( .A(par_en), .B(n43), .Y(n28) );
  INVX2M U52 ( .A(bit_cnt[0]), .Y(n43) );
  ADDHX1M U53 ( .A(n55), .B(\add_21/carry[2] ), .CO(\add_21/carry[3] ), .S(N22) );
  ADDHX1M U54 ( .A(n56), .B(\add_21/carry[3] ), .CO(\add_21/carry[4] ), .S(N23) );
  OAI2BB1X1M U55 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n14), .Y(N8) );
  AO21XLM U56 ( .A0(n17), .A1(prescale[5]), .B0(N13), .Y(N12) );
  CLKXOR2X2M U57 ( .A(\add_21/carry[4] ), .B(n54), .Y(N24) );
  OAI2B2X1M U58 ( .A1N(N8), .A0(n33), .B0(edge_cnt[1]), .B1(n33), .Y(n36) );
  OAI2B2X1M U59 ( .A1N(edge_cnt[1]), .A0(n34), .B0(N8), .B1(n34), .Y(n35) );
  NAND4BBX1M U60 ( .AN(N13), .BN(N12), .C(n36), .D(n35), .Y(n40) );
  CLKXOR2X2M U61 ( .A(N11), .B(n54), .Y(n39) );
  CLKXOR2X2M U62 ( .A(N9), .B(edge_cnt[2]), .Y(n38) );
  CLKXOR2X2M U63 ( .A(N10), .B(edge_cnt[3]), .Y(n37) );
  DLY1X1M U64 ( .A(n49), .Y(n48) );
  DLY1X1M U65 ( .A(test_se), .Y(n49) );
  DLY1X1M U66 ( .A(test_se), .Y(n50) );
  DLY1X1M U67 ( .A(test_se), .Y(n51) );
  DLY1X1M U68 ( .A(test_se), .Y(n52) );
  DLY1X1M U69 ( .A(edge_cnt[1]), .Y(n53) );
  DLY1X1M U70 ( .A(edge_cnt[4]), .Y(n54) );
  DLY1X1M U71 ( .A(edge_cnt[2]), .Y(n55) );
  DLY1X1M U72 ( .A(edge_cnt[3]), .Y(n56) );
  DLY1X1M U73 ( .A(bit_cnt[2]), .Y(n57) );
endmodule


module sample_test_1 ( clk, rst_n, dat_samp_en, prescale, edge_cnt, rx_in, 
        sampled_bit, test_si, test_se );
  input [5:0] prescale;
  input [4:0] edge_cnt;
  input clk, rst_n, dat_samp_en, rx_in, test_si, test_se;
  output sampled_bit;
  wire   N1, N2, N4, N5, N6, N8, N10, N11, N12, N13, N14, N15, n1, n3,
         \sub_13/carry[5] , \sub_13/carry[4] , \sub_13/carry[3] , n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44;
  assign N2 = prescale[1];

  OAI31X4M U4 ( .A0(N1), .A1(N8), .A2(N15), .B0(dat_samp_en), .Y(n1) );
  SDFFSQX4M sampled_bit_reg ( .D(n3), .SI(test_si), .SE(test_se), .CK(clk), 
        .SN(rst_n), .Q(sampled_bit) );
  NOR4X2M U3 ( .A(n36), .B(n35), .C(n34), .D(n33), .Y(N8) );
  NOR4X2M U6 ( .A(n44), .B(n43), .C(n42), .D(n41), .Y(N15) );
  NOR4X2M U7 ( .A(n28), .B(n27), .C(n26), .D(n25), .Y(N1) );
  NOR3X4M U8 ( .A(n14), .B(n16), .C(n19), .Y(N14) );
  OR2X2M U9 ( .A(n18), .B(n12), .Y(n19) );
  NAND2BX2M U10 ( .AN(n10), .B(n9), .Y(n18) );
  OAI2BB1XLM U11 ( .A0N(n18), .A1N(n12), .B0(n19), .Y(N11) );
  NOR2BX2M U12 ( .AN(n8), .B(n4), .Y(n21) );
  NOR2BX2M U13 ( .AN(n8), .B(n4), .Y(n29) );
  NOR2BX2M U14 ( .AN(n4), .B(n8), .Y(n30) );
  NOR2BX2M U15 ( .AN(n9), .B(n4), .Y(n37) );
  NOR2BX2M U16 ( .AN(n4), .B(n9), .Y(n38) );
  NOR2BX2M U17 ( .AN(n4), .B(n8), .Y(n22) );
  INVX2M U18 ( .A(N2), .Y(n9) );
  INVX4M U19 ( .A(n11), .Y(n10) );
  INVX4M U20 ( .A(n9), .Y(n8) );
  INVX2M U21 ( .A(prescale[2]), .Y(n11) );
  INVX4M U22 ( .A(n13), .Y(n12) );
  INVX2M U23 ( .A(prescale[3]), .Y(n13) );
  NAND3X2M U24 ( .A(\sub_13/carry[5] ), .B(n32), .C(n31), .Y(n36) );
  INVX4M U25 ( .A(n17), .Y(n16) );
  INVX2M U26 ( .A(prescale[5]), .Y(n17) );
  INVX4M U27 ( .A(n15), .Y(n14) );
  INVX2M U28 ( .A(prescale[4]), .Y(n15) );
  INVX4M U29 ( .A(n5), .Y(n4) );
  INVX2M U30 ( .A(edge_cnt[0]), .Y(n5) );
  INVX4M U31 ( .A(n7), .Y(n6) );
  INVX2M U32 ( .A(edge_cnt[1]), .Y(n7) );
  AO2B2X2M U33 ( .B0(sampled_bit), .B1(n1), .A0(rx_in), .A1N(n1), .Y(n3) );
  OR2X1M U34 ( .A(n16), .B(\sub_13/carry[4] ), .Y(\sub_13/carry[5] ) );
  XNOR2X1M U35 ( .A(\sub_13/carry[4] ), .B(n16), .Y(N6) );
  OR2X1M U36 ( .A(n14), .B(\sub_13/carry[3] ), .Y(\sub_13/carry[4] ) );
  XNOR2X1M U37 ( .A(\sub_13/carry[3] ), .B(n14), .Y(N5) );
  OR2X1M U38 ( .A(n12), .B(n10), .Y(\sub_13/carry[3] ) );
  XNOR2X1M U39 ( .A(n10), .B(n12), .Y(N4) );
  OAI2BB1X1M U40 ( .A0N(n8), .A1N(n10), .B0(n18), .Y(N10) );
  XNOR2X1M U41 ( .A(n14), .B(n19), .Y(N12) );
  OAI21X1M U42 ( .A0(n14), .A1(n19), .B0(n16), .Y(n20) );
  NAND2BX1M U43 ( .AN(N14), .B(n20), .Y(N13) );
  CLKXOR2X2M U44 ( .A(n12), .B(edge_cnt[2]), .Y(n28) );
  OAI2B2X1M U45 ( .A1N(n6), .A0(n21), .B0(n10), .B1(n21), .Y(n24) );
  OAI2B2X1M U46 ( .A1N(n10), .A0(n22), .B0(n6), .B1(n22), .Y(n23) );
  CLKNAND2X2M U47 ( .A(n24), .B(n23), .Y(n27) );
  CLKXOR2X2M U48 ( .A(n14), .B(edge_cnt[3]), .Y(n26) );
  CLKXOR2X2M U49 ( .A(n16), .B(edge_cnt[4]), .Y(n25) );
  OAI2B2X1M U50 ( .A1N(n6), .A0(n29), .B0(n11), .B1(n29), .Y(n32) );
  OAI2B2X1M U51 ( .A1N(n11), .A0(n30), .B0(n6), .B1(n30), .Y(n31) );
  CLKXOR2X2M U52 ( .A(N6), .B(edge_cnt[4]), .Y(n35) );
  CLKXOR2X2M U53 ( .A(N4), .B(edge_cnt[2]), .Y(n34) );
  CLKXOR2X2M U54 ( .A(N5), .B(edge_cnt[3]), .Y(n33) );
  OAI2B2X1M U55 ( .A1N(n6), .A0(n37), .B0(N10), .B1(n37), .Y(n40) );
  OAI2B2X1M U56 ( .A1N(N10), .A0(n38), .B0(n6), .B1(n38), .Y(n39) );
  NAND3BX1M U57 ( .AN(N14), .B(n40), .C(n39), .Y(n44) );
  CLKXOR2X2M U58 ( .A(N13), .B(edge_cnt[4]), .Y(n43) );
  CLKXOR2X2M U59 ( .A(N11), .B(edge_cnt[2]), .Y(n42) );
  CLKXOR2X2M U60 ( .A(N12), .B(edge_cnt[3]), .Y(n41) );
endmodule


module start_check_test_1 ( clk, rst_n, strt_chk_en, strt_glitch, sampled_bit, 
        edge_cnt, prescale, test_se );
  input [4:0] edge_cnt;
  input [5:0] prescale;
  input clk, rst_n, strt_chk_en, sampled_bit, test_se;
  output strt_glitch;
  wire   N6, N8, N9, N10, N11, N12, N13, N15, N16, N17, N18, N19, N20, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, \add_32/carry[4] , \add_32/carry[3] , \add_32/carry[2] , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n16, n17, n18, n19, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n71, n72, n73;
  wire   [1:0] correct_counter;
  wire   [1:0] error_counter;

  NAND4BX4M U21 ( .AN(n26), .B(n20), .C(n29), .D(n25), .Y(n27) );
  SDFFRQX2M \error_counter_reg[0]  ( .D(n35), .SI(correct_counter[1]), .SE(n72), .CK(clk), .RN(n37), .Q(error_counter[0]) );
  SDFFRQX2M \correct_counter_reg[1]  ( .D(n33), .SI(correct_counter[0]), .SE(
        n71), .CK(clk), .RN(n37), .Q(correct_counter[1]) );
  SDFFRQX2M \error_counter_reg[1]  ( .D(n34), .SI(error_counter[0]), .SE(n73), 
        .CK(clk), .RN(n37), .Q(error_counter[1]) );
  SDFFRQX2M \correct_counter_reg[0]  ( .D(n32), .SI(sampled_bit), .SE(n72), 
        .CK(clk), .RN(n37), .Q(correct_counter[0]) );
  SDFFRQX2M strt_glitch_reg ( .D(n31), .SI(error_counter[1]), .SE(n71), .CK(
        clk), .RN(n37), .Q(strt_glitch) );
  NOR3X4M U6 ( .A(n17), .B(n19), .C(n40), .Y(N12) );
  OR2X2M U7 ( .A(n39), .B(n10), .Y(n40) );
  NAND2BX2M U8 ( .AN(n8), .B(n6), .Y(n39) );
  NOR2BX2M U9 ( .AN(n5), .B(n1), .Y(n42) );
  NOR2BX2M U10 ( .AN(n7), .B(n1), .Y(n50) );
  NOR2BX2M U13 ( .AN(n7), .B(n1), .Y(n58) );
  NAND3BXLM U14 ( .AN(N12), .B(n53), .C(n52), .Y(n57) );
  NOR2BX2M U15 ( .AN(n1), .B(n6), .Y(n51) );
  NOR2BX2M U16 ( .AN(n1), .B(n5), .Y(n43) );
  NOR2BX2M U17 ( .AN(n1), .B(n6), .Y(n59) );
  OAI2BB1XLM U18 ( .A0N(n39), .A1N(n10), .B0(n40), .Y(N9) );
  BUFX2M U19 ( .A(n7), .Y(n6) );
  INVX2M U20 ( .A(n16), .Y(n10) );
  INVX2M U22 ( .A(n36), .Y(n19) );
  NOR2BX2M U23 ( .AN(n29), .B(sampled_bit), .Y(n26) );
  INVX2M U24 ( .A(n6), .Y(n5) );
  ADDHX2M U25 ( .A(n8), .B(n5), .CO(\add_32/carry[2] ), .S(N15) );
  ADDHX1M U26 ( .A(n17), .B(\add_32/carry[3] ), .CO(\add_32/carry[4] ), .S(N17) );
  ADDHX1M U27 ( .A(n10), .B(\add_32/carry[2] ), .CO(\add_32/carry[3] ), .S(N16) );
  ADDHX1M U28 ( .A(n19), .B(\add_32/carry[4] ), .CO(N19), .S(N18) );
  INVX4M U29 ( .A(n9), .Y(n8) );
  INVX2M U30 ( .A(prescale[2]), .Y(n9) );
  INVX2M U31 ( .A(prescale[1]), .Y(n7) );
  INVX2M U32 ( .A(prescale[3]), .Y(n16) );
  INVX2M U33 ( .A(prescale[5]), .Y(n36) );
  INVX4M U34 ( .A(n18), .Y(n17) );
  INVX2M U35 ( .A(prescale[4]), .Y(n18) );
  INVX4M U36 ( .A(n2), .Y(n1) );
  INVX2M U37 ( .A(edge_cnt[0]), .Y(n2) );
  INVX4M U38 ( .A(n38), .Y(n37) );
  INVX2M U39 ( .A(rst_n), .Y(n38) );
  NAND2X2M U40 ( .A(n24), .B(n27), .Y(n28) );
  NAND2X2M U41 ( .A(n24), .B(n23), .Y(n22) );
  INVX4M U42 ( .A(n4), .Y(n3) );
  INVX2M U43 ( .A(edge_cnt[1]), .Y(n4) );
  AND2X2M U44 ( .A(strt_chk_en), .B(n30), .Y(n20) );
  NAND3X2M U45 ( .A(n20), .B(n25), .C(n26), .Y(n23) );
  NAND2BX2M U46 ( .AN(n25), .B(n20), .Y(n21) );
  AND2X2M U47 ( .A(n21), .B(n30), .Y(n24) );
  OR3X2M U48 ( .A(N6), .B(N20), .C(N13), .Y(n29) );
  OAI32X2M U49 ( .A0(n66), .A1(error_counter[1]), .A2(n27), .B0(n69), .B1(n28), 
        .Y(n34) );
  INVX2M U50 ( .A(error_counter[1]), .Y(n69) );
  NAND3X2M U51 ( .A(correct_counter[1]), .B(n68), .C(strt_chk_en), .Y(n30) );
  OAI32X2M U52 ( .A0(n68), .A1(correct_counter[1]), .A2(n23), .B0(n67), .B1(
        n22), .Y(n33) );
  INVX2M U53 ( .A(correct_counter[1]), .Y(n67) );
  OAI22X1M U54 ( .A0(n66), .A1(n28), .B0(error_counter[0]), .B1(n27), .Y(n35)
         );
  OAI22X1M U55 ( .A0(n22), .A1(n68), .B0(correct_counter[0]), .B1(n23), .Y(n32) );
  OAI2BB1X2M U56 ( .A0N(strt_glitch), .A1N(n20), .B0(n21), .Y(n31) );
  INVX2M U57 ( .A(correct_counter[0]), .Y(n68) );
  NAND2X2M U58 ( .A(error_counter[1]), .B(n66), .Y(n25) );
  INVX2M U59 ( .A(error_counter[0]), .Y(n66) );
  OAI2BB1X1M U60 ( .A0N(n5), .A1N(n8), .B0(n39), .Y(N8) );
  XNOR2X1M U61 ( .A(n17), .B(n40), .Y(N10) );
  OAI21X1M U62 ( .A0(n17), .A1(n40), .B0(n19), .Y(n41) );
  NAND2BX1M U63 ( .AN(N12), .B(n41), .Y(N11) );
  CLKXOR2X2M U64 ( .A(n10), .B(edge_cnt[2]), .Y(n49) );
  OAI2B2X1M U65 ( .A1N(n3), .A0(n42), .B0(n8), .B1(n42), .Y(n45) );
  OAI2B2X1M U66 ( .A1N(n8), .A0(n43), .B0(n3), .B1(n43), .Y(n44) );
  CLKNAND2X2M U67 ( .A(n45), .B(n44), .Y(n48) );
  CLKXOR2X2M U68 ( .A(n17), .B(edge_cnt[3]), .Y(n47) );
  CLKXOR2X2M U69 ( .A(n19), .B(edge_cnt[4]), .Y(n46) );
  NOR4X1M U70 ( .A(n49), .B(n48), .C(n47), .D(n46), .Y(N6) );
  OAI2B2X1M U71 ( .A1N(n3), .A0(n50), .B0(N8), .B1(n50), .Y(n53) );
  OAI2B2X1M U72 ( .A1N(N8), .A0(n51), .B0(n3), .B1(n51), .Y(n52) );
  CLKXOR2X2M U73 ( .A(N11), .B(edge_cnt[4]), .Y(n56) );
  CLKXOR2X2M U74 ( .A(N9), .B(edge_cnt[2]), .Y(n55) );
  CLKXOR2X2M U75 ( .A(N10), .B(edge_cnt[3]), .Y(n54) );
  NOR4X1M U76 ( .A(n57), .B(n56), .C(n55), .D(n54), .Y(N13) );
  OAI2B2X1M U77 ( .A1N(n3), .A0(n58), .B0(N15), .B1(n58), .Y(n61) );
  OAI2B2X1M U78 ( .A1N(N15), .A0(n59), .B0(n3), .B1(n59), .Y(n60) );
  NAND3BX1M U79 ( .AN(N19), .B(n61), .C(n60), .Y(n65) );
  CLKXOR2X2M U80 ( .A(N18), .B(edge_cnt[4]), .Y(n64) );
  CLKXOR2X2M U81 ( .A(N16), .B(edge_cnt[2]), .Y(n63) );
  CLKXOR2X2M U82 ( .A(N17), .B(edge_cnt[3]), .Y(n62) );
  NOR4X1M U83 ( .A(n65), .B(n64), .C(n63), .D(n62), .Y(N20) );
  DLY1X1M U84 ( .A(test_se), .Y(n71) );
  DLY1X1M U85 ( .A(test_se), .Y(n72) );
  DLY1X1M U86 ( .A(test_se), .Y(n73) );
endmodule


module parity_check_test_1 ( clk, rst_n, par_chk_en, par_err, sampled_bit, 
        par_type, edge_cnt, prescale, bit_cnt, test_si, test_se );
  input [4:0] edge_cnt;
  input [5:0] prescale;
  input [3:0] bit_cnt;
  input clk, rst_n, par_chk_en, sampled_bit, par_type, test_si, test_se;
  output par_err;
  wire   N8, N15, N16, N17, N18, N19, N20, N22, N23, N24, N25, N26, N27, n32,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, \add_37/carry[4] ,
         \add_37/carry[3] , \add_37/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n24, n25, n26, n27, n28, n29, n30, n31, n33, n34, n35, n36,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n110, n112, n113,
         n114, n115, n116, n117, n118, n119, n120;
  wire   [7:0] data;
  wire   [1:0] correct_counter;
  wire   [1:0] error_counter;

  SDFFRQX2M \data_reg[0]  ( .D(n72), .SI(correct_counter[1]), .SE(n120), .CK(
        clk), .RN(n31), .Q(data[0]) );
  SDFFRQX2M \error_counter_reg[1]  ( .D(n71), .SI(error_counter[0]), .SE(n119), 
        .CK(clk), .RN(n31), .Q(error_counter[1]) );
  SDFFRQX2M \data_reg[2]  ( .D(n63), .SI(data[1]), .SE(n119), .CK(clk), .RN(
        n31), .Q(data[2]) );
  SDFFRQX2M \correct_counter_reg[0]  ( .D(n60), .SI(test_si), .SE(n118), .CK(
        clk), .RN(n31), .Q(correct_counter[0]) );
  SDFFRQX2M \correct_counter_reg[1]  ( .D(n69), .SI(correct_counter[0]), .SE(
        n118), .CK(clk), .RN(n31), .Q(correct_counter[1]) );
  SDFFRQX2M \error_counter_reg[0]  ( .D(n70), .SI(data[7]), .SE(n113), .CK(clk), .RN(n31), .Q(error_counter[0]) );
  SDFFRQX2M \data_reg[6]  ( .D(n67), .SI(data[5]), .SE(n116), .CK(clk), .RN(
        n31), .Q(data[6]) );
  SDFFRQX2M \data_reg[1]  ( .D(n62), .SI(data[0]), .SE(n117), .CK(clk), .RN(
        n31), .Q(data[1]) );
  SDFFRQX2M \data_reg[5]  ( .D(n66), .SI(data[4]), .SE(n113), .CK(clk), .RN(
        n31), .Q(data[5]) );
  SDFFRQX2M \data_reg[7]  ( .D(n68), .SI(data[6]), .SE(n116), .CK(clk), .RN(
        n31), .Q(data[7]) );
  SDFFRQX2M \data_reg[4]  ( .D(n65), .SI(n110), .SE(n117), .CK(clk), .RN(n31), 
        .Q(data[4]) );
  SDFFRX2M \data_reg[3]  ( .D(n64), .SI(data[2]), .SE(n115), .CK(clk), .RN(n31), .Q(n110), .QN(n32) );
  SDFFRQX4M par_err_reg ( .D(n61), .SI(error_counter[1]), .SE(n120), .CK(clk), 
        .RN(n31), .Q(par_err) );
  NOR4X2M U6 ( .A(n96), .B(n95), .C(n94), .D(n93), .Y(N27) );
  NOR4X2M U7 ( .A(n88), .B(n87), .C(n86), .D(n85), .Y(N20) );
  NAND3BX2M U8 ( .AN(N19), .B(n84), .C(n83), .Y(n88) );
  NOR3X4M U9 ( .A(N8), .B(N27), .C(N20), .Y(n46) );
  NOR4X4M U10 ( .A(n80), .B(n79), .C(n78), .D(n77), .Y(N8) );
  NOR3X4M U21 ( .A(n27), .B(n29), .C(n35), .Y(N19) );
  NOR2BX2M U22 ( .AN(n6), .B(n2), .Y(n73) );
  OR2X2M U23 ( .A(n34), .B(n25), .Y(n35) );
  NAND2BX2M U24 ( .AN(n10), .B(n7), .Y(n34) );
  NOR2BX2M U25 ( .AN(n9), .B(n2), .Y(n81) );
  NOR2BX2M U26 ( .AN(n8), .B(n2), .Y(n89) );
  NOR2BX2M U27 ( .AN(n2), .B(n6), .Y(n74) );
  NOR2BX2M U28 ( .AN(n2), .B(n7), .Y(n82) );
  NOR2BX2M U29 ( .AN(n2), .B(n7), .Y(n90) );
  OAI2BB1XLM U30 ( .A0N(n34), .A1N(n25), .B0(n35), .Y(N16) );
  BUFX2M U31 ( .A(n8), .Y(n7) );
  INVX2M U32 ( .A(n26), .Y(n25) );
  INVX2M U33 ( .A(n30), .Y(n29) );
  AND2X2M U34 ( .A(n49), .B(n1), .Y(n39) );
  NOR3X6M U35 ( .A(n104), .B(error_counter[0]), .C(n106), .Y(n45) );
  INVX2M U36 ( .A(n7), .Y(n6) );
  ADDHX2M U37 ( .A(n10), .B(n6), .CO(\add_37/carry[2] ), .S(N22) );
  ADDHX1M U38 ( .A(n27), .B(\add_37/carry[3] ), .CO(\add_37/carry[4] ), .S(N24) );
  ADDHX1M U39 ( .A(n25), .B(\add_37/carry[2] ), .CO(\add_37/carry[3] ), .S(N23) );
  ADDHX1M U40 ( .A(n29), .B(\add_37/carry[4] ), .CO(N26), .S(N25) );
  INVX4M U41 ( .A(n24), .Y(n10) );
  INVX2M U42 ( .A(prescale[2]), .Y(n24) );
  BUFX2M U43 ( .A(n9), .Y(n8) );
  INVX2M U44 ( .A(prescale[1]), .Y(n9) );
  INVX2M U45 ( .A(prescale[3]), .Y(n26) );
  INVX4M U46 ( .A(n3), .Y(n2) );
  INVX2M U47 ( .A(edge_cnt[0]), .Y(n3) );
  INVX2M U48 ( .A(prescale[5]), .Y(n30) );
  INVX4M U49 ( .A(n28), .Y(n27) );
  INVX2M U50 ( .A(prescale[4]), .Y(n28) );
  INVX6M U51 ( .A(n33), .Y(n31) );
  INVX2M U52 ( .A(rst_n), .Y(n33) );
  NAND2X2M U53 ( .A(n42), .B(n38), .Y(n37) );
  NAND2X2M U54 ( .A(n42), .B(n48), .Y(n47) );
  INVX4M U55 ( .A(n5), .Y(n4) );
  INVX2M U56 ( .A(edge_cnt[1]), .Y(n5) );
  NAND3X2M U57 ( .A(n43), .B(n39), .C(n44), .Y(n38) );
  NOR3X2M U58 ( .A(n106), .B(n45), .C(n46), .Y(n44) );
  OR4X2M U59 ( .A(n50), .B(n46), .C(n45), .D(n43), .Y(n48) );
  NAND2X2M U60 ( .A(par_chk_en), .B(n39), .Y(n50) );
  NAND2X2M U61 ( .A(n45), .B(n39), .Y(n40) );
  AND2X2M U62 ( .A(n40), .B(n49), .Y(n42) );
  INVX4M U63 ( .A(n1), .Y(n107) );
  OAI22X1M U64 ( .A0(n101), .A1(n1), .B0(n107), .B1(n102), .Y(n62) );
  OAI22X1M U65 ( .A0(n99), .A1(n1), .B0(n107), .B1(n100), .Y(n65) );
  OAI22X1M U66 ( .A0(n98), .A1(n1), .B0(n107), .B1(n99), .Y(n66) );
  OAI22X1M U67 ( .A0(n97), .A1(n1), .B0(n107), .B1(n98), .Y(n67) );
  INVX2M U68 ( .A(par_chk_en), .Y(n106) );
  OAI32X2M U69 ( .A0(n108), .A1(correct_counter[1]), .A2(n38), .B0(n105), .B1(
        n37), .Y(n69) );
  INVX2M U70 ( .A(correct_counter[1]), .Y(n105) );
  OAI32X2M U71 ( .A0(n103), .A1(error_counter[1]), .A2(n48), .B0(n104), .B1(
        n47), .Y(n71) );
  OAI22X1M U72 ( .A0(n37), .A1(n108), .B0(correct_counter[0]), .B1(n38), .Y(
        n60) );
  OAI22X1M U73 ( .A0(n47), .A1(n103), .B0(error_counter[0]), .B1(n48), .Y(n70)
         );
  CLKBUFX6M U74 ( .A(n41), .Y(n1) );
  NAND4X1M U75 ( .A(N8), .B(n56), .C(n57), .D(n58), .Y(n41) );
  OR4X1M U76 ( .A(bit_cnt[0]), .B(bit_cnt[1]), .C(bit_cnt[2]), .D(bit_cnt[3]), 
        .Y(n56) );
  NAND4BBX1M U77 ( .AN(bit_cnt[0]), .BN(bit_cnt[2]), .C(bit_cnt[1]), .D(
        bit_cnt[3]), .Y(n58) );
  OAI22X1M U78 ( .A0(n32), .A1(n1), .B0(n107), .B1(n101), .Y(n63) );
  OAI22X1M U79 ( .A0(n100), .A1(n1), .B0(n107), .B1(n32), .Y(n64) );
  OAI2BB2X1M U80 ( .B0(n107), .B1(n97), .A0N(sampled_bit), .A1N(n107), .Y(n68)
         );
  OAI2BB2X1M U81 ( .B0(n102), .B1(n1), .A0N(n1), .A1N(data[0]), .Y(n72) );
  OAI2BB1X2M U82 ( .A0N(par_err), .A1N(n39), .B0(n40), .Y(n61) );
  AOI31X2M U83 ( .A0(bit_cnt[3]), .A1(bit_cnt[0]), .A2(n59), .B0(par_chk_en), 
        .Y(n57) );
  NOR2X2M U84 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .Y(n59) );
  NAND3X2M U85 ( .A(par_chk_en), .B(n108), .C(correct_counter[1]), .Y(n49) );
  XOR3X2M U86 ( .A(n51), .B(n52), .C(n53), .Y(n43) );
  CLKXOR2X2M U87 ( .A(par_type), .B(data[2]), .Y(n52) );
  XOR3XLM U88 ( .A(data[1]), .B(data[0]), .C(n54), .Y(n53) );
  XOR3XLM U89 ( .A(data[6]), .B(data[5]), .C(n55), .Y(n51) );
  CLKXOR2X2M U90 ( .A(sampled_bit), .B(data[7]), .Y(n55) );
  CLKXOR2X2M U91 ( .A(n32), .B(data[4]), .Y(n54) );
  INVX2M U92 ( .A(correct_counter[0]), .Y(n108) );
  INVX2M U93 ( .A(error_counter[1]), .Y(n104) );
  INVX2M U94 ( .A(error_counter[0]), .Y(n103) );
  INVX2M U95 ( .A(data[7]), .Y(n97) );
  INVX2M U96 ( .A(data[2]), .Y(n101) );
  INVX2M U97 ( .A(data[4]), .Y(n100) );
  INVX2M U98 ( .A(data[5]), .Y(n99) );
  INVX2M U99 ( .A(data[6]), .Y(n98) );
  INVX2M U100 ( .A(data[1]), .Y(n102) );
  OAI2BB1X1M U101 ( .A0N(n6), .A1N(n10), .B0(n34), .Y(N15) );
  XNOR2X1M U102 ( .A(n27), .B(n35), .Y(N17) );
  OAI21X1M U103 ( .A0(n27), .A1(n35), .B0(n29), .Y(n36) );
  NAND2BX1M U104 ( .AN(N19), .B(n36), .Y(N18) );
  CLKXOR2X2M U105 ( .A(n25), .B(edge_cnt[2]), .Y(n80) );
  OAI2B2X1M U106 ( .A1N(n4), .A0(n73), .B0(n10), .B1(n73), .Y(n76) );
  OAI2B2X1M U107 ( .A1N(n10), .A0(n74), .B0(n4), .B1(n74), .Y(n75) );
  CLKNAND2X2M U108 ( .A(n76), .B(n75), .Y(n79) );
  CLKXOR2X2M U109 ( .A(n27), .B(edge_cnt[3]), .Y(n78) );
  CLKXOR2X2M U110 ( .A(n29), .B(edge_cnt[4]), .Y(n77) );
  OAI2B2X1M U111 ( .A1N(n4), .A0(n81), .B0(N15), .B1(n81), .Y(n84) );
  OAI2B2X1M U112 ( .A1N(N15), .A0(n82), .B0(n4), .B1(n82), .Y(n83) );
  CLKXOR2X2M U113 ( .A(N18), .B(edge_cnt[4]), .Y(n87) );
  CLKXOR2X2M U114 ( .A(N16), .B(edge_cnt[2]), .Y(n86) );
  CLKXOR2X2M U115 ( .A(N17), .B(edge_cnt[3]), .Y(n85) );
  OAI2B2X1M U116 ( .A1N(n4), .A0(n89), .B0(N22), .B1(n89), .Y(n92) );
  OAI2B2X1M U117 ( .A1N(N22), .A0(n90), .B0(n4), .B1(n90), .Y(n91) );
  NAND3BX1M U118 ( .AN(N26), .B(n92), .C(n91), .Y(n96) );
  CLKXOR2X2M U119 ( .A(N25), .B(edge_cnt[4]), .Y(n95) );
  CLKXOR2X2M U120 ( .A(N23), .B(edge_cnt[2]), .Y(n94) );
  CLKXOR2X2M U121 ( .A(N24), .B(edge_cnt[3]), .Y(n93) );
  DLY1X1M U122 ( .A(n114), .Y(n112) );
  DLY1X1M U123 ( .A(n115), .Y(n113) );
  DLY1X1M U124 ( .A(test_se), .Y(n114) );
  DLY1X1M U125 ( .A(test_se), .Y(n115) );
  DLY1X1M U126 ( .A(test_se), .Y(n116) );
  DLY1X1M U127 ( .A(test_se), .Y(n117) );
  DLY1X1M U128 ( .A(n112), .Y(n118) );
  DLY1X1M U129 ( .A(n114), .Y(n119) );
  DLY1X1M U130 ( .A(n112), .Y(n120) );
endmodule


module stop_check_test_1 ( clk, rst_n, stp_chk_en, stp_error, sampled_bit, 
        prescale, edge_cnt, test_si, test_se );
  input [5:0] prescale;
  input [4:0] edge_cnt;
  input clk, rst_n, stp_chk_en, sampled_bit, test_si, test_se;
  output stp_error;
  wire   N6, N8, N9, N10, N11, N12, N13, N15, N16, N17, N18, N19, N20, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, \add_31/carry[4] , \add_31/carry[3] , \add_31/carry[2] , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n16, n17, n18, n19, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n73, n74, n75;
  wire   [1:0] correct_counter;
  wire   [1:0] error_counter;

  SDFFRQX2M \error_counter_reg[0]  ( .D(n35), .SI(correct_counter[1]), .SE(n74), .CK(clk), .RN(n38), .Q(error_counter[0]) );
  SDFFRQX2M \correct_counter_reg[0]  ( .D(n32), .SI(test_si), .SE(n73), .CK(
        clk), .RN(n38), .Q(correct_counter[0]) );
  SDFFRQX2M \correct_counter_reg[1]  ( .D(n33), .SI(correct_counter[0]), .SE(
        n75), .CK(clk), .RN(n38), .Q(correct_counter[1]) );
  SDFFRQX2M \error_counter_reg[1]  ( .D(n34), .SI(error_counter[0]), .SE(n74), 
        .CK(clk), .RN(n38), .Q(error_counter[1]) );
  SDFFRQX4M stp_error_reg ( .D(n31), .SI(error_counter[1]), .SE(n73), .CK(clk), 
        .RN(n38), .Q(stp_error) );
  NOR3X4M U6 ( .A(n18), .B(n36), .C(n41), .Y(N12) );
  OR2X2M U7 ( .A(n40), .B(n16), .Y(n41) );
  NAND2BX2M U8 ( .AN(n9), .B(n6), .Y(n40) );
  NOR2BX2M U9 ( .AN(n5), .B(n1), .Y(n43) );
  NOR2BX2M U10 ( .AN(n7), .B(n1), .Y(n51) );
  NOR2BX2M U13 ( .AN(n8), .B(n1), .Y(n59) );
  NAND3BXLM U14 ( .AN(N12), .B(n54), .C(n53), .Y(n58) );
  NOR2BX2M U15 ( .AN(n1), .B(n6), .Y(n52) );
  NOR2BX2M U16 ( .AN(n1), .B(n5), .Y(n44) );
  NOR2BX2M U17 ( .AN(n1), .B(n6), .Y(n60) );
  OAI2BB1XLM U18 ( .A0N(n40), .A1N(n16), .B0(n41), .Y(N9) );
  BUFX2M U19 ( .A(n7), .Y(n6) );
  INVX2M U20 ( .A(n17), .Y(n16) );
  INVX2M U21 ( .A(n37), .Y(n36) );
  INVX2M U22 ( .A(n6), .Y(n5) );
  ADDHX2M U23 ( .A(n9), .B(n5), .CO(\add_31/carry[2] ), .S(N15) );
  ADDHX1M U24 ( .A(n18), .B(\add_31/carry[3] ), .CO(\add_31/carry[4] ), .S(N17) );
  ADDHX1M U25 ( .A(n16), .B(\add_31/carry[2] ), .CO(\add_31/carry[3] ), .S(N16) );
  ADDHX1M U26 ( .A(n36), .B(\add_31/carry[4] ), .CO(N19), .S(N18) );
  INVX4M U27 ( .A(n10), .Y(n9) );
  INVX2M U28 ( .A(prescale[2]), .Y(n10) );
  BUFX2M U29 ( .A(n8), .Y(n7) );
  INVX2M U30 ( .A(prescale[1]), .Y(n8) );
  INVX2M U31 ( .A(prescale[3]), .Y(n17) );
  INVX2M U32 ( .A(prescale[5]), .Y(n37) );
  INVX4M U33 ( .A(n19), .Y(n18) );
  INVX2M U34 ( .A(prescale[4]), .Y(n19) );
  INVX4M U35 ( .A(n2), .Y(n1) );
  INVX2M U36 ( .A(edge_cnt[0]), .Y(n2) );
  INVX4M U37 ( .A(n39), .Y(n38) );
  INVX2M U38 ( .A(rst_n), .Y(n39) );
  NAND2X2M U39 ( .A(n24), .B(n23), .Y(n22) );
  NAND2X2M U40 ( .A(n24), .B(n27), .Y(n28) );
  INVX4M U41 ( .A(n4), .Y(n3) );
  INVX2M U42 ( .A(edge_cnt[1]), .Y(n4) );
  NAND3BX2M U43 ( .AN(n25), .B(n20), .C(n26), .Y(n23) );
  NAND4X4M U44 ( .A(n20), .B(n29), .C(n25), .D(n26), .Y(n27) );
  OR3X2M U45 ( .A(N6), .B(N20), .C(N13), .Y(n29) );
  AND2X2M U46 ( .A(stp_chk_en), .B(n30), .Y(n20) );
  NAND2BX2M U47 ( .AN(n26), .B(n20), .Y(n21) );
  AND2X2M U48 ( .A(n21), .B(n30), .Y(n24) );
  OAI32X2M U49 ( .A0(n69), .A1(correct_counter[1]), .A2(n23), .B0(n68), .B1(
        n22), .Y(n33) );
  INVX2M U50 ( .A(correct_counter[1]), .Y(n68) );
  OAI32X2M U51 ( .A0(n67), .A1(error_counter[1]), .A2(n27), .B0(n70), .B1(n28), 
        .Y(n34) );
  INVX2M U52 ( .A(error_counter[1]), .Y(n70) );
  OAI22X1M U53 ( .A0(n22), .A1(n69), .B0(correct_counter[0]), .B1(n23), .Y(n32) );
  OAI22X1M U54 ( .A0(n67), .A1(n28), .B0(error_counter[0]), .B1(n27), .Y(n35)
         );
  NAND2X2M U55 ( .A(sampled_bit), .B(n29), .Y(n25) );
  NAND3X2M U56 ( .A(correct_counter[1]), .B(n69), .C(stp_chk_en), .Y(n30) );
  OAI2BB1X2M U57 ( .A0N(stp_error), .A1N(n20), .B0(n21), .Y(n31) );
  NAND2X2M U58 ( .A(error_counter[1]), .B(n67), .Y(n26) );
  INVX2M U59 ( .A(error_counter[0]), .Y(n67) );
  INVX2M U60 ( .A(correct_counter[0]), .Y(n69) );
  OAI2BB1X1M U61 ( .A0N(n5), .A1N(n9), .B0(n40), .Y(N8) );
  XNOR2X1M U62 ( .A(n18), .B(n41), .Y(N10) );
  OAI21X1M U63 ( .A0(n18), .A1(n41), .B0(n36), .Y(n42) );
  NAND2BX1M U64 ( .AN(N12), .B(n42), .Y(N11) );
  CLKXOR2X2M U65 ( .A(n16), .B(edge_cnt[2]), .Y(n50) );
  OAI2B2X1M U66 ( .A1N(n3), .A0(n43), .B0(n9), .B1(n43), .Y(n46) );
  OAI2B2X1M U67 ( .A1N(n9), .A0(n44), .B0(n3), .B1(n44), .Y(n45) );
  CLKNAND2X2M U68 ( .A(n46), .B(n45), .Y(n49) );
  CLKXOR2X2M U69 ( .A(n18), .B(edge_cnt[3]), .Y(n48) );
  CLKXOR2X2M U70 ( .A(n36), .B(edge_cnt[4]), .Y(n47) );
  NOR4X1M U71 ( .A(n50), .B(n49), .C(n48), .D(n47), .Y(N6) );
  OAI2B2X1M U72 ( .A1N(n3), .A0(n51), .B0(N8), .B1(n51), .Y(n54) );
  OAI2B2X1M U73 ( .A1N(N8), .A0(n52), .B0(n3), .B1(n52), .Y(n53) );
  CLKXOR2X2M U74 ( .A(N11), .B(edge_cnt[4]), .Y(n57) );
  CLKXOR2X2M U75 ( .A(N9), .B(edge_cnt[2]), .Y(n56) );
  CLKXOR2X2M U76 ( .A(N10), .B(edge_cnt[3]), .Y(n55) );
  NOR4X1M U77 ( .A(n58), .B(n57), .C(n56), .D(n55), .Y(N13) );
  OAI2B2X1M U78 ( .A1N(n3), .A0(n59), .B0(N15), .B1(n59), .Y(n62) );
  OAI2B2X1M U79 ( .A1N(N15), .A0(n60), .B0(n3), .B1(n60), .Y(n61) );
  NAND3BX1M U80 ( .AN(N19), .B(n62), .C(n61), .Y(n66) );
  CLKXOR2X2M U81 ( .A(N18), .B(edge_cnt[4]), .Y(n65) );
  CLKXOR2X2M U82 ( .A(N16), .B(edge_cnt[2]), .Y(n64) );
  CLKXOR2X2M U83 ( .A(N17), .B(edge_cnt[3]), .Y(n63) );
  NOR4X1M U84 ( .A(n66), .B(n65), .C(n64), .D(n63), .Y(N20) );
  DLY1X1M U85 ( .A(test_se), .Y(n73) );
  DLY1X1M U86 ( .A(test_se), .Y(n74) );
  DLY1X1M U87 ( .A(test_se), .Y(n75) );
endmodule


module desz_test_1 ( clk, rst_n, deser_en, sampled_bit, p_data, test_si, 
        test_se );
  output [7:0] p_data;
  input clk, rst_n, deser_en, sampled_bit, test_si, test_se;
  wire   n10, n12, n14, n16, n18, n20, n22, n24, n1, n2, n3, n4, n5, n6, n7,
         n8, n25, n26, n27, n30, n31, n32, n33;

  SDFFRQX2M \p_data_reg[0]  ( .D(n10), .SI(test_si), .SE(n33), .CK(clk), .RN(
        n2), .Q(p_data[0]) );
  SDFFRQX2M \p_data_reg[7]  ( .D(n24), .SI(p_data[6]), .SE(n32), .CK(clk), 
        .RN(n2), .Q(p_data[7]) );
  SDFFRQX2M \p_data_reg[6]  ( .D(n22), .SI(p_data[5]), .SE(n31), .CK(clk), 
        .RN(n2), .Q(p_data[6]) );
  SDFFRQX2M \p_data_reg[5]  ( .D(n20), .SI(p_data[4]), .SE(n30), .CK(clk), 
        .RN(n2), .Q(p_data[5]) );
  SDFFRQX2M \p_data_reg[4]  ( .D(n18), .SI(p_data[3]), .SE(n33), .CK(clk), 
        .RN(n2), .Q(p_data[4]) );
  SDFFRQX2M \p_data_reg[3]  ( .D(n16), .SI(p_data[2]), .SE(n32), .CK(clk), 
        .RN(n2), .Q(p_data[3]) );
  SDFFRQX2M \p_data_reg[2]  ( .D(n14), .SI(p_data[1]), .SE(n31), .CK(clk), 
        .RN(n2), .Q(p_data[2]) );
  SDFFRQX2M \p_data_reg[1]  ( .D(n12), .SI(p_data[0]), .SE(n30), .CK(clk), 
        .RN(n2), .Q(p_data[1]) );
  INVX4M U2 ( .A(n3), .Y(n2) );
  INVX2M U3 ( .A(rst_n), .Y(n3) );
  INVX4M U4 ( .A(n1), .Y(n27) );
  OAI22X1M U5 ( .A0(n27), .A1(n25), .B0(n1), .B1(n26), .Y(n12) );
  OAI22X1M U6 ( .A0(n27), .A1(n8), .B0(n1), .B1(n25), .Y(n14) );
  OAI22X1M U7 ( .A0(n27), .A1(n7), .B0(n1), .B1(n8), .Y(n16) );
  OAI22X1M U8 ( .A0(n27), .A1(n6), .B0(n1), .B1(n7), .Y(n18) );
  OAI22X1M U9 ( .A0(n27), .A1(n5), .B0(n1), .B1(n6), .Y(n20) );
  OAI22X1M U10 ( .A0(n27), .A1(n4), .B0(n1), .B1(n5), .Y(n22) );
  OAI2BB2X1M U11 ( .B0(n27), .B1(n26), .A0N(p_data[0]), .A1N(n27), .Y(n10) );
  OAI2BB2X1M U12 ( .B0(n1), .B1(n4), .A0N(sampled_bit), .A1N(n1), .Y(n24) );
  CLKBUFX6M U13 ( .A(deser_en), .Y(n1) );
  INVX2M U14 ( .A(p_data[1]), .Y(n26) );
  INVX2M U15 ( .A(p_data[7]), .Y(n4) );
  INVX2M U16 ( .A(p_data[2]), .Y(n25) );
  INVX2M U17 ( .A(p_data[3]), .Y(n8) );
  INVX2M U26 ( .A(p_data[4]), .Y(n7) );
  INVX2M U27 ( .A(p_data[5]), .Y(n6) );
  INVX2M U28 ( .A(p_data[6]), .Y(n5) );
  DLY1X1M U29 ( .A(test_se), .Y(n30) );
  DLY1X1M U30 ( .A(test_se), .Y(n31) );
  DLY1X1M U31 ( .A(test_se), .Y(n32) );
  DLY1X1M U32 ( .A(test_se), .Y(n33) );
endmodule


module uart_rx_top_test_1 ( clk, rst_n, par_en, rx_in, prescale, par_type, 
        data_valid, p_data, parity_error, framing_error, test_si, test_so, 
        test_se );
  input [5:0] prescale;
  output [7:0] p_data;
  input clk, rst_n, par_en, rx_in, par_type, test_si, test_se;
  output data_valid, parity_error, framing_error, test_so;
  wire   data_valid_int, stp_error, strt_glitch, enable, deser_en, stp_chk_en,
         strt_chk_en, par_chk_en, dat_samp_en, sampled_bit, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n19, n21, n22,
         n23, n24;
  wire   [4:0] edge_cnt;
  wire   [3:0] bit_cnt;
  assign test_so = stp_error;

  SDFFRQX2M data_valid_r_reg ( .D(data_valid_int), .SI(test_si), .SE(n22), 
        .CK(clk), .RN(n16), .Q(data_valid) );
  INVX4M U4 ( .A(n7), .Y(n6) );
  INVX4M U5 ( .A(n9), .Y(n8) );
  INVX4M U6 ( .A(n11), .Y(n10) );
  INVX4M U7 ( .A(n13), .Y(n12) );
  INVX4M U8 ( .A(n15), .Y(n14) );
  INVX4M U9 ( .A(n3), .Y(n2) );
  INVX4M U10 ( .A(n17), .Y(n16) );
  INVX4M U11 ( .A(n5), .Y(n4) );
  INVX2M U12 ( .A(prescale[1]), .Y(n7) );
  INVX2M U13 ( .A(prescale[2]), .Y(n9) );
  INVX2M U14 ( .A(prescale[3]), .Y(n11) );
  INVX2M U15 ( .A(prescale[4]), .Y(n13) );
  INVX2M U16 ( .A(prescale[5]), .Y(n15) );
  INVX2M U17 ( .A(edge_cnt[0]), .Y(n3) );
  INVX2M U18 ( .A(rst_n), .Y(n17) );
  INVX2M U19 ( .A(edge_cnt[1]), .Y(n5) );
  OR2X2M U20 ( .A(stp_error), .B(strt_glitch), .Y(framing_error) );
  DLY1X1M U21 ( .A(n23), .Y(n21) );
  INVXLM U22 ( .A(n21), .Y(n22) );
  INVXLM U23 ( .A(test_se), .Y(n23) );
  INVXLM U24 ( .A(n21), .Y(n24) );
  fsm_test_1 u_fsm ( .clk(clk), .rst_n(n16), .rx_in(rx_in), .edge_cnt({
        edge_cnt[4:2], n4, n2}), .bit_cnt(bit_cnt), .par_en(par_en), .par_err(
        parity_error), .strt_glitch(strt_glitch), .stp_error(stp_error), 
        .enable(enable), .data_valid(data_valid_int), .deser_en(deser_en), 
        .stp_chk_en(stp_chk_en), .strt_chk_en(strt_chk_en), .par_chk_en(
        par_chk_en), .dat_samp_en(dat_samp_en), .prescale({n14, n12, n10, n8, 
        n6, prescale[0]}), .test_so(n19), .test_se(test_se) );
  edge_counter_test_1 u_edge_counter ( .clk(clk), .rst_n(n16), .edge_cnt(
        edge_cnt), .bit_cnt(bit_cnt), .enable(enable), .par_en(par_en), 
        .prescale({n14, n12, n10, n8, n6, prescale[0]}), .test_si(p_data[7]), 
        .test_se(test_se) );
  sample_test_1 u_sample ( .clk(clk), .rst_n(n16), .dat_samp_en(dat_samp_en), 
        .prescale({n14, n12, n10, n8, n6, prescale[0]}), .edge_cnt({
        edge_cnt[4:2], n4, n2}), .rx_in(rx_in), .sampled_bit(sampled_bit), 
        .test_si(parity_error), .test_se(n24) );
  start_check_test_1 u_start_check ( .clk(clk), .rst_n(n16), .strt_chk_en(
        strt_chk_en), .strt_glitch(strt_glitch), .sampled_bit(sampled_bit), 
        .edge_cnt({edge_cnt[4:2], n4, n2}), .prescale({n14, n12, n10, n8, n6, 
        prescale[0]}), .test_se(test_se) );
  parity_check_test_1 u_parity_check ( .clk(clk), .rst_n(n16), .par_chk_en(
        par_chk_en), .par_err(parity_error), .sampled_bit(sampled_bit), 
        .par_type(par_type), .edge_cnt({edge_cnt[4:2], n4, n2}), .prescale({
        n14, n12, n10, n8, n6, prescale[0]}), .bit_cnt(bit_cnt), .test_si(n19), 
        .test_se(test_se) );
  stop_check_test_1 u_stop_check ( .clk(clk), .rst_n(n16), .stp_chk_en(
        stp_chk_en), .stp_error(stp_error), .sampled_bit(sampled_bit), 
        .prescale({n14, n12, n10, n8, n6, prescale[0]}), .edge_cnt({
        edge_cnt[4:2], n4, n2}), .test_si(strt_glitch), .test_se(test_se) );
  desz_test_1 u_deserializer ( .clk(clk), .rst_n(n16), .deser_en(deser_en), 
        .sampled_bit(sampled_bit), .p_data(p_data), .test_si(data_valid), 
        .test_se(test_se) );
endmodule


module UART_test_1 ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, TX_IN_P, 
        TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, parity_type, 
        parity_error, framing_error, test_si2, test_si1, test_so1, test_se );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type,
         test_si2, test_si1, test_se;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error, test_so1;
  wire   n1, n4;

  BUFX2M U1 ( .A(Prescale[1]), .Y(n1) );
  uart_top_DATA_WIDTH8_test_1 U0_UART_TX ( .p_data(TX_IN_P), .data_valid(
        TX_IN_V), .parity_type(parity_type), .parity_en(parity_enable), .clk(
        TX_CLK), .rst_n(RST), .tx_out(TX_OUT_S), .busy(TX_OUT_V), .test_si2(
        test_si2), .test_si1(n4), .test_so1(test_so1), .test_se(test_se) );
  uart_rx_top_test_1 U0_UART_RX ( .clk(RX_CLK), .rst_n(RST), .par_en(
        parity_enable), .rx_in(RX_IN_S), .prescale({Prescale[5:2], n1, 
        Prescale[0]}), .par_type(parity_type), .data_valid(RX_OUT_V), .p_data(
        RX_OUT_P), .parity_error(parity_error), .framing_error(framing_error), 
        .test_si(test_si1), .test_so(n4), .test_se(test_se) );
endmodule


module SYS_CTRL_test_1 ( CLK, RST, ALU_OUT, ALU_OUT_VLD, ALU_FUN, ALU_EN, 
        CLKG_EN, RF_Address, RF_WrEn, RF_RdEn, RF_WrData, RF_RdData, 
        RF_RdData_VLD, UART_RX_DATA, UART_RX_VLD, UART_TX_DATA, UART_TX_VLD, 
        CLKDIV_EN, FIFO_FULL, test_si2, test_si1, test_so2, test_so1, test_se
 );
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] RF_Address;
  output [7:0] RF_WrData;
  input [7:0] RF_RdData;
  input [7:0] UART_RX_DATA;
  output [7:0] UART_TX_DATA;
  input CLK, RST, ALU_OUT_VLD, RF_RdData_VLD, UART_RX_VLD, FIFO_FULL, test_si2,
         test_si1, test_se;
  output ALU_EN, CLKG_EN, RF_WrEn, RF_RdEn, UART_TX_VLD, CLKDIV_EN, test_so2,
         test_so1;
  wire   N177, N188, N189, n1, n59, n60, n61, n62, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n2, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n63, n64, n65, n66, n67, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n174, n175, n176, n5,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n3;
  wire   [3:0] current_state;
  wire   [7:0] rf_wr_data_reg;
  assign CLKDIV_EN = 1'b1;
  assign test_so2 = rf_wr_data_reg[7];

  OAI222X4M U134 ( .A0(ALU_OUT_VLD), .A1(n64), .B0(UART_RX_VLD), .B1(n119), 
        .C0(RF_RdData_VLD), .C1(n99), .Y(n106) );
  OAI2BB1X4M U144 ( .A0N(n122), .A1N(n48), .B0(n69), .Y(n85) );
  SDFFRQX2M \rf_wr_data_reg_reg[6]  ( .D(n145), .SI(rf_wr_data_reg[5]), .SE(
        n192), .CK(CLK), .RN(n54), .Q(rf_wr_data_reg[6]) );
  SDFFRQX2M \rf_wr_data_reg_reg[5]  ( .D(n144), .SI(rf_wr_data_reg[4]), .SE(
        n192), .CK(CLK), .RN(n54), .Q(rf_wr_data_reg[5]) );
  SDFFRQX2M \rf_wr_data_reg_reg[4]  ( .D(n143), .SI(rf_wr_data_reg[3]), .SE(
        n191), .CK(CLK), .RN(n53), .Q(rf_wr_data_reg[4]) );
  SDFFRQX2M \rf_wr_data_reg_reg[7]  ( .D(n146), .SI(rf_wr_data_reg[6]), .SE(
        n191), .CK(CLK), .RN(n54), .Q(rf_wr_data_reg[7]) );
  SDFFRQX2M \rf_wr_data_reg_reg[3]  ( .D(n142), .SI(rf_wr_data_reg[2]), .SE(
        n190), .CK(CLK), .RN(n53), .Q(rf_wr_data_reg[3]) );
  SDFFRQX2M \rf_wr_data_reg_reg[2]  ( .D(n141), .SI(rf_wr_data_reg[1]), .SE(
        n190), .CK(CLK), .RN(n53), .Q(rf_wr_data_reg[2]) );
  SDFFRQX2M \rf_wr_data_reg_reg[1]  ( .D(n140), .SI(rf_wr_data_reg[0]), .SE(
        n189), .CK(CLK), .RN(n53), .Q(rf_wr_data_reg[1]) );
  SDFFRQX2M \rf_wr_data_reg_reg[0]  ( .D(n139), .SI(current_state[3]), .SE(
        n189), .CK(CLK), .RN(n53), .Q(rf_wr_data_reg[0]) );
  SDFFRQX2M \UART_TX_DATA_reg[7]  ( .D(n154), .SI(UART_TX_DATA[6]), .SE(n188), 
        .CK(CLK), .RN(n55), .Q(UART_TX_DATA[7]) );
  SDFFRQX2M \UART_TX_DATA_reg[6]  ( .D(n153), .SI(UART_TX_DATA[5]), .SE(n188), 
        .CK(CLK), .RN(n55), .Q(UART_TX_DATA[6]) );
  SDFFRQX2M \UART_TX_DATA_reg[5]  ( .D(n152), .SI(UART_TX_DATA[4]), .SE(n187), 
        .CK(CLK), .RN(n54), .Q(UART_TX_DATA[5]) );
  SDFFRQX2M \UART_TX_DATA_reg[4]  ( .D(n151), .SI(UART_TX_DATA[3]), .SE(n187), 
        .CK(CLK), .RN(n54), .Q(UART_TX_DATA[4]) );
  SDFFRQX2M \UART_TX_DATA_reg[3]  ( .D(n150), .SI(UART_TX_DATA[2]), .SE(n186), 
        .CK(CLK), .RN(n54), .Q(UART_TX_DATA[3]) );
  SDFFRQX2M \UART_TX_DATA_reg[2]  ( .D(n149), .SI(UART_TX_DATA[1]), .SE(n186), 
        .CK(CLK), .RN(n54), .Q(UART_TX_DATA[2]) );
  SDFFRQX2M \UART_TX_DATA_reg[1]  ( .D(n148), .SI(UART_TX_DATA[0]), .SE(n185), 
        .CK(CLK), .RN(n54), .Q(UART_TX_DATA[1]) );
  SDFFRQX2M \UART_TX_DATA_reg[0]  ( .D(n147), .SI(RF_WrEn), .SE(n185), .CK(CLK), .RN(n54), .Q(UART_TX_DATA[0]) );
  SDFFRQX2M \RF_WrData_reg[7]  ( .D(n131), .SI(RF_WrData[6]), .SE(n184), .CK(
        CLK), .RN(n54), .Q(RF_WrData[7]) );
  SDFFRQX2M \RF_WrData_reg[6]  ( .D(n132), .SI(RF_WrData[5]), .SE(n184), .CK(
        CLK), .RN(n54), .Q(RF_WrData[6]) );
  SDFFRQX2M \RF_WrData_reg[5]  ( .D(n133), .SI(RF_WrData[4]), .SE(n183), .CK(
        CLK), .RN(n54), .Q(RF_WrData[5]) );
  SDFFRQX2M \RF_WrData_reg[4]  ( .D(n134), .SI(RF_WrData[3]), .SE(n183), .CK(
        CLK), .RN(n53), .Q(RF_WrData[4]) );
  SDFFRQX2M \RF_WrData_reg[3]  ( .D(n135), .SI(RF_WrData[2]), .SE(n182), .CK(
        CLK), .RN(n53), .Q(RF_WrData[3]) );
  SDFFRQX2M \RF_WrData_reg[2]  ( .D(n136), .SI(RF_WrData[1]), .SE(n182), .CK(
        CLK), .RN(n53), .Q(RF_WrData[2]) );
  SDFFRQX2M \RF_WrData_reg[1]  ( .D(n137), .SI(RF_WrData[0]), .SE(n181), .CK(
        CLK), .RN(n53), .Q(RF_WrData[1]) );
  SDFFRQX2M \RF_WrData_reg[0]  ( .D(n138), .SI(RF_RdEn), .SE(n181), .CK(CLK), 
        .RN(n53), .Q(RF_WrData[0]) );
  SDFFRX1M \alu_fun_reg_reg[3]  ( .D(n158), .SI(n175), .SE(test_se), .CK(CLK), 
        .RN(n52), .Q(n174), .QN(n59) );
  SDFFRX1M \alu_fun_reg_reg[2]  ( .D(n157), .SI(n176), .SE(test_se), .CK(CLK), 
        .RN(n52), .Q(n175), .QN(n60) );
  SDFFRX1M \alu_fun_reg_reg[1]  ( .D(n156), .SI(test_si2), .SE(test_se), .CK(
        CLK), .RN(n52), .Q(n176), .QN(n61) );
  SDFFRX1M \alu_fun_reg_reg[0]  ( .D(n155), .SI(UART_TX_VLD), .SE(test_se), 
        .CK(CLK), .RN(n52), .Q(n5), .QN(n62) );
  SDFFRQX2M RF_WrEn_reg ( .D(n67), .SI(RF_WrData[7]), .SE(test_se), .CK(CLK), 
        .RN(n53), .Q(RF_WrEn) );
  SDFFRQX2M UART_TX_VLD_reg ( .D(n57), .SI(UART_TX_DATA[7]), .SE(test_se), 
        .CK(CLK), .RN(n54), .Q(UART_TX_VLD) );
  SDFFRQX2M RF_RdEn_reg ( .D(N177), .SI(RF_Address[3]), .SE(test_se), .CK(CLK), 
        .RN(n55), .Q(RF_RdEn) );
  SDFFRQX4M \ALU_FUN_reg[1]  ( .D(n128), .SI(ALU_FUN[0]), .SE(n180), .CK(CLK), 
        .RN(n52), .Q(ALU_FUN[1]) );
  SDFFRQX4M \ALU_FUN_reg[2]  ( .D(n129), .SI(ALU_FUN[1]), .SE(n180), .CK(CLK), 
        .RN(n52), .Q(ALU_FUN[2]) );
  SDFFRQX4M \ALU_FUN_reg[0]  ( .D(n127), .SI(n193), .SE(test_se), .CK(CLK), 
        .RN(n52), .Q(ALU_FUN[0]) );
  SDFFRQX4M \RF_Address_reg[0]  ( .D(n123), .SI(CLKG_EN), .SE(test_se), .CK(
        CLK), .RN(n52), .Q(RF_Address[0]) );
  SDFFRQX4M \RF_Address_reg[1]  ( .D(n124), .SI(RF_Address[0]), .SE(test_se), 
        .CK(CLK), .RN(n52), .Q(RF_Address[1]) );
  SDFFRQX4M \RF_Address_reg[3]  ( .D(n126), .SI(RF_Address[2]), .SE(test_se), 
        .CK(CLK), .RN(n52), .Q(RF_Address[3]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(n162), .SI(n174), .SE(test_se), .CK(
        CLK), .RN(n52), .Q(current_state[0]) );
  SDFFRQX4M \current_state_reg[2]  ( .D(n161), .SI(current_state[1]), .SE(
        test_se), .CK(CLK), .RN(n55), .Q(current_state[2]) );
  SDFFRQX4M \current_state_reg[1]  ( .D(n160), .SI(current_state[0]), .SE(
        test_se), .CK(CLK), .RN(n55), .Q(current_state[1]) );
  SDFFRQX4M \current_state_reg[3]  ( .D(n159), .SI(current_state[2]), .SE(
        test_se), .CK(CLK), .RN(n55), .Q(current_state[3]) );
  SDFFRQX2M CLKG_EN_reg ( .D(N189), .SI(ALU_FUN[3]), .SE(test_se), .CK(CLK), 
        .RN(n52), .Q(CLKG_EN) );
  SDFFRQX2M ALU_EN_reg ( .D(N188), .SI(test_si1), .SE(test_se), .CK(CLK), .RN(
        n53), .Q(ALU_EN) );
  SDFFRQX4M \ALU_FUN_reg[3]  ( .D(n130), .SI(ALU_FUN[2]), .SE(test_se), .CK(
        CLK), .RN(n53), .Q(ALU_FUN[3]) );
  SDFFRQX4M \RF_Address_reg[2]  ( .D(n125), .SI(RF_Address[1]), .SE(test_se), 
        .CK(CLK), .RN(n52), .Q(RF_Address[2]) );
  NAND2X2M U3 ( .A(current_state[1]), .B(n166), .Y(n120) );
  OAI32X2M U4 ( .A0(n66), .A1(n120), .A2(n165), .B0(n48), .B1(n121), .Y(n101)
         );
  CLKBUFX6M U5 ( .A(current_state[0]), .Y(n48) );
  BUFX2M U52 ( .A(n101), .Y(n2) );
  AOI211X2M U53 ( .A0(n165), .A1(n166), .B0(n2), .C0(n85), .Y(n119) );
  NAND2X3M U54 ( .A(UART_RX_VLD), .B(n2), .Y(n100) );
  CLKINVX2M U55 ( .A(n48), .Y(n66) );
  NOR2X4M U56 ( .A(n121), .B(n66), .Y(N188) );
  BUFX4M U57 ( .A(n74), .Y(n49) );
  CLKBUFX6M U58 ( .A(n88), .Y(n50) );
  NOR3X6M U59 ( .A(n48), .B(current_state[2]), .C(n120), .Y(n73) );
  NAND3XLM U60 ( .A(UART_RX_VLD), .B(n48), .C(n87), .Y(n86) );
  INVX2M U61 ( .A(UART_RX_DATA[3]), .Y(n169) );
  NAND2XLM U62 ( .A(n48), .B(current_state[3]), .Y(n1) );
  INVX4M U63 ( .A(UART_RX_DATA[0]), .Y(n172) );
  NOR3X2M U64 ( .A(UART_RX_DATA[2]), .B(UART_RX_DATA[6]), .C(UART_RX_DATA[4]), 
        .Y(n114) );
  CLKBUFX8M U65 ( .A(n56), .Y(n52) );
  CLKBUFX8M U66 ( .A(n56), .Y(n53) );
  CLKBUFX8M U67 ( .A(n56), .Y(n54) );
  BUFX4M U68 ( .A(n56), .Y(n55) );
  INVX6M U69 ( .A(N188), .Y(n64) );
  CLKAND2X4M U70 ( .A(n85), .B(n67), .Y(n76) );
  BUFX2M U71 ( .A(RST), .Y(n56) );
  INVX4M U72 ( .A(n106), .Y(n58) );
  OAI221X1M U73 ( .A0(n105), .A1(n106), .B0(n58), .B1(n164), .C0(n107), .Y(
        n160) );
  AOI21X1M U74 ( .A0(n87), .A1(n48), .B0(n85), .Y(n105) );
  OAI211X2M U75 ( .A0(n58), .A1(n165), .B0(n108), .C0(n109), .Y(n161) );
  OAI21X2M U76 ( .A0(n72), .A1(n85), .B0(n58), .Y(n108) );
  AND3X2M U77 ( .A(n58), .B(n87), .C(n118), .Y(n116) );
  NOR3X2M U78 ( .A(n168), .B(n48), .C(n169), .Y(n118) );
  NAND4X2M U79 ( .A(n109), .B(n107), .C(n110), .D(n111), .Y(n162) );
  AOI22X1M U80 ( .A0(n58), .A1(n112), .B0(n48), .B1(n106), .Y(n111) );
  NAND3X2M U81 ( .A(n113), .B(n172), .C(n114), .Y(n110) );
  NAND2BX1M U82 ( .AN(n2), .B(n69), .Y(n112) );
  OAI21BX4M U83 ( .A0(n72), .A1(n73), .B0N(n68), .Y(n71) );
  NOR2X6M U84 ( .A(N177), .B(n67), .Y(n68) );
  NAND2X2M U85 ( .A(n122), .B(n66), .Y(n99) );
  INVX2M U86 ( .A(n49), .Y(n67) );
  OR3X2M U87 ( .A(n120), .B(n48), .C(n165), .Y(n69) );
  NOR2X8M U88 ( .A(n64), .B(n50), .Y(n90) );
  NOR2X8M U89 ( .A(n99), .B(n50), .Y(n91) );
  CLKINVX2M U90 ( .A(n100), .Y(n63) );
  CLKAND2X4M U91 ( .A(n73), .B(n67), .Y(n77) );
  INVX2M U92 ( .A(n50), .Y(n57) );
  INVX2M U93 ( .A(n51), .Y(n163) );
  OAI21X2M U94 ( .A0(n58), .A1(n166), .B0(n102), .Y(n159) );
  AOI32X1M U95 ( .A0(n103), .A1(UART_RX_DATA[4]), .A2(n104), .B0(n58), .B1(n2), 
        .Y(n102) );
  NOR3X2M U96 ( .A(n172), .B(UART_RX_DATA[5]), .C(UART_RX_DATA[1]), .Y(n104)
         );
  NOR3X4M U97 ( .A(current_state[1]), .B(current_state[3]), .C(n165), .Y(n122)
         );
  INVX4M U98 ( .A(current_state[2]), .Y(n165) );
  AND3X2M U99 ( .A(UART_RX_DATA[5]), .B(UART_RX_DATA[1]), .C(n116), .Y(n113)
         );
  AND3X2M U100 ( .A(UART_RX_DATA[6]), .B(UART_RX_DATA[2]), .C(n116), .Y(n103)
         );
  INVX2M U101 ( .A(current_state[3]), .Y(n166) );
  NAND3X2M U102 ( .A(n113), .B(UART_RX_DATA[4]), .C(n115), .Y(n107) );
  NOR3X2M U103 ( .A(n172), .B(UART_RX_DATA[6]), .C(UART_RX_DATA[2]), .Y(n115)
         );
  NAND3X2M U104 ( .A(n103), .B(n172), .C(n117), .Y(n109) );
  NOR3X2M U105 ( .A(UART_RX_DATA[1]), .B(UART_RX_DATA[5]), .C(UART_RX_DATA[4]), 
        .Y(n117) );
  OAI21X2M U106 ( .A0(n68), .A1(n69), .B0(n70), .Y(n123) );
  AOI2BB2X2M U107 ( .B0(RF_Address[0]), .B1(n68), .A0N(n172), .A1N(n71), .Y(
        n70) );
  NAND3X2M U108 ( .A(n164), .B(n165), .C(current_state[3]), .Y(n121) );
  INVX2M U109 ( .A(current_state[1]), .Y(n164) );
  OAI21X2M U110 ( .A0(n73), .A1(n85), .B0(UART_RX_VLD), .Y(n74) );
  OAI2BB1X2M U111 ( .A0N(RF_WrData[0]), .A1N(n49), .B0(n84), .Y(n138) );
  AOI22X1M U112 ( .A0(n76), .A1(UART_RX_DATA[0]), .B0(rf_wr_data_reg[0]), .B1(
        n77), .Y(n84) );
  OAI2BB1X2M U113 ( .A0N(RF_WrData[1]), .A1N(n49), .B0(n83), .Y(n137) );
  AOI22X1M U114 ( .A0(n76), .A1(UART_RX_DATA[1]), .B0(rf_wr_data_reg[1]), .B1(
        n77), .Y(n83) );
  OAI2BB1X2M U115 ( .A0N(RF_WrData[2]), .A1N(n49), .B0(n82), .Y(n136) );
  AOI22X1M U116 ( .A0(n76), .A1(UART_RX_DATA[2]), .B0(rf_wr_data_reg[2]), .B1(
        n77), .Y(n82) );
  OAI2BB1X2M U117 ( .A0N(RF_WrData[3]), .A1N(n49), .B0(n81), .Y(n135) );
  AOI22X1M U118 ( .A0(n76), .A1(UART_RX_DATA[3]), .B0(rf_wr_data_reg[3]), .B1(
        n77), .Y(n81) );
  OAI22X1M U119 ( .A0(n172), .A1(n100), .B0(n63), .B1(n62), .Y(n155) );
  OAI22X1M U120 ( .A0(n171), .A1(n100), .B0(n63), .B1(n61), .Y(n156) );
  OAI22X1M U121 ( .A0(n170), .A1(n100), .B0(n63), .B1(n60), .Y(n157) );
  OAI22X1M U122 ( .A0(n169), .A1(n100), .B0(n63), .B1(n59), .Y(n158) );
  OAI2BB2X1M U123 ( .B0(n71), .B1(n171), .A0N(RF_Address[1]), .A1N(n68), .Y(
        n124) );
  OAI2BB2X1M U124 ( .B0(n71), .B1(n170), .A0N(RF_Address[2]), .A1N(n68), .Y(
        n125) );
  OAI2BB2X1M U125 ( .B0(n71), .B1(n169), .A0N(RF_Address[3]), .A1N(n68), .Y(
        n126) );
  AOI22X1M U126 ( .A0(n65), .A1(RF_RdData_VLD), .B0(N188), .B1(ALU_OUT_VLD), 
        .Y(n88) );
  INVX2M U127 ( .A(n99), .Y(n65) );
  OAI2BB1X2M U128 ( .A0N(UART_TX_DATA[0]), .A1N(n50), .B0(n89), .Y(n147) );
  AOI22X1M U129 ( .A0(ALU_OUT[0]), .A1(n90), .B0(RF_RdData[0]), .B1(n91), .Y(
        n89) );
  OAI2BB1X2M U130 ( .A0N(UART_TX_DATA[1]), .A1N(n50), .B0(n92), .Y(n148) );
  AOI22X1M U131 ( .A0(ALU_OUT[1]), .A1(n90), .B0(RF_RdData[1]), .B1(n91), .Y(
        n92) );
  OAI2BB1X2M U132 ( .A0N(UART_TX_DATA[2]), .A1N(n50), .B0(n93), .Y(n149) );
  AOI22X1M U133 ( .A0(ALU_OUT[2]), .A1(n90), .B0(RF_RdData[2]), .B1(n91), .Y(
        n93) );
  OAI2BB1X2M U135 ( .A0N(UART_TX_DATA[3]), .A1N(n50), .B0(n94), .Y(n150) );
  AOI22X1M U136 ( .A0(ALU_OUT[3]), .A1(n90), .B0(RF_RdData[3]), .B1(n91), .Y(
        n94) );
  OAI2BB1X2M U137 ( .A0N(UART_TX_DATA[4]), .A1N(n50), .B0(n95), .Y(n151) );
  AOI22X1M U138 ( .A0(ALU_OUT[4]), .A1(n90), .B0(RF_RdData[4]), .B1(n91), .Y(
        n95) );
  OAI2BB1X2M U139 ( .A0N(UART_TX_DATA[5]), .A1N(n50), .B0(n96), .Y(n152) );
  AOI22X1M U140 ( .A0(ALU_OUT[5]), .A1(n90), .B0(RF_RdData[5]), .B1(n91), .Y(
        n96) );
  OAI2BB1X2M U141 ( .A0N(UART_TX_DATA[6]), .A1N(n50), .B0(n97), .Y(n153) );
  AOI22X1M U142 ( .A0(ALU_OUT[6]), .A1(n90), .B0(RF_RdData[6]), .B1(n91), .Y(
        n97) );
  OAI2BB1X2M U143 ( .A0N(UART_TX_DATA[7]), .A1N(n50), .B0(n98), .Y(n154) );
  AOI22X1M U145 ( .A0(ALU_OUT[7]), .A1(n90), .B0(RF_RdData[7]), .B1(n91), .Y(
        n98) );
  OAI2BB1X2M U146 ( .A0N(RF_WrData[4]), .A1N(n49), .B0(n80), .Y(n134) );
  AOI22X1M U147 ( .A0(UART_RX_DATA[4]), .A1(n76), .B0(rf_wr_data_reg[4]), .B1(
        n77), .Y(n80) );
  OAI2BB1X2M U148 ( .A0N(RF_WrData[5]), .A1N(n49), .B0(n79), .Y(n133) );
  AOI22X1M U149 ( .A0(UART_RX_DATA[5]), .A1(n76), .B0(rf_wr_data_reg[5]), .B1(
        n77), .Y(n79) );
  OAI2BB1X2M U150 ( .A0N(RF_WrData[6]), .A1N(n49), .B0(n78), .Y(n132) );
  AOI22X1M U151 ( .A0(UART_RX_DATA[6]), .A1(n76), .B0(rf_wr_data_reg[6]), .B1(
        n77), .Y(n78) );
  OAI2BB1X2M U152 ( .A0N(RF_WrData[7]), .A1N(n49), .B0(n75), .Y(n131) );
  AOI22X1M U153 ( .A0(UART_RX_DATA[7]), .A1(n76), .B0(rf_wr_data_reg[7]), .B1(
        n77), .Y(n75) );
  NOR3X6M U154 ( .A(n120), .B(current_state[2]), .C(n66), .Y(n72) );
  AND2X2M U155 ( .A(n72), .B(UART_RX_VLD), .Y(N177) );
  NOR3X6M U156 ( .A(current_state[2]), .B(current_state[3]), .C(
        current_state[1]), .Y(n87) );
  CLKBUFX8M U157 ( .A(n86), .Y(n51) );
  OAI2BB2X1M U158 ( .B0(n172), .B1(n51), .A0N(n51), .A1N(rf_wr_data_reg[0]), 
        .Y(n139) );
  OAI2BB2X1M U159 ( .B0(n171), .B1(n51), .A0N(n51), .A1N(rf_wr_data_reg[1]), 
        .Y(n140) );
  OAI2BB2X1M U160 ( .B0(n170), .B1(n51), .A0N(n51), .A1N(rf_wr_data_reg[2]), 
        .Y(n141) );
  OAI2BB2X1M U161 ( .B0(n169), .B1(n51), .A0N(n51), .A1N(rf_wr_data_reg[3]), 
        .Y(n142) );
  OAI2BB2X1M U162 ( .B0(n168), .B1(n51), .A0N(n51), .A1N(rf_wr_data_reg[7]), 
        .Y(n146) );
  OAI2BB2X1M U163 ( .B0(n64), .B1(n62), .A0N(ALU_FUN[0]), .A1N(n64), .Y(n127)
         );
  OAI2BB2X1M U164 ( .B0(n64), .B1(n61), .A0N(ALU_FUN[1]), .A1N(n64), .Y(n128)
         );
  OAI2BB2X1M U165 ( .B0(n64), .B1(n60), .A0N(ALU_FUN[2]), .A1N(n64), .Y(n129)
         );
  OAI2BB2X1M U166 ( .B0(n64), .B1(n59), .A0N(ALU_FUN[3]), .A1N(n64), .Y(n130)
         );
  INVX2M U167 ( .A(UART_RX_DATA[7]), .Y(n168) );
  AO22X1M U168 ( .A0(UART_RX_DATA[4]), .A1(n163), .B0(n51), .B1(
        rf_wr_data_reg[4]), .Y(n143) );
  AO22X1M U169 ( .A0(UART_RX_DATA[5]), .A1(n163), .B0(n51), .B1(
        rf_wr_data_reg[5]), .Y(n144) );
  AO22X1M U170 ( .A0(UART_RX_DATA[6]), .A1(n163), .B0(n51), .B1(
        rf_wr_data_reg[6]), .Y(n145) );
  OAI31X2M U171 ( .A0(n1), .A1(current_state[1]), .A2(current_state[2]), .B0(
        n167), .Y(N189) );
  INVX2M U172 ( .A(ALU_EN), .Y(n167) );
  INVX2M U173 ( .A(UART_RX_DATA[1]), .Y(n171) );
  INVX2M U174 ( .A(UART_RX_DATA[2]), .Y(n170) );
  DLY1X1M U175 ( .A(test_se), .Y(n180) );
  DLY1X1M U176 ( .A(test_se), .Y(n181) );
  DLY1X1M U177 ( .A(test_se), .Y(n182) );
  DLY1X1M U178 ( .A(test_se), .Y(n183) );
  DLY1X1M U179 ( .A(test_se), .Y(n184) );
  DLY1X1M U180 ( .A(test_se), .Y(n185) );
  DLY1X1M U181 ( .A(test_se), .Y(n186) );
  DLY1X1M U182 ( .A(test_se), .Y(n187) );
  DLY1X1M U183 ( .A(test_se), .Y(n188) );
  DLY1X1M U184 ( .A(test_se), .Y(n189) );
  DLY1X1M U185 ( .A(test_se), .Y(n190) );
  DLY1X1M U186 ( .A(test_se), .Y(n191) );
  DLY1X1M U187 ( .A(test_se), .Y(n192) );
  INVXLM U188 ( .A(n167), .Y(n193) );
  INVXLM U6 ( .A(n5), .Y(n3) );
  INVX2M U7 ( .A(n3), .Y(test_so1) );
endmodule


module RegFile_test_1 ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, 
        RdData_VLD, REG0, REG1, REG2, REG3, test_si2, test_si1, test_so2, 
        test_so1, test_se );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn, test_si2, test_si1, test_se;
  output RdData_VLD, test_so2, test_so1;
  wire   N11, N12, N13, N14, n488, \regArr[15][7] , \regArr[15][6] ,
         \regArr[15][5] , \regArr[15][4] , \regArr[15][3] , \regArr[15][2] ,
         \regArr[15][1] , \regArr[15][0] , \regArr[14][7] , \regArr[14][6] ,
         \regArr[14][5] , \regArr[14][4] , \regArr[14][3] , \regArr[14][2] ,
         \regArr[14][1] , \regArr[14][0] , \regArr[13][7] , \regArr[13][6] ,
         \regArr[13][5] , \regArr[13][4] , \regArr[13][3] , \regArr[13][2] ,
         \regArr[13][1] , \regArr[13][0] , \regArr[12][7] , \regArr[12][6] ,
         \regArr[12][5] , \regArr[12][4] , \regArr[12][3] , \regArr[12][2] ,
         \regArr[12][1] , \regArr[12][0] , \regArr[11][7] , \regArr[11][6] ,
         \regArr[11][5] , \regArr[11][4] , \regArr[11][3] , \regArr[11][2] ,
         \regArr[11][1] , \regArr[11][0] , \regArr[10][7] , \regArr[10][6] ,
         \regArr[10][5] , \regArr[10][4] , \regArr[10][3] , \regArr[10][2] ,
         \regArr[10][1] , \regArr[10][0] , \regArr[9][7] , \regArr[9][6] ,
         \regArr[9][5] , \regArr[9][4] , \regArr[9][3] , \regArr[9][2] ,
         \regArr[9][1] , \regArr[9][0] , \regArr[8][7] , \regArr[8][6] ,
         \regArr[8][5] , \regArr[8][4] , \regArr[8][3] , \regArr[8][2] ,
         \regArr[8][1] , \regArr[8][0] , \regArr[7][7] , \regArr[7][6] ,
         \regArr[7][5] , \regArr[7][4] , \regArr[7][3] , \regArr[7][2] ,
         \regArr[7][1] , \regArr[7][0] , \regArr[6][7] , \regArr[6][6] ,
         \regArr[6][5] , \regArr[6][4] , \regArr[6][3] , \regArr[6][2] ,
         \regArr[6][1] , \regArr[6][0] , \regArr[5][7] , \regArr[5][6] ,
         \regArr[5][5] , \regArr[5][4] , \regArr[5][3] , \regArr[5][2] ,
         \regArr[5][1] , \regArr[5][0] , \regArr[4][7] , \regArr[4][6] ,
         \regArr[4][5] , \regArr[4][4] , \regArr[4][3] , \regArr[4][2] ,
         \regArr[4][1] , \regArr[4][0] , N36, N37, N38, N39, N40, N41, N42,
         N43, n150, n151, n152, n153, n154, n155, n156, n157, n158, n160, n163,
         n164, n166, n167, n168, n169, n170, n171, n175, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n138, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n159, n161, n162, n165, n172, n173, n174, n176, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n492, n493, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506,
         n507, n508, n509, n510, n511, n512, n513, n514, n515, n516, n517,
         n518, n519, n520, n521, n522, n523, n524, n525, n526, n527, n528,
         n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, n539,
         n540, n541, n542, n543, n544, n545, n546, n547, n548, n549, n550,
         n551, n552, n553, n554, n555, n556, n557, n558, n559, n560, n561,
         n562, n563, n564, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n583,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];
  assign test_so2 = \regArr[15][7] ;
  assign test_so1 = \regArr[7][3] ;

  SDFFRHQX8M \regArr_reg[2][2]  ( .D(n197), .SI(n609), .SE(n605), .CK(CLK), 
        .RN(n463), .Q(REG2[2]) );
  SDFFRHQX8M \regArr_reg[1][7]  ( .D(n194), .SI(REG1[6]), .SE(n605), .CK(CLK), 
        .RN(n463), .Q(REG1[7]) );
  SDFFRHQX8M \regArr_reg[1][6]  ( .D(n193), .SI(REG1[5]), .SE(n604), .CK(CLK), 
        .RN(n463), .Q(REG1[6]) );
  SDFFRHQX8M \regArr_reg[1][5]  ( .D(n192), .SI(REG1[4]), .SE(n604), .CK(CLK), 
        .RN(n463), .Q(REG1[5]) );
  SDFFRHQX8M \regArr_reg[1][4]  ( .D(n191), .SI(REG1[3]), .SE(n603), .CK(CLK), 
        .RN(n463), .Q(REG1[4]) );
  SDFFRHQX8M \regArr_reg[1][3]  ( .D(n190), .SI(REG1[2]), .SE(n603), .CK(CLK), 
        .RN(n463), .Q(REG1[3]) );
  SDFFRHQX8M \regArr_reg[1][2]  ( .D(n189), .SI(REG1[1]), .SE(n602), .CK(CLK), 
        .RN(n463), .Q(REG1[2]) );
  SDFFRHQX8M \regArr_reg[1][1]  ( .D(n188), .SI(REG1[0]), .SE(n602), .CK(CLK), 
        .RN(n462), .Q(REG1[1]) );
  SDFFRHQX8M \regArr_reg[1][0]  ( .D(n187), .SI(REG0[7]), .SE(n601), .CK(CLK), 
        .RN(n462), .Q(REG1[0]) );
  SDFFRQX2M \RdData_reg[7]  ( .D(n314), .SI(RdData[6]), .SE(n596), .CK(CLK), 
        .RN(n462), .Q(RdData[7]) );
  SDFFRQX2M \RdData_reg[6]  ( .D(n313), .SI(RdData[5]), .SE(n596), .CK(CLK), 
        .RN(n472), .Q(RdData[6]) );
  SDFFRQX2M \RdData_reg[5]  ( .D(n312), .SI(RdData[4]), .SE(n595), .CK(CLK), 
        .RN(n472), .Q(RdData[5]) );
  SDFFRQX2M \RdData_reg[4]  ( .D(n311), .SI(RdData[3]), .SE(n595), .CK(CLK), 
        .RN(n472), .Q(RdData[4]) );
  SDFFRQX2M \RdData_reg[3]  ( .D(n310), .SI(RdData[2]), .SE(n594), .CK(CLK), 
        .RN(n472), .Q(RdData[3]) );
  SDFFRQX2M \RdData_reg[2]  ( .D(n309), .SI(RdData[1]), .SE(n594), .CK(CLK), 
        .RN(n472), .Q(RdData[2]) );
  SDFFRQX2M \RdData_reg[1]  ( .D(n308), .SI(RdData[0]), .SE(n593), .CK(CLK), 
        .RN(n472), .Q(RdData[1]) );
  SDFFRQX2M \RdData_reg[0]  ( .D(n307), .SI(RdData_VLD), .SE(n593), .CK(CLK), 
        .RN(n472), .Q(RdData[0]) );
  SDFFRQX2M \regArr_reg[15][7]  ( .D(n306), .SI(\regArr[15][6] ), .SE(n592), 
        .CK(CLK), .RN(n471), .Q(\regArr[15][7] ) );
  SDFFRQX2M \regArr_reg[15][6]  ( .D(n305), .SI(\regArr[15][5] ), .SE(n592), 
        .CK(CLK), .RN(n471), .Q(\regArr[15][6] ) );
  SDFFRQX2M \regArr_reg[15][5]  ( .D(n304), .SI(\regArr[15][4] ), .SE(n591), 
        .CK(CLK), .RN(n471), .Q(\regArr[15][5] ) );
  SDFFRQX2M \regArr_reg[15][4]  ( .D(n303), .SI(\regArr[15][3] ), .SE(n591), 
        .CK(CLK), .RN(n471), .Q(\regArr[15][4] ) );
  SDFFRQX2M \regArr_reg[15][3]  ( .D(n302), .SI(\regArr[15][2] ), .SE(n590), 
        .CK(CLK), .RN(n471), .Q(\regArr[15][3] ) );
  SDFFRQX2M \regArr_reg[15][2]  ( .D(n301), .SI(\regArr[15][1] ), .SE(n590), 
        .CK(CLK), .RN(n471), .Q(\regArr[15][2] ) );
  SDFFRQX2M \regArr_reg[15][1]  ( .D(n300), .SI(\regArr[15][0] ), .SE(n589), 
        .CK(CLK), .RN(n471), .Q(\regArr[15][1] ) );
  SDFFRQX2M \regArr_reg[15][0]  ( .D(n299), .SI(\regArr[14][7] ), .SE(n589), 
        .CK(CLK), .RN(n471), .Q(\regArr[15][0] ) );
  SDFFRQX2M \regArr_reg[13][7]  ( .D(n290), .SI(\regArr[13][6] ), .SE(n588), 
        .CK(CLK), .RN(n470), .Q(\regArr[13][7] ) );
  SDFFRQX2M \regArr_reg[13][6]  ( .D(n289), .SI(\regArr[13][5] ), .SE(n588), 
        .CK(CLK), .RN(n470), .Q(\regArr[13][6] ) );
  SDFFRQX2M \regArr_reg[13][5]  ( .D(n288), .SI(\regArr[13][4] ), .SE(n587), 
        .CK(CLK), .RN(n470), .Q(\regArr[13][5] ) );
  SDFFRQX2M \regArr_reg[13][4]  ( .D(n287), .SI(\regArr[13][3] ), .SE(n587), 
        .CK(CLK), .RN(n470), .Q(\regArr[13][4] ) );
  SDFFRQX2M \regArr_reg[13][3]  ( .D(n286), .SI(\regArr[13][2] ), .SE(n586), 
        .CK(CLK), .RN(n470), .Q(\regArr[13][3] ) );
  SDFFRQX2M \regArr_reg[13][2]  ( .D(n285), .SI(\regArr[13][1] ), .SE(n586), 
        .CK(CLK), .RN(n470), .Q(\regArr[13][2] ) );
  SDFFRQX2M \regArr_reg[13][1]  ( .D(n284), .SI(\regArr[13][0] ), .SE(n585), 
        .CK(CLK), .RN(n470), .Q(\regArr[13][1] ) );
  SDFFRQX2M \regArr_reg[13][0]  ( .D(n283), .SI(\regArr[12][7] ), .SE(n585), 
        .CK(CLK), .RN(n470), .Q(\regArr[13][0] ) );
  SDFFRQX2M \regArr_reg[11][7]  ( .D(n274), .SI(\regArr[11][6] ), .SE(n584), 
        .CK(CLK), .RN(n469), .Q(\regArr[11][7] ) );
  SDFFRQX2M \regArr_reg[11][6]  ( .D(n273), .SI(\regArr[11][5] ), .SE(n584), 
        .CK(CLK), .RN(n469), .Q(\regArr[11][6] ) );
  SDFFRQX2M \regArr_reg[11][5]  ( .D(n272), .SI(\regArr[11][4] ), .SE(n583), 
        .CK(CLK), .RN(n469), .Q(\regArr[11][5] ) );
  SDFFRQX2M \regArr_reg[11][4]  ( .D(n271), .SI(\regArr[11][3] ), .SE(n583), 
        .CK(CLK), .RN(n469), .Q(\regArr[11][4] ) );
  SDFFRQX2M \regArr_reg[11][3]  ( .D(n270), .SI(\regArr[11][2] ), .SE(n582), 
        .CK(CLK), .RN(n469), .Q(\regArr[11][3] ) );
  SDFFRQX2M \regArr_reg[11][2]  ( .D(n269), .SI(\regArr[11][1] ), .SE(n582), 
        .CK(CLK), .RN(n469), .Q(\regArr[11][2] ) );
  SDFFRQX2M \regArr_reg[11][1]  ( .D(n268), .SI(\regArr[11][0] ), .SE(n581), 
        .CK(CLK), .RN(n469), .Q(\regArr[11][1] ) );
  SDFFRQX2M \regArr_reg[11][0]  ( .D(n267), .SI(\regArr[10][7] ), .SE(n581), 
        .CK(CLK), .RN(n468), .Q(\regArr[11][0] ) );
  SDFFRQX2M \regArr_reg[9][7]  ( .D(n258), .SI(\regArr[9][6] ), .SE(n580), 
        .CK(CLK), .RN(n468), .Q(\regArr[9][7] ) );
  SDFFRQX2M \regArr_reg[9][6]  ( .D(n257), .SI(\regArr[9][5] ), .SE(n580), 
        .CK(CLK), .RN(n468), .Q(\regArr[9][6] ) );
  SDFFRQX2M \regArr_reg[9][5]  ( .D(n256), .SI(\regArr[9][4] ), .SE(n579), 
        .CK(CLK), .RN(n468), .Q(\regArr[9][5] ) );
  SDFFRQX2M \regArr_reg[9][4]  ( .D(n255), .SI(\regArr[9][3] ), .SE(n579), 
        .CK(CLK), .RN(n468), .Q(\regArr[9][4] ) );
  SDFFRQX2M \regArr_reg[9][3]  ( .D(n254), .SI(\regArr[9][2] ), .SE(n578), 
        .CK(CLK), .RN(n467), .Q(\regArr[9][3] ) );
  SDFFRQX2M \regArr_reg[9][2]  ( .D(n253), .SI(\regArr[9][1] ), .SE(n578), 
        .CK(CLK), .RN(n467), .Q(\regArr[9][2] ) );
  SDFFRQX2M \regArr_reg[9][1]  ( .D(n252), .SI(\regArr[9][0] ), .SE(n577), 
        .CK(CLK), .RN(n467), .Q(\regArr[9][1] ) );
  SDFFRQX2M \regArr_reg[9][0]  ( .D(n251), .SI(\regArr[8][7] ), .SE(n577), 
        .CK(CLK), .RN(n467), .Q(\regArr[9][0] ) );
  SDFFRQX2M \regArr_reg[7][7]  ( .D(n242), .SI(\regArr[7][6] ), .SE(n576), 
        .CK(CLK), .RN(n466), .Q(\regArr[7][7] ) );
  SDFFRQX2M \regArr_reg[7][6]  ( .D(n241), .SI(\regArr[7][5] ), .SE(n576), 
        .CK(CLK), .RN(n466), .Q(\regArr[7][6] ) );
  SDFFRQX2M \regArr_reg[7][5]  ( .D(n240), .SI(\regArr[7][4] ), .SE(n575), 
        .CK(CLK), .RN(n466), .Q(\regArr[7][5] ) );
  SDFFRQX2M \regArr_reg[7][4]  ( .D(n239), .SI(test_si2), .SE(n575), .CK(CLK), 
        .RN(n466), .Q(\regArr[7][4] ) );
  SDFFRQX2M \regArr_reg[7][2]  ( .D(n237), .SI(\regArr[7][1] ), .SE(n574), 
        .CK(CLK), .RN(n466), .Q(\regArr[7][2] ) );
  SDFFRQX2M \regArr_reg[7][1]  ( .D(n236), .SI(\regArr[7][0] ), .SE(n573), 
        .CK(CLK), .RN(n466), .Q(\regArr[7][1] ) );
  SDFFRQX2M \regArr_reg[7][0]  ( .D(n235), .SI(\regArr[6][7] ), .SE(n573), 
        .CK(CLK), .RN(n466), .Q(\regArr[7][0] ) );
  SDFFRQX2M \regArr_reg[5][7]  ( .D(n226), .SI(\regArr[5][6] ), .SE(n572), 
        .CK(CLK), .RN(n465), .Q(\regArr[5][7] ) );
  SDFFRQX2M \regArr_reg[5][6]  ( .D(n225), .SI(\regArr[5][5] ), .SE(n572), 
        .CK(CLK), .RN(n465), .Q(\regArr[5][6] ) );
  SDFFRQX2M \regArr_reg[5][5]  ( .D(n224), .SI(\regArr[5][4] ), .SE(n571), 
        .CK(CLK), .RN(n465), .Q(\regArr[5][5] ) );
  SDFFRQX2M \regArr_reg[5][4]  ( .D(n223), .SI(\regArr[5][3] ), .SE(n571), 
        .CK(CLK), .RN(n465), .Q(\regArr[5][4] ) );
  SDFFRQX2M \regArr_reg[5][3]  ( .D(n222), .SI(\regArr[5][2] ), .SE(n570), 
        .CK(CLK), .RN(n465), .Q(\regArr[5][3] ) );
  SDFFRQX2M \regArr_reg[5][2]  ( .D(n221), .SI(\regArr[5][1] ), .SE(n570), 
        .CK(CLK), .RN(n465), .Q(\regArr[5][2] ) );
  SDFFRQX2M \regArr_reg[5][1]  ( .D(n220), .SI(\regArr[5][0] ), .SE(n569), 
        .CK(CLK), .RN(n465), .Q(\regArr[5][1] ) );
  SDFFRQX2M \regArr_reg[5][0]  ( .D(n219), .SI(\regArr[4][7] ), .SE(n569), 
        .CK(CLK), .RN(n465), .Q(\regArr[5][0] ) );
  SDFFRQX2M \regArr_reg[14][7]  ( .D(n298), .SI(\regArr[14][6] ), .SE(n568), 
        .CK(CLK), .RN(n471), .Q(\regArr[14][7] ) );
  SDFFRQX2M \regArr_reg[14][6]  ( .D(n297), .SI(\regArr[14][5] ), .SE(n568), 
        .CK(CLK), .RN(n471), .Q(\regArr[14][6] ) );
  SDFFRQX2M \regArr_reg[14][5]  ( .D(n296), .SI(\regArr[14][4] ), .SE(n567), 
        .CK(CLK), .RN(n471), .Q(\regArr[14][5] ) );
  SDFFRQX2M \regArr_reg[14][4]  ( .D(n295), .SI(\regArr[14][3] ), .SE(n567), 
        .CK(CLK), .RN(n471), .Q(\regArr[14][4] ) );
  SDFFRQX2M \regArr_reg[14][3]  ( .D(n294), .SI(\regArr[14][2] ), .SE(n566), 
        .CK(CLK), .RN(n471), .Q(\regArr[14][3] ) );
  SDFFRQX2M \regArr_reg[14][2]  ( .D(n293), .SI(\regArr[14][1] ), .SE(n566), 
        .CK(CLK), .RN(n470), .Q(\regArr[14][2] ) );
  SDFFRQX2M \regArr_reg[14][1]  ( .D(n292), .SI(\regArr[14][0] ), .SE(n565), 
        .CK(CLK), .RN(n470), .Q(\regArr[14][1] ) );
  SDFFRQX2M \regArr_reg[14][0]  ( .D(n291), .SI(\regArr[13][7] ), .SE(n565), 
        .CK(CLK), .RN(n470), .Q(\regArr[14][0] ) );
  SDFFRQX2M \regArr_reg[12][7]  ( .D(n282), .SI(\regArr[12][6] ), .SE(n564), 
        .CK(CLK), .RN(n470), .Q(\regArr[12][7] ) );
  SDFFRQX2M \regArr_reg[12][6]  ( .D(n281), .SI(\regArr[12][5] ), .SE(n564), 
        .CK(CLK), .RN(n470), .Q(\regArr[12][6] ) );
  SDFFRQX2M \regArr_reg[12][5]  ( .D(n280), .SI(\regArr[12][4] ), .SE(n563), 
        .CK(CLK), .RN(n469), .Q(\regArr[12][5] ) );
  SDFFRQX2M \regArr_reg[12][4]  ( .D(n279), .SI(\regArr[12][3] ), .SE(n563), 
        .CK(CLK), .RN(n469), .Q(\regArr[12][4] ) );
  SDFFRQX2M \regArr_reg[12][3]  ( .D(n278), .SI(\regArr[12][2] ), .SE(n562), 
        .CK(CLK), .RN(n469), .Q(\regArr[12][3] ) );
  SDFFRQX2M \regArr_reg[12][2]  ( .D(n277), .SI(\regArr[12][1] ), .SE(n562), 
        .CK(CLK), .RN(n469), .Q(\regArr[12][2] ) );
  SDFFRQX2M \regArr_reg[12][1]  ( .D(n276), .SI(\regArr[12][0] ), .SE(n561), 
        .CK(CLK), .RN(n469), .Q(\regArr[12][1] ) );
  SDFFRQX2M \regArr_reg[12][0]  ( .D(n275), .SI(\regArr[11][7] ), .SE(n561), 
        .CK(CLK), .RN(n469), .Q(\regArr[12][0] ) );
  SDFFRQX2M \regArr_reg[10][7]  ( .D(n266), .SI(\regArr[10][6] ), .SE(n560), 
        .CK(CLK), .RN(n468), .Q(\regArr[10][7] ) );
  SDFFRQX2M \regArr_reg[10][6]  ( .D(n265), .SI(\regArr[10][5] ), .SE(n560), 
        .CK(CLK), .RN(n468), .Q(\regArr[10][6] ) );
  SDFFRQX2M \regArr_reg[10][5]  ( .D(n264), .SI(\regArr[10][4] ), .SE(n559), 
        .CK(CLK), .RN(n468), .Q(\regArr[10][5] ) );
  SDFFRQX2M \regArr_reg[10][4]  ( .D(n263), .SI(\regArr[10][3] ), .SE(n559), 
        .CK(CLK), .RN(n468), .Q(\regArr[10][4] ) );
  SDFFRQX2M \regArr_reg[10][3]  ( .D(n262), .SI(\regArr[10][2] ), .SE(n558), 
        .CK(CLK), .RN(n468), .Q(\regArr[10][3] ) );
  SDFFRQX2M \regArr_reg[10][2]  ( .D(n261), .SI(\regArr[10][1] ), .SE(n558), 
        .CK(CLK), .RN(n468), .Q(\regArr[10][2] ) );
  SDFFRQX2M \regArr_reg[10][1]  ( .D(n260), .SI(\regArr[10][0] ), .SE(n557), 
        .CK(CLK), .RN(n468), .Q(\regArr[10][1] ) );
  SDFFRQX2M \regArr_reg[10][0]  ( .D(n259), .SI(\regArr[9][7] ), .SE(n557), 
        .CK(CLK), .RN(n468), .Q(\regArr[10][0] ) );
  SDFFRQX2M \regArr_reg[8][7]  ( .D(n250), .SI(\regArr[8][6] ), .SE(n556), 
        .CK(CLK), .RN(n467), .Q(\regArr[8][7] ) );
  SDFFRQX2M \regArr_reg[8][6]  ( .D(n249), .SI(\regArr[8][5] ), .SE(n556), 
        .CK(CLK), .RN(n467), .Q(\regArr[8][6] ) );
  SDFFRQX2M \regArr_reg[8][5]  ( .D(n248), .SI(\regArr[8][4] ), .SE(n555), 
        .CK(CLK), .RN(n467), .Q(\regArr[8][5] ) );
  SDFFRQX2M \regArr_reg[8][4]  ( .D(n247), .SI(\regArr[8][3] ), .SE(n555), 
        .CK(CLK), .RN(n467), .Q(\regArr[8][4] ) );
  SDFFRQX2M \regArr_reg[8][3]  ( .D(n246), .SI(\regArr[8][2] ), .SE(n554), 
        .CK(CLK), .RN(n467), .Q(\regArr[8][3] ) );
  SDFFRQX2M \regArr_reg[8][2]  ( .D(n245), .SI(\regArr[8][1] ), .SE(n554), 
        .CK(CLK), .RN(n467), .Q(\regArr[8][2] ) );
  SDFFRQX2M \regArr_reg[8][1]  ( .D(n244), .SI(\regArr[8][0] ), .SE(n553), 
        .CK(CLK), .RN(n467), .Q(\regArr[8][1] ) );
  SDFFRQX2M \regArr_reg[8][0]  ( .D(n243), .SI(\regArr[7][7] ), .SE(n553), 
        .CK(CLK), .RN(n467), .Q(\regArr[8][0] ) );
  SDFFRQX2M \regArr_reg[6][7]  ( .D(n234), .SI(\regArr[6][6] ), .SE(n552), 
        .CK(CLK), .RN(n466), .Q(\regArr[6][7] ) );
  SDFFRQX2M \regArr_reg[6][6]  ( .D(n233), .SI(\regArr[6][5] ), .SE(n552), 
        .CK(CLK), .RN(n466), .Q(\regArr[6][6] ) );
  SDFFRQX2M \regArr_reg[6][5]  ( .D(n232), .SI(\regArr[6][4] ), .SE(n551), 
        .CK(CLK), .RN(n466), .Q(\regArr[6][5] ) );
  SDFFRQX2M \regArr_reg[6][4]  ( .D(n231), .SI(\regArr[6][3] ), .SE(n551), 
        .CK(CLK), .RN(n466), .Q(\regArr[6][4] ) );
  SDFFRQX2M \regArr_reg[6][3]  ( .D(n230), .SI(\regArr[6][2] ), .SE(n550), 
        .CK(CLK), .RN(n466), .Q(\regArr[6][3] ) );
  SDFFRQX2M \regArr_reg[6][2]  ( .D(n229), .SI(\regArr[6][1] ), .SE(n550), 
        .CK(CLK), .RN(n465), .Q(\regArr[6][2] ) );
  SDFFRQX2M \regArr_reg[6][1]  ( .D(n228), .SI(\regArr[6][0] ), .SE(n549), 
        .CK(CLK), .RN(n465), .Q(\regArr[6][1] ) );
  SDFFRQX2M \regArr_reg[6][0]  ( .D(n227), .SI(\regArr[5][7] ), .SE(n549), 
        .CK(CLK), .RN(n465), .Q(\regArr[6][0] ) );
  SDFFRQX2M \regArr_reg[4][7]  ( .D(n218), .SI(\regArr[4][6] ), .SE(n548), 
        .CK(CLK), .RN(n465), .Q(\regArr[4][7] ) );
  SDFFRQX2M \regArr_reg[4][6]  ( .D(n217), .SI(\regArr[4][5] ), .SE(n548), 
        .CK(CLK), .RN(n465), .Q(\regArr[4][6] ) );
  SDFFRQX2M \regArr_reg[4][5]  ( .D(n216), .SI(\regArr[4][4] ), .SE(n547), 
        .CK(CLK), .RN(n464), .Q(\regArr[4][5] ) );
  SDFFRQX2M \regArr_reg[4][4]  ( .D(n215), .SI(\regArr[4][3] ), .SE(n547), 
        .CK(CLK), .RN(n464), .Q(\regArr[4][4] ) );
  SDFFRQX2M \regArr_reg[4][3]  ( .D(n214), .SI(\regArr[4][2] ), .SE(n546), 
        .CK(CLK), .RN(n464), .Q(\regArr[4][3] ) );
  SDFFRQX2M \regArr_reg[4][2]  ( .D(n213), .SI(\regArr[4][1] ), .SE(n546), 
        .CK(CLK), .RN(n464), .Q(\regArr[4][2] ) );
  SDFFRQX2M \regArr_reg[4][1]  ( .D(n212), .SI(\regArr[4][0] ), .SE(n545), 
        .CK(CLK), .RN(n464), .Q(\regArr[4][1] ) );
  SDFFRQX2M \regArr_reg[4][0]  ( .D(n211), .SI(REG3[7]), .SE(n545), .CK(CLK), 
        .RN(n464), .Q(\regArr[4][0] ) );
  SDFFRQX2M RdData_VLD_reg ( .D(n178), .SI(test_si1), .SE(n544), .CK(CLK), 
        .RN(n467), .Q(RdData_VLD) );
  SDFFRQX2M \regArr_reg[2][1]  ( .D(n196), .SI(n488), .SE(n544), .CK(CLK), 
        .RN(n463), .Q(REG2[1]) );
  SDFFRQX2M \regArr_reg[3][0]  ( .D(n203), .SI(REG2[7]), .SE(n543), .CK(CLK), 
        .RN(n464), .Q(REG3[0]) );
  SDFFRQX4M \regArr_reg[3][7]  ( .D(n210), .SI(REG3[6]), .SE(n599), .CK(CLK), 
        .RN(n464), .Q(REG3[7]) );
  SDFFRQX4M \regArr_reg[3][6]  ( .D(n209), .SI(REG3[5]), .SE(n599), .CK(CLK), 
        .RN(n464), .Q(REG3[6]) );
  SDFFSQX4M \regArr_reg[3][5]  ( .D(n208), .SI(REG3[4]), .SE(n600), .CK(CLK), 
        .SN(n462), .Q(REG3[5]) );
  SDFFRQX2M \regArr_reg[0][0]  ( .D(n179), .SI(RdData[7]), .SE(n543), .CK(CLK), 
        .RN(n462), .Q(REG0[0]) );
  SDFFRQX2M \regArr_reg[0][2]  ( .D(n181), .SI(REG0[1]), .SE(n542), .CK(CLK), 
        .RN(n462), .Q(REG0[2]) );
  SDFFRQX2M \regArr_reg[0][1]  ( .D(n180), .SI(REG0[0]), .SE(n542), .CK(CLK), 
        .RN(n462), .Q(REG0[1]) );
  SDFFRQX4M \regArr_reg[3][4]  ( .D(n207), .SI(REG3[3]), .SE(n598), .CK(CLK), 
        .RN(n464), .Q(REG3[4]) );
  SDFFRQX4M \regArr_reg[3][3]  ( .D(n206), .SI(REG3[2]), .SE(n598), .CK(CLK), 
        .RN(n464), .Q(REG3[3]) );
  SDFFRQX2M \regArr_reg[2][3]  ( .D(n198), .SI(REG2[2]), .SE(n541), .CK(CLK), 
        .RN(n463), .Q(REG2[3]) );
  SDFFRQX4M \regArr_reg[3][2]  ( .D(n205), .SI(REG3[1]), .SE(n597), .CK(CLK), 
        .RN(n464), .Q(REG3[2]) );
  SDFFRQX4M \regArr_reg[3][1]  ( .D(n204), .SI(n606), .SE(n597), .CK(CLK), 
        .RN(n464), .Q(REG3[1]) );
  SDFFSQX2M \regArr_reg[2][7]  ( .D(n202), .SI(n608), .SE(n601), .CK(CLK), 
        .SN(n462), .Q(REG2[7]) );
  SDFFRQX2M \regArr_reg[2][6]  ( .D(n201), .SI(n607), .SE(n541), .CK(CLK), 
        .RN(n463), .Q(REG2[6]) );
  SDFFRQX2M \regArr_reg[2][5]  ( .D(n200), .SI(REG2[4]), .SE(n540), .CK(CLK), 
        .RN(n463), .Q(REG2[5]) );
  SDFFRQX2M \regArr_reg[2][4]  ( .D(n199), .SI(REG2[3]), .SE(n540), .CK(CLK), 
        .RN(n463), .Q(REG2[4]) );
  SDFFRQX2M \regArr_reg[0][3]  ( .D(n182), .SI(REG0[2]), .SE(n539), .CK(CLK), 
        .RN(n462), .Q(REG0[3]) );
  SDFFRQX2M \regArr_reg[0][4]  ( .D(n183), .SI(REG0[3]), .SE(n539), .CK(CLK), 
        .RN(n462), .Q(REG0[4]) );
  SDFFRQX2M \regArr_reg[0][5]  ( .D(n184), .SI(REG0[4]), .SE(n538), .CK(CLK), 
        .RN(n462), .Q(REG0[5]) );
  SDFFRQX2M \regArr_reg[0][6]  ( .D(n185), .SI(REG0[5]), .SE(n538), .CK(CLK), 
        .RN(n463), .Q(REG0[6]) );
  SDFFRQX2M \regArr_reg[0][7]  ( .D(n186), .SI(REG0[6]), .SE(n537), .CK(CLK), 
        .RN(n462), .Q(REG0[7]) );
  SDFFSQX2M \regArr_reg[2][0]  ( .D(n195), .SI(REG1[7]), .SE(n600), .CK(CLK), 
        .SN(n462), .Q(n488) );
  NOR2X2M U140 ( .A(n411), .B(n410), .Y(n399) );
  NOR2X2M U141 ( .A(n411), .B(N11), .Y(n400) );
  NOR2X2M U142 ( .A(n410), .B(N12), .Y(n401) );
  NOR2X2M U143 ( .A(N11), .B(N12), .Y(n402) );
  NAND2X4M U144 ( .A(N14), .B(N13), .Y(n393) );
  NAND2X4M U145 ( .A(N14), .B(n412), .Y(n390) );
  CLKINVX1M U146 ( .A(N13), .Y(n412) );
  NAND2X4M U147 ( .A(N13), .B(n413), .Y(n403) );
  INVXLM U148 ( .A(n488), .Y(n138) );
  INVX6M U149 ( .A(n138), .Y(REG2[0]) );
  NAND2X4M U151 ( .A(n412), .B(n413), .Y(n396) );
  CLKINVX1M U152 ( .A(N14), .Y(n413) );
  AND2X2M U153 ( .A(n164), .B(N11), .Y(n155) );
  AND2X2M U154 ( .A(n175), .B(N11), .Y(n169) );
  NOR2X4M U155 ( .A(n411), .B(N13), .Y(n157) );
  NOR2X4M U156 ( .A(N12), .B(N13), .Y(n152) );
  AND2X2M U157 ( .A(N13), .B(N12), .Y(n163) );
  AND2X2M U158 ( .A(N13), .B(n411), .Y(n160) );
  INVX8M U159 ( .A(WrData[0]), .Y(n486) );
  INVX8M U160 ( .A(WrData[1]), .Y(n485) );
  INVX8M U161 ( .A(WrData[2]), .Y(n484) );
  INVX8M U162 ( .A(WrData[3]), .Y(n483) );
  INVX8M U163 ( .A(WrData[4]), .Y(n482) );
  INVX8M U164 ( .A(WrData[5]), .Y(n481) );
  INVX8M U165 ( .A(WrData[6]), .Y(n480) );
  INVX8M U166 ( .A(WrData[7]), .Y(n479) );
  CLKBUFX8M U167 ( .A(n476), .Y(n462) );
  CLKBUFX8M U168 ( .A(n475), .Y(n464) );
  CLKBUFX8M U169 ( .A(n475), .Y(n465) );
  CLKBUFX8M U170 ( .A(n475), .Y(n466) );
  CLKBUFX8M U171 ( .A(n474), .Y(n467) );
  CLKBUFX8M U172 ( .A(n474), .Y(n468) );
  CLKBUFX8M U173 ( .A(n474), .Y(n469) );
  CLKBUFX8M U174 ( .A(n473), .Y(n470) );
  CLKBUFX8M U175 ( .A(n473), .Y(n471) );
  CLKBUFX8M U176 ( .A(n476), .Y(n463) );
  BUFX4M U177 ( .A(n473), .Y(n472) );
  CLKBUFX6M U178 ( .A(n414), .Y(n416) );
  BUFX4M U179 ( .A(n399), .Y(n415) );
  BUFX2M U180 ( .A(n477), .Y(n475) );
  BUFX2M U181 ( .A(n477), .Y(n474) );
  BUFX2M U182 ( .A(n476), .Y(n473) );
  BUFX2M U183 ( .A(n477), .Y(n476) );
  CLKBUFX6M U184 ( .A(n418), .Y(n420) );
  CLKBUFX6M U185 ( .A(n426), .Y(n428) );
  CLKBUFX6M U186 ( .A(n422), .Y(n424) );
  CLKBUFX6M U187 ( .A(n414), .Y(n417) );
  BUFX2M U188 ( .A(n399), .Y(n414) );
  BUFX4M U189 ( .A(n418), .Y(n419) );
  BUFX4M U190 ( .A(n402), .Y(n427) );
  BUFX4M U191 ( .A(n401), .Y(n423) );
  BUFX4M U192 ( .A(n154), .Y(n459) );
  BUFX4M U193 ( .A(n166), .Y(n445) );
  BUFX4M U194 ( .A(n168), .Y(n443) );
  BUFX4M U195 ( .A(n170), .Y(n441) );
  BUFX4M U196 ( .A(n171), .Y(n439) );
  BUFX4M U197 ( .A(n156), .Y(n457) );
  BUFX4M U198 ( .A(n158), .Y(n455) );
  BUFX4M U199 ( .A(n151), .Y(n461) );
  BUFX4M U200 ( .A(n154), .Y(n458) );
  BUFX4M U201 ( .A(n166), .Y(n444) );
  BUFX4M U202 ( .A(n168), .Y(n442) );
  BUFX4M U203 ( .A(n170), .Y(n440) );
  BUFX4M U204 ( .A(n171), .Y(n438) );
  BUFX4M U205 ( .A(n156), .Y(n456) );
  BUFX4M U206 ( .A(n158), .Y(n454) );
  BUFX4M U207 ( .A(n151), .Y(n460) );
  INVX4M U208 ( .A(n141), .Y(n453) );
  INVX4M U209 ( .A(n141), .Y(n452) );
  INVX4M U210 ( .A(n142), .Y(n451) );
  INVX4M U211 ( .A(n142), .Y(n450) );
  INVX4M U212 ( .A(n143), .Y(n449) );
  INVX4M U213 ( .A(n143), .Y(n448) );
  INVX4M U214 ( .A(n144), .Y(n447) );
  INVX4M U215 ( .A(n144), .Y(n446) );
  INVX4M U216 ( .A(n147), .Y(n437) );
  INVX4M U217 ( .A(n147), .Y(n436) );
  INVX4M U218 ( .A(n145), .Y(n435) );
  INVX4M U219 ( .A(n145), .Y(n434) );
  INVX4M U220 ( .A(n148), .Y(n433) );
  INVX4M U221 ( .A(n148), .Y(n432) );
  INVX4M U222 ( .A(n146), .Y(n431) );
  INVX4M U223 ( .A(n146), .Y(n430) );
  CLKBUFX6M U224 ( .A(n418), .Y(n421) );
  CLKBUFX6M U225 ( .A(n426), .Y(n429) );
  BUFX2M U226 ( .A(n402), .Y(n426) );
  CLKBUFX6M U227 ( .A(n422), .Y(n425) );
  BUFX2M U228 ( .A(n401), .Y(n422) );
  BUFX2M U229 ( .A(n400), .Y(n418) );
  OAI2BB2X1M U230 ( .B0(n483), .B1(n456), .A0N(REG2[3]), .A1N(n457), .Y(n198)
         );
  OAI2BB2X1M U231 ( .B0(n482), .B1(n456), .A0N(REG2[4]), .A1N(n457), .Y(n199)
         );
  OAI2BB2X1M U232 ( .B0(n481), .B1(n456), .A0N(n607), .A1N(n457), .Y(n200) );
  OAI2BB2X1M U233 ( .B0(n480), .B1(n456), .A0N(n608), .A1N(n457), .Y(n201) );
  OAI2BB2X1M U234 ( .B0(n479), .B1(n456), .A0N(REG2[7]), .A1N(n457), .Y(n202)
         );
  AND2X2M U235 ( .A(n164), .B(n410), .Y(n153) );
  AND2X2M U236 ( .A(n175), .B(n410), .Y(n167) );
  NAND2X2M U237 ( .A(n152), .B(n153), .Y(n151) );
  NAND2X2M U238 ( .A(n157), .B(n153), .Y(n156) );
  NAND2X2M U239 ( .A(n157), .B(n155), .Y(n158) );
  NAND2X2M U240 ( .A(n155), .B(n152), .Y(n154) );
  NAND2X2M U241 ( .A(n167), .B(n152), .Y(n166) );
  NAND2X2M U242 ( .A(n169), .B(n152), .Y(n168) );
  NAND2X2M U243 ( .A(n167), .B(n157), .Y(n170) );
  NAND2X2M U244 ( .A(n169), .B(n157), .Y(n171) );
  AND2X2M U245 ( .A(n160), .B(n153), .Y(n141) );
  AND2X2M U246 ( .A(n160), .B(n155), .Y(n142) );
  AND2X2M U247 ( .A(n163), .B(n153), .Y(n143) );
  AND2X2M U248 ( .A(n163), .B(n155), .Y(n144) );
  AND2X2M U249 ( .A(n169), .B(n160), .Y(n145) );
  AND2X2M U250 ( .A(n169), .B(n163), .Y(n146) );
  AND2X2M U251 ( .A(n167), .B(n160), .Y(n147) );
  AND2X2M U252 ( .A(n167), .B(n163), .Y(n148) );
  INVX4M U253 ( .A(n177), .Y(n478) );
  BUFX2M U254 ( .A(RST), .Y(n477) );
  AO22X1M U255 ( .A0(N43), .A1(n478), .B0(RdData[0]), .B1(n177), .Y(n307) );
  AO22X1M U256 ( .A0(N42), .A1(n478), .B0(RdData[1]), .B1(n177), .Y(n308) );
  AO22X1M U257 ( .A0(N41), .A1(n478), .B0(RdData[2]), .B1(n177), .Y(n309) );
  AO22X1M U258 ( .A0(N40), .A1(n478), .B0(RdData[3]), .B1(n177), .Y(n310) );
  AO22X1M U259 ( .A0(N39), .A1(n478), .B0(RdData[4]), .B1(n177), .Y(n311) );
  AO22X1M U260 ( .A0(N38), .A1(n478), .B0(RdData[5]), .B1(n177), .Y(n312) );
  AO22X1M U261 ( .A0(N37), .A1(n478), .B0(RdData[6]), .B1(n177), .Y(n313) );
  AO22X1M U262 ( .A0(N36), .A1(n478), .B0(RdData[7]), .B1(n177), .Y(n314) );
  INVX2M U263 ( .A(N12), .Y(n411) );
  INVX2M U264 ( .A(N11), .Y(n410) );
  NOR2X4M U265 ( .A(n487), .B(RdEn), .Y(n150) );
  NOR2BX2M U266 ( .AN(n150), .B(N14), .Y(n164) );
  OAI2BB2X1M U267 ( .B0(n461), .B1(n486), .A0N(REG0[0]), .A1N(n461), .Y(n179)
         );
  OAI2BB2X1M U268 ( .B0(n460), .B1(n485), .A0N(REG0[1]), .A1N(n461), .Y(n180)
         );
  OAI2BB2X1M U269 ( .B0(n460), .B1(n484), .A0N(REG0[2]), .A1N(n461), .Y(n181)
         );
  OAI2BB2X1M U270 ( .B0(n460), .B1(n483), .A0N(REG0[3]), .A1N(n461), .Y(n182)
         );
  OAI2BB2X1M U271 ( .B0(n460), .B1(n482), .A0N(REG0[4]), .A1N(n461), .Y(n183)
         );
  OAI2BB2X1M U272 ( .B0(n460), .B1(n481), .A0N(REG0[5]), .A1N(n461), .Y(n184)
         );
  OAI2BB2X1M U273 ( .B0(n460), .B1(n480), .A0N(REG0[6]), .A1N(n461), .Y(n185)
         );
  OAI2BB2X1M U274 ( .B0(n460), .B1(n479), .A0N(REG0[7]), .A1N(n461), .Y(n186)
         );
  OAI2BB2X1M U275 ( .B0(n486), .B1(n459), .A0N(REG1[0]), .A1N(n459), .Y(n187)
         );
  OAI2BB2X1M U276 ( .B0(n485), .B1(n458), .A0N(REG1[1]), .A1N(n459), .Y(n188)
         );
  OAI2BB2X1M U277 ( .B0(n484), .B1(n458), .A0N(REG1[2]), .A1N(n459), .Y(n189)
         );
  OAI2BB2X1M U278 ( .B0(n483), .B1(n458), .A0N(REG1[3]), .A1N(n459), .Y(n190)
         );
  OAI2BB2X1M U279 ( .B0(n482), .B1(n458), .A0N(REG1[4]), .A1N(n459), .Y(n191)
         );
  OAI2BB2X1M U280 ( .B0(n481), .B1(n458), .A0N(REG1[5]), .A1N(n459), .Y(n192)
         );
  OAI2BB2X1M U281 ( .B0(n480), .B1(n458), .A0N(REG1[6]), .A1N(n459), .Y(n193)
         );
  OAI2BB2X1M U282 ( .B0(n479), .B1(n458), .A0N(REG1[7]), .A1N(n459), .Y(n194)
         );
  OAI2BB2X1M U283 ( .B0(n485), .B1(n456), .A0N(n609), .A1N(n457), .Y(n196) );
  OAI2BB2X1M U284 ( .B0(n484), .B1(n456), .A0N(REG2[2]), .A1N(n457), .Y(n197)
         );
  OAI2BB2X1M U285 ( .B0(n486), .B1(n455), .A0N(n606), .A1N(n455), .Y(n203) );
  OAI2BB2X1M U286 ( .B0(n485), .B1(n454), .A0N(REG3[1]), .A1N(n455), .Y(n204)
         );
  OAI2BB2X1M U287 ( .B0(n484), .B1(n454), .A0N(REG3[2]), .A1N(n455), .Y(n205)
         );
  OAI2BB2X1M U288 ( .B0(n483), .B1(n454), .A0N(REG3[3]), .A1N(n455), .Y(n206)
         );
  OAI2BB2X1M U289 ( .B0(n482), .B1(n454), .A0N(REG3[4]), .A1N(n455), .Y(n207)
         );
  OAI2BB2X1M U290 ( .B0(n480), .B1(n454), .A0N(REG3[6]), .A1N(n455), .Y(n209)
         );
  OAI2BB2X1M U291 ( .B0(n479), .B1(n454), .A0N(REG3[7]), .A1N(n455), .Y(n210)
         );
  OAI2BB2X1M U292 ( .B0(n486), .B1(n453), .A0N(\regArr[4][0] ), .A1N(n453), 
        .Y(n211) );
  OAI2BB2X1M U293 ( .B0(n485), .B1(n452), .A0N(\regArr[4][1] ), .A1N(n452), 
        .Y(n212) );
  OAI2BB2X1M U294 ( .B0(n484), .B1(n453), .A0N(\regArr[4][2] ), .A1N(n453), 
        .Y(n213) );
  OAI2BB2X1M U295 ( .B0(n483), .B1(n452), .A0N(\regArr[4][3] ), .A1N(n452), 
        .Y(n214) );
  OAI2BB2X1M U296 ( .B0(n482), .B1(n453), .A0N(\regArr[4][4] ), .A1N(n453), 
        .Y(n215) );
  OAI2BB2X1M U297 ( .B0(n481), .B1(n452), .A0N(\regArr[4][5] ), .A1N(n452), 
        .Y(n216) );
  OAI2BB2X1M U298 ( .B0(n480), .B1(n453), .A0N(\regArr[4][6] ), .A1N(n453), 
        .Y(n217) );
  OAI2BB2X1M U299 ( .B0(n479), .B1(n452), .A0N(\regArr[4][7] ), .A1N(n452), 
        .Y(n218) );
  OAI2BB2X1M U300 ( .B0(n486), .B1(n451), .A0N(\regArr[5][0] ), .A1N(n451), 
        .Y(n219) );
  OAI2BB2X1M U301 ( .B0(n485), .B1(n450), .A0N(\regArr[5][1] ), .A1N(n450), 
        .Y(n220) );
  OAI2BB2X1M U302 ( .B0(n484), .B1(n451), .A0N(\regArr[5][2] ), .A1N(n451), 
        .Y(n221) );
  OAI2BB2X1M U303 ( .B0(n483), .B1(n450), .A0N(\regArr[5][3] ), .A1N(n450), 
        .Y(n222) );
  OAI2BB2X1M U304 ( .B0(n482), .B1(n451), .A0N(\regArr[5][4] ), .A1N(n451), 
        .Y(n223) );
  OAI2BB2X1M U305 ( .B0(n481), .B1(n450), .A0N(\regArr[5][5] ), .A1N(n450), 
        .Y(n224) );
  OAI2BB2X1M U306 ( .B0(n480), .B1(n451), .A0N(\regArr[5][6] ), .A1N(n451), 
        .Y(n225) );
  OAI2BB2X1M U307 ( .B0(n479), .B1(n450), .A0N(\regArr[5][7] ), .A1N(n450), 
        .Y(n226) );
  OAI2BB2X1M U308 ( .B0(n486), .B1(n449), .A0N(\regArr[6][0] ), .A1N(n449), 
        .Y(n227) );
  OAI2BB2X1M U309 ( .B0(n485), .B1(n448), .A0N(\regArr[6][1] ), .A1N(n448), 
        .Y(n228) );
  OAI2BB2X1M U310 ( .B0(n484), .B1(n449), .A0N(\regArr[6][2] ), .A1N(n449), 
        .Y(n229) );
  OAI2BB2X1M U311 ( .B0(n483), .B1(n448), .A0N(\regArr[6][3] ), .A1N(n448), 
        .Y(n230) );
  OAI2BB2X1M U312 ( .B0(n482), .B1(n449), .A0N(\regArr[6][4] ), .A1N(n449), 
        .Y(n231) );
  OAI2BB2X1M U313 ( .B0(n481), .B1(n448), .A0N(\regArr[6][5] ), .A1N(n448), 
        .Y(n232) );
  OAI2BB2X1M U314 ( .B0(n480), .B1(n449), .A0N(\regArr[6][6] ), .A1N(n449), 
        .Y(n233) );
  OAI2BB2X1M U315 ( .B0(n479), .B1(n448), .A0N(\regArr[6][7] ), .A1N(n448), 
        .Y(n234) );
  OAI2BB2X1M U316 ( .B0(n486), .B1(n447), .A0N(\regArr[7][0] ), .A1N(n447), 
        .Y(n235) );
  OAI2BB2X1M U317 ( .B0(n485), .B1(n446), .A0N(\regArr[7][1] ), .A1N(n446), 
        .Y(n236) );
  OAI2BB2X1M U318 ( .B0(n484), .B1(n447), .A0N(\regArr[7][2] ), .A1N(n447), 
        .Y(n237) );
  OAI2BB2X1M U319 ( .B0(n483), .B1(n446), .A0N(n610), .A1N(n446), .Y(n238) );
  OAI2BB2X1M U320 ( .B0(n482), .B1(n447), .A0N(\regArr[7][4] ), .A1N(n447), 
        .Y(n239) );
  OAI2BB2X1M U321 ( .B0(n481), .B1(n446), .A0N(\regArr[7][5] ), .A1N(n446), 
        .Y(n240) );
  OAI2BB2X1M U322 ( .B0(n480), .B1(n447), .A0N(\regArr[7][6] ), .A1N(n447), 
        .Y(n241) );
  OAI2BB2X1M U323 ( .B0(n479), .B1(n446), .A0N(\regArr[7][7] ), .A1N(n446), 
        .Y(n242) );
  OAI2BB2X1M U324 ( .B0(n486), .B1(n445), .A0N(\regArr[8][0] ), .A1N(n445), 
        .Y(n243) );
  OAI2BB2X1M U325 ( .B0(n485), .B1(n444), .A0N(\regArr[8][1] ), .A1N(n445), 
        .Y(n244) );
  OAI2BB2X1M U326 ( .B0(n484), .B1(n444), .A0N(\regArr[8][2] ), .A1N(n445), 
        .Y(n245) );
  OAI2BB2X1M U327 ( .B0(n483), .B1(n444), .A0N(\regArr[8][3] ), .A1N(n445), 
        .Y(n246) );
  OAI2BB2X1M U328 ( .B0(n482), .B1(n444), .A0N(\regArr[8][4] ), .A1N(n445), 
        .Y(n247) );
  OAI2BB2X1M U329 ( .B0(n481), .B1(n444), .A0N(\regArr[8][5] ), .A1N(n445), 
        .Y(n248) );
  OAI2BB2X1M U330 ( .B0(n480), .B1(n444), .A0N(\regArr[8][6] ), .A1N(n445), 
        .Y(n249) );
  OAI2BB2X1M U331 ( .B0(n479), .B1(n444), .A0N(\regArr[8][7] ), .A1N(n445), 
        .Y(n250) );
  OAI2BB2X1M U332 ( .B0(n486), .B1(n443), .A0N(\regArr[9][0] ), .A1N(n443), 
        .Y(n251) );
  OAI2BB2X1M U333 ( .B0(n485), .B1(n442), .A0N(\regArr[9][1] ), .A1N(n443), 
        .Y(n252) );
  OAI2BB2X1M U334 ( .B0(n484), .B1(n442), .A0N(\regArr[9][2] ), .A1N(n443), 
        .Y(n253) );
  OAI2BB2X1M U335 ( .B0(n483), .B1(n442), .A0N(\regArr[9][3] ), .A1N(n443), 
        .Y(n254) );
  OAI2BB2X1M U336 ( .B0(n482), .B1(n442), .A0N(\regArr[9][4] ), .A1N(n443), 
        .Y(n255) );
  OAI2BB2X1M U337 ( .B0(n481), .B1(n442), .A0N(\regArr[9][5] ), .A1N(n443), 
        .Y(n256) );
  OAI2BB2X1M U338 ( .B0(n480), .B1(n442), .A0N(\regArr[9][6] ), .A1N(n443), 
        .Y(n257) );
  OAI2BB2X1M U339 ( .B0(n479), .B1(n442), .A0N(\regArr[9][7] ), .A1N(n443), 
        .Y(n258) );
  OAI2BB2X1M U340 ( .B0(n486), .B1(n441), .A0N(\regArr[10][0] ), .A1N(n441), 
        .Y(n259) );
  OAI2BB2X1M U341 ( .B0(n485), .B1(n440), .A0N(\regArr[10][1] ), .A1N(n441), 
        .Y(n260) );
  OAI2BB2X1M U342 ( .B0(n484), .B1(n440), .A0N(\regArr[10][2] ), .A1N(n441), 
        .Y(n261) );
  OAI2BB2X1M U343 ( .B0(n483), .B1(n440), .A0N(\regArr[10][3] ), .A1N(n441), 
        .Y(n262) );
  OAI2BB2X1M U344 ( .B0(n482), .B1(n440), .A0N(\regArr[10][4] ), .A1N(n441), 
        .Y(n263) );
  OAI2BB2X1M U345 ( .B0(n481), .B1(n440), .A0N(\regArr[10][5] ), .A1N(n441), 
        .Y(n264) );
  OAI2BB2X1M U346 ( .B0(n480), .B1(n440), .A0N(\regArr[10][6] ), .A1N(n441), 
        .Y(n265) );
  OAI2BB2X1M U347 ( .B0(n479), .B1(n440), .A0N(\regArr[10][7] ), .A1N(n441), 
        .Y(n266) );
  OAI2BB2X1M U348 ( .B0(n486), .B1(n439), .A0N(\regArr[11][0] ), .A1N(n439), 
        .Y(n267) );
  OAI2BB2X1M U349 ( .B0(n485), .B1(n438), .A0N(\regArr[11][1] ), .A1N(n439), 
        .Y(n268) );
  OAI2BB2X1M U350 ( .B0(n484), .B1(n438), .A0N(\regArr[11][2] ), .A1N(n439), 
        .Y(n269) );
  OAI2BB2X1M U351 ( .B0(n483), .B1(n438), .A0N(\regArr[11][3] ), .A1N(n439), 
        .Y(n270) );
  OAI2BB2X1M U352 ( .B0(n482), .B1(n438), .A0N(\regArr[11][4] ), .A1N(n439), 
        .Y(n271) );
  OAI2BB2X1M U353 ( .B0(n481), .B1(n438), .A0N(\regArr[11][5] ), .A1N(n439), 
        .Y(n272) );
  OAI2BB2X1M U354 ( .B0(n480), .B1(n438), .A0N(\regArr[11][6] ), .A1N(n439), 
        .Y(n273) );
  OAI2BB2X1M U355 ( .B0(n479), .B1(n438), .A0N(\regArr[11][7] ), .A1N(n439), 
        .Y(n274) );
  OAI2BB2X1M U356 ( .B0(n486), .B1(n437), .A0N(\regArr[12][0] ), .A1N(n437), 
        .Y(n275) );
  OAI2BB2X1M U357 ( .B0(n485), .B1(n436), .A0N(\regArr[12][1] ), .A1N(n436), 
        .Y(n276) );
  OAI2BB2X1M U358 ( .B0(n484), .B1(n437), .A0N(\regArr[12][2] ), .A1N(n437), 
        .Y(n277) );
  OAI2BB2X1M U359 ( .B0(n483), .B1(n436), .A0N(\regArr[12][3] ), .A1N(n436), 
        .Y(n278) );
  OAI2BB2X1M U360 ( .B0(n482), .B1(n437), .A0N(\regArr[12][4] ), .A1N(n437), 
        .Y(n279) );
  OAI2BB2X1M U361 ( .B0(n481), .B1(n436), .A0N(\regArr[12][5] ), .A1N(n436), 
        .Y(n280) );
  OAI2BB2X1M U362 ( .B0(n480), .B1(n437), .A0N(\regArr[12][6] ), .A1N(n437), 
        .Y(n281) );
  OAI2BB2X1M U363 ( .B0(n479), .B1(n436), .A0N(\regArr[12][7] ), .A1N(n436), 
        .Y(n282) );
  OAI2BB2X1M U364 ( .B0(n486), .B1(n435), .A0N(\regArr[13][0] ), .A1N(n435), 
        .Y(n283) );
  OAI2BB2X1M U365 ( .B0(n485), .B1(n434), .A0N(\regArr[13][1] ), .A1N(n434), 
        .Y(n284) );
  OAI2BB2X1M U366 ( .B0(n484), .B1(n435), .A0N(\regArr[13][2] ), .A1N(n435), 
        .Y(n285) );
  OAI2BB2X1M U367 ( .B0(n483), .B1(n434), .A0N(\regArr[13][3] ), .A1N(n434), 
        .Y(n286) );
  OAI2BB2X1M U368 ( .B0(n482), .B1(n435), .A0N(\regArr[13][4] ), .A1N(n435), 
        .Y(n287) );
  OAI2BB2X1M U369 ( .B0(n481), .B1(n434), .A0N(\regArr[13][5] ), .A1N(n434), 
        .Y(n288) );
  OAI2BB2X1M U370 ( .B0(n480), .B1(n435), .A0N(\regArr[13][6] ), .A1N(n435), 
        .Y(n289) );
  OAI2BB2X1M U371 ( .B0(n479), .B1(n434), .A0N(\regArr[13][7] ), .A1N(n434), 
        .Y(n290) );
  OAI2BB2X1M U372 ( .B0(n486), .B1(n433), .A0N(\regArr[14][0] ), .A1N(n433), 
        .Y(n291) );
  OAI2BB2X1M U373 ( .B0(n485), .B1(n432), .A0N(\regArr[14][1] ), .A1N(n432), 
        .Y(n292) );
  OAI2BB2X1M U374 ( .B0(n484), .B1(n433), .A0N(\regArr[14][2] ), .A1N(n433), 
        .Y(n293) );
  OAI2BB2X1M U375 ( .B0(n483), .B1(n432), .A0N(\regArr[14][3] ), .A1N(n432), 
        .Y(n294) );
  OAI2BB2X1M U376 ( .B0(n482), .B1(n433), .A0N(\regArr[14][4] ), .A1N(n433), 
        .Y(n295) );
  OAI2BB2X1M U377 ( .B0(n481), .B1(n432), .A0N(\regArr[14][5] ), .A1N(n432), 
        .Y(n296) );
  OAI2BB2X1M U378 ( .B0(n480), .B1(n433), .A0N(\regArr[14][6] ), .A1N(n433), 
        .Y(n297) );
  OAI2BB2X1M U379 ( .B0(n479), .B1(n432), .A0N(\regArr[14][7] ), .A1N(n432), 
        .Y(n298) );
  OAI2BB2X1M U380 ( .B0(n486), .B1(n431), .A0N(\regArr[15][0] ), .A1N(n431), 
        .Y(n299) );
  OAI2BB2X1M U381 ( .B0(n485), .B1(n430), .A0N(\regArr[15][1] ), .A1N(n430), 
        .Y(n300) );
  OAI2BB2X1M U382 ( .B0(n484), .B1(n431), .A0N(\regArr[15][2] ), .A1N(n431), 
        .Y(n301) );
  OAI2BB2X1M U383 ( .B0(n483), .B1(n430), .A0N(\regArr[15][3] ), .A1N(n430), 
        .Y(n302) );
  OAI2BB2X1M U384 ( .B0(n482), .B1(n431), .A0N(\regArr[15][4] ), .A1N(n431), 
        .Y(n303) );
  OAI2BB2X1M U385 ( .B0(n481), .B1(n430), .A0N(\regArr[15][5] ), .A1N(n430), 
        .Y(n304) );
  OAI2BB2X1M U386 ( .B0(n480), .B1(n431), .A0N(\regArr[15][6] ), .A1N(n431), 
        .Y(n305) );
  OAI2BB2X1M U387 ( .B0(n479), .B1(n430), .A0N(\regArr[15][7] ), .A1N(n430), 
        .Y(n306) );
  OAI2BB2X1M U388 ( .B0(n486), .B1(n457), .A0N(REG2[0]), .A1N(n457), .Y(n195)
         );
  OAI2BB2X1M U389 ( .B0(n481), .B1(n454), .A0N(REG3[5]), .A1N(n455), .Y(n208)
         );
  INVX2M U390 ( .A(WrEn), .Y(n487) );
  AND2X2M U391 ( .A(N14), .B(n150), .Y(n175) );
  NAND2X6M U392 ( .A(RdEn), .B(n487), .Y(n177) );
  AO21XLM U393 ( .A0(RdData_VLD), .A1(n150), .B0(n478), .Y(n178) );
  AOI22X1M U394 ( .A0(\regArr[10][0] ), .A1(n421), .B0(\regArr[11][0] ), .B1(
        n417), .Y(n159) );
  AOI22X1M U395 ( .A0(\regArr[8][0] ), .A1(n429), .B0(\regArr[9][0] ), .B1(
        n425), .Y(n149) );
  AOI21X1M U396 ( .A0(n159), .A1(n149), .B0(n390), .Y(n317) );
  AOI22X1M U397 ( .A0(\regArr[14][0] ), .A1(n421), .B0(\regArr[15][0] ), .B1(
        n417), .Y(n162) );
  AOI22X1M U398 ( .A0(\regArr[12][0] ), .A1(n429), .B0(\regArr[13][0] ), .B1(
        n425), .Y(n161) );
  AOI21X1M U399 ( .A0(n162), .A1(n161), .B0(n393), .Y(n316) );
  AOI22X1M U400 ( .A0(REG2[0]), .A1(n421), .B0(n417), .B1(REG3[0]), .Y(n172)
         );
  AOI22X1M U401 ( .A0(REG0[0]), .A1(n429), .B0(REG1[0]), .B1(n425), .Y(n165)
         );
  AOI21X1M U402 ( .A0(n172), .A1(n165), .B0(n396), .Y(n315) );
  AOI22X1M U403 ( .A0(\regArr[6][0] ), .A1(n421), .B0(\regArr[7][0] ), .B1(
        n417), .Y(n174) );
  AOI22X1M U404 ( .A0(\regArr[4][0] ), .A1(n429), .B0(\regArr[5][0] ), .B1(
        n425), .Y(n173) );
  AOI21X1M U405 ( .A0(n174), .A1(n173), .B0(n403), .Y(n176) );
  OR4X1M U406 ( .A(n317), .B(n316), .C(n315), .D(n176), .Y(N43) );
  AOI22X1M U407 ( .A0(\regArr[10][1] ), .A1(n421), .B0(\regArr[11][1] ), .B1(
        n417), .Y(n319) );
  AOI22X1M U408 ( .A0(\regArr[8][1] ), .A1(n429), .B0(\regArr[9][1] ), .B1(
        n425), .Y(n318) );
  AOI21X1M U409 ( .A0(n319), .A1(n318), .B0(n390), .Y(n329) );
  AOI22X1M U410 ( .A0(\regArr[14][1] ), .A1(n421), .B0(\regArr[15][1] ), .B1(
        n417), .Y(n321) );
  AOI22X1M U411 ( .A0(\regArr[12][1] ), .A1(n429), .B0(\regArr[13][1] ), .B1(
        n425), .Y(n320) );
  AOI21X1M U412 ( .A0(n321), .A1(n320), .B0(n393), .Y(n328) );
  AOI22X1M U413 ( .A0(REG2[1]), .A1(n421), .B0(REG3[1]), .B1(n417), .Y(n323)
         );
  AOI22X1M U414 ( .A0(REG0[1]), .A1(n429), .B0(REG1[1]), .B1(n425), .Y(n322)
         );
  AOI21X1M U415 ( .A0(n323), .A1(n322), .B0(n396), .Y(n327) );
  AOI22X1M U416 ( .A0(\regArr[6][1] ), .A1(n421), .B0(\regArr[7][1] ), .B1(
        n417), .Y(n325) );
  AOI22X1M U417 ( .A0(\regArr[4][1] ), .A1(n429), .B0(\regArr[5][1] ), .B1(
        n425), .Y(n324) );
  AOI21X1M U418 ( .A0(n325), .A1(n324), .B0(n403), .Y(n326) );
  OR4X1M U419 ( .A(n329), .B(n328), .C(n327), .D(n326), .Y(N42) );
  AOI22X1M U420 ( .A0(\regArr[10][2] ), .A1(n421), .B0(\regArr[11][2] ), .B1(
        n417), .Y(n331) );
  AOI22X1M U421 ( .A0(\regArr[8][2] ), .A1(n429), .B0(\regArr[9][2] ), .B1(
        n425), .Y(n330) );
  AOI21X1M U422 ( .A0(n331), .A1(n330), .B0(n390), .Y(n341) );
  AOI22X1M U423 ( .A0(\regArr[14][2] ), .A1(n421), .B0(\regArr[15][2] ), .B1(
        n417), .Y(n333) );
  AOI22X1M U424 ( .A0(\regArr[12][2] ), .A1(n429), .B0(\regArr[13][2] ), .B1(
        n425), .Y(n332) );
  AOI21X1M U425 ( .A0(n333), .A1(n332), .B0(n393), .Y(n340) );
  AOI22X1M U426 ( .A0(REG2[2]), .A1(n421), .B0(REG3[2]), .B1(n417), .Y(n335)
         );
  AOI22X1M U427 ( .A0(REG0[2]), .A1(n429), .B0(REG1[2]), .B1(n425), .Y(n334)
         );
  AOI21X1M U428 ( .A0(n335), .A1(n334), .B0(n396), .Y(n339) );
  AOI22X1M U429 ( .A0(\regArr[6][2] ), .A1(n421), .B0(\regArr[7][2] ), .B1(
        n417), .Y(n337) );
  AOI22X1M U430 ( .A0(\regArr[4][2] ), .A1(n429), .B0(\regArr[5][2] ), .B1(
        n425), .Y(n336) );
  AOI21X1M U431 ( .A0(n337), .A1(n336), .B0(n403), .Y(n338) );
  OR4X1M U432 ( .A(n341), .B(n340), .C(n339), .D(n338), .Y(N41) );
  AOI22X1M U433 ( .A0(\regArr[10][3] ), .A1(n420), .B0(\regArr[11][3] ), .B1(
        n416), .Y(n343) );
  AOI22X1M U434 ( .A0(\regArr[8][3] ), .A1(n428), .B0(\regArr[9][3] ), .B1(
        n424), .Y(n342) );
  AOI21X1M U435 ( .A0(n343), .A1(n342), .B0(n390), .Y(n353) );
  AOI22X1M U436 ( .A0(\regArr[14][3] ), .A1(n420), .B0(\regArr[15][3] ), .B1(
        n416), .Y(n345) );
  AOI22X1M U437 ( .A0(\regArr[12][3] ), .A1(n428), .B0(\regArr[13][3] ), .B1(
        n424), .Y(n344) );
  AOI21X1M U438 ( .A0(n345), .A1(n344), .B0(n393), .Y(n352) );
  AOI22X1M U439 ( .A0(REG2[3]), .A1(n420), .B0(REG3[3]), .B1(n416), .Y(n347)
         );
  AOI22X1M U440 ( .A0(REG0[3]), .A1(n428), .B0(REG1[3]), .B1(n424), .Y(n346)
         );
  AOI21X1M U441 ( .A0(n347), .A1(n346), .B0(n396), .Y(n351) );
  AOI22X1M U442 ( .A0(\regArr[6][3] ), .A1(n420), .B0(n610), .B1(n416), .Y(
        n349) );
  AOI22X1M U443 ( .A0(\regArr[4][3] ), .A1(n428), .B0(\regArr[5][3] ), .B1(
        n424), .Y(n348) );
  AOI21X1M U444 ( .A0(n349), .A1(n348), .B0(n403), .Y(n350) );
  OR4X1M U445 ( .A(n353), .B(n352), .C(n351), .D(n350), .Y(N40) );
  AOI22X1M U446 ( .A0(\regArr[10][4] ), .A1(n420), .B0(\regArr[11][4] ), .B1(
        n416), .Y(n355) );
  AOI22X1M U447 ( .A0(\regArr[8][4] ), .A1(n428), .B0(\regArr[9][4] ), .B1(
        n424), .Y(n354) );
  AOI21X1M U448 ( .A0(n355), .A1(n354), .B0(n390), .Y(n365) );
  AOI22X1M U449 ( .A0(\regArr[14][4] ), .A1(n420), .B0(\regArr[15][4] ), .B1(
        n416), .Y(n357) );
  AOI22X1M U450 ( .A0(\regArr[12][4] ), .A1(n428), .B0(\regArr[13][4] ), .B1(
        n424), .Y(n356) );
  AOI21X1M U451 ( .A0(n357), .A1(n356), .B0(n393), .Y(n364) );
  AOI22X1M U452 ( .A0(REG2[4]), .A1(n420), .B0(REG3[4]), .B1(n416), .Y(n359)
         );
  AOI22X1M U453 ( .A0(REG0[4]), .A1(n428), .B0(REG1[4]), .B1(n424), .Y(n358)
         );
  AOI21X1M U454 ( .A0(n359), .A1(n358), .B0(n396), .Y(n363) );
  AOI22X1M U455 ( .A0(\regArr[6][4] ), .A1(n420), .B0(\regArr[7][4] ), .B1(
        n416), .Y(n361) );
  AOI22X1M U456 ( .A0(\regArr[4][4] ), .A1(n428), .B0(\regArr[5][4] ), .B1(
        n424), .Y(n360) );
  AOI21X1M U457 ( .A0(n361), .A1(n360), .B0(n403), .Y(n362) );
  OR4X1M U458 ( .A(n365), .B(n364), .C(n363), .D(n362), .Y(N39) );
  AOI22X1M U459 ( .A0(\regArr[10][5] ), .A1(n420), .B0(\regArr[11][5] ), .B1(
        n416), .Y(n367) );
  AOI22X1M U460 ( .A0(\regArr[8][5] ), .A1(n428), .B0(\regArr[9][5] ), .B1(
        n424), .Y(n366) );
  AOI21X1M U461 ( .A0(n367), .A1(n366), .B0(n390), .Y(n377) );
  AOI22X1M U462 ( .A0(\regArr[14][5] ), .A1(n420), .B0(\regArr[15][5] ), .B1(
        n416), .Y(n369) );
  AOI22X1M U463 ( .A0(\regArr[12][5] ), .A1(n428), .B0(\regArr[13][5] ), .B1(
        n424), .Y(n368) );
  AOI21X1M U464 ( .A0(n369), .A1(n368), .B0(n393), .Y(n376) );
  AOI22X1M U465 ( .A0(REG2[5]), .A1(n420), .B0(REG3[5]), .B1(n416), .Y(n371)
         );
  AOI22X1M U466 ( .A0(REG0[5]), .A1(n428), .B0(REG1[5]), .B1(n424), .Y(n370)
         );
  AOI21X1M U467 ( .A0(n371), .A1(n370), .B0(n396), .Y(n375) );
  AOI22X1M U468 ( .A0(\regArr[6][5] ), .A1(n420), .B0(\regArr[7][5] ), .B1(
        n416), .Y(n373) );
  AOI22X1M U469 ( .A0(\regArr[4][5] ), .A1(n428), .B0(\regArr[5][5] ), .B1(
        n424), .Y(n372) );
  AOI21X1M U470 ( .A0(n373), .A1(n372), .B0(n403), .Y(n374) );
  OR4X1M U471 ( .A(n377), .B(n376), .C(n375), .D(n374), .Y(N38) );
  AOI22X1M U472 ( .A0(\regArr[10][6] ), .A1(n419), .B0(\regArr[11][6] ), .B1(
        n415), .Y(n379) );
  AOI22X1M U473 ( .A0(\regArr[8][6] ), .A1(n427), .B0(\regArr[9][6] ), .B1(
        n423), .Y(n378) );
  AOI21X1M U474 ( .A0(n379), .A1(n378), .B0(n390), .Y(n389) );
  AOI22X1M U475 ( .A0(\regArr[14][6] ), .A1(n419), .B0(\regArr[15][6] ), .B1(
        n415), .Y(n381) );
  AOI22X1M U476 ( .A0(\regArr[12][6] ), .A1(n427), .B0(\regArr[13][6] ), .B1(
        n423), .Y(n380) );
  AOI21X1M U477 ( .A0(n381), .A1(n380), .B0(n393), .Y(n388) );
  AOI22X1M U478 ( .A0(REG2[6]), .A1(n419), .B0(REG3[6]), .B1(n415), .Y(n383)
         );
  AOI22X1M U479 ( .A0(REG0[6]), .A1(n427), .B0(REG1[6]), .B1(n423), .Y(n382)
         );
  AOI21X1M U480 ( .A0(n383), .A1(n382), .B0(n396), .Y(n387) );
  AOI22X1M U481 ( .A0(\regArr[6][6] ), .A1(n419), .B0(\regArr[7][6] ), .B1(
        n415), .Y(n385) );
  AOI22X1M U482 ( .A0(\regArr[4][6] ), .A1(n427), .B0(\regArr[5][6] ), .B1(
        n423), .Y(n384) );
  AOI21X1M U483 ( .A0(n385), .A1(n384), .B0(n403), .Y(n386) );
  OR4X1M U484 ( .A(n389), .B(n388), .C(n387), .D(n386), .Y(N37) );
  AOI22X1M U485 ( .A0(\regArr[10][7] ), .A1(n419), .B0(\regArr[11][7] ), .B1(
        n415), .Y(n392) );
  AOI22X1M U486 ( .A0(\regArr[8][7] ), .A1(n427), .B0(\regArr[9][7] ), .B1(
        n423), .Y(n391) );
  AOI21X1M U487 ( .A0(n392), .A1(n391), .B0(n390), .Y(n409) );
  AOI22X1M U488 ( .A0(\regArr[14][7] ), .A1(n419), .B0(\regArr[15][7] ), .B1(
        n415), .Y(n395) );
  AOI22X1M U489 ( .A0(\regArr[12][7] ), .A1(n427), .B0(\regArr[13][7] ), .B1(
        n423), .Y(n394) );
  AOI21X1M U490 ( .A0(n395), .A1(n394), .B0(n393), .Y(n408) );
  AOI22X1M U491 ( .A0(REG2[7]), .A1(n419), .B0(REG3[7]), .B1(n415), .Y(n398)
         );
  AOI22X1M U492 ( .A0(REG0[7]), .A1(n427), .B0(REG1[7]), .B1(n423), .Y(n397)
         );
  AOI21X1M U493 ( .A0(n398), .A1(n397), .B0(n396), .Y(n407) );
  AOI22X1M U494 ( .A0(\regArr[6][7] ), .A1(n419), .B0(\regArr[7][7] ), .B1(
        n415), .Y(n405) );
  AOI22X1M U495 ( .A0(\regArr[4][7] ), .A1(n427), .B0(\regArr[5][7] ), .B1(
        n423), .Y(n404) );
  AOI21X1M U496 ( .A0(n405), .A1(n404), .B0(n403), .Y(n406) );
  OR4X1M U497 ( .A(n409), .B(n408), .C(n407), .D(n406), .Y(N36) );
  DLY1X1M U498 ( .A(n509), .Y(n492) );
  DLY1X1M U499 ( .A(n495), .Y(n493) );
  DLY1X1M U500 ( .A(test_se), .Y(n494) );
  INVXLM U501 ( .A(n492), .Y(n495) );
  DLY1X1M U502 ( .A(n504), .Y(n496) );
  DLY1X1M U503 ( .A(test_se), .Y(n497) );
  DLY1X1M U504 ( .A(n506), .Y(n498) );
  DLY1X1M U505 ( .A(test_se), .Y(n499) );
  DLY1X1M U506 ( .A(n508), .Y(n500) );
  DLY1X1M U507 ( .A(test_se), .Y(n501) );
  INVXLM U508 ( .A(\regArr[7][3] ), .Y(n502) );
  INVXLM U509 ( .A(n502), .Y(n503) );
  INVXLM U510 ( .A(n505), .Y(n504) );
  INVXLM U511 ( .A(test_se), .Y(n505) );
  INVXLM U512 ( .A(n507), .Y(n506) );
  INVXLM U513 ( .A(test_se), .Y(n507) );
  INVXLM U514 ( .A(n492), .Y(n508) );
  INVXLM U515 ( .A(test_se), .Y(n509) );
  DLY1X1M U516 ( .A(test_se), .Y(n510) );
  DLY1X1M U517 ( .A(test_se), .Y(n511) );
  DLY1X1M U518 ( .A(test_se), .Y(n512) );
  DLY1X1M U519 ( .A(test_se), .Y(n513) );
  DLY1X1M U520 ( .A(test_se), .Y(n514) );
  DLY1X1M U521 ( .A(test_se), .Y(n515) );
  DLY1X1M U522 ( .A(test_se), .Y(n516) );
  DLY1X1M U523 ( .A(test_se), .Y(n517) );
  DLY1X1M U524 ( .A(test_se), .Y(n518) );
  DLY1X1M U525 ( .A(test_se), .Y(n519) );
  DLY1X1M U526 ( .A(test_se), .Y(n520) );
  DLY1X1M U527 ( .A(test_se), .Y(n521) );
  DLY1X1M U528 ( .A(test_se), .Y(n522) );
  DLY1X1M U529 ( .A(test_se), .Y(n523) );
  DLY1X1M U530 ( .A(test_se), .Y(n524) );
  DLY1X1M U531 ( .A(test_se), .Y(n525) );
  DLY1X1M U532 ( .A(test_se), .Y(n526) );
  DLY1X1M U533 ( .A(test_se), .Y(n527) );
  DLY1X1M U534 ( .A(test_se), .Y(n528) );
  DLY1X1M U535 ( .A(test_se), .Y(n529) );
  DLY1X1M U536 ( .A(test_se), .Y(n530) );
  DLY1X1M U537 ( .A(test_se), .Y(n531) );
  DLY1X1M U538 ( .A(test_se), .Y(n532) );
  DLY1X1M U539 ( .A(test_se), .Y(n533) );
  DLY1X1M U540 ( .A(test_se), .Y(n534) );
  DLY1X1M U541 ( .A(n494), .Y(n535) );
  DLY1X1M U542 ( .A(n493), .Y(n536) );
  DLY1X1M U543 ( .A(n494), .Y(n537) );
  DLY1X1M U544 ( .A(n496), .Y(n538) );
  DLY1X1M U545 ( .A(n497), .Y(n539) );
  DLY1X1M U546 ( .A(n497), .Y(n540) );
  DLY1X1M U547 ( .A(n498), .Y(n541) );
  DLY1X1M U548 ( .A(n498), .Y(n542) );
  DLY1X1M U549 ( .A(n499), .Y(n543) );
  DLY1X1M U550 ( .A(n499), .Y(n544) );
  DLY1X1M U551 ( .A(n500), .Y(n545) );
  DLY1X1M U552 ( .A(n500), .Y(n546) );
  DLY1X1M U553 ( .A(n501), .Y(n547) );
  DLY1X1M U554 ( .A(n501), .Y(n548) );
  DLY1X1M U555 ( .A(n510), .Y(n549) );
  DLY1X1M U556 ( .A(n510), .Y(n550) );
  DLY1X1M U557 ( .A(n511), .Y(n551) );
  DLY1X1M U558 ( .A(n511), .Y(n552) );
  DLY1X1M U559 ( .A(n512), .Y(n553) );
  DLY1X1M U560 ( .A(n512), .Y(n554) );
  DLY1X1M U561 ( .A(n513), .Y(n555) );
  DLY1X1M U562 ( .A(n513), .Y(n556) );
  DLY1X1M U563 ( .A(n514), .Y(n557) );
  DLY1X1M U564 ( .A(n514), .Y(n558) );
  DLY1X1M U565 ( .A(n515), .Y(n559) );
  DLY1X1M U566 ( .A(n515), .Y(n560) );
  DLY1X1M U567 ( .A(n516), .Y(n561) );
  DLY1X1M U568 ( .A(n516), .Y(n562) );
  DLY1X1M U569 ( .A(n517), .Y(n563) );
  DLY1X1M U570 ( .A(n517), .Y(n564) );
  DLY1X1M U571 ( .A(n518), .Y(n565) );
  DLY1X1M U572 ( .A(n518), .Y(n566) );
  DLY1X1M U573 ( .A(n519), .Y(n567) );
  DLY1X1M U574 ( .A(n519), .Y(n568) );
  DLY1X1M U575 ( .A(n520), .Y(n569) );
  DLY1X1M U576 ( .A(n520), .Y(n570) );
  DLY1X1M U577 ( .A(n521), .Y(n571) );
  DLY1X1M U578 ( .A(n521), .Y(n572) );
  DLY1X1M U579 ( .A(n522), .Y(n573) );
  DLY1X1M U581 ( .A(n523), .Y(n575) );
  DLY1X1M U582 ( .A(n523), .Y(n576) );
  DLY1X1M U583 ( .A(n524), .Y(n577) );
  DLY1X1M U584 ( .A(n524), .Y(n578) );
  DLY1X1M U585 ( .A(n525), .Y(n579) );
  DLY1X1M U586 ( .A(n525), .Y(n580) );
  DLY1X1M U587 ( .A(n526), .Y(n581) );
  DLY1X1M U588 ( .A(n526), .Y(n582) );
  DLY1X1M U589 ( .A(n527), .Y(n583) );
  DLY1X1M U590 ( .A(n527), .Y(n584) );
  DLY1X1M U591 ( .A(n528), .Y(n585) );
  DLY1X1M U592 ( .A(n528), .Y(n586) );
  DLY1X1M U593 ( .A(n529), .Y(n587) );
  DLY1X1M U594 ( .A(n529), .Y(n588) );
  DLY1X1M U595 ( .A(n530), .Y(n589) );
  DLY1X1M U596 ( .A(n530), .Y(n590) );
  DLY1X1M U597 ( .A(n531), .Y(n591) );
  DLY1X1M U598 ( .A(n531), .Y(n592) );
  DLY1X1M U599 ( .A(n532), .Y(n593) );
  DLY1X1M U600 ( .A(n532), .Y(n594) );
  DLY1X1M U601 ( .A(n533), .Y(n595) );
  DLY1X1M U602 ( .A(n533), .Y(n596) );
  DLY1X1M U603 ( .A(n534), .Y(n597) );
  DLY1X1M U604 ( .A(n534), .Y(n598) );
  DLY1X1M U605 ( .A(n535), .Y(n599) );
  DLY1X1M U606 ( .A(n496), .Y(n600) );
  DLY1X1M U607 ( .A(n493), .Y(n601) );
  DLY1X1M U608 ( .A(n535), .Y(n602) );
  DLY1X1M U609 ( .A(n536), .Y(n603) );
  DLY1X1M U610 ( .A(n536), .Y(n604) );
  DLY1X1M U611 ( .A(n537), .Y(n605) );
  DLY1X1M U612 ( .A(REG3[0]), .Y(n606) );
  DLY1X1M U613 ( .A(REG2[5]), .Y(n607) );
  DLY1X1M U614 ( .A(REG2[6]), .Y(n608) );
  DLY1X1M U615 ( .A(REG2[1]), .Y(n609) );
  DLY1X1M U616 ( .A(n503), .Y(n610) );
  SDFFRQX4M \regArr_reg[7][3]  ( .D(n238), .SI(\regArr[7][2] ), .SE(n574), 
        .CK(CLK), .RN(n466), .Q(\regArr[7][3] ) );
  BUFX2M U3 ( .A(n522), .Y(n574) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n2), .CI(
        \u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n3), .CI(
        \u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n5), .CI(
        \u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n4), .CI(
        \u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n6), .CI(
        \u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n7), .CI(
        \u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n2), .CI(
        \u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n1), .CI(
        \u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n4), .CI(
        \u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n3), .CI(
        \u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n3), .CI(
        \u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n4), .CI(
        \u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n4), .CI(
        \u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n5), .CI(
        \u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n5), .CI(
        \u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n5), .CI(
        \u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n6), .CI(
        \u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n5), .CI(
        \u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n6), .CI(
        \u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n6), .CI(
        \u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n6), .CI(
        \u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n6), .CI(
        \u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n7), .CI(
        \u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n7), .CI(
        \u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n7), .CI(
        \u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n7), .CI(
        \u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n7), .CI(
        \u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n7), .CI(
        \u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  INVX8M U1 ( .A(b[0]), .Y(n8) );
  NOR2X4M U2 ( .A(b[6]), .B(b[7]), .Y(n11) );
  AND3X4M U3 ( .A(n11), .B(n3), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  CLKAND2X4M U4 ( .A(\u_div/CryTmp[4][4] ), .B(n10), .Y(quotient[4]) );
  CLKAND2X4M U5 ( .A(\u_div/CryTmp[2][6] ), .B(n11), .Y(quotient[2]) );
  CLKAND2X4M U6 ( .A(\u_div/CryTmp[1][7] ), .B(n1), .Y(quotient[1]) );
  AND2X2M U7 ( .A(\u_div/CryTmp[5][3] ), .B(n9), .Y(quotient[5]) );
  MX2X1M U8 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  MX2X1M U9 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  MX2X1M U10 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  MX2X1M U11 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  MX2X1M U12 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  MX2X1M U13 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  MX2X1M U14 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  MX2X1M U15 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  MX2X1M U16 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  MX2X1M U17 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  MX2X1M U18 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  MX2X1M U19 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  MX2X1M U20 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  MX2X1M U21 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  AND3X2M U22 ( .A(n9), .B(n6), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X2M U23 ( .A(n10), .B(n5), .Y(n9) );
  INVX4M U24 ( .A(b[1]), .Y(n7) );
  INVX4M U25 ( .A(b[2]), .Y(n6) );
  OR2X2M U26 ( .A(a[7]), .B(n8), .Y(\u_div/CryTmp[7][1] ) );
  XNOR2X2M U27 ( .A(n8), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X2M U28 ( .A(n8), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U29 ( .A(n8), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U30 ( .A(n8), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U31 ( .A(n8), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U32 ( .A(n8), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  OR2X2M U33 ( .A(a[5]), .B(n8), .Y(\u_div/CryTmp[5][1] ) );
  OR2X2M U34 ( .A(a[4]), .B(n8), .Y(\u_div/CryTmp[4][1] ) );
  OR2X2M U35 ( .A(a[3]), .B(n8), .Y(\u_div/CryTmp[3][1] ) );
  OR2X2M U36 ( .A(a[2]), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  OR2X2M U37 ( .A(a[1]), .B(n8), .Y(\u_div/CryTmp[1][1] ) );
  NAND2BX2M U38 ( .AN(a[0]), .B(b[0]), .Y(\u_div/CryTmp[0][1] ) );
  OR2X2M U39 ( .A(a[6]), .B(n8), .Y(\u_div/CryTmp[6][1] ) );
  XNOR2X2M U40 ( .A(n8), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX4M U41 ( .A(b[4]), .Y(n4) );
  INVX4M U42 ( .A(b[3]), .Y(n5) );
  INVX4M U43 ( .A(b[5]), .Y(n3) );
  INVX2M U44 ( .A(b[6]), .Y(n2) );
  INVX2M U45 ( .A(b[7]), .Y(n1) );
  CLKMX2X2M U46 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U48 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U50 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U51 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U52 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U54 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U55 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U56 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U58 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U59 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U60 ( .A(\u_div/CryTmp[7][1] ), .B(n9), .C(n7), .D(n6), .Y(
        quotient[7]) );
  AND3X1M U61 ( .A(n11), .B(n4), .C(n3), .Y(n10) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  INVX2M U1 ( .A(carry[8]), .Y(DIFF[8]) );
  XNOR2X2M U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[1]), .Y(n8) );
  OR2X2M U5 ( .A(A[0]), .B(n9), .Y(carry[1]) );
  INVX2M U6 ( .A(B[2]), .Y(n7) );
  INVX2M U7 ( .A(B[3]), .Y(n6) );
  INVX2M U8 ( .A(B[4]), .Y(n5) );
  INVX2M U9 ( .A(B[5]), .Y(n4) );
  INVX2M U10 ( .A(B[6]), .Y(n3) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;
  assign SUM[6] = A[6];
  assign SUM[5] = \A[5] ;
  assign \A[5]  = A[5];
  assign SUM[4] = \A[4] ;
  assign \A[4]  = A[4];
  assign SUM[3] = \A[3] ;
  assign \A[3]  = A[3];
  assign SUM[2] = \A[2] ;
  assign \A[2]  = A[2];
  assign SUM[1] = \A[1] ;
  assign \A[1]  = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  OAI21BX4M U2 ( .A0(n12), .A1(n13), .B0N(n14), .Y(n10) );
  AOI2BB1X2M U3 ( .A0N(n1), .A1N(n4), .B0(n3), .Y(n17) );
  NOR2X2M U4 ( .A(B[8]), .B(A[8]), .Y(n7) );
  NOR2X2M U5 ( .A(B[9]), .B(A[9]), .Y(n4) );
  NOR2X2M U6 ( .A(B[11]), .B(A[11]), .Y(n12) );
  NOR2X2M U7 ( .A(B[10]), .B(A[10]), .Y(n16) );
  NAND2X2M U8 ( .A(A[7]), .B(B[7]), .Y(n6) );
  CLKXOR2X2M U9 ( .A(B[13]), .B(n9), .Y(SUM[13]) );
  CLKXOR2X2M U10 ( .A(A[7]), .B(B[7]), .Y(SUM[7]) );
  XNOR2X1M U11 ( .A(n1), .B(n2), .Y(SUM[9]) );
  NOR2X1M U12 ( .A(n3), .B(n4), .Y(n2) );
  CLKXOR2X2M U13 ( .A(n5), .B(n6), .Y(SUM[8]) );
  NAND2BX1M U14 ( .AN(n7), .B(n8), .Y(n5) );
  OAI2BB1X1M U15 ( .A0N(n10), .A1N(A[12]), .B0(n11), .Y(n9) );
  OAI21X1M U16 ( .A0(A[12]), .A1(n10), .B0(B[12]), .Y(n11) );
  XOR3XLM U17 ( .A(B[12]), .B(A[12]), .C(n10), .Y(SUM[12]) );
  XNOR2X1M U18 ( .A(n13), .B(n15), .Y(SUM[11]) );
  NOR2X1M U19 ( .A(n14), .B(n12), .Y(n15) );
  AND2X1M U20 ( .A(B[11]), .B(A[11]), .Y(n14) );
  OA21X1M U21 ( .A0(n16), .A1(n17), .B0(n18), .Y(n13) );
  CLKXOR2X2M U22 ( .A(n19), .B(n17), .Y(SUM[10]) );
  AND2X1M U23 ( .A(B[9]), .B(A[9]), .Y(n3) );
  OA21X1M U24 ( .A0(n6), .A1(n7), .B0(n8), .Y(n1) );
  CLKNAND2X2M U25 ( .A(B[8]), .B(A[8]), .Y(n8) );
  NAND2BX1M U26 ( .AN(n16), .B(n18), .Y(n19) );
  CLKNAND2X2M U27 ( .A(B[10]), .B(A[10]), .Y(n18) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32;

  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n8), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n7), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n6), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n5), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n4), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  NOR2X2M U10 ( .A(n20), .B(n32), .Y(\ab[0][4] ) );
  NOR2X2M U11 ( .A(n19), .B(n32), .Y(\ab[0][5] ) );
  NOR2X2M U12 ( .A(n18), .B(n32), .Y(\ab[0][6] ) );
  NOR2X2M U13 ( .A(n21), .B(n32), .Y(\ab[0][3] ) );
  NOR2X2M U14 ( .A(n22), .B(n32), .Y(\ab[0][2] ) );
  NOR2X2M U15 ( .A(n23), .B(n32), .Y(\ab[0][1] ) );
  NOR2X2M U16 ( .A(n18), .B(n31), .Y(\ab[1][6] ) );
  NOR2X2M U17 ( .A(n21), .B(n31), .Y(\ab[1][3] ) );
  NOR2X2M U18 ( .A(n20), .B(n31), .Y(\ab[1][4] ) );
  NOR2X2M U19 ( .A(n19), .B(n31), .Y(\ab[1][5] ) );
  NOR2X2M U20 ( .A(n22), .B(n31), .Y(\ab[1][2] ) );
  NOR2X2M U21 ( .A(n23), .B(n31), .Y(\ab[1][1] ) );
  NOR2X2M U22 ( .A(n24), .B(n31), .Y(\ab[1][0] ) );
  NOR2X2M U23 ( .A(n17), .B(n32), .Y(\ab[0][7] ) );
  NOR2X2M U24 ( .A(n25), .B(n17), .Y(\ab[7][7] ) );
  CLKXOR2X2M U25 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U27 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  INVX4M U28 ( .A(A[1]), .Y(n31) );
  AND2X2M U29 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U30 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  AND2X2M U31 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  INVX4M U32 ( .A(A[2]), .Y(n30) );
  CLKXOR2X2M U33 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U34 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX4M U35 ( .A(A[3]), .Y(n29) );
  INVX4M U36 ( .A(A[4]), .Y(n28) );
  INVX4M U37 ( .A(A[5]), .Y(n27) );
  AND2X2M U38 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U39 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  INVX4M U40 ( .A(A[7]), .Y(n25) );
  INVX4M U41 ( .A(A[6]), .Y(n26) );
  CLKXOR2X2M U42 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U43 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  XOR2X1M U44 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  INVX4M U45 ( .A(A[0]), .Y(n32) );
  XOR2X1M U46 ( .A(\ab[1][3] ), .B(\ab[0][4] ), .Y(\SUMB[1][3] ) );
  XOR2X1M U47 ( .A(\ab[1][4] ), .B(\ab[0][5] ), .Y(\SUMB[1][4] ) );
  XOR2X1M U48 ( .A(\ab[1][5] ), .B(\ab[0][6] ), .Y(\SUMB[1][5] ) );
  XOR2X1M U49 ( .A(\ab[1][6] ), .B(\ab[0][7] ), .Y(\SUMB[1][6] ) );
  XOR2X1M U50 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Y(\SUMB[1][2] ) );
  XOR2X1M U51 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Y(\SUMB[1][1] ) );
  CLKXOR2X2M U52 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(\A1[6] ) );
  INVX4M U53 ( .A(B[6]), .Y(n18) );
  INVX4M U54 ( .A(B[7]), .Y(n17) );
  INVX4M U55 ( .A(B[4]), .Y(n20) );
  INVX4M U56 ( .A(B[5]), .Y(n19) );
  INVX4M U57 ( .A(B[2]), .Y(n22) );
  INVX4M U58 ( .A(B[3]), .Y(n21) );
  INVX4M U59 ( .A(B[0]), .Y(n24) );
  INVX4M U60 ( .A(B[1]), .Y(n23) );
  NOR2X1M U62 ( .A(n25), .B(n18), .Y(\ab[7][6] ) );
  NOR2X1M U63 ( .A(n25), .B(n19), .Y(\ab[7][5] ) );
  NOR2X1M U64 ( .A(n25), .B(n20), .Y(\ab[7][4] ) );
  NOR2X1M U65 ( .A(n25), .B(n21), .Y(\ab[7][3] ) );
  NOR2X1M U66 ( .A(n25), .B(n22), .Y(\ab[7][2] ) );
  NOR2X1M U67 ( .A(n25), .B(n23), .Y(\ab[7][1] ) );
  NOR2X1M U68 ( .A(n25), .B(n24), .Y(\ab[7][0] ) );
  NOR2X1M U69 ( .A(n17), .B(n26), .Y(\ab[6][7] ) );
  NOR2X1M U70 ( .A(n18), .B(n26), .Y(\ab[6][6] ) );
  NOR2X1M U71 ( .A(n19), .B(n26), .Y(\ab[6][5] ) );
  NOR2X1M U72 ( .A(n20), .B(n26), .Y(\ab[6][4] ) );
  NOR2X1M U73 ( .A(n21), .B(n26), .Y(\ab[6][3] ) );
  NOR2X1M U74 ( .A(n22), .B(n26), .Y(\ab[6][2] ) );
  NOR2X1M U75 ( .A(n23), .B(n26), .Y(\ab[6][1] ) );
  NOR2X1M U76 ( .A(n24), .B(n26), .Y(\ab[6][0] ) );
  NOR2X1M U77 ( .A(n17), .B(n27), .Y(\ab[5][7] ) );
  NOR2X1M U78 ( .A(n18), .B(n27), .Y(\ab[5][6] ) );
  NOR2X1M U79 ( .A(n19), .B(n27), .Y(\ab[5][5] ) );
  NOR2X1M U80 ( .A(n20), .B(n27), .Y(\ab[5][4] ) );
  NOR2X1M U81 ( .A(n21), .B(n27), .Y(\ab[5][3] ) );
  NOR2X1M U82 ( .A(n22), .B(n27), .Y(\ab[5][2] ) );
  NOR2X1M U83 ( .A(n23), .B(n27), .Y(\ab[5][1] ) );
  NOR2X1M U84 ( .A(n24), .B(n27), .Y(\ab[5][0] ) );
  NOR2X1M U85 ( .A(n17), .B(n28), .Y(\ab[4][7] ) );
  NOR2X1M U86 ( .A(n18), .B(n28), .Y(\ab[4][6] ) );
  NOR2X1M U87 ( .A(n19), .B(n28), .Y(\ab[4][5] ) );
  NOR2X1M U88 ( .A(n20), .B(n28), .Y(\ab[4][4] ) );
  NOR2X1M U89 ( .A(n21), .B(n28), .Y(\ab[4][3] ) );
  NOR2X1M U90 ( .A(n22), .B(n28), .Y(\ab[4][2] ) );
  NOR2X1M U91 ( .A(n23), .B(n28), .Y(\ab[4][1] ) );
  NOR2X1M U92 ( .A(n24), .B(n28), .Y(\ab[4][0] ) );
  NOR2X1M U93 ( .A(n17), .B(n29), .Y(\ab[3][7] ) );
  NOR2X1M U94 ( .A(n18), .B(n29), .Y(\ab[3][6] ) );
  NOR2X1M U95 ( .A(n19), .B(n29), .Y(\ab[3][5] ) );
  NOR2X1M U96 ( .A(n20), .B(n29), .Y(\ab[3][4] ) );
  NOR2X1M U97 ( .A(n21), .B(n29), .Y(\ab[3][3] ) );
  NOR2X1M U98 ( .A(n22), .B(n29), .Y(\ab[3][2] ) );
  NOR2X1M U99 ( .A(n23), .B(n29), .Y(\ab[3][1] ) );
  NOR2X1M U100 ( .A(n24), .B(n29), .Y(\ab[3][0] ) );
  NOR2X1M U101 ( .A(n17), .B(n30), .Y(\ab[2][7] ) );
  NOR2X1M U102 ( .A(n18), .B(n30), .Y(\ab[2][6] ) );
  NOR2X1M U103 ( .A(n19), .B(n30), .Y(\ab[2][5] ) );
  NOR2X1M U104 ( .A(n20), .B(n30), .Y(\ab[2][4] ) );
  NOR2X1M U105 ( .A(n21), .B(n30), .Y(\ab[2][3] ) );
  NOR2X1M U106 ( .A(n22), .B(n30), .Y(\ab[2][2] ) );
  NOR2X1M U107 ( .A(n23), .B(n30), .Y(\ab[2][1] ) );
  NOR2X1M U108 ( .A(n24), .B(n30), .Y(\ab[2][0] ) );
  NOR2X1M U109 ( .A(n17), .B(n31), .Y(\ab[1][7] ) );
  NOR2X1M U110 ( .A(n24), .B(n32), .Y(PRODUCT[0]) );
  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n13, n12, n11, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
endmodule


module ALU_test_1 ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, OUT_VALID, test_si, 
        test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST, test_si, test_se;
  output OUT_VALID;
  wire   N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, N105, N106, N107, N108, N109, N110, N111,
         N112, N113, N114, N115, N116, N117, N118, N119, N120, N121, N122,
         N123, N124, N125, N126, N127, N128, N153, N154, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n3, n4, n5, n6, n7, n8, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164;
  wire   [15:0] ALU_OUT_Comb;

  OAI2BB1X4M U92 ( .A0N(n116), .A1N(n106), .B0(n117), .Y(n66) );
  SDFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .SI(ALU_OUT[6]), .SE(
        test_se), .CK(CLK), .RN(n123), .Q(ALU_OUT[7]) );
  SDFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .SI(ALU_OUT[5]), .SE(
        test_se), .CK(CLK), .RN(n123), .Q(ALU_OUT[6]) );
  SDFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .SI(ALU_OUT[4]), .SE(
        test_se), .CK(CLK), .RN(n123), .Q(ALU_OUT[5]) );
  SDFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .SI(ALU_OUT[3]), .SE(
        test_se), .CK(CLK), .RN(n123), .Q(ALU_OUT[4]) );
  SDFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .SI(ALU_OUT[2]), .SE(
        test_se), .CK(CLK), .RN(n123), .Q(ALU_OUT[3]) );
  SDFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .SI(ALU_OUT[1]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[2]) );
  SDFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .SI(ALU_OUT[0]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[1]) );
  SDFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(ALU_OUT[0]) );
  SDFFRQX2M OUT_VALID_reg ( .D(EN), .SI(ALU_OUT[15]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(OUT_VALID) );
  SDFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .SI(ALU_OUT[14]), .SE(
        test_se), .CK(CLK), .RN(n123), .Q(ALU_OUT[15]) );
  SDFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .SI(ALU_OUT[13]), .SE(
        test_se), .CK(CLK), .RN(n123), .Q(ALU_OUT[14]) );
  SDFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .SI(ALU_OUT[12]), .SE(
        test_se), .CK(CLK), .RN(n123), .Q(ALU_OUT[13]) );
  SDFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .SI(ALU_OUT[11]), .SE(
        test_se), .CK(CLK), .RN(n123), .Q(ALU_OUT[12]) );
  SDFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .SI(ALU_OUT[10]), .SE(
        test_se), .CK(CLK), .RN(n123), .Q(ALU_OUT[11]) );
  SDFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .SI(ALU_OUT[9]), .SE(
        test_se), .CK(CLK), .RN(n123), .Q(ALU_OUT[10]) );
  SDFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .SI(ALU_OUT[8]), .SE(
        test_se), .CK(CLK), .RN(n123), .Q(ALU_OUT[9]) );
  SDFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .SI(ALU_OUT[7]), .SE(
        test_se), .CK(CLK), .RN(n123), .Q(ALU_OUT[8]) );
  CLKINVX1M U7 ( .A(RST), .Y(n124) );
  BUFX4M U23 ( .A(n67), .Y(n3) );
  NOR3X2M U24 ( .A(n163), .B(ALU_FUN[2]), .C(n160), .Y(n67) );
  AOI222X2M U25 ( .A0(N106), .A1(n44), .B0(n7), .B1(n47), .C0(N122), .C1(n3), 
        .Y(n101) );
  NOR4X2M U26 ( .A(n141), .B(n140), .C(N154), .D(n139), .Y(N153) );
  OAI2B2X4M U27 ( .A1N(n42), .A0(B[7]), .B0(n139), .B1(n138), .Y(N154) );
  NOR2BX2M U28 ( .AN(B[7]), .B(n42), .Y(n139) );
  OAI2BB1XLM U29 ( .A0N(n129), .A1N(n7), .B0(B[1]), .Y(n128) );
  NOR2BX2M U30 ( .AN(n4), .B(B[0]), .Y(n129) );
  NOR2BX2M U31 ( .AN(B[0]), .B(n4), .Y(n125) );
  INVX4M U32 ( .A(n45), .Y(n47) );
  AOI31X1M U33 ( .A0(n100), .A1(n101), .A2(n102), .B0(n159), .Y(
        ALU_OUT_Comb[1]) );
  BUFX6M U34 ( .A(A[0]), .Y(n4) );
  NOR2X2M U35 ( .A(n164), .B(ALU_FUN[3]), .Y(n119) );
  NOR2X4M U36 ( .A(n162), .B(ALU_FUN[1]), .Y(n106) );
  INVX2M U37 ( .A(ALU_FUN[1]), .Y(n163) );
  NOR2X2M U38 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .Y(n116) );
  INVX2M U39 ( .A(ALU_FUN[2]), .Y(n162) );
  NAND3X4M U40 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .C(n106), .Y(n54) );
  INVX2M U41 ( .A(n27), .Y(n142) );
  INVX2M U42 ( .A(n42), .Y(n152) );
  INVX2M U43 ( .A(n30), .Y(n156) );
  INVX2M U44 ( .A(n36), .Y(n154) );
  INVX2M U45 ( .A(n33), .Y(n155) );
  INVX2M U46 ( .A(n39), .Y(n153) );
  INVX2M U47 ( .A(n6), .Y(n157) );
  INVX4M U48 ( .A(n45), .Y(n46) );
  INVX6M U49 ( .A(n124), .Y(n123) );
  AOI31X2M U50 ( .A0(n108), .A1(n109), .A2(n110), .B0(n159), .Y(
        ALU_OUT_Comb[0]) );
  AOI22X1M U51 ( .A0(N96), .A1(n68), .B0(N87), .B1(n43), .Y(n108) );
  AOI221X2M U52 ( .A0(n7), .A1(n72), .B0(n48), .B1(n158), .C0(n111), .Y(n110)
         );
  AOI222X2M U53 ( .A0(N105), .A1(n44), .B0(n4), .B1(n46), .C0(N121), .C1(n3), 
        .Y(n109) );
  AOI22X1M U54 ( .A0(N97), .A1(n68), .B0(N88), .B1(n43), .Y(n100) );
  AOI221X2M U55 ( .A0(n27), .A1(n72), .B0(n48), .B1(n157), .C0(n103), .Y(n102)
         );
  INVX4M U56 ( .A(n40), .Y(n41) );
  INVX4M U57 ( .A(n37), .Y(n38) );
  INVX4M U58 ( .A(n34), .Y(n35) );
  AOI31X2M U59 ( .A0(n94), .A1(n95), .A2(n96), .B0(n159), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U60 ( .A0(N98), .A1(n68), .B0(N89), .B1(n43), .Y(n94) );
  AOI221X2M U61 ( .A0(n30), .A1(n72), .B0(n48), .B1(n8), .C0(n97), .Y(n96) );
  AOI222X2M U62 ( .A0(N107), .A1(n44), .B0(n27), .B1(n46), .C0(N123), .C1(n3), 
        .Y(n95) );
  INVX4M U63 ( .A(n31), .Y(n32) );
  AOI31X2M U64 ( .A0(n88), .A1(n89), .A2(n90), .B0(n159), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U65 ( .A0(N99), .A1(n68), .B0(N90), .B1(n43), .Y(n88) );
  AOI221X2M U66 ( .A0(n33), .A1(n72), .B0(n48), .B1(n156), .C0(n91), .Y(n90)
         );
  AOI222X2M U67 ( .A0(N108), .A1(n44), .B0(n30), .B1(n47), .C0(N124), .C1(n3), 
        .Y(n89) );
  INVX4M U68 ( .A(n28), .Y(n29) );
  AOI31X2M U69 ( .A0(n82), .A1(n83), .A2(n84), .B0(n159), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U70 ( .A0(N100), .A1(n68), .B0(N91), .B1(n43), .Y(n82) );
  AOI221X2M U71 ( .A0(n72), .A1(n36), .B0(n48), .B1(n155), .C0(n85), .Y(n84)
         );
  AOI222X2M U72 ( .A0(N109), .A1(n44), .B0(n33), .B1(n46), .C0(N125), .C1(n3), 
        .Y(n83) );
  OAI2BB1X2M U73 ( .A0N(N120), .A1N(n49), .B0(n50), .Y(ALU_OUT_Comb[15]) );
  INVX4M U74 ( .A(n5), .Y(n6) );
  INVX4M U75 ( .A(n8), .Y(n26) );
  OAI2BB1X2M U76 ( .A0N(N119), .A1N(n49), .B0(n50), .Y(ALU_OUT_Comb[14]) );
  AOI31X2M U77 ( .A0(n76), .A1(n77), .A2(n78), .B0(n159), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U78 ( .A0(N101), .A1(n68), .B0(N92), .B1(n43), .Y(n76) );
  AOI221X2M U79 ( .A0(n72), .A1(n39), .B0(n48), .B1(n154), .C0(n79), .Y(n78)
         );
  AOI222X2M U80 ( .A0(N110), .A1(n44), .B0(n36), .B1(n47), .C0(N126), .C1(n3), 
        .Y(n77) );
  OAI2BB1X2M U81 ( .A0N(N118), .A1N(n49), .B0(n50), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U82 ( .A0N(N117), .A1N(n49), .B0(n50), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U83 ( .A0N(N115), .A1N(n49), .B0(n50), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U84 ( .A0N(N116), .A1N(n49), .B0(n50), .Y(ALU_OUT_Comb[11]) );
  INVX4M U85 ( .A(n8), .Y(n27) );
  AOI31X2M U86 ( .A0(n69), .A1(n70), .A2(n71), .B0(n159), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U87 ( .A0(N102), .A1(n68), .B0(N93), .B1(n43), .Y(n69) );
  AOI221X2M U88 ( .A0(n72), .A1(n42), .B0(n48), .B1(n153), .C0(n73), .Y(n71)
         );
  AOI222X2M U89 ( .A0(N111), .A1(n44), .B0(n46), .B1(n39), .C0(N127), .C1(n3), 
        .Y(n70) );
  INVX4M U90 ( .A(n5), .Y(n7) );
  INVX4M U91 ( .A(n28), .Y(n30) );
  AOI31X2M U93 ( .A0(n56), .A1(n57), .A2(n58), .B0(n159), .Y(ALU_OUT_Comb[7])
         );
  AOI221X2M U94 ( .A0(n48), .A1(n152), .B0(n47), .B1(n42), .C0(n61), .Y(n58)
         );
  AOI22X1M U95 ( .A0(N103), .A1(n68), .B0(N94), .B1(n43), .Y(n56) );
  AOI22X1M U96 ( .A0(N128), .A1(n3), .B0(N112), .B1(n44), .Y(n57) );
  AOI21X2M U97 ( .A0(n51), .A1(n52), .B0(n159), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U98 ( .A0(N95), .A1(n43), .B0(n145), .Y(n51) );
  AOI2BB2X2M U99 ( .B0(N113), .B1(n44), .A0N(n152), .A1N(n54), .Y(n52) );
  OAI2BB1X2M U100 ( .A0N(N114), .A1N(n49), .B0(n50), .Y(ALU_OUT_Comb[9]) );
  INVX4M U101 ( .A(n31), .Y(n33) );
  INVX4M U102 ( .A(n40), .Y(n42) );
  INVX4M U103 ( .A(n37), .Y(n39) );
  INVX4M U104 ( .A(n34), .Y(n36) );
  INVX2M U105 ( .A(n107), .Y(n145) );
  AOI211X2M U106 ( .A0(N104), .A1(n68), .B0(n48), .C0(n122), .Y(n107) );
  INVX2M U107 ( .A(n119), .Y(n160) );
  CLKBUFX6M U108 ( .A(n65), .Y(n122) );
  OAI31X2M U109 ( .A0(n160), .A1(n163), .A2(n162), .B0(n117), .Y(n65) );
  NOR2BX8M U110 ( .AN(n44), .B(n159), .Y(n49) );
  CLKAND2X6M U111 ( .A(n118), .B(n119), .Y(n68) );
  BUFX10M U112 ( .A(n59), .Y(n48) );
  NOR3X2M U113 ( .A(n163), .B(n161), .C(n162), .Y(n59) );
  INVX2M U114 ( .A(n116), .Y(n161) );
  INVX2M U115 ( .A(n4), .Y(n158) );
  BUFX4M U116 ( .A(n64), .Y(n120) );
  BUFX4M U117 ( .A(n64), .Y(n121) );
  INVX2M U118 ( .A(n60), .Y(n45) );
  NOR2BX2M U119 ( .AN(n106), .B(n160), .Y(n60) );
  CLKBUFX6M U120 ( .A(n55), .Y(n43) );
  NOR2BX2M U121 ( .AN(n118), .B(n161), .Y(n55) );
  INVX2M U122 ( .A(A[7]), .Y(n40) );
  INVX2M U123 ( .A(A[6]), .Y(n37) );
  INVX2M U124 ( .A(A[5]), .Y(n34) );
  INVX2M U125 ( .A(A[4]), .Y(n31) );
  INVX2M U126 ( .A(A[3]), .Y(n28) );
  INVX2M U127 ( .A(A[1]), .Y(n5) );
  INVX2M U128 ( .A(A[2]), .Y(n8) );
  INVX2M U129 ( .A(B[6]), .Y(n144) );
  OAI221X1M U130 ( .A0(B[0]), .A1(n112), .B0(n113), .B1(n151), .C0(n114), .Y(
        n111) );
  INVX2M U131 ( .A(B[0]), .Y(n151) );
  AOI221X2M U132 ( .A0(n4), .A1(n120), .B0(n122), .B1(n158), .C0(n48), .Y(n112) );
  AOI221X2M U133 ( .A0(n120), .A1(n158), .B0(n4), .B1(n66), .C0(n47), .Y(n113)
         );
  NAND4BX1M U134 ( .AN(n115), .B(n162), .C(ALU_FUN[3]), .D(ALU_FUN[1]), .Y(
        n114) );
  AOI22X1M U135 ( .A0(N153), .A1(n164), .B0(N154), .B1(ALU_FUN[0]), .Y(n115)
         );
  INVX2M U136 ( .A(B[4]), .Y(n143) );
  OAI222X1M U137 ( .A0(n74), .A1(n144), .B0(B[6]), .B1(n75), .C0(n54), .C1(
        n154), .Y(n73) );
  AOI221X2M U138 ( .A0(n39), .A1(n120), .B0(n122), .B1(n153), .C0(n48), .Y(n75) );
  AOI221X2M U139 ( .A0(n121), .A1(n153), .B0(n39), .B1(n66), .C0(n47), .Y(n74)
         );
  OAI222X1M U140 ( .A0(n62), .A1(n146), .B0(B[7]), .B1(n63), .C0(n54), .C1(
        n153), .Y(n61) );
  INVX2M U141 ( .A(B[7]), .Y(n146) );
  AOI221X2M U142 ( .A0(n121), .A1(n42), .B0(n122), .B1(n152), .C0(n48), .Y(n63) );
  AOI221X2M U143 ( .A0(n121), .A1(n152), .B0(n42), .B1(n66), .C0(n46), .Y(n62)
         );
  OAI222X1M U144 ( .A0(n86), .A1(n143), .B0(B[4]), .B1(n87), .C0(n54), .C1(
        n156), .Y(n85) );
  AOI221X2M U145 ( .A0(n33), .A1(n120), .B0(n122), .B1(n155), .C0(n48), .Y(n87) );
  AOI221X2M U146 ( .A0(n121), .A1(n155), .B0(n33), .B1(n66), .C0(n47), .Y(n86)
         );
  OAI222X1M U147 ( .A0(n104), .A1(n150), .B0(B[1]), .B1(n105), .C0(n54), .C1(
        n158), .Y(n103) );
  INVX2M U148 ( .A(B[1]), .Y(n150) );
  AOI221X2M U149 ( .A0(n7), .A1(n120), .B0(n122), .B1(n157), .C0(n48), .Y(n105) );
  AOI221X2M U150 ( .A0(n121), .A1(n157), .B0(n7), .B1(n66), .C0(n46), .Y(n104)
         );
  OAI222X1M U151 ( .A0(n98), .A1(n149), .B0(B[2]), .B1(n99), .C0(n54), .C1(
        n157), .Y(n97) );
  INVX2M U152 ( .A(B[2]), .Y(n149) );
  AOI221X2M U153 ( .A0(n27), .A1(n120), .B0(n122), .B1(n142), .C0(n48), .Y(n99) );
  AOI221X2M U154 ( .A0(n121), .A1(n142), .B0(n27), .B1(n66), .C0(n47), .Y(n98)
         );
  OAI222X1M U155 ( .A0(n92), .A1(n148), .B0(B[3]), .B1(n93), .C0(n54), .C1(n8), 
        .Y(n91) );
  INVX2M U156 ( .A(B[3]), .Y(n148) );
  AOI221X2M U157 ( .A0(n30), .A1(n120), .B0(n122), .B1(n156), .C0(n48), .Y(n93) );
  AOI221X2M U158 ( .A0(n121), .A1(n156), .B0(n30), .B1(n66), .C0(n46), .Y(n92)
         );
  OAI222X1M U159 ( .A0(n80), .A1(n147), .B0(B[5]), .B1(n81), .C0(n54), .C1(
        n155), .Y(n79) );
  INVX2M U160 ( .A(B[5]), .Y(n147) );
  AOI221X2M U161 ( .A0(n36), .A1(n120), .B0(n122), .B1(n154), .C0(n48), .Y(n81) );
  AOI221X2M U162 ( .A0(n121), .A1(n154), .B0(n36), .B1(n66), .C0(n46), .Y(n80)
         );
  NOR2X4M U163 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n118) );
  NAND2X4M U164 ( .A(EN), .B(n145), .Y(n50) );
  INVX2M U165 ( .A(ALU_FUN[0]), .Y(n164) );
  NAND3X2M U166 ( .A(n118), .B(ALU_FUN[0]), .C(ALU_FUN[3]), .Y(n117) );
  AND3X4M U167 ( .A(ALU_FUN[3]), .B(n164), .C(n106), .Y(n72) );
  CLKBUFX6M U168 ( .A(n53), .Y(n44) );
  NOR3X2M U169 ( .A(n161), .B(ALU_FUN[2]), .C(n163), .Y(n53) );
  AND3X2M U170 ( .A(n118), .B(n164), .C(ALU_FUN[3]), .Y(n64) );
  INVX6M U171 ( .A(EN), .Y(n159) );
  OAI2B2X1M U172 ( .A1N(n7), .A0(n125), .B0(B[1]), .B1(n125), .Y(n126) );
  NAND2BX1M U173 ( .AN(n39), .B(B[6]), .Y(n137) );
  CLKNAND2X2M U174 ( .A(B[5]), .B(n34), .Y(n136) );
  NAND2BX1M U175 ( .AN(n33), .B(B[4]), .Y(n133) );
  NAND4X1M U176 ( .A(n126), .B(n137), .C(n136), .D(n133), .Y(n141) );
  CLKNAND2X2M U177 ( .A(B[3]), .B(n28), .Y(n132) );
  CLKNAND2X2M U178 ( .A(B[2]), .B(n142), .Y(n127) );
  CLKNAND2X2M U179 ( .A(n132), .B(n127), .Y(n140) );
  OAI211X1M U180 ( .A0(n7), .A1(n129), .B0(n128), .C0(n127), .Y(n130) );
  OAI221X1M U181 ( .A0(B[2]), .A1(n142), .B0(B[3]), .B1(n28), .C0(n130), .Y(
        n131) );
  AOI32X1M U182 ( .A0(n133), .A1(n132), .A2(n131), .B0(n33), .B1(n143), .Y(
        n134) );
  OAI21X1M U183 ( .A0(B[5]), .A1(n34), .B0(n134), .Y(n135) );
  AOI32X1M U184 ( .A0(n137), .A1(n136), .A2(n135), .B0(n39), .B1(n144), .Y(
        n138) );
  ALU_DW_div_uns_0 div_52 ( .a({n41, n38, n35, n32, n29, n26, n6, n4}), .b(B), 
        .quotient({N128, N127, N126, N125, N124, N123, N122, N121}) );
  ALU_DW01_sub_0 sub_46 ( .A({1'b0, n41, n38, n35, n32, n29, n26, n6, n4}), 
        .B({1'b0, B}), .CI(1'b0), .DIFF({N104, N103, N102, N101, N100, N99, 
        N98, N97, N96}) );
  ALU_DW01_add_0 add_43 ( .A({1'b0, n41, n38, n35, n32, n29, n26, n6, n4}), 
        .B({1'b0, B}), .CI(1'b0), .SUM({N95, N94, N93, N92, N91, N90, N89, N88, 
        N87}) );
  ALU_DW02_mult_0 mult_49 ( .A({n41, n38, n35, n32, n29, n26, n6, n4}), .B(B), 
        .TC(1'b0), .PRODUCT({N120, N119, N118, N117, N116, N115, N114, N113, 
        N112, N111, N110, N109, N108, N107, N106, N105}) );
endmodule


module CLK_GATE ( CLK_EN, CLK, test_mode, GATED_CLK );
  input CLK_EN, CLK, test_mode;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP_DFT ( scan_clk, scan_rst, test_mode, SE, SI, SO, RST_N, 
        UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, framing_error, 
        test_si4, test_so4 );
  input [2:0] SI;
  output [2:0] SO;
  input scan_clk, scan_rst, test_mode, SE, RST_N, UART_CLK, REF_CLK,
         UART_RX_IN, test_si4;
  output UART_TX_O, parity_error, framing_error, test_so4;
  wire   ref_clock_dft, uart_clock_dft, alu_clock_dft, ALU_CLK, rst_dft,
         UART_TX_CLK_dft, UART_TX_CLK, UART_RX_CLK_dft, UART_RX_CLK,
         SYNC_UART_RST_dft, SYNC_UART_RST, SYNC_REF_RST_dft, SYNC_REF_RST,
         UART_RX_V_OUT, UART_RX_V_SYNC, UART_TX_VLD, UART_TX_Busy_PULSE,
         FIFO_FULL, UART_TX_V_SYNC, UART_TX_Busy, RF_RdData_VLD, RF_WrEn,
         RF_RdEn, ALU_EN, ALU_OUT_VLD, CLKG_EN, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n14, n15, n16, n18, n19, n20, n23, n26, n27, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;
  wire   [7:0] UART_RX_OUT;
  wire   [7:0] UART_RX_SYNC;
  wire   [7:0] UART_TX_IN;
  wire   [7:0] UART_TX_SYNC;
  wire   [7:0] DIV_RATIO;
  wire   [7:0] UART_Config;
  wire   [7:0] DIV_RATIO_RX;
  wire   [7:0] RF_RdData;
  wire   [3:0] RF_Address;
  wire   [7:0] RF_WrData;
  wire   [3:0] ALU_FUN;
  wire   [15:0] ALU_OUT;
  wire   [7:0] Operand_A;
  wire   [7:0] Operand_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;
  assign test_so4 = SYNC_REF_RST;

  INVX4M U10 ( .A(n11), .Y(n10) );
  INVX4M U11 ( .A(n9), .Y(n8) );
  INVX2M U12 ( .A(n7), .Y(n6) );
  INVX2M U13 ( .A(UART_Config[7]), .Y(n7) );
  INVX2M U14 ( .A(n5), .Y(n4) );
  INVX2M U15 ( .A(UART_Config[4]), .Y(n5) );
  INVX2M U16 ( .A(n3), .Y(n2) );
  INVX2M U17 ( .A(UART_Config[3]), .Y(n3) );
  INVX2M U18 ( .A(UART_TX_V_SYNC), .Y(n12) );
  MX2X2M U19 ( .A(RST_N), .B(scan_rst), .S0(test_mode), .Y(rst_dft) );
  INVX2M U20 ( .A(SYNC_UART_RST_dft), .Y(n11) );
  MX2X2M U21 ( .A(SYNC_UART_RST), .B(scan_rst), .S0(test_mode), .Y(
        SYNC_UART_RST_dft) );
  INVX2M U22 ( .A(SYNC_REF_RST_dft), .Y(n9) );
  MX2X2M U23 ( .A(SYNC_REF_RST), .B(scan_rst), .S0(test_mode), .Y(
        SYNC_REF_RST_dft) );
  MX2X6M U24 ( .A(REF_CLK), .B(scan_clk), .S0(test_mode), .Y(ref_clock_dft) );
  MX2X6M U25 ( .A(UART_CLK), .B(scan_clk), .S0(test_mode), .Y(uart_clock_dft)
         );
  MX2X6M U26 ( .A(ALU_CLK), .B(scan_clk), .S0(test_mode), .Y(alu_clock_dft) );
  MX2X6M U27 ( .A(UART_TX_CLK), .B(scan_clk), .S0(test_mode), .Y(
        UART_TX_CLK_dft) );
  MX2X6M U28 ( .A(UART_RX_CLK), .B(scan_clk), .S0(test_mode), .Y(
        UART_RX_CLK_dft) );
  INVX14M U35 ( .A(n36), .Y(n30) );
  INVX14M U36 ( .A(n35), .Y(n31) );
  INVX14M U37 ( .A(n35), .Y(n32) );
  INVX14M U38 ( .A(n35), .Y(n33) );
  DLY1X1M U39 ( .A(SE), .Y(n34) );
  CLKINVX16M U40 ( .A(SE), .Y(n35) );
  CLKINVX16M U41 ( .A(SE), .Y(n36) );
  INVX14M U42 ( .A(n35), .Y(n37) );
  INVX14M U43 ( .A(n35), .Y(n38) );
  INVX14M U44 ( .A(n35), .Y(n39) );
  INVX14M U45 ( .A(n36), .Y(n40) );
  INVX14M U46 ( .A(n36), .Y(n41) );
  INVX14M U47 ( .A(n36), .Y(n42) );
  RST_SYNC_NUM_STAGES2_test_0 U0_RST_SYNC ( .RST(rst_dft), .CLK(uart_clock_dft), .SYNC_RST(SYNC_UART_RST), .test_si(n26), .test_se(n34) );
  RST_SYNC_NUM_STAGES2_test_1 U1_RST_SYNC ( .RST(rst_dft), .CLK(ref_clock_dft), 
        .SYNC_RST(SYNC_REF_RST), .test_si(n14), .test_se(n30) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8_test_1 U0_ref_sync ( .CLK(ref_clock_dft), 
        .RST(n8), .unsync_bus(UART_RX_OUT), .bus_enable(UART_RX_V_OUT), 
        .sync_bus(UART_RX_SYNC), .enable_pulse_d(UART_RX_V_SYNC), .test_si(n16), .test_so(n15), .test_se(n32) );
  Async_fifo_D_SIZE8_P_SIZE4_F_DEPTH8_test_1 U0_UART_FIFO ( .i_w_clk(
        ref_clock_dft), .i_w_rstn(n8), .i_w_inc(UART_TX_VLD), .i_r_clk(
        UART_TX_CLK_dft), .i_r_rstn(n10), .i_r_inc(UART_TX_Busy_PULSE), 
        .i_w_data(UART_TX_IN), .o_r_data(UART_TX_SYNC), .o_full(FIFO_FULL), 
        .o_empty(UART_TX_V_SYNC), .test_si2(test_si4), .test_si1(n19), 
        .test_so2(n16), .test_so1(n18), .test_se(n38) );
  PULSE_GEN_test_1 U0_PULSE_GEN ( .clk(UART_TX_CLK_dft), .rst(n10), .lvl_sig(
        UART_TX_Busy), .pulse_sig(UART_TX_Busy_PULSE), .test_si(n27), 
        .test_so(n26), .test_se(n31) );
  ClkDiv_test_0 U0_ClkDiv ( .i_ref_clk(uart_clock_dft), .i_rst(n10), 
        .i_clk_en(1'b1), .i_div_ratio(DIV_RATIO), .o_div_clk(UART_TX_CLK), 
        .test_si(ALU_OUT_VLD), .test_so(n27), .test_se(n39) );
  CLKDIV_MUX U0_CLKDIV_MUX ( .IN({n6, UART_Config[6:5], n4, n2, UART_Config[2]}), .OUT({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, DIV_RATIO_RX[3:0]})
         );
  ClkDiv_test_1 U1_ClkDiv ( .i_ref_clk(uart_clock_dft), .i_rst(n10), 
        .i_clk_en(1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 
        DIV_RATIO_RX[3:0]}), .o_div_clk(UART_RX_CLK), .test_si(n15), .test_so(
        n14), .test_se(n42) );
  UART_test_1 U0_UART ( .RST(n10), .TX_CLK(UART_TX_CLK_dft), .RX_CLK(
        UART_RX_CLK_dft), .RX_IN_S(UART_RX_IN), .RX_OUT_P(UART_RX_OUT), 
        .RX_OUT_V(UART_RX_V_OUT), .TX_IN_P(UART_TX_SYNC), .TX_IN_V(n12), 
        .TX_OUT_S(SO[0]), .TX_OUT_V(UART_TX_Busy), .Prescale({n6, 
        UART_Config[6:5], n4, n2, UART_Config[2]}), .parity_enable(
        UART_Config[0]), .parity_type(UART_Config[1]), .parity_error(
        parity_error), .framing_error(framing_error), .test_si2(n18), 
        .test_si1(n20), .test_so1(n19), .test_se(n40) );
  SYS_CTRL_test_1 U0_SYS_CTRL ( .CLK(ref_clock_dft), .RST(n8), .ALU_OUT(
        ALU_OUT), .ALU_OUT_VLD(ALU_OUT_VLD), .ALU_FUN(ALU_FUN), .ALU_EN(ALU_EN), .CLKG_EN(CLKG_EN), .RF_Address(RF_Address), .RF_WrEn(RF_WrEn), .RF_RdEn(
        RF_RdEn), .RF_WrData(RF_WrData), .RF_RdData(RF_RdData), 
        .RF_RdData_VLD(RF_RdData_VLD), .UART_RX_DATA(UART_RX_SYNC), 
        .UART_RX_VLD(UART_RX_V_SYNC), .UART_TX_DATA(UART_TX_IN), .UART_TX_VLD(
        UART_TX_VLD), .FIFO_FULL(FIFO_FULL), .test_si2(SI[0]), .test_si1(n23), 
        .test_so2(n20), .test_so1(SO[1]), .test_se(n41) );
  RegFile_test_1 U0_RegFile ( .CLK(ref_clock_dft), .RST(n8), .WrEn(RF_WrEn), 
        .RdEn(RF_RdEn), .Address(RF_Address), .WrData(RF_WrData), .RdData(
        RF_RdData), .RdData_VLD(RF_RdData_VLD), .REG0(Operand_A), .REG1(
        Operand_B), .REG2(UART_Config), .REG3(DIV_RATIO), .test_si2(SI[1]), 
        .test_si1(SYNC_UART_RST), .test_so2(n23), .test_so1(SO[2]), .test_se(
        n37) );
  ALU_test_1 U0_ALU ( .A(Operand_A), .B(Operand_B), .EN(ALU_EN), .ALU_FUN(
        ALU_FUN), .CLK(alu_clock_dft), .RST(n8), .ALU_OUT(ALU_OUT), 
        .OUT_VALID(ALU_OUT_VLD), .test_si(SI[2]), .test_se(n33) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(CLKG_EN), .CLK(ref_clock_dft), .test_mode(
        1'b0), .GATED_CLK(ALU_CLK) );
  BUFX2M U34 ( .A(SO[0]), .Y(UART_TX_O) );
endmodule

