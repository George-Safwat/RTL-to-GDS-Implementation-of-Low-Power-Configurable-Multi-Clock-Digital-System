/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Wed Oct  7 01:08:00 2026
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_0 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   sync_reg_0_;

  DFFRQX2M sync_reg_reg_1_ ( .D(sync_reg_0_), .CK(CLK), .RN(RST), .Q(SYNC_RST)
         );
  DFFRQX2M sync_reg_reg_0_ ( .D(1'b1), .CK(CLK), .RN(RST), .Q(sync_reg_0_) );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   sync_reg_0_;

  DFFRQX2M sync_reg_reg_1_ ( .D(sync_reg_0_), .CK(CLK), .RN(RST), .Q(SYNC_RST)
         );
  DFFRQX2M sync_reg_reg_0_ ( .D(1'b1), .CK(CLK), .RN(RST), .Q(sync_reg_0_) );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 ( CLK, RST, unsync_bus, bus_enable, 
        sync_bus, enable_pulse_d );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable;
  output enable_pulse_d;
  wire   enable_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync_reg;

  DFFRQX2M enable_flop_reg ( .D(sync_reg[1]), .CK(CLK), .RN(RST), .Q(
        enable_flop) );
  DFFRQX2M sync_reg_reg_1_ ( .D(sync_reg[0]), .CK(CLK), .RN(RST), .Q(
        sync_reg[1]) );
  DFFRQX2M sync_bus_reg_3_ ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M sync_bus_reg_0_ ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M sync_bus_reg_7_ ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M sync_bus_reg_6_ ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M sync_bus_reg_5_ ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M sync_bus_reg_2_ ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M sync_bus_reg_1_ ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M sync_bus_reg_4_ ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M enable_pulse_d_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse_d) );
  DFFRQX2M sync_reg_reg_0_ ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(
        sync_reg[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(enable_flop), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module fifo_mem_A_SIZE3_D_SIZE8_F_DEPTH8_P_SIZE4 ( w_clk, w_rstn, w_full, 
        w_inc, w_addr, r_addr, w_data, r_data );
  input [2:0] w_addr;
  input [2:0] r_addr;
  input [7:0] w_data;
  output [7:0] r_data;
  input w_clk, w_rstn, w_full, w_inc;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137;
  wire   [63:0] FIFO_MEM;

  DFFRQX2M FIFO_MEM_reg_1__7_ ( .D(n37), .CK(w_clk), .RN(n118), .Q(
        FIFO_MEM[15]) );
  DFFRQX2M FIFO_MEM_reg_1__6_ ( .D(n36), .CK(w_clk), .RN(n118), .Q(
        FIFO_MEM[14]) );
  DFFRQX2M FIFO_MEM_reg_1__5_ ( .D(n35), .CK(w_clk), .RN(n118), .Q(
        FIFO_MEM[13]) );
  DFFRQX2M FIFO_MEM_reg_1__4_ ( .D(n34), .CK(w_clk), .RN(n117), .Q(
        FIFO_MEM[12]) );
  DFFRQX2M FIFO_MEM_reg_1__3_ ( .D(n33), .CK(w_clk), .RN(n117), .Q(
        FIFO_MEM[11]) );
  DFFRQX2M FIFO_MEM_reg_1__2_ ( .D(n32), .CK(w_clk), .RN(n117), .Q(
        FIFO_MEM[10]) );
  DFFRQX2M FIFO_MEM_reg_1__1_ ( .D(n31), .CK(w_clk), .RN(n117), .Q(FIFO_MEM[9]) );
  DFFRQX2M FIFO_MEM_reg_1__0_ ( .D(n30), .CK(w_clk), .RN(n117), .Q(FIFO_MEM[8]) );
  DFFRQX2M FIFO_MEM_reg_0__7_ ( .D(n29), .CK(w_clk), .RN(n117), .Q(FIFO_MEM[7]) );
  DFFRQX2M FIFO_MEM_reg_0__6_ ( .D(n28), .CK(w_clk), .RN(n117), .Q(FIFO_MEM[6]) );
  DFFRQX2M FIFO_MEM_reg_0__5_ ( .D(n27), .CK(w_clk), .RN(n117), .Q(FIFO_MEM[5]) );
  DFFRQX2M FIFO_MEM_reg_0__4_ ( .D(n26), .CK(w_clk), .RN(n117), .Q(FIFO_MEM[4]) );
  DFFRQX2M FIFO_MEM_reg_0__3_ ( .D(n25), .CK(w_clk), .RN(n117), .Q(FIFO_MEM[3]) );
  DFFRQX2M FIFO_MEM_reg_0__2_ ( .D(n24), .CK(w_clk), .RN(n117), .Q(FIFO_MEM[2]) );
  DFFRQX2M FIFO_MEM_reg_0__1_ ( .D(n23), .CK(w_clk), .RN(n117), .Q(FIFO_MEM[1]) );
  DFFRQX2M FIFO_MEM_reg_0__0_ ( .D(n22), .CK(w_clk), .RN(n117), .Q(FIFO_MEM[0]) );
  DFFRQX2M FIFO_MEM_reg_5__7_ ( .D(n69), .CK(w_clk), .RN(n120), .Q(
        FIFO_MEM[47]) );
  DFFRQX2M FIFO_MEM_reg_5__6_ ( .D(n68), .CK(w_clk), .RN(n120), .Q(
        FIFO_MEM[46]) );
  DFFRQX2M FIFO_MEM_reg_5__5_ ( .D(n67), .CK(w_clk), .RN(n120), .Q(
        FIFO_MEM[45]) );
  DFFRQX2M FIFO_MEM_reg_5__4_ ( .D(n66), .CK(w_clk), .RN(n120), .Q(
        FIFO_MEM[44]) );
  DFFRQX2M FIFO_MEM_reg_5__3_ ( .D(n65), .CK(w_clk), .RN(n120), .Q(
        FIFO_MEM[43]) );
  DFFRQX2M FIFO_MEM_reg_5__2_ ( .D(n64), .CK(w_clk), .RN(n120), .Q(
        FIFO_MEM[42]) );
  DFFRQX2M FIFO_MEM_reg_5__1_ ( .D(n63), .CK(w_clk), .RN(n120), .Q(
        FIFO_MEM[41]) );
  DFFRQX2M FIFO_MEM_reg_5__0_ ( .D(n62), .CK(w_clk), .RN(n120), .Q(
        FIFO_MEM[40]) );
  DFFRQX2M FIFO_MEM_reg_4__7_ ( .D(n61), .CK(w_clk), .RN(n120), .Q(
        FIFO_MEM[39]) );
  DFFRQX2M FIFO_MEM_reg_4__6_ ( .D(n60), .CK(w_clk), .RN(n119), .Q(
        FIFO_MEM[38]) );
  DFFRQX2M FIFO_MEM_reg_4__5_ ( .D(n59), .CK(w_clk), .RN(n119), .Q(
        FIFO_MEM[37]) );
  DFFRQX2M FIFO_MEM_reg_4__4_ ( .D(n58), .CK(w_clk), .RN(n119), .Q(
        FIFO_MEM[36]) );
  DFFRQX2M FIFO_MEM_reg_4__3_ ( .D(n57), .CK(w_clk), .RN(n119), .Q(
        FIFO_MEM[35]) );
  DFFRQX2M FIFO_MEM_reg_4__2_ ( .D(n56), .CK(w_clk), .RN(n119), .Q(
        FIFO_MEM[34]) );
  DFFRQX2M FIFO_MEM_reg_4__1_ ( .D(n55), .CK(w_clk), .RN(n119), .Q(
        FIFO_MEM[33]) );
  DFFRQX2M FIFO_MEM_reg_4__0_ ( .D(n54), .CK(w_clk), .RN(n119), .Q(
        FIFO_MEM[32]) );
  DFFRQX2M FIFO_MEM_reg_7__7_ ( .D(n85), .CK(w_clk), .RN(n121), .Q(
        FIFO_MEM[63]) );
  DFFRQX2M FIFO_MEM_reg_7__6_ ( .D(n84), .CK(w_clk), .RN(n121), .Q(
        FIFO_MEM[62]) );
  DFFRQX2M FIFO_MEM_reg_7__5_ ( .D(n83), .CK(w_clk), .RN(n121), .Q(
        FIFO_MEM[61]) );
  DFFRQX2M FIFO_MEM_reg_7__4_ ( .D(n82), .CK(w_clk), .RN(n121), .Q(
        FIFO_MEM[60]) );
  DFFRQX2M FIFO_MEM_reg_7__3_ ( .D(n81), .CK(w_clk), .RN(n121), .Q(
        FIFO_MEM[59]) );
  DFFRQX2M FIFO_MEM_reg_7__2_ ( .D(n80), .CK(w_clk), .RN(n121), .Q(
        FIFO_MEM[58]) );
  DFFRQX2M FIFO_MEM_reg_7__1_ ( .D(n79), .CK(w_clk), .RN(n121), .Q(
        FIFO_MEM[57]) );
  DFFRQX2M FIFO_MEM_reg_7__0_ ( .D(n78), .CK(w_clk), .RN(n121), .Q(
        FIFO_MEM[56]) );
  DFFRQX2M FIFO_MEM_reg_6__7_ ( .D(n77), .CK(w_clk), .RN(n121), .Q(
        FIFO_MEM[55]) );
  DFFRQX2M FIFO_MEM_reg_6__6_ ( .D(n76), .CK(w_clk), .RN(n121), .Q(
        FIFO_MEM[54]) );
  DFFRQX2M FIFO_MEM_reg_6__5_ ( .D(n75), .CK(w_clk), .RN(n121), .Q(
        FIFO_MEM[53]) );
  DFFRQX2M FIFO_MEM_reg_6__4_ ( .D(n74), .CK(w_clk), .RN(n121), .Q(
        FIFO_MEM[52]) );
  DFFRQX2M FIFO_MEM_reg_6__3_ ( .D(n73), .CK(w_clk), .RN(n120), .Q(
        FIFO_MEM[51]) );
  DFFRQX2M FIFO_MEM_reg_6__2_ ( .D(n72), .CK(w_clk), .RN(n120), .Q(
        FIFO_MEM[50]) );
  DFFRQX2M FIFO_MEM_reg_6__1_ ( .D(n71), .CK(w_clk), .RN(n120), .Q(
        FIFO_MEM[49]) );
  DFFRQX2M FIFO_MEM_reg_6__0_ ( .D(n70), .CK(w_clk), .RN(n120), .Q(
        FIFO_MEM[48]) );
  DFFRQX2M FIFO_MEM_reg_3__7_ ( .D(n53), .CK(w_clk), .RN(n119), .Q(
        FIFO_MEM[31]) );
  DFFRQX2M FIFO_MEM_reg_3__6_ ( .D(n52), .CK(w_clk), .RN(n119), .Q(
        FIFO_MEM[30]) );
  DFFRQX2M FIFO_MEM_reg_3__5_ ( .D(n51), .CK(w_clk), .RN(n119), .Q(
        FIFO_MEM[29]) );
  DFFRQX2M FIFO_MEM_reg_3__4_ ( .D(n50), .CK(w_clk), .RN(n119), .Q(
        FIFO_MEM[28]) );
  DFFRQX2M FIFO_MEM_reg_3__3_ ( .D(n49), .CK(w_clk), .RN(n119), .Q(
        FIFO_MEM[27]) );
  DFFRQX2M FIFO_MEM_reg_3__2_ ( .D(n48), .CK(w_clk), .RN(n119), .Q(
        FIFO_MEM[26]) );
  DFFRQX2M FIFO_MEM_reg_3__1_ ( .D(n47), .CK(w_clk), .RN(n118), .Q(
        FIFO_MEM[25]) );
  DFFRQX2M FIFO_MEM_reg_3__0_ ( .D(n46), .CK(w_clk), .RN(n118), .Q(
        FIFO_MEM[24]) );
  DFFRQX2M FIFO_MEM_reg_2__7_ ( .D(n45), .CK(w_clk), .RN(n118), .Q(
        FIFO_MEM[23]) );
  DFFRQX2M FIFO_MEM_reg_2__6_ ( .D(n44), .CK(w_clk), .RN(n118), .Q(
        FIFO_MEM[22]) );
  DFFRQX2M FIFO_MEM_reg_2__5_ ( .D(n43), .CK(w_clk), .RN(n118), .Q(
        FIFO_MEM[21]) );
  DFFRQX2M FIFO_MEM_reg_2__4_ ( .D(n42), .CK(w_clk), .RN(n118), .Q(
        FIFO_MEM[20]) );
  DFFRQX2M FIFO_MEM_reg_2__3_ ( .D(n41), .CK(w_clk), .RN(n118), .Q(
        FIFO_MEM[19]) );
  DFFRQX2M FIFO_MEM_reg_2__2_ ( .D(n40), .CK(w_clk), .RN(n118), .Q(
        FIFO_MEM[18]) );
  DFFRQX2M FIFO_MEM_reg_2__1_ ( .D(n39), .CK(w_clk), .RN(n118), .Q(
        FIFO_MEM[17]) );
  DFFRQX2M FIFO_MEM_reg_2__0_ ( .D(n38), .CK(w_clk), .RN(n118), .Q(
        FIFO_MEM[16]) );
  BUFX2M U2 ( .A(n19), .Y(n124) );
  BUFX2M U3 ( .A(n20), .Y(n123) );
  BUFX2M U4 ( .A(n21), .Y(n122) );
  BUFX2M U5 ( .A(n15), .Y(n125) );
  BUFX2M U6 ( .A(n13), .Y(n127) );
  BUFX2M U7 ( .A(n14), .Y(n126) );
  BUFX2M U8 ( .A(n115), .Y(n117) );
  BUFX2M U9 ( .A(n115), .Y(n118) );
  BUFX2M U10 ( .A(n115), .Y(n119) );
  BUFX2M U11 ( .A(n116), .Y(n120) );
  BUFX2M U12 ( .A(n116), .Y(n121) );
  BUFX2M U13 ( .A(w_rstn), .Y(n115) );
  BUFX2M U14 ( .A(w_rstn), .Y(n116) );
  NAND3X2M U15 ( .A(n128), .B(n129), .C(n18), .Y(n17) );
  NAND3X2M U16 ( .A(n128), .B(n129), .C(n12), .Y(n11) );
  NOR2X2M U17 ( .A(n112), .B(n113), .Y(n108) );
  NOR2BX2M U18 ( .AN(n16), .B(w_addr[2]), .Y(n12) );
  OAI2BB2X1M U19 ( .B0(n11), .B1(n137), .A0N(FIFO_MEM[0]), .A1N(n11), .Y(n22)
         );
  OAI2BB2X1M U20 ( .B0(n11), .B1(n136), .A0N(FIFO_MEM[1]), .A1N(n11), .Y(n23)
         );
  OAI2BB2X1M U21 ( .B0(n11), .B1(n135), .A0N(FIFO_MEM[2]), .A1N(n11), .Y(n24)
         );
  OAI2BB2X1M U22 ( .B0(n11), .B1(n134), .A0N(FIFO_MEM[3]), .A1N(n11), .Y(n25)
         );
  OAI2BB2X1M U23 ( .B0(n11), .B1(n133), .A0N(FIFO_MEM[4]), .A1N(n11), .Y(n26)
         );
  OAI2BB2X1M U24 ( .B0(n11), .B1(n132), .A0N(FIFO_MEM[5]), .A1N(n11), .Y(n27)
         );
  OAI2BB2X1M U25 ( .B0(n11), .B1(n131), .A0N(FIFO_MEM[6]), .A1N(n11), .Y(n28)
         );
  OAI2BB2X1M U26 ( .B0(n11), .B1(n130), .A0N(FIFO_MEM[7]), .A1N(n11), .Y(n29)
         );
  OAI2BB2X1M U27 ( .B0(n137), .B1(n17), .A0N(FIFO_MEM[32]), .A1N(n17), .Y(n54)
         );
  OAI2BB2X1M U28 ( .B0(n136), .B1(n17), .A0N(FIFO_MEM[33]), .A1N(n17), .Y(n55)
         );
  OAI2BB2X1M U29 ( .B0(n135), .B1(n17), .A0N(FIFO_MEM[34]), .A1N(n17), .Y(n56)
         );
  OAI2BB2X1M U30 ( .B0(n134), .B1(n17), .A0N(FIFO_MEM[35]), .A1N(n17), .Y(n57)
         );
  OAI2BB2X1M U31 ( .B0(n133), .B1(n17), .A0N(FIFO_MEM[36]), .A1N(n17), .Y(n58)
         );
  OAI2BB2X1M U32 ( .B0(n132), .B1(n17), .A0N(FIFO_MEM[37]), .A1N(n17), .Y(n59)
         );
  OAI2BB2X1M U33 ( .B0(n131), .B1(n17), .A0N(FIFO_MEM[38]), .A1N(n17), .Y(n60)
         );
  OAI2BB2X1M U34 ( .B0(n130), .B1(n17), .A0N(FIFO_MEM[39]), .A1N(n17), .Y(n61)
         );
  OAI2BB2X1M U35 ( .B0(n137), .B1(n127), .A0N(FIFO_MEM[8]), .A1N(n127), .Y(n30) );
  OAI2BB2X1M U36 ( .B0(n136), .B1(n127), .A0N(FIFO_MEM[9]), .A1N(n127), .Y(n31) );
  OAI2BB2X1M U37 ( .B0(n135), .B1(n127), .A0N(FIFO_MEM[10]), .A1N(n127), .Y(
        n32) );
  OAI2BB2X1M U38 ( .B0(n134), .B1(n127), .A0N(FIFO_MEM[11]), .A1N(n127), .Y(
        n33) );
  OAI2BB2X1M U39 ( .B0(n133), .B1(n127), .A0N(FIFO_MEM[12]), .A1N(n127), .Y(
        n34) );
  OAI2BB2X1M U40 ( .B0(n132), .B1(n127), .A0N(FIFO_MEM[13]), .A1N(n127), .Y(
        n35) );
  OAI2BB2X1M U41 ( .B0(n131), .B1(n127), .A0N(FIFO_MEM[14]), .A1N(n127), .Y(
        n36) );
  OAI2BB2X1M U42 ( .B0(n130), .B1(n127), .A0N(FIFO_MEM[15]), .A1N(n127), .Y(
        n37) );
  OAI2BB2X1M U43 ( .B0(n137), .B1(n126), .A0N(FIFO_MEM[16]), .A1N(n126), .Y(
        n38) );
  OAI2BB2X1M U44 ( .B0(n136), .B1(n126), .A0N(FIFO_MEM[17]), .A1N(n126), .Y(
        n39) );
  OAI2BB2X1M U45 ( .B0(n135), .B1(n126), .A0N(FIFO_MEM[18]), .A1N(n126), .Y(
        n40) );
  OAI2BB2X1M U46 ( .B0(n134), .B1(n126), .A0N(FIFO_MEM[19]), .A1N(n126), .Y(
        n41) );
  OAI2BB2X1M U47 ( .B0(n133), .B1(n126), .A0N(FIFO_MEM[20]), .A1N(n126), .Y(
        n42) );
  OAI2BB2X1M U48 ( .B0(n132), .B1(n126), .A0N(FIFO_MEM[21]), .A1N(n126), .Y(
        n43) );
  OAI2BB2X1M U49 ( .B0(n131), .B1(n126), .A0N(FIFO_MEM[22]), .A1N(n126), .Y(
        n44) );
  OAI2BB2X1M U50 ( .B0(n130), .B1(n126), .A0N(FIFO_MEM[23]), .A1N(n126), .Y(
        n45) );
  OAI2BB2X1M U51 ( .B0(n137), .B1(n125), .A0N(FIFO_MEM[24]), .A1N(n125), .Y(
        n46) );
  OAI2BB2X1M U52 ( .B0(n136), .B1(n125), .A0N(FIFO_MEM[25]), .A1N(n125), .Y(
        n47) );
  OAI2BB2X1M U53 ( .B0(n135), .B1(n125), .A0N(FIFO_MEM[26]), .A1N(n125), .Y(
        n48) );
  OAI2BB2X1M U54 ( .B0(n134), .B1(n125), .A0N(FIFO_MEM[27]), .A1N(n125), .Y(
        n49) );
  OAI2BB2X1M U55 ( .B0(n133), .B1(n125), .A0N(FIFO_MEM[28]), .A1N(n125), .Y(
        n50) );
  OAI2BB2X1M U56 ( .B0(n132), .B1(n125), .A0N(FIFO_MEM[29]), .A1N(n125), .Y(
        n51) );
  OAI2BB2X1M U57 ( .B0(n131), .B1(n125), .A0N(FIFO_MEM[30]), .A1N(n125), .Y(
        n52) );
  OAI2BB2X1M U58 ( .B0(n130), .B1(n125), .A0N(FIFO_MEM[31]), .A1N(n125), .Y(
        n53) );
  OAI2BB2X1M U59 ( .B0(n137), .B1(n124), .A0N(FIFO_MEM[40]), .A1N(n124), .Y(
        n62) );
  OAI2BB2X1M U60 ( .B0(n136), .B1(n124), .A0N(FIFO_MEM[41]), .A1N(n124), .Y(
        n63) );
  OAI2BB2X1M U61 ( .B0(n135), .B1(n124), .A0N(FIFO_MEM[42]), .A1N(n124), .Y(
        n64) );
  OAI2BB2X1M U62 ( .B0(n134), .B1(n124), .A0N(FIFO_MEM[43]), .A1N(n124), .Y(
        n65) );
  OAI2BB2X1M U63 ( .B0(n133), .B1(n124), .A0N(FIFO_MEM[44]), .A1N(n124), .Y(
        n66) );
  OAI2BB2X1M U64 ( .B0(n132), .B1(n124), .A0N(FIFO_MEM[45]), .A1N(n124), .Y(
        n67) );
  OAI2BB2X1M U65 ( .B0(n131), .B1(n124), .A0N(FIFO_MEM[46]), .A1N(n124), .Y(
        n68) );
  OAI2BB2X1M U66 ( .B0(n130), .B1(n124), .A0N(FIFO_MEM[47]), .A1N(n124), .Y(
        n69) );
  OAI2BB2X1M U67 ( .B0(n137), .B1(n123), .A0N(FIFO_MEM[48]), .A1N(n123), .Y(
        n70) );
  OAI2BB2X1M U68 ( .B0(n136), .B1(n123), .A0N(FIFO_MEM[49]), .A1N(n123), .Y(
        n71) );
  OAI2BB2X1M U69 ( .B0(n135), .B1(n123), .A0N(FIFO_MEM[50]), .A1N(n123), .Y(
        n72) );
  OAI2BB2X1M U70 ( .B0(n134), .B1(n123), .A0N(FIFO_MEM[51]), .A1N(n123), .Y(
        n73) );
  OAI2BB2X1M U71 ( .B0(n133), .B1(n123), .A0N(FIFO_MEM[52]), .A1N(n123), .Y(
        n74) );
  OAI2BB2X1M U72 ( .B0(n132), .B1(n123), .A0N(FIFO_MEM[53]), .A1N(n123), .Y(
        n75) );
  OAI2BB2X1M U73 ( .B0(n131), .B1(n123), .A0N(FIFO_MEM[54]), .A1N(n123), .Y(
        n76) );
  OAI2BB2X1M U74 ( .B0(n130), .B1(n123), .A0N(FIFO_MEM[55]), .A1N(n123), .Y(
        n77) );
  OAI2BB2X1M U75 ( .B0(n137), .B1(n122), .A0N(FIFO_MEM[56]), .A1N(n122), .Y(
        n78) );
  OAI2BB2X1M U76 ( .B0(n136), .B1(n122), .A0N(FIFO_MEM[57]), .A1N(n122), .Y(
        n79) );
  OAI2BB2X1M U77 ( .B0(n135), .B1(n122), .A0N(FIFO_MEM[58]), .A1N(n122), .Y(
        n80) );
  OAI2BB2X1M U78 ( .B0(n134), .B1(n122), .A0N(FIFO_MEM[59]), .A1N(n122), .Y(
        n81) );
  OAI2BB2X1M U79 ( .B0(n133), .B1(n122), .A0N(FIFO_MEM[60]), .A1N(n122), .Y(
        n82) );
  OAI2BB2X1M U80 ( .B0(n132), .B1(n122), .A0N(FIFO_MEM[61]), .A1N(n122), .Y(
        n83) );
  OAI2BB2X1M U81 ( .B0(n131), .B1(n122), .A0N(FIFO_MEM[62]), .A1N(n122), .Y(
        n84) );
  OAI2BB2X1M U82 ( .B0(n130), .B1(n122), .A0N(FIFO_MEM[63]), .A1N(n122), .Y(
        n85) );
  NOR2BX2M U83 ( .AN(w_inc), .B(w_full), .Y(n16) );
  AND2X2M U84 ( .A(w_addr[2]), .B(n16), .Y(n18) );
  NAND3X2M U85 ( .A(n12), .B(n129), .C(w_addr[0]), .Y(n13) );
  NAND3X2M U86 ( .A(n12), .B(n128), .C(w_addr[1]), .Y(n14) );
  NAND3X2M U87 ( .A(w_addr[0]), .B(n12), .C(w_addr[1]), .Y(n15) );
  NAND3X2M U88 ( .A(w_addr[1]), .B(w_addr[0]), .C(n18), .Y(n21) );
  NAND3X2M U89 ( .A(w_addr[0]), .B(n129), .C(n18), .Y(n19) );
  NAND3X2M U90 ( .A(w_addr[1]), .B(n128), .C(n18), .Y(n20) );
  INVX2M U91 ( .A(w_addr[0]), .Y(n128) );
  INVX2M U92 ( .A(w_addr[1]), .Y(n129) );
  INVX2M U93 ( .A(w_data[0]), .Y(n137) );
  INVX2M U94 ( .A(w_data[1]), .Y(n136) );
  INVX2M U95 ( .A(w_data[2]), .Y(n135) );
  INVX2M U96 ( .A(w_data[3]), .Y(n134) );
  INVX2M U97 ( .A(w_data[4]), .Y(n133) );
  INVX2M U98 ( .A(w_data[5]), .Y(n132) );
  INVX2M U99 ( .A(w_data[6]), .Y(n131) );
  INVX2M U100 ( .A(w_data[7]), .Y(n130) );
  NOR2X2M U101 ( .A(n113), .B(r_addr[2]), .Y(n106) );
  NOR2X2M U102 ( .A(n112), .B(r_addr[1]), .Y(n109) );
  NOR2X2M U103 ( .A(r_addr[1]), .B(r_addr[2]), .Y(n105) );
  INVX2M U104 ( .A(r_addr[1]), .Y(n113) );
  INVX2M U105 ( .A(r_addr[2]), .Y(n112) );
  INVX2M U106 ( .A(r_addr[0]), .Y(n114) );
  AO22X1M U107 ( .A0(FIFO_MEM[24]), .A1(n106), .B0(FIFO_MEM[8]), .B1(n105), 
        .Y(n1) );
  AOI221XLM U108 ( .A0(FIFO_MEM[40]), .A1(n109), .B0(FIFO_MEM[56]), .B1(n108), 
        .C0(n1), .Y(n4) );
  AO22X1M U109 ( .A0(FIFO_MEM[16]), .A1(n106), .B0(FIFO_MEM[0]), .B1(n105), 
        .Y(n2) );
  AOI221XLM U110 ( .A0(FIFO_MEM[32]), .A1(n109), .B0(FIFO_MEM[48]), .B1(n108), 
        .C0(n2), .Y(n3) );
  OAI22X1M U111 ( .A0(n114), .A1(n4), .B0(r_addr[0]), .B1(n3), .Y(r_data[0])
         );
  AO22X1M U112 ( .A0(FIFO_MEM[25]), .A1(n106), .B0(FIFO_MEM[9]), .B1(n105), 
        .Y(n5) );
  AOI221XLM U113 ( .A0(FIFO_MEM[41]), .A1(n109), .B0(FIFO_MEM[57]), .B1(n108), 
        .C0(n5), .Y(n8) );
  AO22X1M U114 ( .A0(FIFO_MEM[17]), .A1(n106), .B0(FIFO_MEM[1]), .B1(n105), 
        .Y(n6) );
  AOI221XLM U115 ( .A0(FIFO_MEM[33]), .A1(n109), .B0(FIFO_MEM[49]), .B1(n108), 
        .C0(n6), .Y(n7) );
  OAI22X1M U116 ( .A0(n114), .A1(n8), .B0(r_addr[0]), .B1(n7), .Y(r_data[1])
         );
  AO22X1M U117 ( .A0(FIFO_MEM[26]), .A1(n106), .B0(FIFO_MEM[10]), .B1(n105), 
        .Y(n9) );
  AOI221XLM U118 ( .A0(FIFO_MEM[42]), .A1(n109), .B0(FIFO_MEM[58]), .B1(n108), 
        .C0(n9), .Y(n87) );
  AO22X1M U119 ( .A0(FIFO_MEM[18]), .A1(n106), .B0(FIFO_MEM[2]), .B1(n105), 
        .Y(n10) );
  AOI221XLM U120 ( .A0(FIFO_MEM[34]), .A1(n109), .B0(FIFO_MEM[50]), .B1(n108), 
        .C0(n10), .Y(n86) );
  OAI22X1M U121 ( .A0(n114), .A1(n87), .B0(r_addr[0]), .B1(n86), .Y(r_data[2])
         );
  AO22X1M U122 ( .A0(FIFO_MEM[27]), .A1(n106), .B0(FIFO_MEM[11]), .B1(n105), 
        .Y(n88) );
  AOI221XLM U123 ( .A0(FIFO_MEM[43]), .A1(n109), .B0(FIFO_MEM[59]), .B1(n108), 
        .C0(n88), .Y(n91) );
  AO22X1M U124 ( .A0(FIFO_MEM[19]), .A1(n106), .B0(FIFO_MEM[3]), .B1(n105), 
        .Y(n89) );
  AOI221XLM U125 ( .A0(FIFO_MEM[35]), .A1(n109), .B0(FIFO_MEM[51]), .B1(n108), 
        .C0(n89), .Y(n90) );
  OAI22X1M U126 ( .A0(n114), .A1(n91), .B0(r_addr[0]), .B1(n90), .Y(r_data[3])
         );
  AO22X1M U127 ( .A0(FIFO_MEM[28]), .A1(n106), .B0(FIFO_MEM[12]), .B1(n105), 
        .Y(n92) );
  AOI221XLM U128 ( .A0(FIFO_MEM[44]), .A1(n109), .B0(FIFO_MEM[60]), .B1(n108), 
        .C0(n92), .Y(n95) );
  AO22X1M U129 ( .A0(FIFO_MEM[20]), .A1(n106), .B0(FIFO_MEM[4]), .B1(n105), 
        .Y(n93) );
  AOI221XLM U130 ( .A0(FIFO_MEM[36]), .A1(n109), .B0(FIFO_MEM[52]), .B1(n108), 
        .C0(n93), .Y(n94) );
  OAI22X1M U131 ( .A0(n114), .A1(n95), .B0(r_addr[0]), .B1(n94), .Y(r_data[4])
         );
  AO22X1M U132 ( .A0(FIFO_MEM[29]), .A1(n106), .B0(FIFO_MEM[13]), .B1(n105), 
        .Y(n96) );
  AOI221XLM U133 ( .A0(FIFO_MEM[45]), .A1(n109), .B0(FIFO_MEM[61]), .B1(n108), 
        .C0(n96), .Y(n99) );
  AO22X1M U134 ( .A0(FIFO_MEM[21]), .A1(n106), .B0(FIFO_MEM[5]), .B1(n105), 
        .Y(n97) );
  AOI221XLM U135 ( .A0(FIFO_MEM[37]), .A1(n109), .B0(FIFO_MEM[53]), .B1(n108), 
        .C0(n97), .Y(n98) );
  OAI22X1M U136 ( .A0(n114), .A1(n99), .B0(r_addr[0]), .B1(n98), .Y(r_data[5])
         );
  AO22X1M U137 ( .A0(FIFO_MEM[30]), .A1(n106), .B0(FIFO_MEM[14]), .B1(n105), 
        .Y(n100) );
  AOI221XLM U138 ( .A0(FIFO_MEM[46]), .A1(n109), .B0(FIFO_MEM[62]), .B1(n108), 
        .C0(n100), .Y(n103) );
  AO22X1M U139 ( .A0(FIFO_MEM[22]), .A1(n106), .B0(FIFO_MEM[6]), .B1(n105), 
        .Y(n101) );
  AOI221XLM U140 ( .A0(FIFO_MEM[38]), .A1(n109), .B0(FIFO_MEM[54]), .B1(n108), 
        .C0(n101), .Y(n102) );
  OAI22X1M U141 ( .A0(n114), .A1(n103), .B0(r_addr[0]), .B1(n102), .Y(
        r_data[6]) );
  AO22X1M U142 ( .A0(FIFO_MEM[31]), .A1(n106), .B0(FIFO_MEM[15]), .B1(n105), 
        .Y(n104) );
  AOI221XLM U143 ( .A0(FIFO_MEM[47]), .A1(n109), .B0(FIFO_MEM[63]), .B1(n108), 
        .C0(n104), .Y(n111) );
  AO22X1M U144 ( .A0(FIFO_MEM[23]), .A1(n106), .B0(FIFO_MEM[7]), .B1(n105), 
        .Y(n107) );
  AOI221XLM U145 ( .A0(FIFO_MEM[39]), .A1(n109), .B0(FIFO_MEM[55]), .B1(n108), 
        .C0(n107), .Y(n110) );
  OAI22X1M U146 ( .A0(n111), .A1(n114), .B0(r_addr[0]), .B1(n110), .Y(
        r_data[7]) );
endmodule


module DF_Sync_DATA_SIZE4_0 ( sync_clk, sync_rstn, unsync_ip, sync_op );
  input [3:0] unsync_ip;
  output [3:0] sync_op;
  input sync_clk, sync_rstn;

  wire   [3:0] meta_flop;

  DFFRQX2M sync_op_reg_3_ ( .D(meta_flop[3]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[3]) );
  DFFRQX2M sync_op_reg_2_ ( .D(meta_flop[2]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[2]) );
  DFFRQX2M sync_op_reg_1_ ( .D(meta_flop[1]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[1]) );
  DFFRQX2M sync_op_reg_0_ ( .D(meta_flop[0]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[0]) );
  DFFRQX2M meta_flop_reg_3_ ( .D(unsync_ip[3]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(meta_flop[3]) );
  DFFRQX2M meta_flop_reg_2_ ( .D(unsync_ip[2]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(meta_flop[2]) );
  DFFRQX2M meta_flop_reg_1_ ( .D(unsync_ip[1]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(meta_flop[1]) );
  DFFRQX2M meta_flop_reg_0_ ( .D(unsync_ip[0]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(meta_flop[0]) );
endmodule


module fifo_wr ( w_clk, w_rstn, w_inc, sync_rd_ptr, w_addr, gray_w_ptr, full
 );
  input [3:0] sync_rd_ptr;
  output [2:0] w_addr;
  output [3:0] gray_w_ptr;
  input w_clk, w_rstn, w_inc;
  output full;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [3:0] comb_gray_w_ptr;

  DFFRQX2M w_ptr_reg_3_ ( .D(n11), .CK(w_clk), .RN(w_rstn), .Q(
        comb_gray_w_ptr[3]) );
  DFFRQX2M w_ptr_reg_2_ ( .D(n12), .CK(w_clk), .RN(w_rstn), .Q(w_addr[2]) );
  DFFRQX2M gray_w_ptr_reg_2_ ( .D(comb_gray_w_ptr[2]), .CK(w_clk), .RN(w_rstn), 
        .Q(gray_w_ptr[2]) );
  DFFRQX2M gray_w_ptr_reg_1_ ( .D(comb_gray_w_ptr[1]), .CK(w_clk), .RN(w_rstn), 
        .Q(gray_w_ptr[1]) );
  DFFRQX2M gray_w_ptr_reg_0_ ( .D(comb_gray_w_ptr[0]), .CK(w_clk), .RN(w_rstn), 
        .Q(gray_w_ptr[0]) );
  DFFRX1M w_ptr_reg_0_ ( .D(n14), .CK(w_clk), .RN(w_rstn), .Q(w_addr[0]), .QN(
        n1) );
  DFFRQX2M w_ptr_reg_1_ ( .D(n13), .CK(w_clk), .RN(w_rstn), .Q(w_addr[1]) );
  DFFRQX2M gray_w_ptr_reg_3_ ( .D(comb_gray_w_ptr[3]), .CK(w_clk), .RN(w_rstn), 
        .Q(gray_w_ptr[3]) );
  XNOR2X2M U3 ( .A(comb_gray_w_ptr[1]), .B(sync_rd_ptr[1]), .Y(n7) );
  XNOR2X2M U4 ( .A(n1), .B(w_addr[1]), .Y(comb_gray_w_ptr[0]) );
  NOR2X2M U5 ( .A(n5), .B(n1), .Y(n4) );
  XNOR2X2M U6 ( .A(comb_gray_w_ptr[3]), .B(n2), .Y(n11) );
  NAND2BX2M U7 ( .AN(n3), .B(w_addr[2]), .Y(n2) );
  NAND4X2M U8 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n6) );
  CLKXOR2X2M U9 ( .A(sync_rd_ptr[3]), .B(comb_gray_w_ptr[3]), .Y(n10) );
  XNOR2X2M U10 ( .A(comb_gray_w_ptr[0]), .B(sync_rd_ptr[0]), .Y(n8) );
  CLKXOR2X2M U11 ( .A(sync_rd_ptr[2]), .B(comb_gray_w_ptr[2]), .Y(n9) );
  INVX2M U12 ( .A(n6), .Y(full) );
  NAND2X2M U13 ( .A(n4), .B(w_addr[1]), .Y(n3) );
  NAND2X2M U14 ( .A(w_inc), .B(n6), .Y(n5) );
  CLKXOR2X2M U15 ( .A(comb_gray_w_ptr[3]), .B(w_addr[2]), .Y(
        comb_gray_w_ptr[2]) );
  CLKXOR2X2M U16 ( .A(w_addr[1]), .B(w_addr[2]), .Y(comb_gray_w_ptr[1]) );
  XNOR2X2M U17 ( .A(w_addr[2]), .B(n3), .Y(n12) );
  CLKXOR2X2M U18 ( .A(w_addr[1]), .B(n4), .Y(n13) );
  CLKXOR2X2M U19 ( .A(n1), .B(n5), .Y(n14) );
endmodule


module fifo_rd ( r_clk, r_rstn, r_inc, sync_wr_ptr, rd_addr, empty, 
        gray_rd_ptr );
  input [3:0] sync_wr_ptr;
  output [2:0] rd_addr;
  output [3:0] gray_rd_ptr;
  input r_clk, r_rstn, r_inc;
  output empty;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [3:0] comb_gray_rd_ptr;

  DFFRQX2M rd_ptr_reg_3_ ( .D(n11), .CK(r_clk), .RN(r_rstn), .Q(
        comb_gray_rd_ptr[3]) );
  DFFRX1M rd_ptr_reg_0_ ( .D(n14), .CK(r_clk), .RN(r_rstn), .Q(rd_addr[0]), 
        .QN(n1) );
  DFFRQX2M rd_ptr_reg_2_ ( .D(n12), .CK(r_clk), .RN(r_rstn), .Q(rd_addr[2]) );
  DFFRQX2M rd_ptr_reg_1_ ( .D(n13), .CK(r_clk), .RN(r_rstn), .Q(rd_addr[1]) );
  DFFRQX2M gray_rd_ptr_reg_3_ ( .D(comb_gray_rd_ptr[3]), .CK(r_clk), .RN(
        r_rstn), .Q(gray_rd_ptr[3]) );
  DFFRQX2M gray_rd_ptr_reg_2_ ( .D(comb_gray_rd_ptr[2]), .CK(r_clk), .RN(
        r_rstn), .Q(gray_rd_ptr[2]) );
  DFFRQX2M gray_rd_ptr_reg_1_ ( .D(comb_gray_rd_ptr[1]), .CK(r_clk), .RN(
        r_rstn), .Q(gray_rd_ptr[1]) );
  DFFRQX2M gray_rd_ptr_reg_0_ ( .D(comb_gray_rd_ptr[0]), .CK(r_clk), .RN(
        r_rstn), .Q(gray_rd_ptr[0]) );
  INVX2M U3 ( .A(n6), .Y(empty) );
  XNOR2X2M U4 ( .A(comb_gray_rd_ptr[1]), .B(sync_wr_ptr[1]), .Y(n7) );
  XNOR2X2M U5 ( .A(n1), .B(rd_addr[1]), .Y(comb_gray_rd_ptr[0]) );
  NOR2X2M U6 ( .A(n5), .B(n1), .Y(n4) );
  XNOR2X2M U7 ( .A(rd_addr[2]), .B(n3), .Y(n12) );
  XNOR2X2M U8 ( .A(comb_gray_rd_ptr[3]), .B(n2), .Y(n11) );
  NAND2BX2M U9 ( .AN(n3), .B(rd_addr[2]), .Y(n2) );
  NAND4X2M U10 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n6) );
  XNOR2X2M U11 ( .A(comb_gray_rd_ptr[3]), .B(sync_wr_ptr[3]), .Y(n9) );
  XNOR2X2M U12 ( .A(comb_gray_rd_ptr[2]), .B(sync_wr_ptr[2]), .Y(n10) );
  XNOR2X2M U13 ( .A(comb_gray_rd_ptr[0]), .B(sync_wr_ptr[0]), .Y(n8) );
  NAND2X2M U14 ( .A(n4), .B(rd_addr[1]), .Y(n3) );
  NAND2X2M U15 ( .A(r_inc), .B(n6), .Y(n5) );
  CLKXOR2X2M U16 ( .A(rd_addr[1]), .B(rd_addr[2]), .Y(comb_gray_rd_ptr[1]) );
  CLKXOR2X2M U17 ( .A(comb_gray_rd_ptr[3]), .B(rd_addr[2]), .Y(
        comb_gray_rd_ptr[2]) );
  CLKXOR2X2M U18 ( .A(rd_addr[1]), .B(n4), .Y(n13) );
  CLKXOR2X2M U19 ( .A(n1), .B(n5), .Y(n14) );
endmodule


module DF_Sync_DATA_SIZE4_1 ( sync_clk, sync_rstn, unsync_ip, sync_op );
  input [3:0] unsync_ip;
  output [3:0] sync_op;
  input sync_clk, sync_rstn;

  wire   [3:0] meta_flop;

  DFFRQX2M sync_op_reg_1_ ( .D(meta_flop[1]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[1]) );
  DFFRQX2M sync_op_reg_0_ ( .D(meta_flop[0]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[0]) );
  DFFRQX2M sync_op_reg_2_ ( .D(meta_flop[2]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[2]) );
  DFFRQX2M sync_op_reg_3_ ( .D(meta_flop[3]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(sync_op[3]) );
  DFFRQX2M meta_flop_reg_3_ ( .D(unsync_ip[3]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(meta_flop[3]) );
  DFFRQX2M meta_flop_reg_2_ ( .D(unsync_ip[2]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(meta_flop[2]) );
  DFFRQX2M meta_flop_reg_1_ ( .D(unsync_ip[1]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(meta_flop[1]) );
  DFFRQX2M meta_flop_reg_0_ ( .D(unsync_ip[0]), .CK(sync_clk), .RN(sync_rstn), 
        .Q(meta_flop[0]) );
endmodule


module Async_fifo_D_SIZE8_P_SIZE4_F_DEPTH8 ( i_w_clk, i_w_rstn, i_w_inc, 
        i_r_clk, i_r_rstn, i_r_inc, i_w_data, o_r_data, o_full, o_empty );
  input [7:0] i_w_data;
  output [7:0] o_r_data;
  input i_w_clk, i_w_rstn, i_w_inc, i_r_clk, i_r_rstn, i_r_inc;
  output o_full, o_empty;
  wire   n1, n2;
  wire   [2:0] w_addr;
  wire   [2:0] r_addr;
  wire   [3:0] gray_w_ptr;
  wire   [3:0] w2r_ptr;
  wire   [3:0] r2w_ptr;
  wire   [3:0] gray_rd_ptr;

  fifo_mem_A_SIZE3_D_SIZE8_F_DEPTH8_P_SIZE4 u_fifo_mem ( .w_clk(i_w_clk), 
        .w_rstn(n1), .w_full(o_full), .w_inc(i_w_inc), .w_addr(w_addr), 
        .r_addr(r_addr), .w_data(i_w_data), .r_data(o_r_data) );
  DF_Sync_DATA_SIZE4_0 u_w2r_sync ( .sync_clk(i_r_clk), .sync_rstn(i_r_rstn), 
        .unsync_ip(gray_w_ptr), .sync_op(w2r_ptr) );
  fifo_wr u_fifo_wr ( .w_clk(i_w_clk), .w_rstn(n1), .w_inc(i_w_inc), 
        .sync_rd_ptr(r2w_ptr), .w_addr(w_addr), .gray_w_ptr(gray_w_ptr), 
        .full(o_full) );
  fifo_rd u_fifo_rd ( .r_clk(i_r_clk), .r_rstn(i_r_rstn), .r_inc(i_r_inc), 
        .sync_wr_ptr(w2r_ptr), .rd_addr(r_addr), .empty(o_empty), 
        .gray_rd_ptr(gray_rd_ptr) );
  DF_Sync_DATA_SIZE4_1 u_r2w_sync ( .sync_clk(i_w_clk), .sync_rstn(n1), 
        .unsync_ip(gray_rd_ptr), .sync_op(r2w_ptr) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(i_w_rstn), .Y(n2) );
endmodule


module PULSE_GEN ( clk, rst, lvl_sig, pulse_sig );
  input clk, rst, lvl_sig;
  output pulse_sig;
  wire   pls_flop, rcv_flop;

  DFFRQX2M rcv_flop_reg ( .D(lvl_sig), .CK(clk), .RN(rst), .Q(rcv_flop) );
  DFFRQX2M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst), .Q(pls_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
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
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_0 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;

  ClkDiv_0_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFRQX2M div_clk_reg ( .D(n18), .CK(i_ref_clk), .RN(i_rst), .Q(div_clk) );
  DFFSQX2M odd_edge_tog_reg ( .D(n17), .CK(i_ref_clk), .SN(i_rst), .Q(
        odd_edge_tog) );
  DFFRQX2M count_reg_5_ ( .D(n20), .CK(i_ref_clk), .RN(i_rst), .Q(count[5]) );
  DFFRQX2M count_reg_4_ ( .D(n21), .CK(i_ref_clk), .RN(i_rst), .Q(count[4]) );
  DFFRQX2M count_reg_3_ ( .D(n22), .CK(i_ref_clk), .RN(i_rst), .Q(count[3]) );
  DFFRQX2M count_reg_6_ ( .D(n19), .CK(i_ref_clk), .RN(i_rst), .Q(count[6]) );
  DFFRQX2M count_reg_0_ ( .D(n25), .CK(i_ref_clk), .RN(i_rst), .Q(count[0]) );
  DFFRQX2M count_reg_2_ ( .D(n23), .CK(i_ref_clk), .RN(i_rst), .Q(count[2]) );
  DFFRQX2M count_reg_1_ ( .D(n24), .CK(i_ref_clk), .RN(i_rst), .Q(count[1]) );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  OR2X2M U4 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  NAND2BX2M U5 ( .AN(n41), .B(i_clk_en), .Y(n7) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  CLKINVX1M U7 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n25) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n24) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n23) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n22) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n21) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n20) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n19) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(N2), .Y(n8) );
  CLKXOR2X2M U26 ( .A(div_clk), .B(n11), .Y(n18) );
  AOI21X1M U27 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U28 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U29 ( .A(odd_edge_tog), .B(n13), .Y(n17) );
  OR2X1M U30 ( .A(n10), .B(n7), .Y(n13) );
  CLKNAND2X2M U31 ( .A(n14), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U32 ( .A(n15), .B(n12), .S0(odd_edge_tog), .Y(n14) );
  NAND4X1M U33 ( .A(n16), .B(n26), .C(n27), .D(n28), .Y(n12) );
  NOR4X1M U34 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U35 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n32) );
  CLKXOR2X2M U36 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n31) );
  CLKXOR2X2M U37 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n29) );
  XNOR2X1M U39 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n27) );
  XNOR2X1M U40 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n26) );
  XNOR2X1M U41 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n16) );
  NAND4X1M U42 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n15) );
  NOR4X1M U43 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n36) );
  CLKXOR2X2M U44 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n40) );
  CLKXOR2X2M U45 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n39) );
  CLKXOR2X2M U46 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n37) );
  XNOR2X1M U48 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n35) );
  XNOR2X1M U49 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n34) );
  XNOR2X1M U50 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n33) );
  CLKINVX1M U51 ( .A(n7), .Y(N2) );
  NOR4BX1M U52 ( .AN(n42), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n41) );
  NOR4X1M U53 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n42) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  INVX2M U3 ( .A(1'b1), .Y(OUT[7]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[4]) );
  NAND4BX1M U11 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n16), .Y(n6) );
  NAND4BX1M U12 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n16), .Y(n7) );
  INVX2M U13 ( .A(IN[2]), .Y(n15) );
  NOR4X1M U14 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U15 ( .A(n17), .B(n14), .C(IN[2]), .Y(n5) );
  OAI211X2M U16 ( .A0(n8), .A1(n9), .B0(n17), .C0(n14), .Y(OUT[0]) );
  NAND2X2M U17 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U18 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  INVX2M U19 ( .A(IN[1]), .Y(n14) );
  INVX2M U20 ( .A(IN[5]), .Y(n16) );
  NOR3X2M U21 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR3X2M U22 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  INVX2M U23 ( .A(IN[0]), .Y(n17) );
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
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_1 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;

  ClkDiv_1_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFRQX2M div_clk_reg ( .D(n50), .CK(i_ref_clk), .RN(i_rst), .Q(div_clk) );
  DFFSQX2M odd_edge_tog_reg ( .D(n51), .CK(i_ref_clk), .SN(i_rst), .Q(
        odd_edge_tog) );
  DFFRQX2M count_reg_5_ ( .D(n48), .CK(i_ref_clk), .RN(i_rst), .Q(count[5]) );
  DFFRQX2M count_reg_4_ ( .D(n47), .CK(i_ref_clk), .RN(i_rst), .Q(count[4]) );
  DFFRQX2M count_reg_3_ ( .D(n46), .CK(i_ref_clk), .RN(i_rst), .Q(count[3]) );
  DFFRQX2M count_reg_6_ ( .D(n49), .CK(i_ref_clk), .RN(i_rst), .Q(count[6]) );
  DFFRQX2M count_reg_0_ ( .D(n43), .CK(i_ref_clk), .RN(i_rst), .Q(count[0]) );
  DFFRQX2M count_reg_2_ ( .D(n45), .CK(i_ref_clk), .RN(i_rst), .Q(count[2]) );
  DFFRQX2M count_reg_1_ ( .D(n44), .CK(i_ref_clk), .RN(i_rst), .Q(count[1]) );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  OR2X2M U4 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  NAND2BX2M U5 ( .AN(n41), .B(i_clk_en), .Y(n7) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  CLKINVX1M U7 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n43) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n44) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n45) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n46) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n47) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n48) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n49) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(N2), .Y(n8) );
  CLKXOR2X2M U26 ( .A(div_clk), .B(n11), .Y(n50) );
  AOI21X1M U27 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U28 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U29 ( .A(odd_edge_tog), .B(n13), .Y(n51) );
  OR2X1M U30 ( .A(n10), .B(n7), .Y(n13) );
  CLKNAND2X2M U31 ( .A(n14), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U32 ( .A(n15), .B(n12), .S0(odd_edge_tog), .Y(n14) );
  NAND4X1M U33 ( .A(n16), .B(n26), .C(n27), .D(n28), .Y(n12) );
  NOR4X1M U34 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U35 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n32) );
  CLKXOR2X2M U36 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n31) );
  CLKXOR2X2M U37 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n29) );
  XNOR2X1M U39 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n27) );
  XNOR2X1M U40 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n26) );
  XNOR2X1M U41 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n16) );
  NAND4X1M U42 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n15) );
  NOR4X1M U43 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n36) );
  CLKXOR2X2M U44 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n40) );
  CLKXOR2X2M U45 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n39) );
  CLKXOR2X2M U46 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n37) );
  XNOR2X1M U48 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n35) );
  XNOR2X1M U49 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n34) );
  XNOR2X1M U50 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n33) );
  CLKINVX1M U51 ( .A(n7), .Y(N2) );
  NOR4BX1M U52 ( .AN(n42), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n41) );
  NOR4X1M U53 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n42) );
endmodule


module sz ( p_data, ser_data, ser_done, ser_en, clk, rst_n );
  input [7:0] p_data;
  input ser_en, clk, rst_n;
  output ser_data, ser_done;
  wire   N1, N2, N3, N6, n2, n4, n6, n7, n8, n9, n10, n11, n1, n3, n5, n12,
         n13, n14, n15, n16, n17, n18;

  DFFRQX2M ser_data_reg ( .D(n8), .CK(clk), .RN(rst_n), .Q(ser_data) );
  DFFRQX2M counter_reg_2_ ( .D(n9), .CK(clk), .RN(rst_n), .Q(N3) );
  DFFRQX2M counter_reg_1_ ( .D(n10), .CK(clk), .RN(rst_n), .Q(N2) );
  DFFRQX2M ser_done_reg ( .D(n7), .CK(clk), .RN(rst_n), .Q(ser_done) );
  DFFRQX2M counter_reg_0_ ( .D(n11), .CK(clk), .RN(rst_n), .Q(N1) );
  INVX2M U3 ( .A(ser_en), .Y(n17) );
  CLKXOR2X2M U4 ( .A(n15), .B(n2), .Y(n10) );
  NAND2X2M U5 ( .A(ser_en), .B(N1), .Y(n2) );
  OAI31X1M U6 ( .A0(n18), .A1(n2), .A2(n15), .B0(n4), .Y(n7) );
  INVX2M U7 ( .A(N3), .Y(n18) );
  NAND2X2M U8 ( .A(ser_done), .B(n17), .Y(n4) );
  CLKXOR2X2M U9 ( .A(N3), .B(n6), .Y(n9) );
  NOR2X2M U10 ( .A(n2), .B(n15), .Y(n6) );
  CLKXOR2X2M U11 ( .A(ser_en), .B(N1), .Y(n11) );
  AO22X1M U12 ( .A0(ser_data), .A1(n17), .B0(N6), .B1(ser_en), .Y(n8) );
  INVX2M U13 ( .A(N1), .Y(n16) );
  INVX2M U14 ( .A(N2), .Y(n15) );
  AOI22X1M U15 ( .A0(p_data[2]), .A1(n16), .B0(p_data[3]), .B1(N1), .Y(n3) );
  AOI22X1M U16 ( .A0(p_data[0]), .A1(n16), .B0(p_data[1]), .B1(N1), .Y(n1) );
  OA22X1M U17 ( .A0(n15), .A1(n3), .B0(N2), .B1(n1), .Y(n14) );
  AOI22X1M U18 ( .A0(p_data[6]), .A1(n16), .B0(p_data[7]), .B1(N1), .Y(n12) );
  AOI22X1M U19 ( .A0(p_data[4]), .A1(n16), .B0(p_data[5]), .B1(N1), .Y(n5) );
  OAI22X1M U20 ( .A0(n12), .A1(n15), .B0(N2), .B1(n5), .Y(n13) );
  OAI2BB2X1M U21 ( .B0(n14), .B1(N3), .A0N(N3), .A1N(n13), .Y(N6) );
endmodule


module FSM ( mux_sel, data_valid, parity_en, ser_en, ser_done, clk, rst_n, 
        busy );
  output [1:0] mux_sel;
  input data_valid, parity_en, ser_done, clk, rst_n;
  output ser_en, busy;
  wire   n6, n7, n8, n9, n10, n1, n2, n3, n4, n5;
  wire   [2:0] cs;
  wire   [2:0] ns;

  DFFRQX2M cs_reg_2_ ( .D(ns[2]), .CK(clk), .RN(rst_n), .Q(cs[2]) );
  DFFRQX2M cs_reg_0_ ( .D(ns[0]), .CK(clk), .RN(rst_n), .Q(cs[0]) );
  DFFRQX2M cs_reg_1_ ( .D(n1), .CK(clk), .RN(rst_n), .Q(cs[1]) );
  OAI32X1M U3 ( .A0(n2), .A1(cs[2]), .A2(cs[1]), .B0(ser_done), .B1(n6), .Y(
        ser_en) );
  NAND2X2M U4 ( .A(n6), .B(n7), .Y(mux_sel[1]) );
  AO21XLM U5 ( .A0(n4), .A1(n9), .B0(mux_sel[1]), .Y(busy) );
  XNOR2X2M U6 ( .A(cs[2]), .B(n2), .Y(n9) );
  NOR3X2M U7 ( .A(n9), .B(cs[0]), .C(n10), .Y(ns[0]) );
  AOI32X1M U8 ( .A0(ser_done), .A1(cs[1]), .A2(parity_en), .B0(data_valid), 
        .B1(n4), .Y(n10) );
  NAND3X2M U9 ( .A(cs[0]), .B(n3), .C(cs[1]), .Y(n7) );
  NAND3X2M U10 ( .A(n2), .B(n3), .C(cs[1]), .Y(n6) );
  INVX2M U11 ( .A(cs[0]), .Y(n2) );
  INVX2M U12 ( .A(cs[2]), .Y(n3) );
  INVX2M U13 ( .A(cs[1]), .Y(n4) );
  INVX2M U14 ( .A(n8), .Y(n1) );
  AOI2B1X1M U15 ( .A1N(n6), .A0(parity_en), .B0(ser_en), .Y(n8) );
  OAI211X2M U16 ( .A0(cs[1]), .A1(cs[0]), .B0(n7), .C0(n3), .Y(mux_sel[0]) );
  OAI31X1M U17 ( .A0(n5), .A1(parity_en), .A2(n6), .B0(n7), .Y(ns[2]) );
  INVX2M U18 ( .A(ser_done), .Y(n5) );
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


module mux ( mux_sel, start_bit, stop_bit, ser_data, parity_bit, tx_out, clk, 
        rst_n );
  input [1:0] mux_sel;
  input start_bit, stop_bit, ser_data, parity_bit, clk, rst_n;
  output tx_out;
  wire   tx_out_int, n2, n3, n1;

  DFFSQX2M tx_out_reg ( .D(tx_out_int), .CK(clk), .SN(rst_n), .Q(tx_out) );
  OAI2B2X1M U3 ( .A1N(mux_sel[1]), .A0(n2), .B0(mux_sel[1]), .B1(n3), .Y(
        tx_out_int) );
  AOI22X1M U4 ( .A0(start_bit), .A1(n1), .B0(stop_bit), .B1(mux_sel[0]), .Y(n3) );
  AOI22X1M U5 ( .A0(ser_data), .A1(n1), .B0(parity_bit), .B1(mux_sel[0]), .Y(
        n2) );
  INVX2M U6 ( .A(mux_sel[0]), .Y(n1) );
endmodule


module uart_top_DATA_WIDTH8 ( p_data, data_valid, parity_type, parity_en, clk, 
        rst_n, tx_out, busy );
  input [7:0] p_data;
  input data_valid, parity_type, parity_en, clk, rst_n;
  output tx_out, busy;
  wire   ser_data, ser_done, ser_en, parity_bit, n1, n3, n4, n5, n6, n7, n8,
         n9, n10, n2;
  wire   [7:0] data_reg;
  wire   [1:0] mux_sel;

  sz m1 ( .p_data(data_reg), .ser_data(ser_data), .ser_done(ser_done), 
        .ser_en(ser_en), .clk(clk), .rst_n(rst_n) );
  FSM m2 ( .mux_sel(mux_sel), .data_valid(data_valid), .parity_en(parity_en), 
        .ser_en(ser_en), .ser_done(ser_done), .clk(clk), .rst_n(rst_n), .busy(
        busy) );
  parity m3 ( .p_data(data_reg), .parity_type(parity_type), .data_valid(
        data_valid), .parity_bit(parity_bit) );
  mux m4 ( .mux_sel(mux_sel), .start_bit(1'b0), .stop_bit(1'b1), .ser_data(
        ser_data), .parity_bit(parity_bit), .tx_out(tx_out), .clk(clk), 
        .rst_n(rst_n) );
  DFFRQX2M data_reg_reg_5_ ( .D(n7), .CK(clk), .RN(rst_n), .Q(data_reg[5]) );
  DFFRQX2M data_reg_reg_1_ ( .D(n3), .CK(clk), .RN(rst_n), .Q(data_reg[1]) );
  DFFRQX2M data_reg_reg_0_ ( .D(n10), .CK(clk), .RN(rst_n), .Q(data_reg[0]) );
  DFFRQX2M data_reg_reg_4_ ( .D(n6), .CK(clk), .RN(rst_n), .Q(data_reg[4]) );
  DFFRQX2M data_reg_reg_7_ ( .D(n9), .CK(clk), .RN(rst_n), .Q(data_reg[7]) );
  DFFRQX2M data_reg_reg_3_ ( .D(n5), .CK(clk), .RN(rst_n), .Q(data_reg[3]) );
  DFFRQX2M data_reg_reg_6_ ( .D(n8), .CK(clk), .RN(rst_n), .Q(data_reg[6]) );
  DFFRQX2M data_reg_reg_2_ ( .D(n4), .CK(clk), .RN(rst_n), .Q(data_reg[2]) );
  INVX2M U3 ( .A(n1), .Y(n2) );
  NAND2BX2M U4 ( .AN(busy), .B(data_valid), .Y(n1) );
  AO22X1M U5 ( .A0(data_reg[1]), .A1(n1), .B0(p_data[1]), .B1(n2), .Y(n3) );
  AO22X1M U6 ( .A0(data_reg[2]), .A1(n1), .B0(p_data[2]), .B1(n2), .Y(n4) );
  AO22X1M U7 ( .A0(data_reg[3]), .A1(n1), .B0(p_data[3]), .B1(n2), .Y(n5) );
  AO22X1M U8 ( .A0(data_reg[4]), .A1(n1), .B0(p_data[4]), .B1(n2), .Y(n6) );
  AO22X1M U9 ( .A0(data_reg[5]), .A1(n1), .B0(p_data[5]), .B1(n2), .Y(n7) );
  AO22X1M U10 ( .A0(data_reg[6]), .A1(n1), .B0(p_data[6]), .B1(n2), .Y(n8) );
  AO22X1M U11 ( .A0(data_reg[7]), .A1(n1), .B0(p_data[7]), .B1(n2), .Y(n9) );
  AO22X1M U12 ( .A0(data_reg[0]), .A1(n1), .B0(p_data[0]), .B1(n2), .Y(n10) );
endmodule


module fsm ( clk, rst_n, rx_in, edge_cnt, bit_cnt, par_en, par_err, 
        strt_glitch, stp_error, enable, data_valid, deser_en, stp_chk_en, 
        strt_chk_en, par_chk_en, dat_samp_en, prescale );
  input [4:0] edge_cnt;
  input [3:0] bit_cnt;
  input [5:0] prescale;
  input clk, rst_n, rx_in, par_en, par_err, strt_glitch, stp_error;
  output enable, data_valid, deser_en, stp_chk_en, strt_chk_en, par_chk_en,
         dat_samp_en;
  wire   N34, N35, N36, N37, N38, N39, N40, N41, N48, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72;
  wire   [2:0] cs;
  wire   [2:0] ns;

  DFFRQX2M cs_reg_1_ ( .D(ns[1]), .CK(clk), .RN(rst_n), .Q(cs[1]) );
  DFFRQX2M cs_reg_0_ ( .D(ns[0]), .CK(clk), .RN(rst_n), .Q(cs[0]) );
  DFFRQX2M cs_reg_2_ ( .D(ns[2]), .CK(clk), .RN(rst_n), .Q(cs[2]) );
  NOR4BX1M U3 ( .AN(n58), .B(cs[2]), .C(cs[0]), .D(cs[1]), .Y(n53) );
  NOR3X2M U4 ( .A(cs[1]), .B(cs[2]), .C(n68), .Y(n26) );
  INVX2M U5 ( .A(n52), .Y(n62) );
  NAND2X2M U6 ( .A(n23), .B(n33), .Y(ns[2]) );
  NAND4X2M U7 ( .A(n69), .B(n59), .C(n46), .D(n47), .Y(enable) );
  OAI211X2M U8 ( .A0(n51), .A1(n49), .B0(n72), .C0(n66), .Y(n46) );
  AND4X2M U9 ( .A(n22), .B(n33), .C(n36), .D(n39), .Y(n47) );
  INVX2M U10 ( .A(rx_in), .Y(n72) );
  INVX2M U11 ( .A(n44), .Y(n21) );
  OAI31X1M U12 ( .A0(n28), .A1(rx_in), .A2(n45), .B0(n22), .Y(n44) );
  INVX2M U13 ( .A(n53), .Y(n22) );
  NAND2X2M U14 ( .A(n21), .B(n24), .Y(strt_chk_en) );
  OAI21X2M U15 ( .A0(n25), .A1(n60), .B0(n26), .Y(n24) );
  OAI211X2M U16 ( .A0(N41), .A1(n39), .B0(n21), .C0(n42), .Y(ns[0]) );
  NOR2BX2M U17 ( .AN(n41), .B(n29), .Y(n42) );
  NAND4X2M U18 ( .A(n67), .B(n69), .C(n57), .D(n28), .Y(dat_samp_en) );
  NOR2X2M U19 ( .A(n53), .B(n26), .Y(n57) );
  INVX2M U20 ( .A(N41), .Y(n60) );
  AOI22X1M U21 ( .A0(n49), .A1(n61), .B0(n51), .B1(n52), .Y(n45) );
  INVX2M U22 ( .A(n50), .Y(n61) );
  NOR3X2M U23 ( .A(n37), .B(n71), .C(n69), .Y(n29) );
  NOR2BX2M U24 ( .AN(n54), .B(n31), .Y(n52) );
  INVX2M U25 ( .A(n38), .Y(n69) );
  NAND3X2M U26 ( .A(n51), .B(n62), .C(n66), .Y(n33) );
  NAND2BX2M U27 ( .AN(n25), .B(n26), .Y(n39) );
  INVX2M U28 ( .A(n32), .Y(n67) );
  NAND3X2M U29 ( .A(n49), .B(n50), .C(n66), .Y(n36) );
  INVX2M U30 ( .A(n28), .Y(n66) );
  INVX2M U31 ( .A(n34), .Y(n23) );
  OAI211X2M U32 ( .A0(n31), .A1(n59), .B0(n35), .C0(n36), .Y(n34) );
  NAND3BX2M U33 ( .AN(n37), .B(n71), .C(n38), .Y(n35) );
  INVX2M U34 ( .A(n43), .Y(n59) );
  NAND2X2M U35 ( .A(n43), .B(n31), .Y(n41) );
  NOR2X2M U36 ( .A(n45), .B(n28), .Y(data_valid) );
  NOR2X2M U37 ( .A(stp_error), .B(rx_in), .Y(n58) );
  NOR3X2M U38 ( .A(cs[0]), .B(cs[2]), .C(n70), .Y(n38) );
  NOR3X2M U39 ( .A(n68), .B(cs[2]), .C(n70), .Y(n32) );
  NOR3X2M U40 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .C(n56), .Y(n54) );
  OR3X2M U41 ( .A(edge_cnt[4]), .B(edge_cnt[3]), .C(edge_cnt[2]), .Y(n56) );
  NAND4X2M U42 ( .A(bit_cnt[3]), .B(bit_cnt[1]), .C(n63), .D(n65), .Y(n31) );
  OAI21X2M U43 ( .A0(n27), .A1(n28), .B0(n23), .Y(stp_chk_en) );
  AOI21X2M U44 ( .A0(n62), .A1(n71), .B0(stp_error), .Y(n27) );
  NAND4X2M U45 ( .A(bit_cnt[0]), .B(bit_cnt[3]), .C(n64), .D(n65), .Y(n37) );
  NOR2X2M U46 ( .A(n67), .B(par_err), .Y(n43) );
  NAND3X2M U47 ( .A(n68), .B(n70), .C(cs[2]), .Y(n28) );
  NOR2X2M U48 ( .A(par_en), .B(stp_error), .Y(n51) );
  NOR2X2M U49 ( .A(n71), .B(stp_error), .Y(n49) );
  OAI211X2M U50 ( .A0(n60), .A1(n39), .B0(n40), .C0(n41), .Y(ns[1]) );
  OAI21X2M U51 ( .A0(par_en), .A1(n37), .B0(n38), .Y(n40) );
  NAND3X2M U52 ( .A(bit_cnt[0]), .B(n54), .C(n55), .Y(n50) );
  NOR3BX2M U53 ( .AN(bit_cnt[3]), .B(bit_cnt[2]), .C(n64), .Y(n55) );
  NAND2BX2M U54 ( .AN(n29), .B(n30), .Y(par_chk_en) );
  OAI21X2M U55 ( .A0(par_err), .A1(n31), .B0(n32), .Y(n30) );
  INVX2M U56 ( .A(bit_cnt[1]), .Y(n64) );
  NAND4X2M U57 ( .A(n63), .B(n64), .C(n48), .D(n65), .Y(n25) );
  NOR2X2M U58 ( .A(strt_glitch), .B(bit_cnt[3]), .Y(n48) );
  INVX2M U59 ( .A(bit_cnt[0]), .Y(n63) );
  INVX2M U60 ( .A(bit_cnt[2]), .Y(n65) );
  INVX2M U61 ( .A(cs[1]), .Y(n70) );
  INVX2M U62 ( .A(cs[0]), .Y(n68) );
  AND3X2M U63 ( .A(N48), .B(n37), .C(n38), .Y(deser_en) );
  INVX2M U64 ( .A(par_en), .Y(n71) );
  OR2X2M U65 ( .A(prescale[1]), .B(prescale[0]), .Y(n1) );
  CLKINVX1M U66 ( .A(prescale[0]), .Y(N34) );
  OAI2BB1X1M U67 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n1), .Y(N35) );
  OR2X1M U68 ( .A(n1), .B(prescale[2]), .Y(n2) );
  OAI2BB1X1M U69 ( .A0N(n1), .A1N(prescale[2]), .B0(n2), .Y(N36) );
  OR2X1M U70 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OAI2BB1X1M U71 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N37) );
  OR2X1M U72 ( .A(n3), .B(prescale[4]), .Y(n4) );
  OAI2BB1X1M U73 ( .A0N(n3), .A1N(prescale[4]), .B0(n4), .Y(N38) );
  NOR2X1M U74 ( .A(n4), .B(prescale[5]), .Y(N40) );
  AO21XLM U75 ( .A0(n4), .A1(prescale[5]), .B0(N40), .Y(N39) );
  NOR2BX1M U76 ( .AN(edge_cnt[0]), .B(N34), .Y(n5) );
  OAI2B2X1M U77 ( .A1N(N35), .A0(n5), .B0(edge_cnt[1]), .B1(n5), .Y(n8) );
  NOR2BX1M U78 ( .AN(N34), .B(edge_cnt[0]), .Y(n6) );
  OAI2B2X1M U79 ( .A1N(edge_cnt[1]), .A0(n6), .B0(N35), .B1(n6), .Y(n7) );
  NAND4BBX1M U80 ( .AN(N40), .BN(N39), .C(n8), .D(n7), .Y(n12) );
  CLKXOR2X2M U81 ( .A(N38), .B(edge_cnt[4]), .Y(n11) );
  CLKXOR2X2M U82 ( .A(N36), .B(edge_cnt[2]), .Y(n10) );
  CLKXOR2X2M U83 ( .A(N37), .B(edge_cnt[3]), .Y(n9) );
  NOR4X1M U84 ( .A(n12), .B(n11), .C(n10), .D(n9), .Y(N41) );
  CLKXOR2X2M U85 ( .A(prescale[3]), .B(edge_cnt[2]), .Y(n20) );
  NOR2BX1M U86 ( .AN(prescale[1]), .B(edge_cnt[0]), .Y(n13) );
  OAI2B2X1M U87 ( .A1N(edge_cnt[1]), .A0(n13), .B0(prescale[2]), .B1(n13), .Y(
        n16) );
  NOR2BX1M U88 ( .AN(edge_cnt[0]), .B(prescale[1]), .Y(n14) );
  OAI2B2X1M U89 ( .A1N(prescale[2]), .A0(n14), .B0(edge_cnt[1]), .B1(n14), .Y(
        n15) );
  CLKNAND2X2M U90 ( .A(n16), .B(n15), .Y(n19) );
  CLKXOR2X2M U91 ( .A(prescale[4]), .B(edge_cnt[3]), .Y(n18) );
  CLKXOR2X2M U92 ( .A(prescale[5]), .B(edge_cnt[4]), .Y(n17) );
  NOR4X1M U93 ( .A(n20), .B(n19), .C(n18), .D(n17), .Y(N48) );
endmodule


module edge_counter ( clk, rst_n, edge_cnt, bit_cnt, enable, par_en, prescale
 );
  output [4:0] edge_cnt;
  output [3:0] bit_cnt;
  input [5:0] prescale;
  input clk, rst_n, enable, par_en;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N21, N22, N23, N35, N36, N37,
         N38, N39, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n1, n2, n3, n4, n5, n6, n7, n8, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33;
  wire   [4:2] add_21_carry;

  DFFRQX2M bit_cnt_reg_2_ ( .D(n20), .CK(clk), .RN(rst_n), .Q(bit_cnt[2]) );
  DFFRQX2M bit_cnt_reg_3_ ( .D(n23), .CK(clk), .RN(rst_n), .Q(bit_cnt[3]) );
  DFFRQX2M bit_cnt_reg_1_ ( .D(n21), .CK(clk), .RN(rst_n), .Q(bit_cnt[1]) );
  DFFRQX2M edge_cnt_reg_0_ ( .D(N35), .CK(clk), .RN(rst_n), .Q(edge_cnt[0]) );
  DFFRQX2M edge_cnt_reg_4_ ( .D(N39), .CK(clk), .RN(rst_n), .Q(edge_cnt[4]) );
  DFFRQX2M edge_cnt_reg_3_ ( .D(N38), .CK(clk), .RN(rst_n), .Q(edge_cnt[3]) );
  DFFRQX2M edge_cnt_reg_2_ ( .D(N37), .CK(clk), .RN(rst_n), .Q(edge_cnt[2]) );
  DFFRQX2M edge_cnt_reg_1_ ( .D(N36), .CK(clk), .RN(rst_n), .Q(edge_cnt[1]) );
  DFFRQX2M bit_cnt_reg_0_ ( .D(n22), .CK(clk), .RN(rst_n), .Q(bit_cnt[0]) );
  INVX2M U3 ( .A(n15), .Y(n31) );
  NOR2X2M U4 ( .A(n14), .B(N14), .Y(n15) );
  INVX2M U5 ( .A(n14), .Y(n30) );
  NOR2BX2M U6 ( .AN(N21), .B(n31), .Y(N36) );
  NOR2BX2M U7 ( .AN(N22), .B(n31), .Y(N37) );
  NOR2BX2M U8 ( .AN(N23), .B(n31), .Y(N38) );
  NOR2BX2M U9 ( .AN(n2), .B(n31), .Y(N35) );
  OAI21X2M U10 ( .A0(bit_cnt[0]), .A1(n14), .B0(n31), .Y(n13) );
  NAND2X2M U11 ( .A(enable), .B(n18), .Y(n14) );
  NAND4BX1M U12 ( .AN(bit_cnt[2]), .B(n19), .C(bit_cnt[1]), .D(bit_cnt[3]), 
        .Y(n18) );
  CLKXOR2X2M U13 ( .A(par_en), .B(n32), .Y(n19) );
  NAND3X2M U14 ( .A(bit_cnt[0]), .B(n31), .C(n30), .Y(n12) );
  OAI2BB2X1M U15 ( .B0(bit_cnt[1]), .B1(n12), .A0N(n13), .A1N(bit_cnt[1]), .Y(
        n21) );
  OAI32X1M U16 ( .A0(n16), .A1(bit_cnt[3]), .A2(n12), .B0(n17), .B1(n33), .Y(
        n23) );
  INVX2M U17 ( .A(bit_cnt[3]), .Y(n33) );
  AOI21X2M U18 ( .A0(n30), .A1(n16), .B0(n13), .Y(n17) );
  NAND2X2M U19 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .Y(n16) );
  OAI32X1M U20 ( .A0(n14), .A1(bit_cnt[0]), .A2(n15), .B0(n32), .B1(n31), .Y(
        n22) );
  NOR2X2M U21 ( .A(n1), .B(n31), .Y(N39) );
  XNOR2X2M U22 ( .A(add_21_carry[4]), .B(edge_cnt[4]), .Y(n1) );
  NOR2BX2M U23 ( .AN(enable), .B(n9), .Y(n20) );
  AOI21X2M U24 ( .A0(bit_cnt[2]), .A1(n10), .B0(n11), .Y(n9) );
  AOI211X2M U25 ( .A0(par_en), .A1(bit_cnt[3]), .B0(n10), .C0(bit_cnt[2]), .Y(
        n11) );
  NAND3X2M U26 ( .A(bit_cnt[1]), .B(bit_cnt[0]), .C(N14), .Y(n10) );
  INVX2M U27 ( .A(edge_cnt[0]), .Y(n2) );
  INVX2M U28 ( .A(bit_cnt[0]), .Y(n32) );
  ADDHX1M U29 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(add_21_carry[2]), .S(N21) );
  ADDHX1M U30 ( .A(edge_cnt[2]), .B(add_21_carry[2]), .CO(add_21_carry[3]), 
        .S(N22) );
  ADDHX1M U31 ( .A(edge_cnt[3]), .B(add_21_carry[3]), .CO(add_21_carry[4]), 
        .S(N23) );
  OR2X2M U32 ( .A(prescale[1]), .B(prescale[0]), .Y(n3) );
  CLKINVX1M U33 ( .A(prescale[0]), .Y(N7) );
  OAI2BB1X1M U34 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n3), .Y(N8) );
  OR2X1M U35 ( .A(n3), .B(prescale[2]), .Y(n4) );
  OAI2BB1X1M U36 ( .A0N(n3), .A1N(prescale[2]), .B0(n4), .Y(N9) );
  OR2X1M U37 ( .A(n4), .B(prescale[3]), .Y(n5) );
  OAI2BB1X1M U38 ( .A0N(n4), .A1N(prescale[3]), .B0(n5), .Y(N10) );
  OR2X1M U39 ( .A(n5), .B(prescale[4]), .Y(n6) );
  OAI2BB1X1M U40 ( .A0N(n5), .A1N(prescale[4]), .B0(n6), .Y(N11) );
  NOR2X1M U41 ( .A(n6), .B(prescale[5]), .Y(N13) );
  AO21XLM U42 ( .A0(n6), .A1(prescale[5]), .B0(N13), .Y(N12) );
  NOR2BX1M U43 ( .AN(edge_cnt[0]), .B(N7), .Y(n7) );
  OAI2B2X1M U44 ( .A1N(N8), .A0(n7), .B0(edge_cnt[1]), .B1(n7), .Y(n25) );
  NOR2BX1M U45 ( .AN(N7), .B(edge_cnt[0]), .Y(n8) );
  OAI2B2X1M U46 ( .A1N(edge_cnt[1]), .A0(n8), .B0(N8), .B1(n8), .Y(n24) );
  NAND4BBX1M U47 ( .AN(N13), .BN(N12), .C(n25), .D(n24), .Y(n29) );
  CLKXOR2X2M U48 ( .A(N11), .B(edge_cnt[4]), .Y(n28) );
  CLKXOR2X2M U49 ( .A(N9), .B(edge_cnt[2]), .Y(n27) );
  CLKXOR2X2M U50 ( .A(N10), .B(edge_cnt[3]), .Y(n26) );
  NOR4X1M U51 ( .A(n29), .B(n28), .C(n27), .D(n26), .Y(N14) );
endmodule


module sample ( clk, rst_n, dat_samp_en, prescale, edge_cnt, rx_in, 
        sampled_bit );
  input [5:0] prescale;
  input [4:0] edge_cnt;
  input clk, rst_n, dat_samp_en, rx_in;
  output sampled_bit;
  wire   N1, N4, N5, N6, N8, N10, N11, N12, N13, N14, N15, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32;
  wire   [4:3] sub_13_carry;

  DFFSQX2M sampled_bit_reg ( .D(n2), .CK(clk), .SN(rst_n), .Q(sampled_bit) );
  NOR2X2M U3 ( .A(prescale[5]), .B(sub_13_carry[4]), .Y(n3) );
  INVX2M U4 ( .A(prescale[1]), .Y(n4) );
  INVX2M U5 ( .A(prescale[2]), .Y(n5) );
  AO2B2X2M U6 ( .B0(sampled_bit), .B1(n1), .A0(rx_in), .A1N(n1), .Y(n2) );
  OAI31X1M U7 ( .A0(N1), .A1(N8), .A2(N15), .B0(dat_samp_en), .Y(n1) );
  XNOR2X1M U8 ( .A(sub_13_carry[4]), .B(prescale[5]), .Y(N6) );
  OR2X1M U9 ( .A(prescale[4]), .B(sub_13_carry[3]), .Y(sub_13_carry[4]) );
  XNOR2X1M U10 ( .A(sub_13_carry[3]), .B(prescale[4]), .Y(N5) );
  OR2X1M U11 ( .A(prescale[3]), .B(prescale[2]), .Y(sub_13_carry[3]) );
  XNOR2X1M U12 ( .A(prescale[2]), .B(prescale[3]), .Y(N4) );
  NAND2BX1M U13 ( .AN(prescale[2]), .B(n4), .Y(n6) );
  OAI2BB1X1M U14 ( .A0N(prescale[1]), .A1N(prescale[2]), .B0(n6), .Y(N10) );
  OR2X1M U15 ( .A(n6), .B(prescale[3]), .Y(n7) );
  OAI2BB1X1M U16 ( .A0N(n6), .A1N(prescale[3]), .B0(n7), .Y(N11) );
  XNOR2X1M U17 ( .A(prescale[4]), .B(n7), .Y(N12) );
  NOR3X1M U18 ( .A(prescale[4]), .B(prescale[5]), .C(n7), .Y(N14) );
  OAI21X1M U19 ( .A0(prescale[4]), .A1(n7), .B0(prescale[5]), .Y(n8) );
  NAND2BX1M U20 ( .AN(N14), .B(n8), .Y(N13) );
  CLKXOR2X2M U21 ( .A(prescale[3]), .B(edge_cnt[2]), .Y(n16) );
  NOR2BX1M U22 ( .AN(prescale[1]), .B(edge_cnt[0]), .Y(n9) );
  OAI2B2X1M U23 ( .A1N(edge_cnt[1]), .A0(n9), .B0(prescale[2]), .B1(n9), .Y(
        n12) );
  NOR2BX1M U24 ( .AN(edge_cnt[0]), .B(prescale[1]), .Y(n10) );
  OAI2B2X1M U25 ( .A1N(prescale[2]), .A0(n10), .B0(edge_cnt[1]), .B1(n10), .Y(
        n11) );
  CLKNAND2X2M U26 ( .A(n12), .B(n11), .Y(n15) );
  CLKXOR2X2M U27 ( .A(prescale[4]), .B(edge_cnt[3]), .Y(n14) );
  CLKXOR2X2M U28 ( .A(prescale[5]), .B(edge_cnt[4]), .Y(n13) );
  NOR4X1M U29 ( .A(n16), .B(n15), .C(n14), .D(n13), .Y(N1) );
  NOR2BX1M U30 ( .AN(prescale[1]), .B(edge_cnt[0]), .Y(n17) );
  OAI2B2X1M U31 ( .A1N(edge_cnt[1]), .A0(n17), .B0(n5), .B1(n17), .Y(n20) );
  NOR2BX1M U32 ( .AN(edge_cnt[0]), .B(prescale[1]), .Y(n18) );
  OAI2B2X1M U33 ( .A1N(n5), .A0(n18), .B0(edge_cnt[1]), .B1(n18), .Y(n19) );
  NAND3BX1M U34 ( .AN(n3), .B(n20), .C(n19), .Y(n24) );
  CLKXOR2X2M U35 ( .A(N6), .B(edge_cnt[4]), .Y(n23) );
  CLKXOR2X2M U36 ( .A(N4), .B(edge_cnt[2]), .Y(n22) );
  CLKXOR2X2M U37 ( .A(N5), .B(edge_cnt[3]), .Y(n21) );
  NOR4X1M U38 ( .A(n24), .B(n23), .C(n22), .D(n21), .Y(N8) );
  NOR2BX1M U39 ( .AN(n4), .B(edge_cnt[0]), .Y(n25) );
  OAI2B2X1M U40 ( .A1N(edge_cnt[1]), .A0(n25), .B0(N10), .B1(n25), .Y(n28) );
  NOR2BX1M U41 ( .AN(edge_cnt[0]), .B(n4), .Y(n26) );
  OAI2B2X1M U42 ( .A1N(N10), .A0(n26), .B0(edge_cnt[1]), .B1(n26), .Y(n27) );
  NAND3BX1M U43 ( .AN(N14), .B(n28), .C(n27), .Y(n32) );
  CLKXOR2X2M U44 ( .A(N13), .B(edge_cnt[4]), .Y(n31) );
  CLKXOR2X2M U45 ( .A(N11), .B(edge_cnt[2]), .Y(n30) );
  CLKXOR2X2M U46 ( .A(N12), .B(edge_cnt[3]), .Y(n29) );
  NOR4X1M U47 ( .A(n32), .B(n31), .C(n30), .D(n29), .Y(N15) );
endmodule


module start_check ( clk, rst_n, strt_chk_en, strt_glitch, sampled_bit, 
        edge_cnt, prescale );
  input [4:0] edge_cnt;
  input [5:0] prescale;
  input clk, rst_n, strt_chk_en, sampled_bit;
  output strt_glitch;
  wire   N6, N8, N9, N10, N11, N12, N13, N15, N16, N17, N18, N19, N20, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48;
  wire   [1:0] correct_counter;
  wire   [1:0] error_counter;
  wire   [4:2] add_32_carry;

  DFFRQX2M error_counter_reg_0_ ( .D(n30), .CK(clk), .RN(rst_n), .Q(
        error_counter[0]) );
  DFFRQX2M correct_counter_reg_0_ ( .D(n27), .CK(clk), .RN(rst_n), .Q(
        correct_counter[0]) );
  DFFRQX2M correct_counter_reg_1_ ( .D(n28), .CK(clk), .RN(rst_n), .Q(
        correct_counter[1]) );
  DFFRQX2M error_counter_reg_1_ ( .D(n29), .CK(clk), .RN(rst_n), .Q(
        error_counter[1]) );
  DFFRQX2M strt_glitch_reg ( .D(n26), .CK(clk), .RN(rst_n), .Q(strt_glitch) );
  NAND2X2M U3 ( .A(n19), .B(n22), .Y(n23) );
  NAND2X2M U4 ( .A(n19), .B(n18), .Y(n17) );
  ADDHX1M U5 ( .A(prescale[3]), .B(add_32_carry[2]), .CO(add_32_carry[3]), .S(
        N16) );
  ADDHX1M U6 ( .A(prescale[2]), .B(prescale[1]), .CO(add_32_carry[2]), .S(N15)
         );
  ADDHX1M U7 ( .A(prescale[4]), .B(add_32_carry[3]), .CO(add_32_carry[4]), .S(
        N17) );
  INVX2M U8 ( .A(prescale[1]), .Y(n1) );
  ADDHX1M U9 ( .A(prescale[5]), .B(add_32_carry[4]), .CO(N19), .S(N18) );
  NAND4BX1M U10 ( .AN(n21), .B(n15), .C(n24), .D(n20), .Y(n22) );
  NAND3X2M U11 ( .A(n15), .B(n20), .C(n21), .Y(n18) );
  AND2X2M U12 ( .A(strt_chk_en), .B(n25), .Y(n15) );
  AND2X2M U13 ( .A(n16), .B(n25), .Y(n19) );
  NAND2BX2M U14 ( .AN(n20), .B(n15), .Y(n16) );
  OR3X2M U15 ( .A(N6), .B(N20), .C(N13), .Y(n24) );
  OAI32X1M U16 ( .A0(n45), .A1(error_counter[1]), .A2(n22), .B0(n48), .B1(n23), 
        .Y(n29) );
  INVX2M U17 ( .A(error_counter[1]), .Y(n48) );
  OAI32X1M U18 ( .A0(n47), .A1(correct_counter[1]), .A2(n18), .B0(n46), .B1(
        n17), .Y(n28) );
  INVX2M U19 ( .A(correct_counter[1]), .Y(n46) );
  OAI22X1M U20 ( .A0(n45), .A1(n23), .B0(error_counter[0]), .B1(n22), .Y(n30)
         );
  OAI22X1M U21 ( .A0(n17), .A1(n47), .B0(correct_counter[0]), .B1(n18), .Y(n27) );
  NAND3X2M U22 ( .A(correct_counter[1]), .B(n47), .C(strt_chk_en), .Y(n25) );
  OAI2BB1X2M U23 ( .A0N(strt_glitch), .A1N(n15), .B0(n16), .Y(n26) );
  NOR2BX2M U24 ( .AN(n24), .B(sampled_bit), .Y(n21) );
  NAND2X2M U25 ( .A(error_counter[1]), .B(n45), .Y(n20) );
  INVX2M U26 ( .A(error_counter[0]), .Y(n45) );
  INVX2M U27 ( .A(correct_counter[0]), .Y(n47) );
  NAND2BX1M U28 ( .AN(prescale[2]), .B(n1), .Y(n2) );
  OAI2BB1X1M U29 ( .A0N(prescale[1]), .A1N(prescale[2]), .B0(n2), .Y(N8) );
  OR2X1M U30 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OAI2BB1X1M U31 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N9) );
  XNOR2X1M U32 ( .A(prescale[4]), .B(n3), .Y(N10) );
  NOR3X1M U33 ( .A(prescale[4]), .B(prescale[5]), .C(n3), .Y(N12) );
  OAI21X1M U34 ( .A0(prescale[4]), .A1(n3), .B0(prescale[5]), .Y(n4) );
  NAND2BX1M U35 ( .AN(N12), .B(n4), .Y(N11) );
  CLKXOR2X2M U36 ( .A(prescale[3]), .B(edge_cnt[2]), .Y(n12) );
  NOR2BX1M U37 ( .AN(prescale[1]), .B(edge_cnt[0]), .Y(n5) );
  OAI2B2X1M U38 ( .A1N(edge_cnt[1]), .A0(n5), .B0(prescale[2]), .B1(n5), .Y(n8) );
  NOR2BX1M U39 ( .AN(edge_cnt[0]), .B(prescale[1]), .Y(n6) );
  OAI2B2X1M U40 ( .A1N(prescale[2]), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n7) );
  CLKNAND2X2M U41 ( .A(n8), .B(n7), .Y(n11) );
  CLKXOR2X2M U42 ( .A(prescale[4]), .B(edge_cnt[3]), .Y(n10) );
  CLKXOR2X2M U43 ( .A(prescale[5]), .B(edge_cnt[4]), .Y(n9) );
  NOR4X1M U44 ( .A(n12), .B(n11), .C(n10), .D(n9), .Y(N6) );
  NOR2BX1M U45 ( .AN(n1), .B(edge_cnt[0]), .Y(n13) );
  OAI2B2X1M U46 ( .A1N(edge_cnt[1]), .A0(n13), .B0(N8), .B1(n13), .Y(n32) );
  NOR2BX1M U47 ( .AN(edge_cnt[0]), .B(n1), .Y(n14) );
  OAI2B2X1M U48 ( .A1N(N8), .A0(n14), .B0(edge_cnt[1]), .B1(n14), .Y(n31) );
  NAND3BX1M U49 ( .AN(N12), .B(n32), .C(n31), .Y(n36) );
  CLKXOR2X2M U50 ( .A(N11), .B(edge_cnt[4]), .Y(n35) );
  CLKXOR2X2M U51 ( .A(N9), .B(edge_cnt[2]), .Y(n34) );
  CLKXOR2X2M U52 ( .A(N10), .B(edge_cnt[3]), .Y(n33) );
  NOR4X1M U53 ( .A(n36), .B(n35), .C(n34), .D(n33), .Y(N13) );
  NOR2BX1M U54 ( .AN(n1), .B(edge_cnt[0]), .Y(n37) );
  OAI2B2X1M U55 ( .A1N(edge_cnt[1]), .A0(n37), .B0(N15), .B1(n37), .Y(n40) );
  NOR2BX1M U56 ( .AN(edge_cnt[0]), .B(n1), .Y(n38) );
  OAI2B2X1M U57 ( .A1N(N15), .A0(n38), .B0(edge_cnt[1]), .B1(n38), .Y(n39) );
  NAND3BX1M U58 ( .AN(N19), .B(n40), .C(n39), .Y(n44) );
  CLKXOR2X2M U59 ( .A(N18), .B(edge_cnt[4]), .Y(n43) );
  CLKXOR2X2M U60 ( .A(N16), .B(edge_cnt[2]), .Y(n42) );
  CLKXOR2X2M U61 ( .A(N17), .B(edge_cnt[3]), .Y(n41) );
  NOR4X1M U62 ( .A(n44), .B(n43), .C(n42), .D(n41), .Y(N20) );
endmodule


module parity_check ( clk, rst_n, par_chk_en, par_err, sampled_bit, par_type, 
        edge_cnt, prescale, bit_cnt );
  input [4:0] edge_cnt;
  input [5:0] prescale;
  input [3:0] bit_cnt;
  input clk, rst_n, par_chk_en, sampled_bit, par_type;
  output par_err;
  wire   N8, N15, N16, N17, N18, N19, N20, N22, N23, N24, N25, N26, N27, n19,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n20, n21, n22,
         n23, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78;
  wire   [7:0] data;
  wire   [1:0] correct_counter;
  wire   [1:0] error_counter;
  wire   [4:2] add_37_carry;

  DFFRQX2M data_reg_0_ ( .D(n59), .CK(clk), .RN(rst_n), .Q(data[0]) );
  DFFRQX2M data_reg_1_ ( .D(n49), .CK(clk), .RN(rst_n), .Q(data[1]) );
  DFFRQX2M error_counter_reg_1_ ( .D(n58), .CK(clk), .RN(rst_n), .Q(
        error_counter[1]) );
  DFFRQX2M correct_counter_reg_0_ ( .D(n47), .CK(clk), .RN(rst_n), .Q(
        correct_counter[0]) );
  DFFRQX2M data_reg_4_ ( .D(n52), .CK(clk), .RN(rst_n), .Q(data[4]) );
  DFFRQX2M data_reg_2_ ( .D(n50), .CK(clk), .RN(rst_n), .Q(data[2]) );
  DFFRQX2M correct_counter_reg_1_ ( .D(n56), .CK(clk), .RN(rst_n), .Q(
        correct_counter[1]) );
  DFFRQX2M error_counter_reg_0_ ( .D(n57), .CK(clk), .RN(rst_n), .Q(
        error_counter[0]) );
  DFFRQX2M data_reg_6_ ( .D(n54), .CK(clk), .RN(rst_n), .Q(data[6]) );
  DFFRQX2M data_reg_5_ ( .D(n53), .CK(clk), .RN(rst_n), .Q(data[5]) );
  DFFRQX2M data_reg_7_ ( .D(n55), .CK(clk), .RN(rst_n), .Q(data[7]) );
  DFFRX1M data_reg_3_ ( .D(n51), .CK(clk), .RN(rst_n), .QN(n19) );
  DFFRQX2M par_err_reg ( .D(n48), .CK(clk), .RN(rst_n), .Q(par_err) );
  NOR3X2M U3 ( .A(n74), .B(error_counter[0]), .C(n76), .Y(n32) );
  NAND2X2M U4 ( .A(n29), .B(n25), .Y(n24) );
  NAND2X2M U5 ( .A(n29), .B(n35), .Y(n34) );
  ADDHX1M U6 ( .A(prescale[3]), .B(add_37_carry[2]), .CO(add_37_carry[3]), .S(
        N23) );
  ADDHX1M U7 ( .A(prescale[2]), .B(prescale[1]), .CO(add_37_carry[2]), .S(N22)
         );
  ADDHX1M U8 ( .A(prescale[4]), .B(add_37_carry[3]), .CO(add_37_carry[4]), .S(
        N24) );
  INVX2M U9 ( .A(prescale[1]), .Y(n2) );
  ADDHX1M U10 ( .A(prescale[5]), .B(add_37_carry[4]), .CO(N26), .S(N25) );
  NAND3X2M U11 ( .A(n30), .B(n26), .C(n31), .Y(n25) );
  NOR3X2M U12 ( .A(n76), .B(n32), .C(n33), .Y(n31) );
  NAND2X2M U13 ( .A(n32), .B(n26), .Y(n27) );
  AND2X2M U14 ( .A(n36), .B(n1), .Y(n26) );
  AND2X2M U15 ( .A(n27), .B(n36), .Y(n29) );
  OR4X1M U16 ( .A(n37), .B(n33), .C(n32), .D(n30), .Y(n35) );
  NAND2X2M U17 ( .A(par_chk_en), .B(n26), .Y(n37) );
  OAI22X1M U18 ( .A0(n71), .A1(n1), .B0(n77), .B1(n72), .Y(n49) );
  OAI22X1M U19 ( .A0(n69), .A1(n1), .B0(n77), .B1(n70), .Y(n52) );
  OAI22X1M U20 ( .A0(n68), .A1(n1), .B0(n77), .B1(n69), .Y(n53) );
  OAI22X1M U21 ( .A0(n67), .A1(n1), .B0(n77), .B1(n68), .Y(n54) );
  INVX2M U22 ( .A(n1), .Y(n77) );
  INVX2M U23 ( .A(par_chk_en), .Y(n76) );
  OAI32X1M U24 ( .A0(n78), .A1(correct_counter[1]), .A2(n25), .B0(n75), .B1(
        n24), .Y(n56) );
  INVX2M U25 ( .A(correct_counter[1]), .Y(n75) );
  OAI32X1M U26 ( .A0(n73), .A1(error_counter[1]), .A2(n35), .B0(n74), .B1(n34), 
        .Y(n58) );
  NOR3X2M U27 ( .A(N8), .B(N27), .C(N20), .Y(n33) );
  OAI22X1M U28 ( .A0(n34), .A1(n73), .B0(error_counter[0]), .B1(n35), .Y(n57)
         );
  OAI22X1M U29 ( .A0(n24), .A1(n78), .B0(correct_counter[0]), .B1(n25), .Y(n47) );
  BUFX2M U30 ( .A(n28), .Y(n1) );
  NAND4X2M U31 ( .A(N8), .B(n43), .C(n44), .D(n45), .Y(n28) );
  OR4X1M U32 ( .A(bit_cnt[0]), .B(bit_cnt[1]), .C(bit_cnt[2]), .D(bit_cnt[3]), 
        .Y(n43) );
  NAND4BBX1M U33 ( .AN(bit_cnt[0]), .BN(bit_cnt[2]), .C(bit_cnt[1]), .D(
        bit_cnt[3]), .Y(n45) );
  AOI31X2M U34 ( .A0(bit_cnt[3]), .A1(bit_cnt[0]), .A2(n46), .B0(par_chk_en), 
        .Y(n44) );
  NOR2X2M U35 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .Y(n46) );
  OAI22X1M U36 ( .A0(n19), .A1(n1), .B0(n77), .B1(n71), .Y(n50) );
  OAI22X1M U37 ( .A0(n70), .A1(n1), .B0(n77), .B1(n19), .Y(n51) );
  XOR3XLM U38 ( .A(n38), .B(n39), .C(n40), .Y(n30) );
  CLKXOR2X2M U39 ( .A(par_type), .B(data[2]), .Y(n39) );
  XOR3XLM U40 ( .A(data[1]), .B(data[0]), .C(n41), .Y(n40) );
  XOR3XLM U41 ( .A(data[6]), .B(data[5]), .C(n42), .Y(n38) );
  OAI2BB2X1M U42 ( .B0(n77), .B1(n67), .A0N(sampled_bit), .A1N(n77), .Y(n55)
         );
  OAI2BB2X1M U43 ( .B0(n72), .B1(n1), .A0N(n1), .A1N(data[0]), .Y(n59) );
  NAND3X2M U44 ( .A(par_chk_en), .B(n78), .C(correct_counter[1]), .Y(n36) );
  OAI2BB1X2M U45 ( .A0N(par_err), .A1N(n26), .B0(n27), .Y(n48) );
  CLKXOR2X2M U46 ( .A(sampled_bit), .B(data[7]), .Y(n42) );
  CLKXOR2X2M U47 ( .A(n19), .B(data[4]), .Y(n41) );
  INVX2M U48 ( .A(correct_counter[0]), .Y(n78) );
  INVX2M U49 ( .A(error_counter[1]), .Y(n74) );
  INVX2M U50 ( .A(error_counter[0]), .Y(n73) );
  INVX2M U51 ( .A(data[7]), .Y(n67) );
  INVX2M U52 ( .A(data[2]), .Y(n71) );
  INVX2M U53 ( .A(data[4]), .Y(n70) );
  INVX2M U54 ( .A(data[5]), .Y(n69) );
  INVX2M U55 ( .A(data[6]), .Y(n68) );
  INVX2M U56 ( .A(data[1]), .Y(n72) );
  NAND2BX1M U57 ( .AN(prescale[2]), .B(n2), .Y(n3) );
  OAI2BB1X1M U58 ( .A0N(prescale[1]), .A1N(prescale[2]), .B0(n3), .Y(N15) );
  OR2X1M U59 ( .A(n3), .B(prescale[3]), .Y(n4) );
  OAI2BB1X1M U60 ( .A0N(n3), .A1N(prescale[3]), .B0(n4), .Y(N16) );
  XNOR2X1M U61 ( .A(prescale[4]), .B(n4), .Y(N17) );
  NOR3X1M U62 ( .A(prescale[4]), .B(prescale[5]), .C(n4), .Y(N19) );
  OAI21X1M U63 ( .A0(prescale[4]), .A1(n4), .B0(prescale[5]), .Y(n5) );
  NAND2BX1M U64 ( .AN(N19), .B(n5), .Y(N18) );
  CLKXOR2X2M U65 ( .A(prescale[3]), .B(edge_cnt[2]), .Y(n13) );
  NOR2BX1M U66 ( .AN(prescale[1]), .B(edge_cnt[0]), .Y(n6) );
  OAI2B2X1M U67 ( .A1N(edge_cnt[1]), .A0(n6), .B0(prescale[2]), .B1(n6), .Y(n9) );
  NOR2BX1M U68 ( .AN(edge_cnt[0]), .B(prescale[1]), .Y(n7) );
  OAI2B2X1M U69 ( .A1N(prescale[2]), .A0(n7), .B0(edge_cnt[1]), .B1(n7), .Y(n8) );
  CLKNAND2X2M U70 ( .A(n9), .B(n8), .Y(n12) );
  CLKXOR2X2M U71 ( .A(prescale[4]), .B(edge_cnt[3]), .Y(n11) );
  CLKXOR2X2M U72 ( .A(prescale[5]), .B(edge_cnt[4]), .Y(n10) );
  NOR4X1M U73 ( .A(n13), .B(n12), .C(n11), .D(n10), .Y(N8) );
  NOR2BX1M U74 ( .AN(n2), .B(edge_cnt[0]), .Y(n14) );
  OAI2B2X1M U75 ( .A1N(edge_cnt[1]), .A0(n14), .B0(N15), .B1(n14), .Y(n17) );
  NOR2BX1M U76 ( .AN(edge_cnt[0]), .B(n2), .Y(n15) );
  OAI2B2X1M U77 ( .A1N(N15), .A0(n15), .B0(edge_cnt[1]), .B1(n15), .Y(n16) );
  NAND3BX1M U78 ( .AN(N19), .B(n17), .C(n16), .Y(n22) );
  CLKXOR2X2M U79 ( .A(N18), .B(edge_cnt[4]), .Y(n21) );
  CLKXOR2X2M U80 ( .A(N16), .B(edge_cnt[2]), .Y(n20) );
  CLKXOR2X2M U81 ( .A(N17), .B(edge_cnt[3]), .Y(n18) );
  NOR4X1M U82 ( .A(n22), .B(n21), .C(n20), .D(n18), .Y(N20) );
  NOR2BX1M U83 ( .AN(n2), .B(edge_cnt[0]), .Y(n23) );
  OAI2B2X1M U84 ( .A1N(edge_cnt[1]), .A0(n23), .B0(N22), .B1(n23), .Y(n62) );
  NOR2BX1M U85 ( .AN(edge_cnt[0]), .B(n2), .Y(n60) );
  OAI2B2X1M U86 ( .A1N(N22), .A0(n60), .B0(edge_cnt[1]), .B1(n60), .Y(n61) );
  NAND3BX1M U87 ( .AN(N26), .B(n62), .C(n61), .Y(n66) );
  CLKXOR2X2M U88 ( .A(N25), .B(edge_cnt[4]), .Y(n65) );
  CLKXOR2X2M U89 ( .A(N23), .B(edge_cnt[2]), .Y(n64) );
  CLKXOR2X2M U90 ( .A(N24), .B(edge_cnt[3]), .Y(n63) );
  NOR4X1M U91 ( .A(n66), .B(n65), .C(n64), .D(n63), .Y(N27) );
endmodule


module stop_check ( clk, rst_n, stp_chk_en, stp_error, sampled_bit, prescale, 
        edge_cnt );
  input [5:0] prescale;
  input [4:0] edge_cnt;
  input clk, rst_n, stp_chk_en, sampled_bit;
  output stp_error;
  wire   N6, N8, N9, N10, N11, N12, N13, N15, N16, N17, N18, N19, N20, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48;
  wire   [1:0] correct_counter;
  wire   [1:0] error_counter;
  wire   [4:2] add_31_carry;

  DFFRQX2M error_counter_reg_0_ ( .D(n30), .CK(clk), .RN(rst_n), .Q(
        error_counter[0]) );
  DFFRQX2M correct_counter_reg_0_ ( .D(n27), .CK(clk), .RN(rst_n), .Q(
        correct_counter[0]) );
  DFFRQX2M correct_counter_reg_1_ ( .D(n28), .CK(clk), .RN(rst_n), .Q(
        correct_counter[1]) );
  DFFRQX2M error_counter_reg_1_ ( .D(n29), .CK(clk), .RN(rst_n), .Q(
        error_counter[1]) );
  DFFRQX2M stp_error_reg ( .D(n26), .CK(clk), .RN(rst_n), .Q(stp_error) );
  NAND2X2M U3 ( .A(n19), .B(n18), .Y(n17) );
  NAND2X2M U4 ( .A(n19), .B(n22), .Y(n23) );
  ADDHX1M U5 ( .A(prescale[3]), .B(add_31_carry[2]), .CO(add_31_carry[3]), .S(
        N16) );
  ADDHX1M U6 ( .A(prescale[2]), .B(prescale[1]), .CO(add_31_carry[2]), .S(N15)
         );
  ADDHX1M U7 ( .A(prescale[4]), .B(add_31_carry[3]), .CO(add_31_carry[4]), .S(
        N17) );
  INVX2M U8 ( .A(prescale[1]), .Y(n1) );
  ADDHX1M U9 ( .A(prescale[5]), .B(add_31_carry[4]), .CO(N19), .S(N18) );
  NAND3BX2M U10 ( .AN(n20), .B(n15), .C(n21), .Y(n18) );
  NAND4X2M U11 ( .A(n15), .B(n24), .C(n20), .D(n21), .Y(n22) );
  OR3X2M U12 ( .A(N6), .B(N20), .C(N13), .Y(n24) );
  AND2X2M U13 ( .A(stp_chk_en), .B(n25), .Y(n15) );
  AND2X2M U14 ( .A(n16), .B(n25), .Y(n19) );
  NAND2BX2M U15 ( .AN(n21), .B(n15), .Y(n16) );
  OAI32X1M U16 ( .A0(n47), .A1(correct_counter[1]), .A2(n18), .B0(n46), .B1(
        n17), .Y(n28) );
  INVX2M U17 ( .A(correct_counter[1]), .Y(n46) );
  OAI32X1M U18 ( .A0(n45), .A1(error_counter[1]), .A2(n22), .B0(n48), .B1(n23), 
        .Y(n29) );
  INVX2M U19 ( .A(error_counter[1]), .Y(n48) );
  OAI22X1M U20 ( .A0(n17), .A1(n47), .B0(correct_counter[0]), .B1(n18), .Y(n27) );
  OAI22X1M U21 ( .A0(n45), .A1(n23), .B0(error_counter[0]), .B1(n22), .Y(n30)
         );
  NAND3X2M U22 ( .A(correct_counter[1]), .B(n47), .C(stp_chk_en), .Y(n25) );
  NAND2X2M U23 ( .A(sampled_bit), .B(n24), .Y(n20) );
  OAI2BB1X2M U24 ( .A0N(stp_error), .A1N(n15), .B0(n16), .Y(n26) );
  NAND2X2M U25 ( .A(error_counter[1]), .B(n45), .Y(n21) );
  INVX2M U26 ( .A(error_counter[0]), .Y(n45) );
  INVX2M U27 ( .A(correct_counter[0]), .Y(n47) );
  NAND2BX1M U28 ( .AN(prescale[2]), .B(n1), .Y(n2) );
  OAI2BB1X1M U29 ( .A0N(prescale[1]), .A1N(prescale[2]), .B0(n2), .Y(N8) );
  OR2X1M U30 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OAI2BB1X1M U31 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N9) );
  XNOR2X1M U32 ( .A(prescale[4]), .B(n3), .Y(N10) );
  NOR3X1M U33 ( .A(prescale[4]), .B(prescale[5]), .C(n3), .Y(N12) );
  OAI21X1M U34 ( .A0(prescale[4]), .A1(n3), .B0(prescale[5]), .Y(n4) );
  NAND2BX1M U35 ( .AN(N12), .B(n4), .Y(N11) );
  CLKXOR2X2M U36 ( .A(prescale[3]), .B(edge_cnt[2]), .Y(n12) );
  NOR2BX1M U37 ( .AN(prescale[1]), .B(edge_cnt[0]), .Y(n5) );
  OAI2B2X1M U38 ( .A1N(edge_cnt[1]), .A0(n5), .B0(prescale[2]), .B1(n5), .Y(n8) );
  NOR2BX1M U39 ( .AN(edge_cnt[0]), .B(prescale[1]), .Y(n6) );
  OAI2B2X1M U40 ( .A1N(prescale[2]), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n7) );
  CLKNAND2X2M U41 ( .A(n8), .B(n7), .Y(n11) );
  CLKXOR2X2M U42 ( .A(prescale[4]), .B(edge_cnt[3]), .Y(n10) );
  CLKXOR2X2M U43 ( .A(prescale[5]), .B(edge_cnt[4]), .Y(n9) );
  NOR4X1M U44 ( .A(n12), .B(n11), .C(n10), .D(n9), .Y(N6) );
  NOR2BX1M U45 ( .AN(n1), .B(edge_cnt[0]), .Y(n13) );
  OAI2B2X1M U46 ( .A1N(edge_cnt[1]), .A0(n13), .B0(N8), .B1(n13), .Y(n32) );
  NOR2BX1M U47 ( .AN(edge_cnt[0]), .B(n1), .Y(n14) );
  OAI2B2X1M U48 ( .A1N(N8), .A0(n14), .B0(edge_cnt[1]), .B1(n14), .Y(n31) );
  NAND3BX1M U49 ( .AN(N12), .B(n32), .C(n31), .Y(n36) );
  CLKXOR2X2M U50 ( .A(N11), .B(edge_cnt[4]), .Y(n35) );
  CLKXOR2X2M U51 ( .A(N9), .B(edge_cnt[2]), .Y(n34) );
  CLKXOR2X2M U52 ( .A(N10), .B(edge_cnt[3]), .Y(n33) );
  NOR4X1M U53 ( .A(n36), .B(n35), .C(n34), .D(n33), .Y(N13) );
  NOR2BX1M U54 ( .AN(n1), .B(edge_cnt[0]), .Y(n37) );
  OAI2B2X1M U55 ( .A1N(edge_cnt[1]), .A0(n37), .B0(N15), .B1(n37), .Y(n40) );
  NOR2BX1M U56 ( .AN(edge_cnt[0]), .B(n1), .Y(n38) );
  OAI2B2X1M U57 ( .A1N(N15), .A0(n38), .B0(edge_cnt[1]), .B1(n38), .Y(n39) );
  NAND3BX1M U58 ( .AN(N19), .B(n40), .C(n39), .Y(n44) );
  CLKXOR2X2M U59 ( .A(N18), .B(edge_cnt[4]), .Y(n43) );
  CLKXOR2X2M U60 ( .A(N16), .B(edge_cnt[2]), .Y(n42) );
  CLKXOR2X2M U61 ( .A(N17), .B(edge_cnt[3]), .Y(n41) );
  NOR4X1M U62 ( .A(n44), .B(n43), .C(n42), .D(n41), .Y(N20) );
endmodule


module desz ( clk, rst_n, deser_en, sampled_bit, p_data );
  output [7:0] p_data;
  input clk, rst_n, deser_en, sampled_bit;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n1, n2, n3, n4, n5, n6, n7, n8,
         n17;

  DFFRQX2M p_data_reg_0_ ( .D(n9), .CK(clk), .RN(rst_n), .Q(p_data[0]) );
  DFFRQX2M p_data_reg_7_ ( .D(n16), .CK(clk), .RN(rst_n), .Q(p_data[7]) );
  DFFRQX2M p_data_reg_6_ ( .D(n15), .CK(clk), .RN(rst_n), .Q(p_data[6]) );
  DFFRQX2M p_data_reg_5_ ( .D(n14), .CK(clk), .RN(rst_n), .Q(p_data[5]) );
  DFFRQX2M p_data_reg_4_ ( .D(n13), .CK(clk), .RN(rst_n), .Q(p_data[4]) );
  DFFRQX2M p_data_reg_3_ ( .D(n12), .CK(clk), .RN(rst_n), .Q(p_data[3]) );
  DFFRQX2M p_data_reg_2_ ( .D(n11), .CK(clk), .RN(rst_n), .Q(p_data[2]) );
  DFFRQX2M p_data_reg_1_ ( .D(n10), .CK(clk), .RN(rst_n), .Q(p_data[1]) );
  OAI22X1M U2 ( .A0(n17), .A1(n7), .B0(n1), .B1(n8), .Y(n10) );
  OAI22X1M U3 ( .A0(n17), .A1(n6), .B0(n1), .B1(n7), .Y(n11) );
  OAI22X1M U4 ( .A0(n17), .A1(n5), .B0(n1), .B1(n6), .Y(n12) );
  OAI22X1M U5 ( .A0(n17), .A1(n4), .B0(n1), .B1(n5), .Y(n13) );
  OAI22X1M U6 ( .A0(n17), .A1(n3), .B0(n1), .B1(n4), .Y(n14) );
  OAI22X1M U7 ( .A0(n17), .A1(n2), .B0(n1), .B1(n3), .Y(n15) );
  INVX2M U8 ( .A(n1), .Y(n17) );
  OAI2BB2X1M U9 ( .B0(n17), .B1(n8), .A0N(p_data[0]), .A1N(n17), .Y(n9) );
  BUFX2M U10 ( .A(deser_en), .Y(n1) );
  OAI2BB2X1M U11 ( .B0(n1), .B1(n2), .A0N(sampled_bit), .A1N(n1), .Y(n16) );
  INVX2M U12 ( .A(p_data[1]), .Y(n8) );
  INVX2M U13 ( .A(p_data[7]), .Y(n2) );
  INVX2M U14 ( .A(p_data[2]), .Y(n7) );
  INVX2M U15 ( .A(p_data[3]), .Y(n6) );
  INVX2M U16 ( .A(p_data[4]), .Y(n5) );
  INVX2M U17 ( .A(p_data[5]), .Y(n4) );
  INVX2M U18 ( .A(p_data[6]), .Y(n3) );
endmodule


module uart_rx_top ( clk, rst_n, par_en, rx_in, prescale, par_type, data_valid, 
        p_data, parity_error, framing_error );
  input [5:0] prescale;
  output [7:0] p_data;
  input clk, rst_n, par_en, rx_in, par_type;
  output data_valid, parity_error, framing_error;
  wire   data_valid_int, stp_error, strt_glitch, enable, deser_en, stp_chk_en,
         strt_chk_en, par_chk_en, dat_samp_en, sampled_bit, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;
  wire   [4:0] edge_cnt;
  wire   [3:0] bit_cnt;

  fsm u_fsm ( .clk(clk), .rst_n(n1), .rx_in(rx_in), .edge_cnt({edge_cnt[4:2], 
        n5, n3}), .bit_cnt(bit_cnt), .par_en(par_en), .par_err(parity_error), 
        .strt_glitch(strt_glitch), .stp_error(stp_error), .enable(enable), 
        .data_valid(data_valid_int), .deser_en(deser_en), .stp_chk_en(
        stp_chk_en), .strt_chk_en(strt_chk_en), .par_chk_en(par_chk_en), 
        .dat_samp_en(dat_samp_en), .prescale({n15, n13, n11, n9, n7, 
        prescale[0]}) );
  edge_counter u_edge_counter ( .clk(clk), .rst_n(n1), .edge_cnt(edge_cnt), 
        .bit_cnt(bit_cnt), .enable(enable), .par_en(par_en), .prescale({n15, 
        n13, n11, n9, n7, prescale[0]}) );
  sample u_sample ( .clk(clk), .rst_n(n1), .dat_samp_en(dat_samp_en), 
        .prescale({n15, n13, n11, n9, n7, prescale[0]}), .edge_cnt({
        edge_cnt[4:2], n5, n3}), .rx_in(rx_in), .sampled_bit(sampled_bit) );
  start_check u_start_check ( .clk(clk), .rst_n(n1), .strt_chk_en(strt_chk_en), 
        .strt_glitch(strt_glitch), .sampled_bit(sampled_bit), .edge_cnt({
        edge_cnt[4:2], n5, n3}), .prescale({n15, n13, n11, n9, n7, prescale[0]}) );
  parity_check u_parity_check ( .clk(clk), .rst_n(n1), .par_chk_en(par_chk_en), 
        .par_err(parity_error), .sampled_bit(sampled_bit), .par_type(par_type), 
        .edge_cnt({edge_cnt[4:2], n5, n3}), .prescale({n15, n13, n11, n9, n7, 
        prescale[0]}), .bit_cnt(bit_cnt) );
  stop_check u_stop_check ( .clk(clk), .rst_n(n1), .stp_chk_en(stp_chk_en), 
        .stp_error(stp_error), .sampled_bit(sampled_bit), .prescale({n15, n13, 
        n11, n9, n7, prescale[0]}), .edge_cnt({edge_cnt[4:2], n5, n3}) );
  desz u_deserializer ( .clk(clk), .rst_n(n1), .deser_en(deser_en), 
        .sampled_bit(sampled_bit), .p_data(p_data) );
  DFFRQX2M data_valid_r_reg ( .D(data_valid_int), .CK(clk), .RN(n1), .Q(
        data_valid) );
  INVX2M U3 ( .A(n8), .Y(n7) );
  INVX2M U4 ( .A(n10), .Y(n9) );
  INVX2M U5 ( .A(n14), .Y(n13) );
  INVX2M U6 ( .A(n4), .Y(n3) );
  INVX2M U7 ( .A(edge_cnt[0]), .Y(n4) );
  INVX4M U8 ( .A(n2), .Y(n1) );
  INVX2M U9 ( .A(rst_n), .Y(n2) );
  INVX2M U10 ( .A(prescale[1]), .Y(n8) );
  INVX2M U11 ( .A(prescale[2]), .Y(n10) );
  INVX2M U12 ( .A(prescale[4]), .Y(n14) );
  INVX2M U13 ( .A(n16), .Y(n15) );
  INVX2M U14 ( .A(prescale[5]), .Y(n16) );
  INVX2M U15 ( .A(n12), .Y(n11) );
  INVX2M U16 ( .A(prescale[3]), .Y(n12) );
  OR2X2M U17 ( .A(stp_error), .B(strt_glitch), .Y(framing_error) );
  INVX2M U18 ( .A(n6), .Y(n5) );
  INVX2M U19 ( .A(edge_cnt[1]), .Y(n6) );
endmodule


module UART ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, TX_IN_P, 
        TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, parity_type, 
        parity_error, framing_error );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error;
  wire   n1, n2, n3, n4, n5, n6, n7;

  uart_top_DATA_WIDTH8 U0_UART_TX ( .p_data(TX_IN_P), .data_valid(TX_IN_V), 
        .parity_type(parity_type), .parity_en(parity_enable), .clk(TX_CLK), 
        .rst_n(n1), .tx_out(TX_OUT_S), .busy(TX_OUT_V) );
  uart_rx_top U0_UART_RX ( .clk(RX_CLK), .rst_n(n1), .par_en(parity_enable), 
        .rx_in(RX_IN_S), .prescale({n7, n6, n5, n4, n3, Prescale[0]}), 
        .par_type(parity_type), .data_valid(RX_OUT_V), .p_data(RX_OUT_P), 
        .parity_error(parity_error), .framing_error(framing_error) );
  BUFX2M U1 ( .A(Prescale[1]), .Y(n3) );
  BUFX2M U2 ( .A(Prescale[2]), .Y(n4) );
  BUFX2M U3 ( .A(Prescale[4]), .Y(n6) );
  BUFX2M U4 ( .A(Prescale[5]), .Y(n7) );
  BUFX2M U5 ( .A(Prescale[3]), .Y(n5) );
  INVX2M U6 ( .A(n2), .Y(n1) );
  INVX2M U7 ( .A(RST), .Y(n2) );
endmodule


module SYS_CTRL ( CLK, RST, ALU_OUT, ALU_OUT_VLD, ALU_FUN, ALU_EN, CLKG_EN, 
        RF_Address, RF_WrEn, RF_RdEn, RF_WrData, RF_RdData, RF_RdData_VLD, 
        UART_RX_DATA, UART_RX_VLD, UART_TX_DATA, UART_TX_VLD, CLKDIV_EN, 
        FIFO_FULL );
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] RF_Address;
  output [7:0] RF_WrData;
  input [7:0] RF_RdData;
  input [7:0] UART_RX_DATA;
  output [7:0] UART_TX_DATA;
  input CLK, RST, ALU_OUT_VLD, RF_RdData_VLD, UART_RX_VLD, FIFO_FULL;
  output ALU_EN, CLKG_EN, RF_WrEn, RF_RdEn, UART_TX_VLD, CLKDIV_EN;
  wire   N177, N188, N189, n1, n14, n15, n16, n17, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n18, n19, n20, n21, n22, n118, n119, n120,
         n121, n122;
  wire   [3:0] current_state;
  wire   [7:0] rf_wr_data_reg;

  DFFRQX2M rf_wr_data_reg_reg_6_ ( .D(n100), .CK(CLK), .RN(RST), .Q(
        rf_wr_data_reg[6]) );
  DFFRQX2M rf_wr_data_reg_reg_5_ ( .D(n99), .CK(CLK), .RN(RST), .Q(
        rf_wr_data_reg[5]) );
  DFFRQX2M rf_wr_data_reg_reg_4_ ( .D(n98), .CK(CLK), .RN(RST), .Q(
        rf_wr_data_reg[4]) );
  DFFRQX2M rf_wr_data_reg_reg_7_ ( .D(n101), .CK(CLK), .RN(RST), .Q(
        rf_wr_data_reg[7]) );
  DFFRQX2M rf_wr_data_reg_reg_3_ ( .D(n97), .CK(CLK), .RN(n5), .Q(
        rf_wr_data_reg[3]) );
  DFFRQX2M rf_wr_data_reg_reg_2_ ( .D(n96), .CK(CLK), .RN(n5), .Q(
        rf_wr_data_reg[2]) );
  DFFRQX2M rf_wr_data_reg_reg_1_ ( .D(n95), .CK(CLK), .RN(n5), .Q(
        rf_wr_data_reg[1]) );
  DFFRQX2M rf_wr_data_reg_reg_0_ ( .D(n94), .CK(CLK), .RN(n5), .Q(
        rf_wr_data_reg[0]) );
  DFFRQX2M UART_TX_DATA_reg_7_ ( .D(n109), .CK(CLK), .RN(n5), .Q(
        UART_TX_DATA[7]) );
  DFFRQX2M UART_TX_DATA_reg_6_ ( .D(n108), .CK(CLK), .RN(n5), .Q(
        UART_TX_DATA[6]) );
  DFFRQX2M UART_TX_DATA_reg_5_ ( .D(n107), .CK(CLK), .RN(n5), .Q(
        UART_TX_DATA[5]) );
  DFFRQX2M UART_TX_DATA_reg_4_ ( .D(n106), .CK(CLK), .RN(n5), .Q(
        UART_TX_DATA[4]) );
  DFFRQX2M UART_TX_DATA_reg_3_ ( .D(n105), .CK(CLK), .RN(n5), .Q(
        UART_TX_DATA[3]) );
  DFFRQX2M UART_TX_DATA_reg_2_ ( .D(n104), .CK(CLK), .RN(n5), .Q(
        UART_TX_DATA[2]) );
  DFFRQX2M UART_TX_DATA_reg_1_ ( .D(n103), .CK(CLK), .RN(RST), .Q(
        UART_TX_DATA[1]) );
  DFFRQX2M UART_TX_DATA_reg_0_ ( .D(n102), .CK(CLK), .RN(RST), .Q(
        UART_TX_DATA[0]) );
  DFFRQX2M RF_WrData_reg_6_ ( .D(n87), .CK(CLK), .RN(RST), .Q(RF_WrData[6]) );
  DFFRQX2M RF_WrData_reg_4_ ( .D(n89), .CK(CLK), .RN(RST), .Q(RF_WrData[4]) );
  DFFRQX2M RF_WrData_reg_3_ ( .D(n90), .CK(CLK), .RN(n5), .Q(RF_WrData[3]) );
  DFFRQX2M RF_WrData_reg_2_ ( .D(n91), .CK(CLK), .RN(n5), .Q(RF_WrData[2]) );
  DFFRQX2M RF_WrData_reg_1_ ( .D(n92), .CK(CLK), .RN(n5), .Q(RF_WrData[1]) );
  DFFRQX2M RF_WrEn_reg ( .D(n13), .CK(CLK), .RN(RST), .Q(RF_WrEn) );
  DFFRQX2M UART_TX_VLD_reg ( .D(n4), .CK(CLK), .RN(RST), .Q(UART_TX_VLD) );
  DFFRQX2M RF_RdEn_reg ( .D(N177), .CK(CLK), .RN(n5), .Q(RF_RdEn) );
  DFFRQX2M RF_WrData_reg_7_ ( .D(n86), .CK(CLK), .RN(RST), .Q(RF_WrData[7]) );
  DFFRQX2M RF_WrData_reg_5_ ( .D(n88), .CK(CLK), .RN(RST), .Q(RF_WrData[5]) );
  DFFRQX2M RF_WrData_reg_0_ ( .D(n93), .CK(CLK), .RN(RST), .Q(RF_WrData[0]) );
  DFFRX1M alu_fun_reg_reg_3_ ( .D(n113), .CK(CLK), .RN(RST), .QN(n14) );
  DFFRX1M alu_fun_reg_reg_2_ ( .D(n112), .CK(CLK), .RN(RST), .QN(n15) );
  DFFRX1M alu_fun_reg_reg_1_ ( .D(n111), .CK(CLK), .RN(RST), .QN(n16) );
  DFFRX1M alu_fun_reg_reg_0_ ( .D(n110), .CK(CLK), .RN(RST), .QN(n17) );
  DFFRQX2M RF_Address_reg_3_ ( .D(n81), .CK(CLK), .RN(RST), .Q(RF_Address[3])
         );
  DFFRQX2M ALU_EN_reg ( .D(N188), .CK(CLK), .RN(RST), .Q(ALU_EN) );
  DFFRQX2M RF_Address_reg_2_ ( .D(n80), .CK(CLK), .RN(RST), .Q(RF_Address[2])
         );
  DFFRQX2M current_state_reg_0_ ( .D(n117), .CK(CLK), .RN(n5), .Q(
        current_state[0]) );
  DFFRQX2M ALU_FUN_reg_1_ ( .D(n83), .CK(CLK), .RN(RST), .Q(ALU_FUN[1]) );
  DFFRQX2M RF_Address_reg_0_ ( .D(n78), .CK(CLK), .RN(RST), .Q(RF_Address[0])
         );
  DFFRQX2M RF_Address_reg_1_ ( .D(n79), .CK(CLK), .RN(RST), .Q(RF_Address[1])
         );
  DFFRQX2M ALU_FUN_reg_2_ ( .D(n84), .CK(CLK), .RN(RST), .Q(ALU_FUN[2]) );
  DFFRQX2M ALU_FUN_reg_0_ ( .D(n82), .CK(CLK), .RN(RST), .Q(ALU_FUN[0]) );
  DFFRQX2M ALU_FUN_reg_3_ ( .D(n85), .CK(CLK), .RN(RST), .Q(ALU_FUN[3]) );
  DFFRQX2M current_state_reg_2_ ( .D(n116), .CK(CLK), .RN(n5), .Q(
        current_state[2]) );
  DFFRQX2M current_state_reg_1_ ( .D(n115), .CK(CLK), .RN(n5), .Q(
        current_state[1]) );
  DFFRQX2M current_state_reg_3_ ( .D(n114), .CK(CLK), .RN(n5), .Q(
        current_state[3]) );
  DFFRQX2M CLKG_EN_reg ( .D(N189), .CK(CLK), .RN(RST), .Q(CLKG_EN) );
  INVX2M U3 ( .A(1'b0), .Y(CLKDIV_EN) );
  INVX2M U5 ( .A(n6), .Y(n5) );
  INVX2M U7 ( .A(N188), .Y(n11) );
  AND2X2M U8 ( .A(n40), .B(n13), .Y(n31) );
  BUFX2M U9 ( .A(n7), .Y(n6) );
  OAI32X1M U10 ( .A0(n12), .A1(n75), .A2(n20), .B0(n8), .B1(n76), .Y(n56) );
  INVX2M U11 ( .A(n61), .Y(n9) );
  AND3X2M U12 ( .A(n9), .B(n42), .C(n73), .Y(n71) );
  NOR3X2M U13 ( .A(n118), .B(n8), .C(n119), .Y(n73) );
  OAI21BX1M U14 ( .A0(n27), .A1(n28), .B0N(n23), .Y(n26) );
  OAI2BB1X2M U15 ( .A0N(n77), .A1N(n8), .B0(n24), .Y(n40) );
  OAI221X1M U16 ( .A0(n60), .A1(n61), .B0(n9), .B1(n19), .C0(n62), .Y(n115) );
  AOI21X2M U17 ( .A0(n42), .A1(n8), .B0(n40), .Y(n60) );
  NOR2X2M U18 ( .A(n11), .B(n43), .Y(n45) );
  NOR2X2M U19 ( .A(n54), .B(n43), .Y(n46) );
  NOR2X2M U20 ( .A(N177), .B(n13), .Y(n23) );
  NOR2X2M U21 ( .A(n76), .B(n12), .Y(N188) );
  OAI211X2M U22 ( .A0(n9), .A1(n20), .B0(n63), .C0(n64), .Y(n116) );
  OAI21X2M U23 ( .A0(n27), .A1(n40), .B0(n9), .Y(n63) );
  NAND2X2M U24 ( .A(n77), .B(n12), .Y(n54) );
  INVX2M U25 ( .A(n55), .Y(n10) );
  INVX2M U26 ( .A(n29), .Y(n13) );
  NAND4X2M U27 ( .A(n64), .B(n62), .C(n65), .D(n66), .Y(n117) );
  AOI22X1M U28 ( .A0(n9), .A1(n67), .B0(n8), .B1(n61), .Y(n66) );
  NAND3X2M U29 ( .A(n68), .B(n122), .C(n69), .Y(n65) );
  NAND2BX2M U30 ( .AN(n56), .B(n24), .Y(n67) );
  AND2X2M U31 ( .A(n28), .B(n13), .Y(n32) );
  INVX2M U32 ( .A(n8), .Y(n12) );
  OR3X2M U33 ( .A(n75), .B(n8), .C(n20), .Y(n24) );
  INVX2M U34 ( .A(n41), .Y(n18) );
  INVX2M U35 ( .A(RST), .Y(n7) );
  OAI222X1M U36 ( .A0(ALU_OUT_VLD), .A1(n11), .B0(UART_RX_VLD), .B1(n74), .C0(
        RF_RdData_VLD), .C1(n54), .Y(n61) );
  AOI211X2M U37 ( .A0(n20), .A1(n21), .B0(n56), .C0(n40), .Y(n74) );
  NAND2X2M U38 ( .A(current_state[1]), .B(n21), .Y(n75) );
  INVX2M U39 ( .A(current_state[2]), .Y(n20) );
  OAI21X2M U40 ( .A0(n9), .A1(n21), .B0(n57), .Y(n114) );
  AOI32X1M U41 ( .A0(n58), .A1(UART_RX_DATA[4]), .A2(n59), .B0(n9), .B1(n56), 
        .Y(n57) );
  NOR3X2M U42 ( .A(n122), .B(UART_RX_DATA[5]), .C(UART_RX_DATA[1]), .Y(n59) );
  AND3X2M U43 ( .A(UART_RX_DATA[6]), .B(UART_RX_DATA[2]), .C(n71), .Y(n58) );
  INVX2M U44 ( .A(current_state[3]), .Y(n21) );
  NOR3X2M U45 ( .A(n8), .B(current_state[2]), .C(n75), .Y(n28) );
  NOR3X2M U46 ( .A(n75), .B(current_state[2]), .C(n12), .Y(n27) );
  OAI21X2M U47 ( .A0(n28), .A1(n40), .B0(UART_RX_VLD), .Y(n29) );
  NOR3X2M U48 ( .A(current_state[1]), .B(current_state[3]), .C(n20), .Y(n77)
         );
  NAND2X2M U49 ( .A(UART_RX_VLD), .B(n56), .Y(n55) );
  OAI22X1M U50 ( .A0(n122), .A1(n55), .B0(n10), .B1(n17), .Y(n110) );
  OAI22X1M U51 ( .A0(n121), .A1(n55), .B0(n10), .B1(n16), .Y(n111) );
  OAI22X1M U52 ( .A0(n120), .A1(n55), .B0(n10), .B1(n15), .Y(n112) );
  OAI22X1M U53 ( .A0(n119), .A1(n55), .B0(n10), .B1(n14), .Y(n113) );
  AND3X2M U54 ( .A(UART_RX_DATA[5]), .B(UART_RX_DATA[1]), .C(n71), .Y(n68) );
  OAI2BB2X1M U55 ( .B0(n26), .B1(n119), .A0N(RF_Address[3]), .A1N(n23), .Y(n81) );
  OAI2BB2X1M U56 ( .B0(n26), .B1(n121), .A0N(RF_Address[1]), .A1N(n23), .Y(n79) );
  OAI2BB2X1M U57 ( .B0(n26), .B1(n120), .A0N(RF_Address[2]), .A1N(n23), .Y(n80) );
  NAND3X2M U58 ( .A(n58), .B(n122), .C(n72), .Y(n64) );
  NOR3X2M U59 ( .A(UART_RX_DATA[1]), .B(UART_RX_DATA[5]), .C(UART_RX_DATA[4]), 
        .Y(n72) );
  OAI21X2M U60 ( .A0(n23), .A1(n24), .B0(n25), .Y(n78) );
  AOI2BB2XLM U61 ( .B0(RF_Address[0]), .B1(n23), .A0N(n122), .A1N(n26), .Y(n25) );
  NAND3X2M U62 ( .A(n19), .B(n20), .C(current_state[3]), .Y(n76) );
  NAND3X2M U63 ( .A(n68), .B(UART_RX_DATA[4]), .C(n70), .Y(n62) );
  NOR3X2M U64 ( .A(n122), .B(UART_RX_DATA[6]), .C(UART_RX_DATA[2]), .Y(n70) );
  BUFX2M U65 ( .A(current_state[0]), .Y(n8) );
  INVX2M U66 ( .A(current_state[1]), .Y(n19) );
  AO2B2X2M U67 ( .B0(N188), .B1(ALU_OUT_VLD), .A0(RF_RdData_VLD), .A1N(n54), 
        .Y(n4) );
  INVX2M U68 ( .A(n4), .Y(n43) );
  AND2X2M U69 ( .A(n27), .B(UART_RX_VLD), .Y(N177) );
  OAI2BB1X2M U70 ( .A0N(RF_WrData[4]), .A1N(n29), .B0(n35), .Y(n89) );
  AOI22X1M U71 ( .A0(UART_RX_DATA[4]), .A1(n31), .B0(rf_wr_data_reg[4]), .B1(
        n32), .Y(n35) );
  OAI2BB1X2M U72 ( .A0N(UART_TX_DATA[0]), .A1N(n43), .B0(n44), .Y(n102) );
  AOI22X1M U73 ( .A0(ALU_OUT[0]), .A1(n45), .B0(RF_RdData[0]), .B1(n46), .Y(
        n44) );
  OAI2BB1X2M U74 ( .A0N(UART_TX_DATA[1]), .A1N(n43), .B0(n47), .Y(n103) );
  AOI22X1M U75 ( .A0(ALU_OUT[1]), .A1(n45), .B0(RF_RdData[1]), .B1(n46), .Y(
        n47) );
  OAI2BB1X2M U76 ( .A0N(UART_TX_DATA[2]), .A1N(n43), .B0(n48), .Y(n104) );
  AOI22X1M U77 ( .A0(ALU_OUT[2]), .A1(n45), .B0(RF_RdData[2]), .B1(n46), .Y(
        n48) );
  OAI2BB1X2M U78 ( .A0N(UART_TX_DATA[3]), .A1N(n43), .B0(n49), .Y(n105) );
  AOI22X1M U79 ( .A0(ALU_OUT[3]), .A1(n45), .B0(RF_RdData[3]), .B1(n46), .Y(
        n49) );
  OAI2BB1X2M U80 ( .A0N(UART_TX_DATA[4]), .A1N(n43), .B0(n50), .Y(n106) );
  AOI22X1M U81 ( .A0(ALU_OUT[4]), .A1(n45), .B0(RF_RdData[4]), .B1(n46), .Y(
        n50) );
  OAI2BB1X2M U82 ( .A0N(UART_TX_DATA[5]), .A1N(n43), .B0(n51), .Y(n107) );
  AOI22X1M U83 ( .A0(ALU_OUT[5]), .A1(n45), .B0(RF_RdData[5]), .B1(n46), .Y(
        n51) );
  OAI2BB1X2M U84 ( .A0N(UART_TX_DATA[6]), .A1N(n43), .B0(n52), .Y(n108) );
  AOI22X1M U85 ( .A0(ALU_OUT[6]), .A1(n45), .B0(RF_RdData[6]), .B1(n46), .Y(
        n52) );
  OAI2BB1X2M U86 ( .A0N(UART_TX_DATA[7]), .A1N(n43), .B0(n53), .Y(n109) );
  AOI22X1M U87 ( .A0(ALU_OUT[7]), .A1(n45), .B0(RF_RdData[7]), .B1(n46), .Y(
        n53) );
  OAI2BB1X2M U88 ( .A0N(RF_WrData[5]), .A1N(n29), .B0(n34), .Y(n88) );
  AOI22X1M U89 ( .A0(UART_RX_DATA[5]), .A1(n31), .B0(rf_wr_data_reg[5]), .B1(
        n32), .Y(n34) );
  OAI2BB1X2M U90 ( .A0N(RF_WrData[6]), .A1N(n29), .B0(n33), .Y(n87) );
  AOI22X1M U91 ( .A0(UART_RX_DATA[6]), .A1(n31), .B0(rf_wr_data_reg[6]), .B1(
        n32), .Y(n33) );
  OAI2BB1X2M U92 ( .A0N(RF_WrData[1]), .A1N(n29), .B0(n38), .Y(n92) );
  AOI22X1M U93 ( .A0(n31), .A1(UART_RX_DATA[1]), .B0(rf_wr_data_reg[1]), .B1(
        n32), .Y(n38) );
  OAI2BB1X2M U94 ( .A0N(RF_WrData[2]), .A1N(n29), .B0(n37), .Y(n91) );
  AOI22X1M U95 ( .A0(n31), .A1(UART_RX_DATA[2]), .B0(rf_wr_data_reg[2]), .B1(
        n32), .Y(n37) );
  OAI2BB1X2M U96 ( .A0N(RF_WrData[0]), .A1N(n29), .B0(n39), .Y(n93) );
  AOI22X1M U97 ( .A0(n31), .A1(UART_RX_DATA[0]), .B0(rf_wr_data_reg[0]), .B1(
        n32), .Y(n39) );
  OAI2BB1X2M U98 ( .A0N(RF_WrData[3]), .A1N(n29), .B0(n36), .Y(n90) );
  AOI22X1M U99 ( .A0(n31), .A1(UART_RX_DATA[3]), .B0(rf_wr_data_reg[3]), .B1(
        n32), .Y(n36) );
  OAI2BB1X2M U100 ( .A0N(RF_WrData[7]), .A1N(n29), .B0(n30), .Y(n86) );
  AOI22X1M U101 ( .A0(UART_RX_DATA[7]), .A1(n31), .B0(rf_wr_data_reg[7]), .B1(
        n32), .Y(n30) );
  NOR3X2M U102 ( .A(current_state[2]), .B(current_state[3]), .C(
        current_state[1]), .Y(n42) );
  NAND3X2M U103 ( .A(UART_RX_VLD), .B(n8), .C(n42), .Y(n41) );
  NOR3X2M U104 ( .A(UART_RX_DATA[2]), .B(UART_RX_DATA[6]), .C(UART_RX_DATA[4]), 
        .Y(n69) );
  OAI31X1M U105 ( .A0(n1), .A1(current_state[1]), .A2(current_state[2]), .B0(
        n22), .Y(N189) );
  INVX2M U106 ( .A(ALU_EN), .Y(n22) );
  NAND2X2M U107 ( .A(n8), .B(current_state[3]), .Y(n1) );
  OAI2BB2X1M U108 ( .B0(n122), .B1(n41), .A0N(n41), .A1N(rf_wr_data_reg[0]), 
        .Y(n94) );
  OAI2BB2X1M U109 ( .B0(n121), .B1(n41), .A0N(n41), .A1N(rf_wr_data_reg[1]), 
        .Y(n95) );
  OAI2BB2X1M U110 ( .B0(n120), .B1(n41), .A0N(n41), .A1N(rf_wr_data_reg[2]), 
        .Y(n96) );
  OAI2BB2X1M U111 ( .B0(n119), .B1(n41), .A0N(n41), .A1N(rf_wr_data_reg[3]), 
        .Y(n97) );
  OAI2BB2X1M U112 ( .B0(n118), .B1(n41), .A0N(n41), .A1N(rf_wr_data_reg[7]), 
        .Y(n101) );
  INVX2M U113 ( .A(UART_RX_DATA[0]), .Y(n122) );
  OAI2BB2X1M U114 ( .B0(n11), .B1(n17), .A0N(ALU_FUN[0]), .A1N(n11), .Y(n82)
         );
  OAI2BB2X1M U115 ( .B0(n11), .B1(n16), .A0N(ALU_FUN[1]), .A1N(n11), .Y(n83)
         );
  OAI2BB2X1M U116 ( .B0(n11), .B1(n15), .A0N(ALU_FUN[2]), .A1N(n11), .Y(n84)
         );
  OAI2BB2X1M U117 ( .B0(n11), .B1(n14), .A0N(ALU_FUN[3]), .A1N(n11), .Y(n85)
         );
  INVX2M U118 ( .A(UART_RX_DATA[1]), .Y(n121) );
  INVX2M U119 ( .A(UART_RX_DATA[2]), .Y(n120) );
  INVX2M U120 ( .A(UART_RX_DATA[3]), .Y(n119) );
  INVX2M U121 ( .A(UART_RX_DATA[7]), .Y(n118) );
  AO22X1M U122 ( .A0(UART_RX_DATA[4]), .A1(n18), .B0(n41), .B1(
        rf_wr_data_reg[4]), .Y(n98) );
  AO22X1M U123 ( .A0(UART_RX_DATA[5]), .A1(n18), .B0(n41), .B1(
        rf_wr_data_reg[5]), .Y(n99) );
  AO22X1M U124 ( .A0(UART_RX_DATA[6]), .A1(n18), .B0(n41), .B1(
        rf_wr_data_reg[6]), .Y(n100) );
endmodule


module RegFile ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, RdData_VLD, 
        REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn;
  output RdData_VLD;
  wire   regArr_15__7_, regArr_15__6_, regArr_15__5_, regArr_15__4_,
         regArr_15__3_, regArr_15__2_, regArr_15__1_, regArr_15__0_,
         regArr_14__7_, regArr_14__6_, regArr_14__5_, regArr_14__4_,
         regArr_14__3_, regArr_14__2_, regArr_14__1_, regArr_14__0_,
         regArr_13__7_, regArr_13__6_, regArr_13__5_, regArr_13__4_,
         regArr_13__3_, regArr_13__2_, regArr_13__1_, regArr_13__0_,
         regArr_12__7_, regArr_12__6_, regArr_12__5_, regArr_12__4_,
         regArr_12__3_, regArr_12__2_, regArr_12__1_, regArr_12__0_,
         regArr_11__7_, regArr_11__6_, regArr_11__5_, regArr_11__4_,
         regArr_11__3_, regArr_11__2_, regArr_11__1_, regArr_11__0_,
         regArr_10__7_, regArr_10__6_, regArr_10__5_, regArr_10__4_,
         regArr_10__3_, regArr_10__2_, regArr_10__1_, regArr_10__0_,
         regArr_9__7_, regArr_9__6_, regArr_9__5_, regArr_9__4_, regArr_9__3_,
         regArr_9__2_, regArr_9__1_, regArr_9__0_, regArr_8__7_, regArr_8__6_,
         regArr_8__5_, regArr_8__4_, regArr_8__3_, regArr_8__2_, regArr_8__1_,
         regArr_8__0_, regArr_7__7_, regArr_7__6_, regArr_7__5_, regArr_7__4_,
         regArr_7__3_, regArr_7__2_, regArr_7__1_, regArr_7__0_, regArr_6__7_,
         regArr_6__6_, regArr_6__5_, regArr_6__4_, regArr_6__3_, regArr_6__2_,
         regArr_6__1_, regArr_6__0_, regArr_5__7_, regArr_5__6_, regArr_5__5_,
         regArr_5__4_, regArr_5__3_, regArr_5__2_, regArr_5__1_, regArr_5__0_,
         regArr_4__7_, regArr_4__6_, regArr_4__5_, regArr_4__4_, regArr_4__3_,
         regArr_4__2_, regArr_4__1_, regArr_4__0_, N36, N37, N38, N39, N40,
         N41, N42, N43, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303;

  DFFRQX2M RdData_reg_7_ ( .D(n177), .CK(CLK), .RN(n287), .Q(RdData[7]) );
  DFFRQX2M RdData_reg_6_ ( .D(n176), .CK(CLK), .RN(n279), .Q(RdData[6]) );
  DFFRQX2M RdData_reg_5_ ( .D(n175), .CK(CLK), .RN(n283), .Q(RdData[5]) );
  DFFRQX2M RdData_reg_4_ ( .D(n174), .CK(CLK), .RN(n280), .Q(RdData[4]) );
  DFFRQX2M RdData_reg_3_ ( .D(n173), .CK(CLK), .RN(n280), .Q(RdData[3]) );
  DFFRQX2M RdData_reg_2_ ( .D(n172), .CK(CLK), .RN(n280), .Q(RdData[2]) );
  DFFRQX2M RdData_reg_1_ ( .D(n171), .CK(CLK), .RN(n280), .Q(RdData[1]) );
  DFFRQX2M RdData_reg_0_ ( .D(n170), .CK(CLK), .RN(n280), .Q(RdData[0]) );
  DFFRQX2M regArr_reg_15__7_ ( .D(n169), .CK(CLK), .RN(n279), .Q(regArr_15__7_) );
  DFFRQX2M regArr_reg_15__6_ ( .D(n168), .CK(CLK), .RN(n279), .Q(regArr_15__6_) );
  DFFRQX2M regArr_reg_15__5_ ( .D(n167), .CK(CLK), .RN(n279), .Q(regArr_15__5_) );
  DFFRQX2M regArr_reg_15__4_ ( .D(n166), .CK(CLK), .RN(n279), .Q(regArr_15__4_) );
  DFFRQX2M regArr_reg_15__3_ ( .D(n165), .CK(CLK), .RN(n279), .Q(regArr_15__3_) );
  DFFRQX2M regArr_reg_15__2_ ( .D(n164), .CK(CLK), .RN(n279), .Q(regArr_15__2_) );
  DFFRQX2M regArr_reg_15__1_ ( .D(n163), .CK(CLK), .RN(n279), .Q(regArr_15__1_) );
  DFFRQX2M regArr_reg_15__0_ ( .D(n162), .CK(CLK), .RN(n279), .Q(regArr_15__0_) );
  DFFRQX2M regArr_reg_13__7_ ( .D(n153), .CK(CLK), .RN(n280), .Q(regArr_13__7_) );
  DFFRQX2M regArr_reg_13__6_ ( .D(n152), .CK(CLK), .RN(n280), .Q(regArr_13__6_) );
  DFFRQX2M regArr_reg_13__5_ ( .D(n151), .CK(CLK), .RN(n280), .Q(regArr_13__5_) );
  DFFRQX2M regArr_reg_13__4_ ( .D(n150), .CK(CLK), .RN(n280), .Q(regArr_13__4_) );
  DFFRQX2M regArr_reg_13__3_ ( .D(n149), .CK(CLK), .RN(n280), .Q(regArr_13__3_) );
  DFFRQX2M regArr_reg_13__2_ ( .D(n148), .CK(CLK), .RN(n280), .Q(regArr_13__2_) );
  DFFRQX2M regArr_reg_13__1_ ( .D(n147), .CK(CLK), .RN(n280), .Q(regArr_13__1_) );
  DFFRQX2M regArr_reg_13__0_ ( .D(n146), .CK(CLK), .RN(n280), .Q(regArr_13__0_) );
  DFFRQX2M regArr_reg_11__7_ ( .D(n137), .CK(CLK), .RN(n281), .Q(regArr_11__7_) );
  DFFRQX2M regArr_reg_11__6_ ( .D(n136), .CK(CLK), .RN(n281), .Q(regArr_11__6_) );
  DFFRQX2M regArr_reg_11__5_ ( .D(n135), .CK(CLK), .RN(n281), .Q(regArr_11__5_) );
  DFFRQX2M regArr_reg_11__4_ ( .D(n134), .CK(CLK), .RN(n281), .Q(regArr_11__4_) );
  DFFRQX2M regArr_reg_11__3_ ( .D(n133), .CK(CLK), .RN(n281), .Q(regArr_11__3_) );
  DFFRQX2M regArr_reg_11__2_ ( .D(n132), .CK(CLK), .RN(n281), .Q(regArr_11__2_) );
  DFFRQX2M regArr_reg_11__1_ ( .D(n131), .CK(CLK), .RN(n281), .Q(regArr_11__1_) );
  DFFRQX2M regArr_reg_11__0_ ( .D(n130), .CK(CLK), .RN(n281), .Q(regArr_11__0_) );
  DFFRQX2M regArr_reg_9__7_ ( .D(n121), .CK(CLK), .RN(n282), .Q(regArr_9__7_)
         );
  DFFRQX2M regArr_reg_9__6_ ( .D(n120), .CK(CLK), .RN(n282), .Q(regArr_9__6_)
         );
  DFFRQX2M regArr_reg_9__5_ ( .D(n119), .CK(CLK), .RN(n282), .Q(regArr_9__5_)
         );
  DFFRQX2M regArr_reg_9__4_ ( .D(n118), .CK(CLK), .RN(n282), .Q(regArr_9__4_)
         );
  DFFRQX2M regArr_reg_9__3_ ( .D(n117), .CK(CLK), .RN(n282), .Q(regArr_9__3_)
         );
  DFFRQX2M regArr_reg_9__2_ ( .D(n116), .CK(CLK), .RN(n282), .Q(regArr_9__2_)
         );
  DFFRQX2M regArr_reg_9__1_ ( .D(n115), .CK(CLK), .RN(n282), .Q(regArr_9__1_)
         );
  DFFRQX2M regArr_reg_9__0_ ( .D(n114), .CK(CLK), .RN(n284), .Q(regArr_9__0_)
         );
  DFFRQX2M regArr_reg_7__7_ ( .D(n105), .CK(CLK), .RN(n283), .Q(regArr_7__7_)
         );
  DFFRQX2M regArr_reg_7__6_ ( .D(n104), .CK(CLK), .RN(n283), .Q(regArr_7__6_)
         );
  DFFRQX2M regArr_reg_7__5_ ( .D(n103), .CK(CLK), .RN(n283), .Q(regArr_7__5_)
         );
  DFFRQX2M regArr_reg_7__4_ ( .D(n102), .CK(CLK), .RN(n283), .Q(regArr_7__4_)
         );
  DFFRQX2M regArr_reg_7__3_ ( .D(n101), .CK(CLK), .RN(n283), .Q(regArr_7__3_)
         );
  DFFRQX2M regArr_reg_7__2_ ( .D(n100), .CK(CLK), .RN(n285), .Q(regArr_7__2_)
         );
  DFFRQX2M regArr_reg_7__1_ ( .D(n99), .CK(CLK), .RN(n285), .Q(regArr_7__1_)
         );
  DFFRQX2M regArr_reg_7__0_ ( .D(n98), .CK(CLK), .RN(n285), .Q(regArr_7__0_)
         );
  DFFRQX2M regArr_reg_5__7_ ( .D(n89), .CK(CLK), .RN(n284), .Q(regArr_5__7_)
         );
  DFFRQX2M regArr_reg_5__6_ ( .D(n88), .CK(CLK), .RN(n284), .Q(regArr_5__6_)
         );
  DFFRQX2M regArr_reg_5__5_ ( .D(n87), .CK(CLK), .RN(n284), .Q(regArr_5__5_)
         );
  DFFRQX2M regArr_reg_5__4_ ( .D(n86), .CK(CLK), .RN(n284), .Q(regArr_5__4_)
         );
  DFFRQX2M regArr_reg_5__3_ ( .D(n85), .CK(CLK), .RN(n286), .Q(regArr_5__3_)
         );
  DFFRQX2M regArr_reg_5__2_ ( .D(n84), .CK(CLK), .RN(n286), .Q(regArr_5__2_)
         );
  DFFRQX2M regArr_reg_5__1_ ( .D(n83), .CK(CLK), .RN(n286), .Q(regArr_5__1_)
         );
  DFFRQX2M regArr_reg_5__0_ ( .D(n82), .CK(CLK), .RN(n286), .Q(regArr_5__0_)
         );
  DFFRQX2M regArr_reg_14__7_ ( .D(n161), .CK(CLK), .RN(n279), .Q(regArr_14__7_) );
  DFFRQX2M regArr_reg_14__6_ ( .D(n160), .CK(CLK), .RN(n279), .Q(regArr_14__6_) );
  DFFRQX2M regArr_reg_14__5_ ( .D(n159), .CK(CLK), .RN(n281), .Q(regArr_14__5_) );
  DFFRQX2M regArr_reg_14__4_ ( .D(n158), .CK(CLK), .RN(n281), .Q(regArr_14__4_) );
  DFFRQX2M regArr_reg_14__3_ ( .D(n157), .CK(CLK), .RN(n281), .Q(regArr_14__3_) );
  DFFRQX2M regArr_reg_14__2_ ( .D(n156), .CK(CLK), .RN(n281), .Q(regArr_14__2_) );
  DFFRQX2M regArr_reg_14__1_ ( .D(n155), .CK(CLK), .RN(n281), .Q(regArr_14__1_) );
  DFFRQX2M regArr_reg_14__0_ ( .D(n154), .CK(CLK), .RN(n280), .Q(regArr_14__0_) );
  DFFRQX2M regArr_reg_12__7_ ( .D(n145), .CK(CLK), .RN(n280), .Q(regArr_12__7_) );
  DFFRQX2M regArr_reg_12__6_ ( .D(n144), .CK(CLK), .RN(n282), .Q(regArr_12__6_) );
  DFFRQX2M regArr_reg_12__5_ ( .D(n143), .CK(CLK), .RN(n282), .Q(regArr_12__5_) );
  DFFRQX2M regArr_reg_12__4_ ( .D(n142), .CK(CLK), .RN(n282), .Q(regArr_12__4_) );
  DFFRQX2M regArr_reg_12__3_ ( .D(n141), .CK(CLK), .RN(n282), .Q(regArr_12__3_) );
  DFFRQX2M regArr_reg_12__2_ ( .D(n140), .CK(CLK), .RN(n282), .Q(regArr_12__2_) );
  DFFRQX2M regArr_reg_12__1_ ( .D(n139), .CK(CLK), .RN(n281), .Q(regArr_12__1_) );
  DFFRQX2M regArr_reg_12__0_ ( .D(n138), .CK(CLK), .RN(n281), .Q(regArr_12__0_) );
  DFFRQX2M regArr_reg_10__7_ ( .D(n129), .CK(CLK), .RN(n283), .Q(regArr_10__7_) );
  DFFRQX2M regArr_reg_10__6_ ( .D(n128), .CK(CLK), .RN(n283), .Q(regArr_10__6_) );
  DFFRQX2M regArr_reg_10__5_ ( .D(n127), .CK(CLK), .RN(n283), .Q(regArr_10__5_) );
  DFFRQX2M regArr_reg_10__4_ ( .D(n126), .CK(CLK), .RN(n283), .Q(regArr_10__4_) );
  DFFRQX2M regArr_reg_10__3_ ( .D(n125), .CK(CLK), .RN(n283), .Q(regArr_10__3_) );
  DFFRQX2M regArr_reg_10__2_ ( .D(n124), .CK(CLK), .RN(n282), .Q(regArr_10__2_) );
  DFFRQX2M regArr_reg_10__1_ ( .D(n123), .CK(CLK), .RN(n282), .Q(regArr_10__1_) );
  DFFRQX2M regArr_reg_10__0_ ( .D(n122), .CK(CLK), .RN(n282), .Q(regArr_10__0_) );
  DFFRQX2M regArr_reg_8__7_ ( .D(n113), .CK(CLK), .RN(n284), .Q(regArr_8__7_)
         );
  DFFRQX2M regArr_reg_8__6_ ( .D(n112), .CK(CLK), .RN(n284), .Q(regArr_8__6_)
         );
  DFFRQX2M regArr_reg_8__5_ ( .D(n111), .CK(CLK), .RN(n284), .Q(regArr_8__5_)
         );
  DFFRQX2M regArr_reg_8__4_ ( .D(n110), .CK(CLK), .RN(n284), .Q(regArr_8__4_)
         );
  DFFRQX2M regArr_reg_8__3_ ( .D(n109), .CK(CLK), .RN(n284), .Q(regArr_8__3_)
         );
  DFFRQX2M regArr_reg_8__2_ ( .D(n108), .CK(CLK), .RN(n283), .Q(regArr_8__2_)
         );
  DFFRQX2M regArr_reg_8__1_ ( .D(n107), .CK(CLK), .RN(n283), .Q(regArr_8__1_)
         );
  DFFRQX2M regArr_reg_8__0_ ( .D(n106), .CK(CLK), .RN(n283), .Q(regArr_8__0_)
         );
  DFFRQX2M regArr_reg_6__7_ ( .D(n97), .CK(CLK), .RN(n285), .Q(regArr_6__7_)
         );
  DFFRQX2M regArr_reg_6__6_ ( .D(n96), .CK(CLK), .RN(n285), .Q(regArr_6__6_)
         );
  DFFRQX2M regArr_reg_6__5_ ( .D(n95), .CK(CLK), .RN(n285), .Q(regArr_6__5_)
         );
  DFFRQX2M regArr_reg_6__4_ ( .D(n94), .CK(CLK), .RN(n284), .Q(regArr_6__4_)
         );
  DFFRQX2M regArr_reg_6__3_ ( .D(n93), .CK(CLK), .RN(n284), .Q(regArr_6__3_)
         );
  DFFRQX2M regArr_reg_6__2_ ( .D(n92), .CK(CLK), .RN(n284), .Q(regArr_6__2_)
         );
  DFFRQX2M regArr_reg_6__1_ ( .D(n91), .CK(CLK), .RN(n284), .Q(regArr_6__1_)
         );
  DFFRQX2M regArr_reg_6__0_ ( .D(n90), .CK(CLK), .RN(n284), .Q(regArr_6__0_)
         );
  DFFRQX2M regArr_reg_4__7_ ( .D(n81), .CK(CLK), .RN(n286), .Q(regArr_4__7_)
         );
  DFFRQX2M regArr_reg_4__6_ ( .D(n80), .CK(CLK), .RN(n286), .Q(regArr_4__6_)
         );
  DFFRQX2M regArr_reg_4__5_ ( .D(n79), .CK(CLK), .RN(n285), .Q(regArr_4__5_)
         );
  DFFRQX2M regArr_reg_4__4_ ( .D(n78), .CK(CLK), .RN(n285), .Q(regArr_4__4_)
         );
  DFFRQX2M regArr_reg_4__3_ ( .D(n77), .CK(CLK), .RN(n285), .Q(regArr_4__3_)
         );
  DFFRQX2M regArr_reg_4__2_ ( .D(n76), .CK(CLK), .RN(n285), .Q(regArr_4__2_)
         );
  DFFRQX2M regArr_reg_4__1_ ( .D(n75), .CK(CLK), .RN(n285), .Q(regArr_4__1_)
         );
  DFFRQX2M regArr_reg_4__0_ ( .D(n74), .CK(CLK), .RN(n285), .Q(regArr_4__0_)
         );
  DFFRQX2M regArr_reg_3__0_ ( .D(n66), .CK(CLK), .RN(n287), .Q(REG3[0]) );
  DFFRQX2M regArr_reg_3__4_ ( .D(n70), .CK(CLK), .RN(n285), .Q(REG3[4]) );
  DFFRQX2M regArr_reg_3__2_ ( .D(n68), .CK(CLK), .RN(n287), .Q(REG3[2]) );
  DFFRQX2M regArr_reg_3__3_ ( .D(n69), .CK(CLK), .RN(n287), .Q(REG3[3]) );
  DFFRQX2M regArr_reg_3__6_ ( .D(n72), .CK(CLK), .RN(n285), .Q(REG3[6]) );
  DFFRQX2M regArr_reg_3__7_ ( .D(n73), .CK(CLK), .RN(n285), .Q(REG3[7]) );
  DFFRQX2M RdData_VLD_reg ( .D(n41), .CK(CLK), .RN(n283), .Q(RdData_VLD) );
  DFFSQX2M regArr_reg_3__5_ ( .D(n71), .CK(CLK), .SN(n279), .Q(REG3[5]) );
  DFFRQX2M regArr_reg_2__1_ ( .D(n59), .CK(CLK), .RN(n286), .Q(REG2[1]) );
  DFFRQX2M regArr_reg_3__1_ ( .D(n67), .CK(CLK), .RN(n287), .Q(REG3[1]) );
  DFFSQX2M regArr_reg_2__7_ ( .D(n65), .CK(CLK), .SN(n279), .Q(REG2[7]) );
  DFFRQX2M regArr_reg_2__6_ ( .D(n64), .CK(CLK), .RN(n287), .Q(REG2[6]) );
  DFFRQX2M regArr_reg_2__5_ ( .D(n63), .CK(CLK), .RN(n287), .Q(REG2[5]) );
  DFFRQX2M regArr_reg_2__4_ ( .D(n62), .CK(CLK), .RN(n286), .Q(REG2[4]) );
  DFFRQX2M regArr_reg_2__3_ ( .D(n61), .CK(CLK), .RN(n286), .Q(REG2[3]) );
  DFFSQX2M regArr_reg_2__0_ ( .D(n58), .CK(CLK), .SN(n279), .Q(REG2[0]) );
  DFFRQX2M regArr_reg_2__2_ ( .D(n60), .CK(CLK), .RN(n286), .Q(REG2[2]) );
  DFFRQX2M regArr_reg_0__1_ ( .D(n43), .CK(CLK), .RN(n287), .Q(REG0[1]) );
  DFFRQX2M regArr_reg_0__0_ ( .D(n42), .CK(CLK), .RN(n287), .Q(REG0[0]) );
  DFFRQX2M regArr_reg_0__2_ ( .D(n44), .CK(CLK), .RN(n287), .Q(REG0[2]) );
  DFFRQX2M regArr_reg_0__3_ ( .D(n45), .CK(CLK), .RN(n287), .Q(REG0[3]) );
  DFFRQX2M regArr_reg_0__4_ ( .D(n46), .CK(CLK), .RN(n287), .Q(REG0[4]) );
  DFFRQX2M regArr_reg_0__5_ ( .D(n47), .CK(CLK), .RN(n287), .Q(REG0[5]) );
  DFFRQX2M regArr_reg_0__7_ ( .D(n49), .CK(CLK), .RN(n287), .Q(REG0[7]) );
  DFFRQX2M regArr_reg_0__6_ ( .D(n48), .CK(CLK), .RN(n279), .Q(REG0[6]) );
  DFFRQX2M regArr_reg_1__1_ ( .D(n51), .CK(CLK), .RN(n288), .Q(REG1[1]) );
  DFFRQX2M regArr_reg_1__3_ ( .D(n53), .CK(CLK), .RN(n286), .Q(REG1[3]) );
  DFFRQX2M regArr_reg_1__2_ ( .D(n52), .CK(CLK), .RN(n288), .Q(REG1[2]) );
  DFFRQX2M regArr_reg_1__5_ ( .D(n55), .CK(CLK), .RN(n286), .Q(REG1[5]) );
  DFFRQX2M regArr_reg_1__7_ ( .D(n57), .CK(CLK), .RN(n286), .Q(REG1[7]) );
  DFFRQX2M regArr_reg_1__0_ ( .D(n50), .CK(CLK), .RN(n287), .Q(REG1[0]) );
  DFFRQX2M regArr_reg_1__4_ ( .D(n54), .CK(CLK), .RN(n286), .Q(REG1[4]) );
  DFFRQX2M regArr_reg_1__6_ ( .D(n56), .CK(CLK), .RN(n286), .Q(REG1[6]) );
  NOR2X2M U3 ( .A(n271), .B(Address[2]), .Y(n20) );
  NOR2X2M U4 ( .A(Address[1]), .B(Address[2]), .Y(n15) );
  INVX2M U5 ( .A(WrData[1]), .Y(n301) );
  INVX2M U6 ( .A(WrData[2]), .Y(n300) );
  INVX2M U7 ( .A(WrData[3]), .Y(n299) );
  INVX2M U8 ( .A(WrData[4]), .Y(n298) );
  INVX2M U9 ( .A(WrData[6]), .Y(n296) );
  INVX2M U10 ( .A(n277), .Y(n278) );
  INVX2M U11 ( .A(n1), .Y(n274) );
  BUFX2M U12 ( .A(n293), .Y(n279) );
  BUFX2M U13 ( .A(n290), .Y(n286) );
  BUFX2M U14 ( .A(n290), .Y(n285) );
  BUFX2M U15 ( .A(n291), .Y(n284) );
  BUFX2M U16 ( .A(n292), .Y(n282) );
  BUFX2M U17 ( .A(n292), .Y(n281) );
  BUFX2M U18 ( .A(n293), .Y(n280) );
  BUFX2M U19 ( .A(n291), .Y(n283) );
  BUFX2M U20 ( .A(n289), .Y(n287) );
  BUFX2M U21 ( .A(n289), .Y(n288) );
  OR2X2M U22 ( .A(n271), .B(n270), .Y(n1) );
  BUFX2M U23 ( .A(n4), .Y(n277) );
  INVX2M U24 ( .A(n3), .Y(n276) );
  INVX2M U25 ( .A(n2), .Y(n275) );
  NAND2X2M U26 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U27 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U28 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U29 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U30 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U31 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U32 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U33 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U34 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U35 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U36 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U37 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U38 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U39 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U40 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U41 ( .A(n15), .B(n16), .Y(n14) );
  AND2X2M U42 ( .A(n27), .B(n270), .Y(n16) );
  AND2X2M U43 ( .A(n38), .B(n270), .Y(n30) );
  INVX2M U44 ( .A(n40), .Y(n294) );
  BUFX2M U45 ( .A(RST), .Y(n290) );
  BUFX2M U46 ( .A(RST), .Y(n292) );
  BUFX2M U47 ( .A(RST), .Y(n291) );
  BUFX2M U48 ( .A(RST), .Y(n293) );
  BUFX2M U49 ( .A(RST), .Y(n289) );
  OR2X2M U50 ( .A(n271), .B(Address[0]), .Y(n2) );
  OR2X2M U51 ( .A(n270), .B(Address[1]), .Y(n3) );
  OR2X2M U52 ( .A(Address[0]), .B(Address[1]), .Y(n4) );
  INVX2M U53 ( .A(Address[1]), .Y(n271) );
  AO22X1M U54 ( .A0(N43), .A1(n294), .B0(RdData[0]), .B1(n40), .Y(n170) );
  AO22X1M U55 ( .A0(N42), .A1(n294), .B0(RdData[1]), .B1(n40), .Y(n171) );
  AO22X1M U56 ( .A0(N41), .A1(n294), .B0(RdData[2]), .B1(n40), .Y(n172) );
  AO22X1M U57 ( .A0(N40), .A1(n294), .B0(RdData[3]), .B1(n40), .Y(n173) );
  AO22X1M U58 ( .A0(N39), .A1(n294), .B0(RdData[4]), .B1(n40), .Y(n174) );
  AO22X1M U59 ( .A0(N38), .A1(n294), .B0(RdData[5]), .B1(n40), .Y(n175) );
  AO22X1M U60 ( .A0(N37), .A1(n294), .B0(RdData[6]), .B1(n40), .Y(n176) );
  AO22X1M U61 ( .A0(N36), .A1(n294), .B0(RdData[7]), .B1(n40), .Y(n177) );
  INVX2M U62 ( .A(Address[0]), .Y(n270) );
  INVX2M U63 ( .A(WrData[0]), .Y(n302) );
  INVX2M U64 ( .A(WrData[5]), .Y(n297) );
  INVX2M U65 ( .A(WrData[7]), .Y(n295) );
  NAND2X2M U66 ( .A(RdEn), .B(n303), .Y(n40) );
  NOR2X2M U67 ( .A(n303), .B(RdEn), .Y(n13) );
  OAI2BB2X1M U68 ( .B0(n14), .B1(n302), .A0N(REG0[0]), .A1N(n14), .Y(n42) );
  OAI2BB2X1M U69 ( .B0(n14), .B1(n301), .A0N(REG0[1]), .A1N(n14), .Y(n43) );
  OAI2BB2X1M U70 ( .B0(n14), .B1(n300), .A0N(REG0[2]), .A1N(n14), .Y(n44) );
  OAI2BB2X1M U71 ( .B0(n14), .B1(n299), .A0N(REG0[3]), .A1N(n14), .Y(n45) );
  OAI2BB2X1M U72 ( .B0(n14), .B1(n298), .A0N(REG0[4]), .A1N(n14), .Y(n46) );
  OAI2BB2X1M U73 ( .B0(n14), .B1(n297), .A0N(REG0[5]), .A1N(n14), .Y(n47) );
  OAI2BB2X1M U74 ( .B0(n14), .B1(n296), .A0N(REG0[6]), .A1N(n14), .Y(n48) );
  OAI2BB2X1M U75 ( .B0(n14), .B1(n295), .A0N(REG0[7]), .A1N(n14), .Y(n49) );
  OAI2BB2X1M U76 ( .B0(n301), .B1(n19), .A0N(REG2[1]), .A1N(n19), .Y(n59) );
  OAI2BB2X1M U77 ( .B0(n300), .B1(n19), .A0N(REG2[2]), .A1N(n19), .Y(n60) );
  OAI2BB2X1M U78 ( .B0(n299), .B1(n19), .A0N(REG2[3]), .A1N(n19), .Y(n61) );
  OAI2BB2X1M U79 ( .B0(n298), .B1(n19), .A0N(REG2[4]), .A1N(n19), .Y(n62) );
  OAI2BB2X1M U80 ( .B0(n297), .B1(n19), .A0N(REG2[5]), .A1N(n19), .Y(n63) );
  OAI2BB2X1M U81 ( .B0(n296), .B1(n19), .A0N(REG2[6]), .A1N(n19), .Y(n64) );
  OAI2BB2X1M U82 ( .B0(n302), .B1(n21), .A0N(REG3[0]), .A1N(n21), .Y(n66) );
  OAI2BB2X1M U83 ( .B0(n301), .B1(n21), .A0N(REG3[1]), .A1N(n21), .Y(n67) );
  OAI2BB2X1M U84 ( .B0(n300), .B1(n21), .A0N(REG3[2]), .A1N(n21), .Y(n68) );
  OAI2BB2X1M U85 ( .B0(n299), .B1(n21), .A0N(REG3[3]), .A1N(n21), .Y(n69) );
  OAI2BB2X1M U86 ( .B0(n298), .B1(n21), .A0N(REG3[4]), .A1N(n21), .Y(n70) );
  OAI2BB2X1M U87 ( .B0(n296), .B1(n21), .A0N(REG3[6]), .A1N(n21), .Y(n72) );
  OAI2BB2X1M U88 ( .B0(n295), .B1(n21), .A0N(REG3[7]), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U89 ( .B0(n302), .B1(n17), .A0N(REG1[0]), .A1N(n17), .Y(n50) );
  OAI2BB2X1M U90 ( .B0(n301), .B1(n17), .A0N(REG1[1]), .A1N(n17), .Y(n51) );
  OAI2BB2X1M U91 ( .B0(n300), .B1(n17), .A0N(REG1[2]), .A1N(n17), .Y(n52) );
  OAI2BB2X1M U92 ( .B0(n299), .B1(n17), .A0N(REG1[3]), .A1N(n17), .Y(n53) );
  OAI2BB2X1M U93 ( .B0(n298), .B1(n17), .A0N(REG1[4]), .A1N(n17), .Y(n54) );
  OAI2BB2X1M U94 ( .B0(n297), .B1(n17), .A0N(REG1[5]), .A1N(n17), .Y(n55) );
  OAI2BB2X1M U95 ( .B0(n296), .B1(n17), .A0N(REG1[6]), .A1N(n17), .Y(n56) );
  OAI2BB2X1M U96 ( .B0(n295), .B1(n17), .A0N(REG1[7]), .A1N(n17), .Y(n57) );
  OAI2BB2X1M U97 ( .B0(n302), .B1(n29), .A0N(regArr_8__0_), .A1N(n29), .Y(n106) );
  OAI2BB2X1M U98 ( .B0(n301), .B1(n29), .A0N(regArr_8__1_), .A1N(n29), .Y(n107) );
  OAI2BB2X1M U99 ( .B0(n300), .B1(n29), .A0N(regArr_8__2_), .A1N(n29), .Y(n108) );
  OAI2BB2X1M U100 ( .B0(n299), .B1(n29), .A0N(regArr_8__3_), .A1N(n29), .Y(
        n109) );
  OAI2BB2X1M U101 ( .B0(n298), .B1(n29), .A0N(regArr_8__4_), .A1N(n29), .Y(
        n110) );
  OAI2BB2X1M U102 ( .B0(n297), .B1(n29), .A0N(regArr_8__5_), .A1N(n29), .Y(
        n111) );
  OAI2BB2X1M U103 ( .B0(n296), .B1(n29), .A0N(regArr_8__6_), .A1N(n29), .Y(
        n112) );
  OAI2BB2X1M U104 ( .B0(n295), .B1(n29), .A0N(regArr_8__7_), .A1N(n29), .Y(
        n113) );
  OAI2BB2X1M U105 ( .B0(n302), .B1(n31), .A0N(regArr_9__0_), .A1N(n31), .Y(
        n114) );
  OAI2BB2X1M U106 ( .B0(n301), .B1(n31), .A0N(regArr_9__1_), .A1N(n31), .Y(
        n115) );
  OAI2BB2X1M U107 ( .B0(n300), .B1(n31), .A0N(regArr_9__2_), .A1N(n31), .Y(
        n116) );
  OAI2BB2X1M U108 ( .B0(n299), .B1(n31), .A0N(regArr_9__3_), .A1N(n31), .Y(
        n117) );
  OAI2BB2X1M U109 ( .B0(n298), .B1(n31), .A0N(regArr_9__4_), .A1N(n31), .Y(
        n118) );
  OAI2BB2X1M U110 ( .B0(n297), .B1(n31), .A0N(regArr_9__5_), .A1N(n31), .Y(
        n119) );
  OAI2BB2X1M U111 ( .B0(n296), .B1(n31), .A0N(regArr_9__6_), .A1N(n31), .Y(
        n120) );
  OAI2BB2X1M U112 ( .B0(n295), .B1(n31), .A0N(regArr_9__7_), .A1N(n31), .Y(
        n121) );
  OAI2BB2X1M U113 ( .B0(n302), .B1(n33), .A0N(regArr_10__0_), .A1N(n33), .Y(
        n122) );
  OAI2BB2X1M U114 ( .B0(n301), .B1(n33), .A0N(regArr_10__1_), .A1N(n33), .Y(
        n123) );
  OAI2BB2X1M U115 ( .B0(n300), .B1(n33), .A0N(regArr_10__2_), .A1N(n33), .Y(
        n124) );
  OAI2BB2X1M U116 ( .B0(n299), .B1(n33), .A0N(regArr_10__3_), .A1N(n33), .Y(
        n125) );
  OAI2BB2X1M U117 ( .B0(n298), .B1(n33), .A0N(regArr_10__4_), .A1N(n33), .Y(
        n126) );
  OAI2BB2X1M U118 ( .B0(n297), .B1(n33), .A0N(regArr_10__5_), .A1N(n33), .Y(
        n127) );
  OAI2BB2X1M U119 ( .B0(n296), .B1(n33), .A0N(regArr_10__6_), .A1N(n33), .Y(
        n128) );
  OAI2BB2X1M U120 ( .B0(n295), .B1(n33), .A0N(regArr_10__7_), .A1N(n33), .Y(
        n129) );
  OAI2BB2X1M U121 ( .B0(n302), .B1(n34), .A0N(regArr_11__0_), .A1N(n34), .Y(
        n130) );
  OAI2BB2X1M U122 ( .B0(n301), .B1(n34), .A0N(regArr_11__1_), .A1N(n34), .Y(
        n131) );
  OAI2BB2X1M U123 ( .B0(n300), .B1(n34), .A0N(regArr_11__2_), .A1N(n34), .Y(
        n132) );
  OAI2BB2X1M U124 ( .B0(n299), .B1(n34), .A0N(regArr_11__3_), .A1N(n34), .Y(
        n133) );
  OAI2BB2X1M U125 ( .B0(n298), .B1(n34), .A0N(regArr_11__4_), .A1N(n34), .Y(
        n134) );
  OAI2BB2X1M U126 ( .B0(n297), .B1(n34), .A0N(regArr_11__5_), .A1N(n34), .Y(
        n135) );
  OAI2BB2X1M U127 ( .B0(n296), .B1(n34), .A0N(regArr_11__6_), .A1N(n34), .Y(
        n136) );
  OAI2BB2X1M U128 ( .B0(n295), .B1(n34), .A0N(regArr_11__7_), .A1N(n34), .Y(
        n137) );
  OAI2BB2X1M U129 ( .B0(n302), .B1(n22), .A0N(regArr_4__0_), .A1N(n22), .Y(n74) );
  OAI2BB2X1M U130 ( .B0(n301), .B1(n22), .A0N(regArr_4__1_), .A1N(n22), .Y(n75) );
  OAI2BB2X1M U131 ( .B0(n300), .B1(n22), .A0N(regArr_4__2_), .A1N(n22), .Y(n76) );
  OAI2BB2X1M U132 ( .B0(n299), .B1(n22), .A0N(regArr_4__3_), .A1N(n22), .Y(n77) );
  OAI2BB2X1M U133 ( .B0(n298), .B1(n22), .A0N(regArr_4__4_), .A1N(n22), .Y(n78) );
  OAI2BB2X1M U134 ( .B0(n297), .B1(n22), .A0N(regArr_4__5_), .A1N(n22), .Y(n79) );
  OAI2BB2X1M U135 ( .B0(n296), .B1(n22), .A0N(regArr_4__6_), .A1N(n22), .Y(n80) );
  OAI2BB2X1M U136 ( .B0(n295), .B1(n22), .A0N(regArr_4__7_), .A1N(n22), .Y(n81) );
  OAI2BB2X1M U137 ( .B0(n302), .B1(n24), .A0N(regArr_5__0_), .A1N(n24), .Y(n82) );
  OAI2BB2X1M U138 ( .B0(n301), .B1(n24), .A0N(regArr_5__1_), .A1N(n24), .Y(n83) );
  OAI2BB2X1M U139 ( .B0(n300), .B1(n24), .A0N(regArr_5__2_), .A1N(n24), .Y(n84) );
  OAI2BB2X1M U140 ( .B0(n299), .B1(n24), .A0N(regArr_5__3_), .A1N(n24), .Y(n85) );
  OAI2BB2X1M U141 ( .B0(n298), .B1(n24), .A0N(regArr_5__4_), .A1N(n24), .Y(n86) );
  OAI2BB2X1M U142 ( .B0(n297), .B1(n24), .A0N(regArr_5__5_), .A1N(n24), .Y(n87) );
  OAI2BB2X1M U143 ( .B0(n296), .B1(n24), .A0N(regArr_5__6_), .A1N(n24), .Y(n88) );
  OAI2BB2X1M U144 ( .B0(n295), .B1(n24), .A0N(regArr_5__7_), .A1N(n24), .Y(n89) );
  OAI2BB2X1M U145 ( .B0(n302), .B1(n25), .A0N(regArr_6__0_), .A1N(n25), .Y(n90) );
  OAI2BB2X1M U146 ( .B0(n301), .B1(n25), .A0N(regArr_6__1_), .A1N(n25), .Y(n91) );
  OAI2BB2X1M U147 ( .B0(n300), .B1(n25), .A0N(regArr_6__2_), .A1N(n25), .Y(n92) );
  OAI2BB2X1M U148 ( .B0(n299), .B1(n25), .A0N(regArr_6__3_), .A1N(n25), .Y(n93) );
  OAI2BB2X1M U149 ( .B0(n298), .B1(n25), .A0N(regArr_6__4_), .A1N(n25), .Y(n94) );
  OAI2BB2X1M U150 ( .B0(n297), .B1(n25), .A0N(regArr_6__5_), .A1N(n25), .Y(n95) );
  OAI2BB2X1M U151 ( .B0(n296), .B1(n25), .A0N(regArr_6__6_), .A1N(n25), .Y(n96) );
  OAI2BB2X1M U152 ( .B0(n295), .B1(n25), .A0N(regArr_6__7_), .A1N(n25), .Y(n97) );
  OAI2BB2X1M U153 ( .B0(n302), .B1(n28), .A0N(regArr_7__0_), .A1N(n28), .Y(n98) );
  OAI2BB2X1M U154 ( .B0(n301), .B1(n28), .A0N(regArr_7__1_), .A1N(n28), .Y(n99) );
  OAI2BB2X1M U155 ( .B0(n300), .B1(n28), .A0N(regArr_7__2_), .A1N(n28), .Y(
        n100) );
  OAI2BB2X1M U156 ( .B0(n299), .B1(n28), .A0N(regArr_7__3_), .A1N(n28), .Y(
        n101) );
  OAI2BB2X1M U157 ( .B0(n298), .B1(n28), .A0N(regArr_7__4_), .A1N(n28), .Y(
        n102) );
  OAI2BB2X1M U158 ( .B0(n297), .B1(n28), .A0N(regArr_7__5_), .A1N(n28), .Y(
        n103) );
  OAI2BB2X1M U159 ( .B0(n296), .B1(n28), .A0N(regArr_7__6_), .A1N(n28), .Y(
        n104) );
  OAI2BB2X1M U160 ( .B0(n295), .B1(n28), .A0N(regArr_7__7_), .A1N(n28), .Y(
        n105) );
  OAI2BB2X1M U161 ( .B0(n302), .B1(n35), .A0N(regArr_12__0_), .A1N(n35), .Y(
        n138) );
  OAI2BB2X1M U162 ( .B0(n301), .B1(n35), .A0N(regArr_12__1_), .A1N(n35), .Y(
        n139) );
  OAI2BB2X1M U163 ( .B0(n300), .B1(n35), .A0N(regArr_12__2_), .A1N(n35), .Y(
        n140) );
  OAI2BB2X1M U164 ( .B0(n299), .B1(n35), .A0N(regArr_12__3_), .A1N(n35), .Y(
        n141) );
  OAI2BB2X1M U165 ( .B0(n298), .B1(n35), .A0N(regArr_12__4_), .A1N(n35), .Y(
        n142) );
  OAI2BB2X1M U166 ( .B0(n297), .B1(n35), .A0N(regArr_12__5_), .A1N(n35), .Y(
        n143) );
  OAI2BB2X1M U167 ( .B0(n296), .B1(n35), .A0N(regArr_12__6_), .A1N(n35), .Y(
        n144) );
  OAI2BB2X1M U168 ( .B0(n295), .B1(n35), .A0N(regArr_12__7_), .A1N(n35), .Y(
        n145) );
  OAI2BB2X1M U169 ( .B0(n302), .B1(n36), .A0N(regArr_13__0_), .A1N(n36), .Y(
        n146) );
  OAI2BB2X1M U170 ( .B0(n301), .B1(n36), .A0N(regArr_13__1_), .A1N(n36), .Y(
        n147) );
  OAI2BB2X1M U171 ( .B0(n300), .B1(n36), .A0N(regArr_13__2_), .A1N(n36), .Y(
        n148) );
  OAI2BB2X1M U172 ( .B0(n299), .B1(n36), .A0N(regArr_13__3_), .A1N(n36), .Y(
        n149) );
  OAI2BB2X1M U173 ( .B0(n298), .B1(n36), .A0N(regArr_13__4_), .A1N(n36), .Y(
        n150) );
  OAI2BB2X1M U174 ( .B0(n297), .B1(n36), .A0N(regArr_13__5_), .A1N(n36), .Y(
        n151) );
  OAI2BB2X1M U175 ( .B0(n296), .B1(n36), .A0N(regArr_13__6_), .A1N(n36), .Y(
        n152) );
  OAI2BB2X1M U176 ( .B0(n295), .B1(n36), .A0N(regArr_13__7_), .A1N(n36), .Y(
        n153) );
  OAI2BB2X1M U177 ( .B0(n302), .B1(n37), .A0N(regArr_14__0_), .A1N(n37), .Y(
        n154) );
  OAI2BB2X1M U178 ( .B0(n301), .B1(n37), .A0N(regArr_14__1_), .A1N(n37), .Y(
        n155) );
  OAI2BB2X1M U179 ( .B0(n300), .B1(n37), .A0N(regArr_14__2_), .A1N(n37), .Y(
        n156) );
  OAI2BB2X1M U180 ( .B0(n299), .B1(n37), .A0N(regArr_14__3_), .A1N(n37), .Y(
        n157) );
  OAI2BB2X1M U181 ( .B0(n298), .B1(n37), .A0N(regArr_14__4_), .A1N(n37), .Y(
        n158) );
  OAI2BB2X1M U182 ( .B0(n297), .B1(n37), .A0N(regArr_14__5_), .A1N(n37), .Y(
        n159) );
  OAI2BB2X1M U183 ( .B0(n296), .B1(n37), .A0N(regArr_14__6_), .A1N(n37), .Y(
        n160) );
  OAI2BB2X1M U184 ( .B0(n295), .B1(n37), .A0N(regArr_14__7_), .A1N(n37), .Y(
        n161) );
  OAI2BB2X1M U185 ( .B0(n302), .B1(n39), .A0N(regArr_15__0_), .A1N(n39), .Y(
        n162) );
  OAI2BB2X1M U186 ( .B0(n301), .B1(n39), .A0N(regArr_15__1_), .A1N(n39), .Y(
        n163) );
  OAI2BB2X1M U187 ( .B0(n300), .B1(n39), .A0N(regArr_15__2_), .A1N(n39), .Y(
        n164) );
  OAI2BB2X1M U188 ( .B0(n299), .B1(n39), .A0N(regArr_15__3_), .A1N(n39), .Y(
        n165) );
  OAI2BB2X1M U189 ( .B0(n298), .B1(n39), .A0N(regArr_15__4_), .A1N(n39), .Y(
        n166) );
  OAI2BB2X1M U190 ( .B0(n297), .B1(n39), .A0N(regArr_15__5_), .A1N(n39), .Y(
        n167) );
  OAI2BB2X1M U191 ( .B0(n296), .B1(n39), .A0N(regArr_15__6_), .A1N(n39), .Y(
        n168) );
  OAI2BB2X1M U192 ( .B0(n295), .B1(n39), .A0N(regArr_15__7_), .A1N(n39), .Y(
        n169) );
  OAI2BB2X1M U193 ( .B0(n302), .B1(n19), .A0N(REG2[0]), .A1N(n19), .Y(n58) );
  OAI2BB2X1M U194 ( .B0(n295), .B1(n19), .A0N(REG2[7]), .A1N(n19), .Y(n65) );
  OAI2BB2X1M U195 ( .B0(n297), .B1(n21), .A0N(REG3[5]), .A1N(n21), .Y(n71) );
  AND2X2M U196 ( .A(Address[2]), .B(n271), .Y(n23) );
  AND2X2M U197 ( .A(Address[2]), .B(Address[1]), .Y(n26) );
  AND2X2M U198 ( .A(n27), .B(Address[0]), .Y(n18) );
  AND2X2M U199 ( .A(n38), .B(Address[0]), .Y(n32) );
  NOR2BX2M U200 ( .AN(n13), .B(Address[3]), .Y(n27) );
  INVX2M U201 ( .A(WrEn), .Y(n303) );
  INVX2M U202 ( .A(Address[2]), .Y(n272) );
  AND2X2M U203 ( .A(Address[3]), .B(n13), .Y(n38) );
  INVX2M U204 ( .A(Address[3]), .Y(n273) );
  AO21XLM U205 ( .A0(RdData_VLD), .A1(n13), .B0(n294), .Y(n41) );
  AOI22X1M U206 ( .A0(regArr_10__0_), .A1(n275), .B0(regArr_11__0_), .B1(n274), 
        .Y(n6) );
  AOI22X1M U207 ( .A0(regArr_8__0_), .A1(n278), .B0(regArr_9__0_), .B1(n276), 
        .Y(n5) );
  CLKNAND2X2M U208 ( .A(Address[3]), .B(n272), .Y(n254) );
  AOI21X1M U209 ( .A0(n6), .A1(n5), .B0(n254), .Y(n181) );
  AOI22X1M U210 ( .A0(regArr_14__0_), .A1(n275), .B0(regArr_15__0_), .B1(n274), 
        .Y(n8) );
  AOI22X1M U211 ( .A0(regArr_12__0_), .A1(n278), .B0(regArr_13__0_), .B1(n276), 
        .Y(n7) );
  CLKNAND2X2M U212 ( .A(Address[3]), .B(Address[2]), .Y(n257) );
  AOI21X1M U213 ( .A0(n8), .A1(n7), .B0(n257), .Y(n180) );
  AOI22X1M U214 ( .A0(REG2[0]), .A1(n275), .B0(REG3[0]), .B1(n274), .Y(n10) );
  AOI22X1M U215 ( .A0(REG0[0]), .A1(n278), .B0(REG1[0]), .B1(n276), .Y(n9) );
  CLKNAND2X2M U216 ( .A(n272), .B(n273), .Y(n260) );
  AOI21X1M U217 ( .A0(n10), .A1(n9), .B0(n260), .Y(n179) );
  AOI22X1M U218 ( .A0(regArr_6__0_), .A1(n275), .B0(regArr_7__0_), .B1(n274), 
        .Y(n12) );
  AOI22X1M U219 ( .A0(regArr_4__0_), .A1(n278), .B0(regArr_5__0_), .B1(n276), 
        .Y(n11) );
  CLKNAND2X2M U220 ( .A(Address[2]), .B(n273), .Y(n263) );
  AOI21X1M U221 ( .A0(n12), .A1(n11), .B0(n263), .Y(n178) );
  OR4X1M U222 ( .A(n181), .B(n180), .C(n179), .D(n178), .Y(N43) );
  AOI22X1M U223 ( .A0(regArr_10__1_), .A1(n275), .B0(regArr_11__1_), .B1(n274), 
        .Y(n183) );
  AOI22X1M U224 ( .A0(regArr_8__1_), .A1(n278), .B0(regArr_9__1_), .B1(n276), 
        .Y(n182) );
  AOI21X1M U225 ( .A0(n183), .A1(n182), .B0(n254), .Y(n193) );
  AOI22X1M U226 ( .A0(regArr_14__1_), .A1(n275), .B0(regArr_15__1_), .B1(n274), 
        .Y(n185) );
  AOI22X1M U227 ( .A0(regArr_12__1_), .A1(n278), .B0(regArr_13__1_), .B1(n276), 
        .Y(n184) );
  AOI21X1M U228 ( .A0(n185), .A1(n184), .B0(n257), .Y(n192) );
  AOI22X1M U229 ( .A0(REG2[1]), .A1(n275), .B0(REG3[1]), .B1(n274), .Y(n187)
         );
  AOI22X1M U230 ( .A0(REG0[1]), .A1(n278), .B0(REG1[1]), .B1(n276), .Y(n186)
         );
  AOI21X1M U231 ( .A0(n187), .A1(n186), .B0(n260), .Y(n191) );
  AOI22X1M U232 ( .A0(regArr_6__1_), .A1(n275), .B0(regArr_7__1_), .B1(n274), 
        .Y(n189) );
  AOI22X1M U233 ( .A0(regArr_4__1_), .A1(n278), .B0(regArr_5__1_), .B1(n276), 
        .Y(n188) );
  AOI21X1M U234 ( .A0(n189), .A1(n188), .B0(n263), .Y(n190) );
  OR4X1M U235 ( .A(n193), .B(n192), .C(n191), .D(n190), .Y(N42) );
  AOI22X1M U236 ( .A0(regArr_10__2_), .A1(n275), .B0(regArr_11__2_), .B1(n274), 
        .Y(n195) );
  AOI22X1M U237 ( .A0(regArr_8__2_), .A1(n278), .B0(regArr_9__2_), .B1(n276), 
        .Y(n194) );
  AOI21X1M U238 ( .A0(n195), .A1(n194), .B0(n254), .Y(n205) );
  AOI22X1M U239 ( .A0(regArr_14__2_), .A1(n275), .B0(regArr_15__2_), .B1(n274), 
        .Y(n197) );
  AOI22X1M U240 ( .A0(regArr_12__2_), .A1(n278), .B0(regArr_13__2_), .B1(n276), 
        .Y(n196) );
  AOI21X1M U241 ( .A0(n197), .A1(n196), .B0(n257), .Y(n204) );
  AOI22X1M U242 ( .A0(REG2[2]), .A1(n275), .B0(REG3[2]), .B1(n274), .Y(n199)
         );
  AOI22X1M U243 ( .A0(REG0[2]), .A1(n278), .B0(REG1[2]), .B1(n276), .Y(n198)
         );
  AOI21X1M U244 ( .A0(n199), .A1(n198), .B0(n260), .Y(n203) );
  AOI22X1M U245 ( .A0(regArr_6__2_), .A1(n275), .B0(regArr_7__2_), .B1(n274), 
        .Y(n201) );
  AOI22X1M U246 ( .A0(regArr_4__2_), .A1(n278), .B0(regArr_5__2_), .B1(n276), 
        .Y(n200) );
  AOI21X1M U247 ( .A0(n201), .A1(n200), .B0(n263), .Y(n202) );
  OR4X1M U248 ( .A(n205), .B(n204), .C(n203), .D(n202), .Y(N41) );
  AOI22X1M U249 ( .A0(regArr_10__3_), .A1(n275), .B0(regArr_11__3_), .B1(n274), 
        .Y(n207) );
  AOI22X1M U250 ( .A0(regArr_8__3_), .A1(n278), .B0(regArr_9__3_), .B1(n276), 
        .Y(n206) );
  AOI21X1M U251 ( .A0(n207), .A1(n206), .B0(n254), .Y(n217) );
  AOI22X1M U252 ( .A0(regArr_14__3_), .A1(n275), .B0(regArr_15__3_), .B1(n274), 
        .Y(n209) );
  AOI22X1M U253 ( .A0(regArr_12__3_), .A1(n278), .B0(regArr_13__3_), .B1(n276), 
        .Y(n208) );
  AOI21X1M U254 ( .A0(n209), .A1(n208), .B0(n257), .Y(n216) );
  AOI22X1M U255 ( .A0(REG2[3]), .A1(n275), .B0(REG3[3]), .B1(n274), .Y(n211)
         );
  AOI22X1M U256 ( .A0(REG0[3]), .A1(n278), .B0(REG1[3]), .B1(n276), .Y(n210)
         );
  AOI21X1M U257 ( .A0(n211), .A1(n210), .B0(n260), .Y(n215) );
  AOI22X1M U258 ( .A0(regArr_6__3_), .A1(n275), .B0(regArr_7__3_), .B1(n274), 
        .Y(n213) );
  AOI22X1M U259 ( .A0(regArr_4__3_), .A1(n278), .B0(regArr_5__3_), .B1(n276), 
        .Y(n212) );
  AOI21X1M U260 ( .A0(n213), .A1(n212), .B0(n263), .Y(n214) );
  OR4X1M U261 ( .A(n217), .B(n216), .C(n215), .D(n214), .Y(N40) );
  AOI22X1M U262 ( .A0(regArr_10__4_), .A1(n275), .B0(regArr_11__4_), .B1(n274), 
        .Y(n219) );
  AOI22X1M U263 ( .A0(regArr_8__4_), .A1(n278), .B0(regArr_9__4_), .B1(n276), 
        .Y(n218) );
  AOI21X1M U264 ( .A0(n219), .A1(n218), .B0(n254), .Y(n229) );
  AOI22X1M U265 ( .A0(regArr_14__4_), .A1(n275), .B0(regArr_15__4_), .B1(n274), 
        .Y(n221) );
  AOI22X1M U266 ( .A0(regArr_12__4_), .A1(n278), .B0(regArr_13__4_), .B1(n276), 
        .Y(n220) );
  AOI21X1M U267 ( .A0(n221), .A1(n220), .B0(n257), .Y(n228) );
  AOI22X1M U268 ( .A0(REG2[4]), .A1(n275), .B0(REG3[4]), .B1(n274), .Y(n223)
         );
  AOI22X1M U269 ( .A0(REG0[4]), .A1(n278), .B0(REG1[4]), .B1(n276), .Y(n222)
         );
  AOI21X1M U270 ( .A0(n223), .A1(n222), .B0(n260), .Y(n227) );
  AOI22X1M U271 ( .A0(regArr_6__4_), .A1(n275), .B0(regArr_7__4_), .B1(n274), 
        .Y(n225) );
  AOI22X1M U272 ( .A0(regArr_4__4_), .A1(n278), .B0(regArr_5__4_), .B1(n276), 
        .Y(n224) );
  AOI21X1M U273 ( .A0(n225), .A1(n224), .B0(n263), .Y(n226) );
  OR4X1M U274 ( .A(n229), .B(n228), .C(n227), .D(n226), .Y(N39) );
  AOI22X1M U275 ( .A0(regArr_10__5_), .A1(n275), .B0(regArr_11__5_), .B1(n274), 
        .Y(n231) );
  AOI22X1M U276 ( .A0(regArr_8__5_), .A1(n278), .B0(regArr_9__5_), .B1(n276), 
        .Y(n230) );
  AOI21X1M U277 ( .A0(n231), .A1(n230), .B0(n254), .Y(n241) );
  AOI22X1M U278 ( .A0(regArr_14__5_), .A1(n275), .B0(regArr_15__5_), .B1(n274), 
        .Y(n233) );
  AOI22X1M U279 ( .A0(regArr_12__5_), .A1(n278), .B0(regArr_13__5_), .B1(n276), 
        .Y(n232) );
  AOI21X1M U280 ( .A0(n233), .A1(n232), .B0(n257), .Y(n240) );
  AOI22X1M U281 ( .A0(REG2[5]), .A1(n275), .B0(REG3[5]), .B1(n274), .Y(n235)
         );
  AOI22X1M U282 ( .A0(REG0[5]), .A1(n278), .B0(REG1[5]), .B1(n276), .Y(n234)
         );
  AOI21X1M U283 ( .A0(n235), .A1(n234), .B0(n260), .Y(n239) );
  AOI22X1M U284 ( .A0(regArr_6__5_), .A1(n275), .B0(regArr_7__5_), .B1(n274), 
        .Y(n237) );
  AOI22X1M U285 ( .A0(regArr_4__5_), .A1(n278), .B0(regArr_5__5_), .B1(n276), 
        .Y(n236) );
  AOI21X1M U286 ( .A0(n237), .A1(n236), .B0(n263), .Y(n238) );
  OR4X1M U287 ( .A(n241), .B(n240), .C(n239), .D(n238), .Y(N38) );
  AOI22X1M U288 ( .A0(regArr_10__6_), .A1(n275), .B0(regArr_11__6_), .B1(n274), 
        .Y(n243) );
  AOI22X1M U289 ( .A0(regArr_8__6_), .A1(n278), .B0(regArr_9__6_), .B1(n276), 
        .Y(n242) );
  AOI21X1M U290 ( .A0(n243), .A1(n242), .B0(n254), .Y(n253) );
  AOI22X1M U291 ( .A0(regArr_14__6_), .A1(n275), .B0(regArr_15__6_), .B1(n274), 
        .Y(n245) );
  AOI22X1M U292 ( .A0(regArr_12__6_), .A1(n278), .B0(regArr_13__6_), .B1(n276), 
        .Y(n244) );
  AOI21X1M U293 ( .A0(n245), .A1(n244), .B0(n257), .Y(n252) );
  AOI22X1M U294 ( .A0(REG2[6]), .A1(n275), .B0(REG3[6]), .B1(n274), .Y(n247)
         );
  AOI22X1M U295 ( .A0(REG0[6]), .A1(n278), .B0(REG1[6]), .B1(n276), .Y(n246)
         );
  AOI21X1M U296 ( .A0(n247), .A1(n246), .B0(n260), .Y(n251) );
  AOI22X1M U297 ( .A0(regArr_6__6_), .A1(n275), .B0(regArr_7__6_), .B1(n274), 
        .Y(n249) );
  AOI22X1M U298 ( .A0(regArr_4__6_), .A1(n278), .B0(regArr_5__6_), .B1(n276), 
        .Y(n248) );
  AOI21X1M U299 ( .A0(n249), .A1(n248), .B0(n263), .Y(n250) );
  OR4X1M U300 ( .A(n253), .B(n252), .C(n251), .D(n250), .Y(N37) );
  AOI22X1M U301 ( .A0(regArr_10__7_), .A1(n275), .B0(regArr_11__7_), .B1(n274), 
        .Y(n256) );
  AOI22X1M U302 ( .A0(regArr_8__7_), .A1(n278), .B0(regArr_9__7_), .B1(n276), 
        .Y(n255) );
  AOI21X1M U303 ( .A0(n256), .A1(n255), .B0(n254), .Y(n269) );
  AOI22X1M U304 ( .A0(regArr_14__7_), .A1(n275), .B0(regArr_15__7_), .B1(n274), 
        .Y(n259) );
  AOI22X1M U305 ( .A0(regArr_12__7_), .A1(n278), .B0(regArr_13__7_), .B1(n276), 
        .Y(n258) );
  AOI21X1M U306 ( .A0(n259), .A1(n258), .B0(n257), .Y(n268) );
  AOI22X1M U307 ( .A0(REG2[7]), .A1(n275), .B0(REG3[7]), .B1(n274), .Y(n262)
         );
  AOI22X1M U308 ( .A0(REG0[7]), .A1(n278), .B0(REG1[7]), .B1(n276), .Y(n261)
         );
  AOI21X1M U309 ( .A0(n262), .A1(n261), .B0(n260), .Y(n267) );
  AOI22X1M U310 ( .A0(regArr_6__7_), .A1(n275), .B0(regArr_7__7_), .B1(n274), 
        .Y(n265) );
  AOI22X1M U311 ( .A0(regArr_4__7_), .A1(n278), .B0(regArr_5__7_), .B1(n276), 
        .Y(n264) );
  AOI21X1M U312 ( .A0(n265), .A1(n264), .B0(n263), .Y(n266) );
  OR4X1M U313 ( .A(n269), .B(n268), .C(n267), .D(n266), .Y(N36) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   u_div_SumTmp_1__0_, u_div_SumTmp_1__1_, u_div_SumTmp_1__2_,
         u_div_SumTmp_1__3_, u_div_SumTmp_1__4_, u_div_SumTmp_1__5_,
         u_div_SumTmp_1__6_, u_div_SumTmp_2__0_, u_div_SumTmp_2__1_,
         u_div_SumTmp_2__2_, u_div_SumTmp_2__3_, u_div_SumTmp_2__4_,
         u_div_SumTmp_2__5_, u_div_SumTmp_3__0_, u_div_SumTmp_3__1_,
         u_div_SumTmp_3__2_, u_div_SumTmp_3__3_, u_div_SumTmp_3__4_,
         u_div_SumTmp_4__0_, u_div_SumTmp_4__1_, u_div_SumTmp_4__2_,
         u_div_SumTmp_4__3_, u_div_SumTmp_5__0_, u_div_SumTmp_5__1_,
         u_div_SumTmp_5__2_, u_div_SumTmp_6__0_, u_div_SumTmp_6__1_,
         u_div_SumTmp_7__0_, u_div_CryTmp_0__1_, u_div_CryTmp_0__2_,
         u_div_CryTmp_0__3_, u_div_CryTmp_0__4_, u_div_CryTmp_0__5_,
         u_div_CryTmp_0__6_, u_div_CryTmp_0__7_, u_div_CryTmp_1__1_,
         u_div_CryTmp_1__2_, u_div_CryTmp_1__3_, u_div_CryTmp_1__4_,
         u_div_CryTmp_1__5_, u_div_CryTmp_1__6_, u_div_CryTmp_1__7_,
         u_div_CryTmp_2__1_, u_div_CryTmp_2__2_, u_div_CryTmp_2__3_,
         u_div_CryTmp_2__4_, u_div_CryTmp_2__5_, u_div_CryTmp_2__6_,
         u_div_CryTmp_3__1_, u_div_CryTmp_3__2_, u_div_CryTmp_3__3_,
         u_div_CryTmp_3__4_, u_div_CryTmp_3__5_, u_div_CryTmp_4__1_,
         u_div_CryTmp_4__2_, u_div_CryTmp_4__3_, u_div_CryTmp_4__4_,
         u_div_CryTmp_5__1_, u_div_CryTmp_5__2_, u_div_CryTmp_5__3_,
         u_div_CryTmp_6__1_, u_div_CryTmp_6__2_, u_div_CryTmp_7__1_,
         u_div_PartRem_1__1_, u_div_PartRem_1__2_, u_div_PartRem_1__3_,
         u_div_PartRem_1__4_, u_div_PartRem_1__5_, u_div_PartRem_1__6_,
         u_div_PartRem_1__7_, u_div_PartRem_2__1_, u_div_PartRem_2__2_,
         u_div_PartRem_2__3_, u_div_PartRem_2__4_, u_div_PartRem_2__5_,
         u_div_PartRem_2__6_, u_div_PartRem_3__1_, u_div_PartRem_3__2_,
         u_div_PartRem_3__3_, u_div_PartRem_3__4_, u_div_PartRem_3__5_,
         u_div_PartRem_4__1_, u_div_PartRem_4__2_, u_div_PartRem_4__3_,
         u_div_PartRem_4__4_, u_div_PartRem_5__1_, u_div_PartRem_5__2_,
         u_div_PartRem_5__3_, u_div_PartRem_6__1_, u_div_PartRem_6__2_,
         u_div_PartRem_7__1_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M u_div_u_fa_PartRem_0_1_6 ( .A(u_div_PartRem_2__6_), .B(n12), .CI(
        u_div_CryTmp_1__6_), .CO(u_div_CryTmp_1__7_), .S(u_div_SumTmp_1__6_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_5 ( .A(u_div_PartRem_3__5_), .B(n13), .CI(
        u_div_CryTmp_2__5_), .CO(u_div_CryTmp_2__6_), .S(u_div_SumTmp_2__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_3 ( .A(u_div_PartRem_5__3_), .B(n15), .CI(
        u_div_CryTmp_4__3_), .CO(u_div_CryTmp_4__4_), .S(u_div_SumTmp_4__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_5_2 ( .A(u_div_PartRem_6__2_), .B(n16), .CI(
        u_div_CryTmp_5__2_), .CO(u_div_CryTmp_5__3_), .S(u_div_SumTmp_5__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_6_1 ( .A(u_div_PartRem_7__1_), .B(n17), .CI(
        u_div_CryTmp_6__1_), .CO(u_div_CryTmp_6__2_), .S(u_div_SumTmp_6__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_4 ( .A(u_div_PartRem_4__4_), .B(n14), .CI(
        u_div_CryTmp_3__4_), .CO(u_div_CryTmp_3__5_), .S(u_div_SumTmp_3__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_0_6 ( .A(u_div_PartRem_1__6_), .B(n12), .CI(
        u_div_CryTmp_0__6_), .CO(u_div_CryTmp_0__7_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_7 ( .A(u_div_PartRem_1__7_), .B(n11), .CI(
        u_div_CryTmp_0__7_), .CO(quotient[0]) );
  ADDFX2M u_div_u_fa_PartRem_0_0_1 ( .A(u_div_PartRem_1__1_), .B(n17), .CI(
        u_div_CryTmp_0__1_), .CO(u_div_CryTmp_0__2_) );
  ADDFX2M u_div_u_fa_PartRem_0_1_1 ( .A(u_div_PartRem_2__1_), .B(n17), .CI(
        u_div_CryTmp_1__1_), .CO(u_div_CryTmp_1__2_), .S(u_div_SumTmp_1__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_1 ( .A(u_div_PartRem_3__1_), .B(n17), .CI(
        u_div_CryTmp_2__1_), .CO(u_div_CryTmp_2__2_), .S(u_div_SumTmp_2__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_1 ( .A(u_div_PartRem_4__1_), .B(n17), .CI(
        u_div_CryTmp_3__1_), .CO(u_div_CryTmp_3__2_), .S(u_div_SumTmp_3__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_1 ( .A(u_div_PartRem_5__1_), .B(n17), .CI(
        u_div_CryTmp_4__1_), .CO(u_div_CryTmp_4__2_), .S(u_div_SumTmp_4__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_5_1 ( .A(u_div_PartRem_6__1_), .B(n17), .CI(
        u_div_CryTmp_5__1_), .CO(u_div_CryTmp_5__2_), .S(u_div_SumTmp_5__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_0_4 ( .A(u_div_PartRem_1__4_), .B(n14), .CI(
        u_div_CryTmp_0__4_), .CO(u_div_CryTmp_0__5_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_5 ( .A(u_div_PartRem_1__5_), .B(n13), .CI(
        u_div_CryTmp_0__5_), .CO(u_div_CryTmp_0__6_) );
  ADDFX2M u_div_u_fa_PartRem_0_1_5 ( .A(u_div_PartRem_2__5_), .B(n13), .CI(
        u_div_CryTmp_1__5_), .CO(u_div_CryTmp_1__6_), .S(u_div_SumTmp_1__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_4 ( .A(u_div_PartRem_2__4_), .B(n14), .CI(
        u_div_CryTmp_1__4_), .CO(u_div_CryTmp_1__5_), .S(u_div_SumTmp_1__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_0_2 ( .A(u_div_PartRem_1__2_), .B(n16), .CI(
        u_div_CryTmp_0__2_), .CO(u_div_CryTmp_0__3_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_3 ( .A(u_div_PartRem_1__3_), .B(n15), .CI(
        u_div_CryTmp_0__3_), .CO(u_div_CryTmp_0__4_) );
  ADDFX2M u_div_u_fa_PartRem_0_2_4 ( .A(u_div_PartRem_3__4_), .B(n14), .CI(
        u_div_CryTmp_2__4_), .CO(u_div_CryTmp_2__5_), .S(u_div_SumTmp_2__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_3 ( .A(u_div_PartRem_2__3_), .B(n15), .CI(
        u_div_CryTmp_1__3_), .CO(u_div_CryTmp_1__4_), .S(u_div_SumTmp_1__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_3 ( .A(u_div_PartRem_3__3_), .B(n15), .CI(
        u_div_CryTmp_2__3_), .CO(u_div_CryTmp_2__4_), .S(u_div_SumTmp_2__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_2 ( .A(u_div_PartRem_2__2_), .B(n16), .CI(
        u_div_CryTmp_1__2_), .CO(u_div_CryTmp_1__3_), .S(u_div_SumTmp_1__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_3 ( .A(u_div_PartRem_4__3_), .B(n15), .CI(
        u_div_CryTmp_3__3_), .CO(u_div_CryTmp_3__4_), .S(u_div_SumTmp_3__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_2 ( .A(u_div_PartRem_3__2_), .B(n16), .CI(
        u_div_CryTmp_2__2_), .CO(u_div_CryTmp_2__3_), .S(u_div_SumTmp_2__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_2 ( .A(u_div_PartRem_4__2_), .B(n16), .CI(
        u_div_CryTmp_3__2_), .CO(u_div_CryTmp_3__3_), .S(u_div_SumTmp_3__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_2 ( .A(u_div_PartRem_5__2_), .B(n16), .CI(
        u_div_CryTmp_4__2_), .CO(u_div_CryTmp_4__3_), .S(u_div_SumTmp_4__2_)
         );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(u_div_SumTmp_7__0_) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(u_div_SumTmp_6__0_) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(u_div_SumTmp_5__0_) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(u_div_SumTmp_4__0_) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(u_div_SumTmp_3__0_) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(u_div_SumTmp_2__0_) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(u_div_CryTmp_7__1_) );
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(u_div_CryTmp_5__1_) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n18), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(u_div_CryTmp_4__1_) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n18), .Y(n5) );
  NAND2X2M U15 ( .A(n5), .B(n7), .Y(u_div_CryTmp_3__1_) );
  INVX2M U16 ( .A(a[3]), .Y(n7) );
  NAND2X2M U17 ( .A(n5), .B(n8), .Y(u_div_CryTmp_2__1_) );
  INVX2M U18 ( .A(a[2]), .Y(n8) );
  NAND2X2M U19 ( .A(n5), .B(n9), .Y(u_div_CryTmp_1__1_) );
  INVX2M U20 ( .A(a[1]), .Y(n9) );
  NAND2X2M U21 ( .A(n5), .B(n10), .Y(u_div_CryTmp_0__1_) );
  INVX2M U22 ( .A(a[0]), .Y(n10) );
  NAND2X2M U23 ( .A(n1), .B(n2), .Y(u_div_CryTmp_6__1_) );
  INVX2M U24 ( .A(a[6]), .Y(n2) );
  INVX2M U25 ( .A(n18), .Y(n1) );
  XNOR2X2M U26 ( .A(n18), .B(a[1]), .Y(u_div_SumTmp_1__0_) );
  INVX2M U27 ( .A(b[1]), .Y(n17) );
  INVX2M U28 ( .A(b[2]), .Y(n16) );
  INVX2M U29 ( .A(b[3]), .Y(n15) );
  INVX2M U30 ( .A(b[4]), .Y(n14) );
  INVX2M U31 ( .A(b[5]), .Y(n13) );
  INVX2M U32 ( .A(b[6]), .Y(n12) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(u_div_PartRem_2__6_), .B(u_div_SumTmp_1__6_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__7_) );
  CLKMX2X2M U35 ( .A(u_div_PartRem_3__5_), .B(u_div_SumTmp_2__5_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__6_) );
  CLKMX2X2M U36 ( .A(u_div_PartRem_4__4_), .B(u_div_SumTmp_3__4_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__5_) );
  CLKMX2X2M U37 ( .A(u_div_PartRem_5__3_), .B(u_div_SumTmp_4__3_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__4_) );
  CLKMX2X2M U38 ( .A(u_div_PartRem_6__2_), .B(u_div_SumTmp_5__2_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__3_) );
  CLKMX2X2M U39 ( .A(u_div_PartRem_7__1_), .B(u_div_SumTmp_6__1_), .S0(
        quotient[6]), .Y(u_div_PartRem_6__2_) );
  CLKMX2X2M U40 ( .A(a[7]), .B(u_div_SumTmp_7__0_), .S0(quotient[7]), .Y(
        u_div_PartRem_7__1_) );
  CLKMX2X2M U41 ( .A(u_div_PartRem_2__5_), .B(u_div_SumTmp_1__5_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__6_) );
  CLKMX2X2M U42 ( .A(u_div_PartRem_3__4_), .B(u_div_SumTmp_2__4_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__5_) );
  CLKMX2X2M U43 ( .A(u_div_PartRem_4__3_), .B(u_div_SumTmp_3__3_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__4_) );
  CLKMX2X2M U44 ( .A(u_div_PartRem_5__2_), .B(u_div_SumTmp_4__2_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__3_) );
  CLKMX2X2M U45 ( .A(u_div_PartRem_6__1_), .B(u_div_SumTmp_5__1_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__2_) );
  CLKMX2X2M U46 ( .A(a[6]), .B(u_div_SumTmp_6__0_), .S0(quotient[6]), .Y(
        u_div_PartRem_6__1_) );
  CLKMX2X2M U47 ( .A(u_div_PartRem_2__4_), .B(u_div_SumTmp_1__4_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__5_) );
  CLKMX2X2M U48 ( .A(u_div_PartRem_3__3_), .B(u_div_SumTmp_2__3_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__4_) );
  CLKMX2X2M U49 ( .A(u_div_PartRem_4__2_), .B(u_div_SumTmp_3__2_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__3_) );
  CLKMX2X2M U50 ( .A(u_div_PartRem_5__1_), .B(u_div_SumTmp_4__1_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__2_) );
  CLKMX2X2M U51 ( .A(a[5]), .B(u_div_SumTmp_5__0_), .S0(quotient[5]), .Y(
        u_div_PartRem_5__1_) );
  CLKMX2X2M U52 ( .A(u_div_PartRem_2__3_), .B(u_div_SumTmp_1__3_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__4_) );
  CLKMX2X2M U53 ( .A(u_div_PartRem_3__2_), .B(u_div_SumTmp_2__2_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__3_) );
  CLKMX2X2M U54 ( .A(u_div_PartRem_4__1_), .B(u_div_SumTmp_3__1_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__2_) );
  CLKMX2X2M U55 ( .A(a[4]), .B(u_div_SumTmp_4__0_), .S0(quotient[4]), .Y(
        u_div_PartRem_4__1_) );
  CLKMX2X2M U56 ( .A(u_div_PartRem_2__2_), .B(u_div_SumTmp_1__2_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__3_) );
  CLKMX2X2M U57 ( .A(u_div_PartRem_3__1_), .B(u_div_SumTmp_2__1_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__2_) );
  CLKMX2X2M U58 ( .A(a[3]), .B(u_div_SumTmp_3__0_), .S0(quotient[3]), .Y(
        u_div_PartRem_3__1_) );
  CLKMX2X2M U59 ( .A(u_div_PartRem_2__1_), .B(u_div_SumTmp_1__1_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__2_) );
  CLKMX2X2M U60 ( .A(a[2]), .B(u_div_SumTmp_2__0_), .S0(quotient[2]), .Y(
        u_div_PartRem_2__1_) );
  CLKMX2X2M U61 ( .A(a[1]), .B(u_div_SumTmp_1__0_), .S0(quotient[1]), .Y(
        u_div_PartRem_1__1_) );
  AND4X1M U62 ( .A(u_div_CryTmp_7__1_), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(u_div_CryTmp_6__2_), .Y(quotient[6]) );
  AND2X1M U64 ( .A(u_div_CryTmp_5__3_), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(u_div_CryTmp_4__4_), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(u_div_CryTmp_3__5_), .Y(quotient[3]) );
  AND2X1M U69 ( .A(u_div_CryTmp_2__6_), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(u_div_CryTmp_1__7_), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [8:1] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
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
  XNOR2X2M U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U2 ( .A(B[0]), .Y(n9) );
  INVX2M U3 ( .A(B[2]), .Y(n7) );
  INVX2M U4 ( .A(B[3]), .Y(n6) );
  INVX2M U5 ( .A(B[4]), .Y(n5) );
  INVX2M U6 ( .A(B[5]), .Y(n4) );
  INVX2M U7 ( .A(B[6]), .Y(n3) );
  INVX2M U8 ( .A(B[1]), .Y(n8) );
  NAND2X2M U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [7:2] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  INVX2M U4 ( .A(A[6]), .Y(n9) );
  XNOR2X2M U5 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  INVX2M U6 ( .A(n9), .Y(SUM[6]) );
  XNOR2X2M U7 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U8 ( .A(B[7]), .Y(n8) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   ab_7__7_, ab_7__6_, ab_7__5_, ab_7__4_, ab_7__3_, ab_7__2_, ab_7__1_,
         ab_7__0_, ab_6__7_, ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_, ab_6__2_,
         ab_6__1_, ab_6__0_, ab_5__7_, ab_5__6_, ab_5__5_, ab_5__4_, ab_5__3_,
         ab_5__2_, ab_5__1_, ab_5__0_, ab_4__7_, ab_4__6_, ab_4__5_, ab_4__4_,
         ab_4__3_, ab_4__2_, ab_4__1_, ab_4__0_, ab_3__7_, ab_3__6_, ab_3__5_,
         ab_3__4_, ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_, ab_2__7_, ab_2__6_,
         ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_, ab_2__0_, ab_1__7_,
         ab_1__6_, ab_1__5_, ab_1__4_, ab_1__3_, ab_1__2_, ab_1__1_, ab_1__0_,
         ab_0__7_, ab_0__6_, ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, ab_0__1_,
         CARRYB_7__6_, CARRYB_7__5_, CARRYB_7__4_, CARRYB_7__3_, CARRYB_7__2_,
         CARRYB_7__1_, CARRYB_7__0_, CARRYB_6__6_, CARRYB_6__5_, CARRYB_6__4_,
         CARRYB_6__3_, CARRYB_6__2_, CARRYB_6__1_, CARRYB_6__0_, CARRYB_5__6_,
         CARRYB_5__5_, CARRYB_5__4_, CARRYB_5__3_, CARRYB_5__2_, CARRYB_5__1_,
         CARRYB_5__0_, CARRYB_4__6_, CARRYB_4__5_, CARRYB_4__4_, CARRYB_4__3_,
         CARRYB_4__2_, CARRYB_4__1_, CARRYB_4__0_, CARRYB_3__6_, CARRYB_3__5_,
         CARRYB_3__4_, CARRYB_3__3_, CARRYB_3__2_, CARRYB_3__1_, CARRYB_3__0_,
         CARRYB_2__6_, CARRYB_2__5_, CARRYB_2__4_, CARRYB_2__3_, CARRYB_2__2_,
         CARRYB_2__1_, CARRYB_2__0_, SUMB_7__6_, SUMB_7__5_, SUMB_7__4_,
         SUMB_7__3_, SUMB_7__2_, SUMB_7__1_, SUMB_7__0_, SUMB_6__6_,
         SUMB_6__5_, SUMB_6__4_, SUMB_6__3_, SUMB_6__2_, SUMB_6__1_,
         SUMB_5__6_, SUMB_5__5_, SUMB_5__4_, SUMB_5__3_, SUMB_5__2_,
         SUMB_5__1_, SUMB_4__6_, SUMB_4__5_, SUMB_4__4_, SUMB_4__3_,
         SUMB_4__2_, SUMB_4__1_, SUMB_3__6_, SUMB_3__5_, SUMB_3__4_,
         SUMB_3__3_, SUMB_3__2_, SUMB_3__1_, SUMB_2__6_, SUMB_2__5_,
         SUMB_2__4_, SUMB_2__3_, SUMB_2__2_, SUMB_2__1_, SUMB_1__6_,
         SUMB_1__5_, SUMB_1__4_, SUMB_1__3_, SUMB_1__2_, SUMB_1__1_, A1_12_,
         A1_11_, A1_10_, A1_9_, A1_8_, A1_7_, A1_6_, A1_4_, A1_3_, A1_2_,
         A1_1_, A1_0_, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_DW01_add_1 FS_1 ( .A({1'b0, A1_12_, A1_11_, A1_10_, A1_9_, A1_8_, A1_7_, 
        A1_6_, SUMB_7__0_, A1_4_, A1_3_, A1_2_, A1_1_, A1_0_}), .B({n10, n16, 
        n15, n14, n13, n11, n12, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(ab_7__6_), .B(CARRYB_6__6_), .CI(ab_6__7_), .CO(
        CARRYB_7__6_), .S(SUMB_7__6_) );
  ADDFX2M S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(A1_4_) );
  ADDFX2M S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_), .S(A1_3_) );
  ADDFX2M S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .CI(SUMB_3__1_), .CO(
        CARRYB_4__0_), .S(A1_2_) );
  ADDFX2M S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .CI(SUMB_2__1_), .CO(
        CARRYB_3__0_), .S(A1_1_) );
  ADDFX2M S1_2_0 ( .A(ab_2__0_), .B(n6), .CI(SUMB_1__1_), .CO(CARRYB_2__0_), 
        .S(A1_0_) );
  ADDFX2M S3_6_6 ( .A(ab_6__6_), .B(CARRYB_5__6_), .CI(ab_5__7_), .CO(
        CARRYB_6__6_), .S(SUMB_6__6_) );
  ADDFX2M S2_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(SUMB_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  ADDFX2M S3_5_6 ( .A(ab_5__6_), .B(CARRYB_4__6_), .CI(ab_4__7_), .CO(
        CARRYB_5__6_), .S(SUMB_5__6_) );
  ADDFX2M S4_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .CI(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(SUMB_7__0_) );
  ADDFX2M S4_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .CI(SUMB_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  ADDFX2M S4_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .CI(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  ADDFX2M S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .CI(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  ADDFX2M S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .CI(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  ADDFX2M S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .CI(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  ADDFX2M S2_4_4 ( .A(ab_4__4_), .B(CARRYB_3__4_), .CI(SUMB_3__5_), .CO(
        CARRYB_4__4_), .S(SUMB_4__4_) );
  ADDFX2M S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  ADDFX2M S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  ADDFX2M S2_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .CI(SUMB_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  ADDFX2M S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  ADDFX2M S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  ADDFX2M S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  ADDFX2M S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .CI(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  ADDFX2M S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .CI(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  ADDFX2M S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .CI(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  ADDFX2M S2_2_1 ( .A(ab_2__1_), .B(n5), .CI(SUMB_1__2_), .CO(CARRYB_2__1_), 
        .S(SUMB_2__1_) );
  ADDFX2M S2_2_2 ( .A(ab_2__2_), .B(n4), .CI(SUMB_1__3_), .CO(CARRYB_2__2_), 
        .S(SUMB_2__2_) );
  ADDFX2M S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  ADDFX2M S2_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .CI(SUMB_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  ADDFX2M S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  ADDFX2M S3_4_6 ( .A(ab_4__6_), .B(CARRYB_3__6_), .CI(ab_3__7_), .CO(
        CARRYB_4__6_), .S(SUMB_4__6_) );
  ADDFX2M S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  ADDFX2M S2_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(SUMB_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  ADDFX2M S3_3_6 ( .A(ab_3__6_), .B(CARRYB_2__6_), .CI(ab_2__7_), .CO(
        CARRYB_3__6_), .S(SUMB_3__6_) );
  ADDFX2M S2_3_3 ( .A(ab_3__3_), .B(CARRYB_2__3_), .CI(SUMB_2__4_), .CO(
        CARRYB_3__3_), .S(SUMB_3__3_) );
  ADDFX2M S3_2_6 ( .A(ab_2__6_), .B(n9), .CI(ab_1__7_), .CO(CARRYB_2__6_), .S(
        SUMB_2__6_) );
  ADDFX2M S2_2_3 ( .A(ab_2__3_), .B(n3), .CI(SUMB_1__4_), .CO(CARRYB_2__3_), 
        .S(SUMB_2__3_) );
  ADDFX2M S2_2_4 ( .A(ab_2__4_), .B(n8), .CI(SUMB_1__5_), .CO(CARRYB_2__4_), 
        .S(SUMB_2__4_) );
  ADDFX2M S2_2_5 ( .A(ab_2__5_), .B(n7), .CI(SUMB_1__6_), .CO(CARRYB_2__5_), 
        .S(SUMB_2__5_) );
  ADDFX2M S4_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .CI(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  ADDFX2M S4_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  ADDFX2M S4_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  AND2X2M U2 ( .A(ab_0__4_), .B(ab_1__3_), .Y(n3) );
  AND2X2M U3 ( .A(ab_0__3_), .B(ab_1__2_), .Y(n4) );
  AND2X2M U4 ( .A(ab_0__2_), .B(ab_1__1_), .Y(n5) );
  AND2X2M U5 ( .A(ab_0__1_), .B(ab_1__0_), .Y(n6) );
  AND2X2M U6 ( .A(ab_0__6_), .B(ab_1__5_), .Y(n7) );
  AND2X2M U7 ( .A(ab_0__5_), .B(ab_1__4_), .Y(n8) );
  AND2X2M U8 ( .A(ab_0__7_), .B(ab_1__6_), .Y(n9) );
  AND2X2M U9 ( .A(CARRYB_7__6_), .B(ab_7__7_), .Y(n10) );
  CLKXOR2X2M U10 ( .A(CARRYB_7__1_), .B(SUMB_7__2_), .Y(A1_7_) );
  CLKXOR2X2M U11 ( .A(CARRYB_7__2_), .B(SUMB_7__3_), .Y(A1_8_) );
  INVX2M U12 ( .A(ab_0__7_), .Y(n23) );
  INVX2M U13 ( .A(ab_0__5_), .Y(n21) );
  INVX2M U14 ( .A(ab_0__3_), .Y(n19) );
  INVX2M U15 ( .A(ab_0__6_), .Y(n22) );
  INVX2M U16 ( .A(ab_0__4_), .Y(n20) );
  AND2X2M U17 ( .A(CARRYB_7__1_), .B(SUMB_7__2_), .Y(n11) );
  AND2X2M U18 ( .A(CARRYB_7__0_), .B(SUMB_7__1_), .Y(n12) );
  CLKXOR2X2M U19 ( .A(CARRYB_7__4_), .B(SUMB_7__5_), .Y(A1_10_) );
  CLKXOR2X2M U20 ( .A(CARRYB_7__3_), .B(SUMB_7__4_), .Y(A1_9_) );
  CLKXOR2X2M U21 ( .A(CARRYB_7__5_), .B(SUMB_7__6_), .Y(A1_11_) );
  INVX2M U22 ( .A(ab_0__2_), .Y(n18) );
  AND2X2M U23 ( .A(CARRYB_7__2_), .B(SUMB_7__3_), .Y(n13) );
  AND2X2M U24 ( .A(CARRYB_7__3_), .B(SUMB_7__4_), .Y(n14) );
  AND2X2M U25 ( .A(CARRYB_7__4_), .B(SUMB_7__5_), .Y(n15) );
  CLKXOR2X2M U26 ( .A(CARRYB_7__6_), .B(ab_7__7_), .Y(A1_12_) );
  XNOR2X2M U27 ( .A(CARRYB_7__0_), .B(n17), .Y(A1_6_) );
  INVX2M U28 ( .A(SUMB_7__1_), .Y(n17) );
  AND2X2M U29 ( .A(CARRYB_7__5_), .B(SUMB_7__6_), .Y(n16) );
  CLKXOR2X2M U30 ( .A(ab_1__0_), .B(ab_0__1_), .Y(PRODUCT[1]) );
  XNOR2X2M U31 ( .A(ab_1__6_), .B(n23), .Y(SUMB_1__6_) );
  XNOR2X2M U32 ( .A(ab_1__5_), .B(n22), .Y(SUMB_1__5_) );
  XNOR2X2M U33 ( .A(ab_1__4_), .B(n21), .Y(SUMB_1__4_) );
  XNOR2X2M U34 ( .A(ab_1__3_), .B(n20), .Y(SUMB_1__3_) );
  XNOR2X2M U35 ( .A(ab_1__2_), .B(n19), .Y(SUMB_1__2_) );
  INVX2M U36 ( .A(A[0]), .Y(n39) );
  INVX2M U37 ( .A(A[1]), .Y(n38) );
  XNOR2X2M U38 ( .A(ab_1__1_), .B(n18), .Y(SUMB_1__1_) );
  INVX2M U39 ( .A(A[2]), .Y(n37) );
  INVX2M U40 ( .A(A[3]), .Y(n36) );
  INVX2M U41 ( .A(A[4]), .Y(n35) );
  INVX2M U42 ( .A(A[5]), .Y(n34) );
  INVX2M U43 ( .A(A[7]), .Y(n32) );
  INVX2M U44 ( .A(A[6]), .Y(n33) );
  INVX2M U45 ( .A(B[6]), .Y(n25) );
  INVX2M U46 ( .A(B[4]), .Y(n27) );
  INVX2M U47 ( .A(B[7]), .Y(n24) );
  INVX2M U48 ( .A(B[5]), .Y(n26) );
  INVX2M U49 ( .A(B[3]), .Y(n28) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(ab_7__7_) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(ab_7__6_) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(ab_7__5_) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(ab_7__4_) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(ab_7__3_) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(ab_7__2_) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(ab_7__1_) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(ab_7__0_) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(ab_6__7_) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(ab_6__6_) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(ab_6__5_) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(ab_6__4_) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(ab_6__3_) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(ab_6__2_) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(ab_6__1_) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(ab_6__0_) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(ab_5__7_) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(ab_5__6_) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(ab_5__5_) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(ab_5__4_) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(ab_5__3_) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(ab_5__2_) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(ab_5__1_) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(ab_5__0_) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(ab_4__7_) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(ab_4__6_) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(ab_4__5_) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(ab_4__4_) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(ab_4__3_) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(ab_4__2_) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(ab_4__1_) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(ab_4__0_) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(ab_3__7_) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(ab_3__6_) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(ab_3__5_) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(ab_3__4_) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(ab_3__3_) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(ab_3__2_) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(ab_3__1_) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(ab_3__0_) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(ab_2__7_) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(ab_2__6_) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(ab_2__5_) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(ab_2__4_) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(ab_2__3_) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(ab_2__2_) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(ab_2__1_) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(ab_2__0_) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(ab_1__7_) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(ab_1__6_) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(ab_1__5_) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(ab_1__4_) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(ab_1__3_) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(ab_1__2_) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(ab_1__1_) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(ab_1__0_) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(ab_0__7_) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(ab_0__6_) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(ab_0__5_) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(ab_0__4_) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(ab_0__3_) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(ab_0__2_) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(ab_0__1_) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST;
  output OUT_VALID;
  wire   N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, N105, N106, N107, N108, N109, N110, N111,
         N112, N113, N114, N115, N116, N117, N118, N119, N120, N121, N122,
         N123, N124, N125, N126, N127, N128, N153, N154, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8;
  wire   [15:0] ALU_OUT_Comb;

  ALU_DW_div_uns_0 div_52 ( .a({n10, n9, n8, n7, n6, n5, n4, n3}), .b(B), 
        .quotient({N128, N127, N126, N125, N124, N123, N122, N121}), 
        .remainder({SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, 
        SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, 
        SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8}) );
  ALU_DW01_sub_0 sub_46 ( .A({1'b0, n10, n9, n8, n7, n6, n5, n4, n3}), .B({
        1'b0, B}), .CI(1'b0), .DIFF({N104, N103, N102, N101, N100, N99, N98, 
        N97, N96}) );
  ALU_DW01_add_0 add_43 ( .A({1'b0, n10, n9, n8, n7, n6, n5, n4, n3}), .B({
        1'b0, B}), .CI(1'b0), .SUM({N95, N94, N93, N92, N91, N90, N89, N88, 
        N87}) );
  ALU_DW02_mult_0 mult_49 ( .A({n10, n9, n8, n7, n6, n5, n4, n3}), .B(B), .TC(
        1'b0), .PRODUCT({N120, N119, N118, N117, N116, N115, N114, N113, N112, 
        N111, N110, N109, N108, N107, N106, N105}) );
  DFFRQX2M ALU_OUT_reg_7_ ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M ALU_OUT_reg_6_ ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M ALU_OUT_reg_5_ ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M ALU_OUT_reg_4_ ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M ALU_OUT_reg_3_ ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M ALU_OUT_reg_2_ ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M ALU_OUT_reg_1_ ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M ALU_OUT_reg_0_ ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  DFFRQX2M ALU_OUT_reg_15_ ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M ALU_OUT_reg_14_ ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M ALU_OUT_reg_13_ ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M ALU_OUT_reg_12_ ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M ALU_OUT_reg_11_ ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M ALU_OUT_reg_10_ ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M ALU_OUT_reg_9_ ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M ALU_OUT_reg_8_ ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  NOR3X2M U3 ( .A(n124), .B(ALU_FUN[2]), .C(n121), .Y(n50) );
  AOI31X2M U4 ( .A0(n91), .A1(n92), .A2(n93), .B0(n120), .Y(ALU_OUT_Comb[0])
         );
  AOI22X1M U7 ( .A0(N96), .A1(n51), .B0(N87), .B1(n38), .Y(n91) );
  AOI221XLM U8 ( .A0(n4), .A1(n55), .B0(n13), .B1(n119), .C0(n94), .Y(n93) );
  AOI222X1M U9 ( .A0(N105), .A1(n11), .B0(n3), .B1(n12), .C0(N121), .C1(n50), 
        .Y(n92) );
  AOI31X2M U10 ( .A0(n83), .A1(n84), .A2(n85), .B0(n120), .Y(ALU_OUT_Comb[1])
         );
  AOI22X1M U11 ( .A0(N97), .A1(n51), .B0(N88), .B1(n38), .Y(n83) );
  AOI221XLM U12 ( .A0(n5), .A1(n55), .B0(n13), .B1(n118), .C0(n86), .Y(n85) );
  AOI222X1M U13 ( .A0(N106), .A1(n11), .B0(n4), .B1(n12), .C0(N122), .C1(n50), 
        .Y(n84) );
  AOI31X2M U14 ( .A0(n77), .A1(n78), .A2(n79), .B0(n120), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U15 ( .A0(N98), .A1(n51), .B0(N89), .B1(n38), .Y(n77) );
  AOI221XLM U16 ( .A0(n6), .A1(n55), .B0(n13), .B1(n103), .C0(n80), .Y(n79) );
  AOI222X1M U17 ( .A0(N107), .A1(n11), .B0(n5), .B1(n12), .C0(N123), .C1(n50), 
        .Y(n78) );
  AOI31X2M U18 ( .A0(n71), .A1(n72), .A2(n73), .B0(n120), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U19 ( .A0(N99), .A1(n51), .B0(N90), .B1(n38), .Y(n71) );
  AOI221XLM U20 ( .A0(n7), .A1(n55), .B0(n13), .B1(n117), .C0(n74), .Y(n73) );
  AOI222X1M U21 ( .A0(N108), .A1(n11), .B0(n6), .B1(n12), .C0(N124), .C1(n50), 
        .Y(n72) );
  AOI31X2M U22 ( .A0(n65), .A1(n66), .A2(n67), .B0(n120), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U23 ( .A0(N100), .A1(n51), .B0(N91), .B1(n38), .Y(n65) );
  AOI221XLM U24 ( .A0(n55), .A1(n8), .B0(n13), .B1(n116), .C0(n68), .Y(n67) );
  AOI222X1M U25 ( .A0(N109), .A1(n11), .B0(n7), .B1(n12), .C0(N125), .C1(n50), 
        .Y(n66) );
  OAI2BB1X2M U26 ( .A0N(N119), .A1N(n32), .B0(n33), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U27 ( .A0N(N120), .A1N(n32), .B0(n33), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U28 ( .A0N(N116), .A1N(n32), .B0(n33), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U29 ( .A0N(N117), .A1N(n32), .B0(n33), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U30 ( .A0N(N118), .A1N(n32), .B0(n33), .Y(ALU_OUT_Comb[13]) );
  AOI31X2M U31 ( .A0(n59), .A1(n60), .A2(n61), .B0(n120), .Y(ALU_OUT_Comb[5])
         );
  AOI221XLM U32 ( .A0(n55), .A1(n9), .B0(n13), .B1(n115), .C0(n62), .Y(n61) );
  AOI22X1M U33 ( .A0(N101), .A1(n51), .B0(N92), .B1(n38), .Y(n59) );
  AOI222X1M U34 ( .A0(N110), .A1(n11), .B0(n8), .B1(n12), .C0(N126), .C1(n50), 
        .Y(n60) );
  AOI31X2M U35 ( .A0(n52), .A1(n53), .A2(n54), .B0(n120), .Y(ALU_OUT_Comb[6])
         );
  AOI221XLM U36 ( .A0(n55), .A1(n10), .B0(n13), .B1(n114), .C0(n56), .Y(n54)
         );
  AOI22X1M U37 ( .A0(N102), .A1(n51), .B0(N93), .B1(n38), .Y(n52) );
  AOI222X1M U38 ( .A0(N111), .A1(n11), .B0(n12), .B1(n9), .C0(N127), .C1(n50), 
        .Y(n53) );
  AOI31X2M U39 ( .A0(n39), .A1(n40), .A2(n41), .B0(n120), .Y(ALU_OUT_Comb[7])
         );
  AOI221XLM U40 ( .A0(n13), .A1(n113), .B0(n12), .B1(n10), .C0(n44), .Y(n41)
         );
  AOI22X1M U41 ( .A0(N103), .A1(n51), .B0(N94), .B1(n38), .Y(n39) );
  AOI22X1M U42 ( .A0(N128), .A1(n50), .B0(N112), .B1(n11), .Y(n40) );
  AOI21X2M U43 ( .A0(n34), .A1(n35), .B0(n120), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U44 ( .A0(N95), .A1(n38), .B0(n106), .Y(n34) );
  AOI2BB2XLM U45 ( .B0(N113), .B1(n11), .A0N(n113), .A1N(n37), .Y(n35) );
  OAI2BB1X2M U46 ( .A0N(N114), .A1N(n32), .B0(n33), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U47 ( .A0N(N115), .A1N(n32), .B0(n33), .Y(ALU_OUT_Comb[10]) );
  INVX2M U48 ( .A(n90), .Y(n106) );
  AOI211X2M U49 ( .A0(N104), .A1(n51), .B0(n13), .C0(n14), .Y(n90) );
  INVX2M U50 ( .A(n5), .Y(n103) );
  OAI2BB1X2M U51 ( .A0N(n99), .A1N(n89), .B0(n100), .Y(n49) );
  BUFX2M U52 ( .A(n42), .Y(n13) );
  NOR3X2M U53 ( .A(n124), .B(n122), .C(n123), .Y(n42) );
  INVX2M U54 ( .A(n99), .Y(n122) );
  BUFX2M U55 ( .A(n43), .Y(n12) );
  NOR2BX2M U56 ( .AN(n89), .B(n121), .Y(n43) );
  INVX2M U57 ( .A(n102), .Y(n121) );
  BUFX2M U58 ( .A(n48), .Y(n14) );
  OAI31X1M U59 ( .A0(n121), .A1(n124), .A2(n123), .B0(n100), .Y(n48) );
  NOR2BX2M U60 ( .AN(n101), .B(n122), .Y(n38) );
  NOR2BX2M U61 ( .AN(n11), .B(n120), .Y(n32) );
  AND2X2M U62 ( .A(n101), .B(n102), .Y(n51) );
  INVX2M U63 ( .A(n8), .Y(n115) );
  INVX2M U64 ( .A(n6), .Y(n117) );
  INVX2M U65 ( .A(n10), .Y(n113) );
  INVX2M U66 ( .A(n3), .Y(n119) );
  INVX2M U67 ( .A(n4), .Y(n118) );
  INVX2M U68 ( .A(n7), .Y(n116) );
  INVX2M U69 ( .A(n9), .Y(n114) );
  BUFX2M U70 ( .A(A[7]), .Y(n10) );
  BUFX2M U71 ( .A(A[6]), .Y(n9) );
  BUFX2M U72 ( .A(A[5]), .Y(n8) );
  BUFX2M U73 ( .A(A[4]), .Y(n7) );
  BUFX2M U74 ( .A(A[3]), .Y(n6) );
  BUFX2M U75 ( .A(A[2]), .Y(n5) );
  BUFX2M U76 ( .A(A[0]), .Y(n3) );
  BUFX2M U77 ( .A(A[1]), .Y(n4) );
  NAND4BX1M U78 ( .AN(n98), .B(n123), .C(ALU_FUN[3]), .D(ALU_FUN[1]), .Y(n97)
         );
  AOI22X1M U79 ( .A0(N153), .A1(n125), .B0(N154), .B1(ALU_FUN[0]), .Y(n98) );
  OAI221X1M U80 ( .A0(B[0]), .A1(n95), .B0(n96), .B1(n112), .C0(n97), .Y(n94)
         );
  INVX2M U81 ( .A(B[0]), .Y(n112) );
  AOI221XLM U82 ( .A0(n47), .A1(n119), .B0(n3), .B1(n49), .C0(n12), .Y(n96) );
  AOI221XLM U83 ( .A0(n3), .A1(n47), .B0(n14), .B1(n119), .C0(n13), .Y(n95) );
  INVX2M U84 ( .A(B[6]), .Y(n105) );
  NAND2X2M U85 ( .A(EN), .B(n106), .Y(n33) );
  OAI222X1M U86 ( .A0(n45), .A1(n107), .B0(B[7]), .B1(n46), .C0(n37), .C1(n114), .Y(n44) );
  INVX2M U87 ( .A(B[7]), .Y(n107) );
  AOI221XLM U88 ( .A0(n47), .A1(n113), .B0(n10), .B1(n49), .C0(n12), .Y(n45)
         );
  AOI221XLM U89 ( .A0(n47), .A1(n10), .B0(n14), .B1(n113), .C0(n13), .Y(n46)
         );
  OAI222X1M U90 ( .A0(n87), .A1(n111), .B0(B[1]), .B1(n88), .C0(n37), .C1(n119), .Y(n86) );
  INVX2M U91 ( .A(B[1]), .Y(n111) );
  AOI221XLM U92 ( .A0(n47), .A1(n118), .B0(n4), .B1(n49), .C0(n12), .Y(n87) );
  AOI221XLM U93 ( .A0(n4), .A1(n47), .B0(n14), .B1(n118), .C0(n13), .Y(n88) );
  OAI222X1M U94 ( .A0(n81), .A1(n110), .B0(B[2]), .B1(n82), .C0(n37), .C1(n118), .Y(n80) );
  INVX2M U95 ( .A(B[2]), .Y(n110) );
  AOI221XLM U96 ( .A0(n47), .A1(n103), .B0(n5), .B1(n49), .C0(n12), .Y(n81) );
  AOI221XLM U97 ( .A0(n5), .A1(n47), .B0(n14), .B1(n103), .C0(n13), .Y(n82) );
  OAI222X1M U98 ( .A0(n75), .A1(n109), .B0(B[3]), .B1(n76), .C0(n37), .C1(n103), .Y(n74) );
  INVX2M U99 ( .A(B[3]), .Y(n109) );
  AOI221XLM U100 ( .A0(n47), .A1(n117), .B0(n6), .B1(n49), .C0(n12), .Y(n75)
         );
  AOI221XLM U101 ( .A0(n6), .A1(n47), .B0(n14), .B1(n117), .C0(n13), .Y(n76)
         );
  OAI222X1M U102 ( .A0(n69), .A1(n104), .B0(B[4]), .B1(n70), .C0(n37), .C1(
        n117), .Y(n68) );
  AOI221XLM U103 ( .A0(n47), .A1(n116), .B0(n7), .B1(n49), .C0(n12), .Y(n69)
         );
  AOI221XLM U104 ( .A0(n7), .A1(n47), .B0(n14), .B1(n116), .C0(n13), .Y(n70)
         );
  OAI222X1M U105 ( .A0(n63), .A1(n108), .B0(B[5]), .B1(n64), .C0(n37), .C1(
        n116), .Y(n62) );
  INVX2M U106 ( .A(B[5]), .Y(n108) );
  AOI221XLM U107 ( .A0(n47), .A1(n115), .B0(n8), .B1(n49), .C0(n12), .Y(n63)
         );
  AOI221XLM U108 ( .A0(n8), .A1(n47), .B0(n14), .B1(n115), .C0(n13), .Y(n64)
         );
  OAI222X1M U109 ( .A0(n57), .A1(n105), .B0(B[6]), .B1(n58), .C0(n37), .C1(
        n115), .Y(n56) );
  AOI221XLM U110 ( .A0(n47), .A1(n114), .B0(n9), .B1(n49), .C0(n12), .Y(n57)
         );
  AOI221XLM U111 ( .A0(n9), .A1(n47), .B0(n14), .B1(n114), .C0(n13), .Y(n58)
         );
  NOR2X2M U112 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n101) );
  AND3X2M U113 ( .A(n101), .B(n125), .C(ALU_FUN[3]), .Y(n47) );
  NOR2X2M U114 ( .A(n123), .B(ALU_FUN[1]), .Y(n89) );
  NOR2X2M U115 ( .A(n125), .B(ALU_FUN[3]), .Y(n102) );
  NOR2X2M U116 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .Y(n99) );
  INVX2M U117 ( .A(ALU_FUN[1]), .Y(n124) );
  INVX2M U118 ( .A(ALU_FUN[2]), .Y(n123) );
  INVX2M U119 ( .A(ALU_FUN[0]), .Y(n125) );
  NAND3X2M U120 ( .A(n101), .B(ALU_FUN[0]), .C(ALU_FUN[3]), .Y(n100) );
  INVX2M U121 ( .A(B[4]), .Y(n104) );
  AND3X2M U122 ( .A(ALU_FUN[3]), .B(n125), .C(n89), .Y(n55) );
  NAND3X2M U123 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .C(n89), .Y(n37) );
  INVX2M U124 ( .A(EN), .Y(n120) );
  BUFX2M U125 ( .A(n36), .Y(n11) );
  NOR3X2M U126 ( .A(n122), .B(ALU_FUN[2]), .C(n124), .Y(n36) );
  NOR2BX1M U127 ( .AN(B[0]), .B(n3), .Y(n15) );
  OAI2B2X1M U128 ( .A1N(n4), .A0(n15), .B0(B[1]), .B1(n15), .Y(n16) );
  NAND2BX1M U129 ( .AN(n9), .B(B[6]), .Y(n27) );
  CLKNAND2X2M U130 ( .A(B[5]), .B(n115), .Y(n26) );
  NAND2BX1M U131 ( .AN(n7), .B(B[4]), .Y(n23) );
  NAND4X1M U132 ( .A(n16), .B(n27), .C(n26), .D(n23), .Y(n31) );
  CLKNAND2X2M U133 ( .A(B[3]), .B(n117), .Y(n22) );
  CLKNAND2X2M U134 ( .A(B[2]), .B(n103), .Y(n17) );
  CLKNAND2X2M U135 ( .A(n22), .B(n17), .Y(n30) );
  NOR2BX1M U136 ( .AN(B[7]), .B(n10), .Y(n29) );
  NOR2BX1M U137 ( .AN(n3), .B(B[0]), .Y(n19) );
  OAI2BB1X1M U138 ( .A0N(n19), .A1N(n4), .B0(B[1]), .Y(n18) );
  OAI211X1M U139 ( .A0(n4), .A1(n19), .B0(n18), .C0(n17), .Y(n20) );
  OAI221X1M U140 ( .A0(B[2]), .A1(n103), .B0(B[3]), .B1(n117), .C0(n20), .Y(
        n21) );
  AOI32X1M U141 ( .A0(n23), .A1(n22), .A2(n21), .B0(n7), .B1(n104), .Y(n24) );
  OAI21X1M U142 ( .A0(B[5]), .A1(n115), .B0(n24), .Y(n25) );
  AOI32X1M U143 ( .A0(n27), .A1(n26), .A2(n25), .B0(n9), .B1(n105), .Y(n28) );
  OAI2B2X1M U144 ( .A1N(n10), .A0(B[7]), .B0(n29), .B1(n28), .Y(N154) );
  NOR4X1M U145 ( .A(n31), .B(n30), .C(N154), .D(n29), .Y(N153) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   SYNC_UART_RST, SYNC_REF_RST, UART_RX_V_OUT, UART_RX_V_SYNC,
         UART_TX_VLD, UART_TX_CLK, UART_TX_Busy_PULSE, FIFO_FULL,
         UART_TX_V_SYNC, UART_TX_Busy, UART_RX_CLK, RF_RdData_VLD, RF_WrEn,
         RF_RdEn, ALU_EN, ALU_OUT_VLD, CLKG_EN, ALU_CLK, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4;
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

  RST_SYNC_NUM_STAGES2_0 U0_RST_SYNC ( .RST(RST_N), .CLK(UART_CLK), .SYNC_RST(
        SYNC_UART_RST) );
  RST_SYNC_NUM_STAGES2_1 U1_RST_SYNC ( .RST(RST_N), .CLK(REF_CLK), .SYNC_RST(
        SYNC_REF_RST) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 U0_ref_sync ( .CLK(REF_CLK), .RST(n13), 
        .unsync_bus(UART_RX_OUT), .bus_enable(UART_RX_V_OUT), .sync_bus(
        UART_RX_SYNC), .enable_pulse_d(UART_RX_V_SYNC) );
  Async_fifo_D_SIZE8_P_SIZE4_F_DEPTH8 U0_UART_FIFO ( .i_w_clk(REF_CLK), 
        .i_w_rstn(n13), .i_w_inc(UART_TX_VLD), .i_r_clk(UART_TX_CLK), 
        .i_r_rstn(n15), .i_r_inc(UART_TX_Busy_PULSE), .i_w_data(UART_TX_IN), 
        .o_r_data(UART_TX_SYNC), .o_full(FIFO_FULL), .o_empty(UART_TX_V_SYNC)
         );
  PULSE_GEN U0_PULSE_GEN ( .clk(UART_TX_CLK), .rst(n15), .lvl_sig(UART_TX_Busy), .pulse_sig(UART_TX_Busy_PULSE) );
  ClkDiv_0 U0_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst(n15), .i_clk_en(1'b1), 
        .i_div_ratio(DIV_RATIO), .o_div_clk(UART_TX_CLK) );
  CLKDIV_MUX U0_CLKDIV_MUX ( .IN({n11, n9, n7, n5, n3, UART_Config[2]}), .OUT(
        {SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, 
        SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, DIV_RATIO_RX[3:0]}) );
  ClkDiv_1 U1_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst(n15), .i_clk_en(1'b1), 
        .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX[3:0]}), .o_div_clk(
        UART_RX_CLK) );
  UART U0_UART ( .RST(n15), .TX_CLK(UART_TX_CLK), .RX_CLK(UART_RX_CLK), 
        .RX_IN_S(n2), .RX_OUT_P(UART_RX_OUT), .RX_OUT_V(UART_RX_V_OUT), 
        .TX_IN_P(UART_TX_SYNC), .TX_IN_V(n1), .TX_OUT_S(UART_TX_O), .TX_OUT_V(
        UART_TX_Busy), .Prescale({n11, n9, n7, n5, n3, UART_Config[2]}), 
        .parity_enable(UART_Config[0]), .parity_type(UART_Config[1]), 
        .parity_error(parity_error), .framing_error(framing_error) );
  SYS_CTRL U0_SYS_CTRL ( .CLK(REF_CLK), .RST(n13), .ALU_OUT(ALU_OUT), 
        .ALU_OUT_VLD(ALU_OUT_VLD), .ALU_FUN(ALU_FUN), .ALU_EN(ALU_EN), 
        .CLKG_EN(CLKG_EN), .RF_Address(RF_Address), .RF_WrEn(RF_WrEn), 
        .RF_RdEn(RF_RdEn), .RF_WrData(RF_WrData), .RF_RdData(RF_RdData), 
        .RF_RdData_VLD(RF_RdData_VLD), .UART_RX_DATA(UART_RX_SYNC), 
        .UART_RX_VLD(UART_RX_V_SYNC), .UART_TX_DATA(UART_TX_IN), .UART_TX_VLD(
        UART_TX_VLD), .FIFO_FULL(FIFO_FULL) );
  RegFile U0_RegFile ( .CLK(REF_CLK), .RST(n13), .WrEn(RF_WrEn), .RdEn(RF_RdEn), .Address(RF_Address), .WrData(RF_WrData), .RdData(RF_RdData), .RdData_VLD(
        RF_RdData_VLD), .REG0(Operand_A), .REG1(Operand_B), .REG2(UART_Config), 
        .REG3(DIV_RATIO) );
  ALU U0_ALU ( .A(Operand_A), .B(Operand_B), .EN(ALU_EN), .ALU_FUN(ALU_FUN), 
        .CLK(ALU_CLK), .RST(n13), .ALU_OUT(ALU_OUT), .OUT_VALID(ALU_OUT_VLD)
         );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(CLKG_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK)
         );
  INVX2M U2 ( .A(UART_TX_V_SYNC), .Y(n1) );
  BUFX2M U3 ( .A(UART_RX_IN), .Y(n2) );
  INVX4M U4 ( .A(n14), .Y(n13) );
  INVX2M U5 ( .A(SYNC_REF_RST), .Y(n14) );
  INVX4M U6 ( .A(n16), .Y(n15) );
  INVX2M U7 ( .A(SYNC_UART_RST), .Y(n16) );
  INVX2M U8 ( .A(n6), .Y(n5) );
  INVX2M U9 ( .A(UART_Config[4]), .Y(n6) );
  INVX2M U10 ( .A(n8), .Y(n7) );
  INVX2M U11 ( .A(UART_Config[5]), .Y(n8) );
  INVX2M U12 ( .A(n10), .Y(n9) );
  INVX2M U13 ( .A(UART_Config[6]), .Y(n10) );
  INVX2M U14 ( .A(n4), .Y(n3) );
  INVX2M U15 ( .A(UART_Config[3]), .Y(n4) );
  INVX2M U16 ( .A(n12), .Y(n11) );
  INVX2M U17 ( .A(UART_Config[7]), .Y(n12) );
endmodule

