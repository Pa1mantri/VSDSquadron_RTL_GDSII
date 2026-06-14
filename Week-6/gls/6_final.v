module debug_regs (wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _101_;
 wire _103_;
 wire _104_;
 wire _106_;
 wire _108_;
 wire _111_;
 wire _112_;
 wire _115_;
 wire _116_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _123_;
 wire _124_;
 wire _125_;
 wire _126_;
 wire _127_;
 wire _128_;
 wire _129_;
 wire _130_;
 wire _132_;
 wire _133_;
 wire _134_;
 wire _136_;
 wire _137_;
 wire _139_;
 wire _140_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _154_;
 wire _156_;
 wire _157_;
 wire _158_;
 wire _160_;
 wire _161_;
 wire _163_;
 wire _164_;
 wire _165_;
 wire _166_;
 wire _167_;
 wire _168_;
 wire _169_;
 wire _170_;
 wire _171_;
 wire _172_;
 wire _173_;
 wire _174_;
 wire _175_;
 wire _176_;
 wire _177_;
 wire _178_;
 wire _179_;
 wire _180_;
 wire _181_;
 wire _182_;
 wire _183_;
 wire _184_;
 wire _185_;
 wire _186_;
 wire _187_;
 wire _188_;
 wire _189_;
 wire _190_;
 wire _191_;
 wire _192_;
 wire _193_;
 wire _194_;
 wire _195_;
 wire _196_;
 wire \debug_reg_1[0] ;
 wire \debug_reg_1[10] ;
 wire \debug_reg_1[11] ;
 wire \debug_reg_1[12] ;
 wire \debug_reg_1[13] ;
 wire \debug_reg_1[14] ;
 wire \debug_reg_1[15] ;
 wire \debug_reg_1[16] ;
 wire \debug_reg_1[17] ;
 wire \debug_reg_1[18] ;
 wire \debug_reg_1[19] ;
 wire \debug_reg_1[1] ;
 wire \debug_reg_1[20] ;
 wire \debug_reg_1[21] ;
 wire \debug_reg_1[22] ;
 wire \debug_reg_1[23] ;
 wire \debug_reg_1[24] ;
 wire \debug_reg_1[25] ;
 wire \debug_reg_1[26] ;
 wire \debug_reg_1[27] ;
 wire \debug_reg_1[28] ;
 wire \debug_reg_1[29] ;
 wire \debug_reg_1[2] ;
 wire \debug_reg_1[30] ;
 wire \debug_reg_1[31] ;
 wire \debug_reg_1[3] ;
 wire \debug_reg_1[4] ;
 wire \debug_reg_1[5] ;
 wire \debug_reg_1[6] ;
 wire \debug_reg_1[7] ;
 wire \debug_reg_1[8] ;
 wire \debug_reg_1[9] ;
 wire \debug_reg_2[0] ;
 wire \debug_reg_2[10] ;
 wire \debug_reg_2[11] ;
 wire \debug_reg_2[12] ;
 wire \debug_reg_2[13] ;
 wire \debug_reg_2[14] ;
 wire \debug_reg_2[15] ;
 wire \debug_reg_2[16] ;
 wire \debug_reg_2[17] ;
 wire \debug_reg_2[18] ;
 wire \debug_reg_2[19] ;
 wire \debug_reg_2[1] ;
 wire \debug_reg_2[20] ;
 wire \debug_reg_2[21] ;
 wire \debug_reg_2[22] ;
 wire \debug_reg_2[23] ;
 wire \debug_reg_2[24] ;
 wire \debug_reg_2[25] ;
 wire \debug_reg_2[26] ;
 wire \debug_reg_2[27] ;
 wire \debug_reg_2[28] ;
 wire \debug_reg_2[29] ;
 wire \debug_reg_2[2] ;
 wire \debug_reg_2[30] ;
 wire \debug_reg_2[31] ;
 wire \debug_reg_2[3] ;
 wire \debug_reg_2[4] ;
 wire \debug_reg_2[5] ;
 wire \debug_reg_2[6] ;
 wire \debug_reg_2[7] ;
 wire \debug_reg_2[8] ;
 wire \debug_reg_2[9] ;
 wire net1;
 wire net45;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net46;
 wire net47;
 wire net48;
 wire net49;
 wire net50;
 wire net51;
 wire net52;
 wire net53;
 wire net54;
 wire net55;
 wire net56;
 wire net57;
 wire net58;
 wire net59;
 wire net60;
 wire net61;
 wire net62;
 wire net63;
 wire net64;
 wire net65;
 wire net66;
 wire net67;
 wire net68;
 wire net69;
 wire net70;
 wire net71;
 wire net72;
 wire net73;
 wire net74;
 wire net75;
 wire net76;
 wire net77;
 wire net39;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net86;
 wire net84;
 wire net85;
 wire clknet_0_wb_clk_i;
 wire net83;
 wire clknet_3_0__leaf_wb_clk_i;
 wire clknet_3_1__leaf_wb_clk_i;
 wire clknet_3_2__leaf_wb_clk_i;
 wire clknet_3_3__leaf_wb_clk_i;
 wire clknet_3_4__leaf_wb_clk_i;
 wire clknet_3_5__leaf_wb_clk_i;
 wire clknet_3_6__leaf_wb_clk_i;
 wire clknet_3_7__leaf_wb_clk_i;

 sky130_fd_sc_hd__inv_2 _197_ (.A(net44),
    .Y(_098_));
 sky130_fd_sc_hd__nand4bb_4 _200_ (.A_N(net2),
    .B_N(net3),
    .C(net4),
    .D(net5),
    .Y(_101_));
 sky130_fd_sc_hd__mux2i_1 _202_ (.A0(\debug_reg_2[7] ),
    .A1(\debug_reg_1[7] ),
    .S(_101_),
    .Y(_103_));
 sky130_fd_sc_hd__or2_1 _203_ (.A(net2),
    .B(net3),
    .X(_104_));
 sky130_fd_sc_hd__nand4b_1 _205_ (.A_N(net45),
    .B(net5),
    .C(net6),
    .D(net43),
    .Y(_106_));
 sky130_fd_sc_hd__or2_2 _207_ (.A(_104_),
    .B(net83),
    .X(_108_));
 sky130_fd_sc_hd__nor2_1 _210_ (.A(net75),
    .B(_098_),
    .Y(_111_));
 sky130_fd_sc_hd__a211oi_1 _211_ (.A1(_098_),
    .A2(_103_),
    .B1(_108_),
    .C1(_111_),
    .Y(_050_));
 sky130_fd_sc_hd__and4bb_2 _212_ (.A_N(net2),
    .B_N(net3),
    .C(net4),
    .D(net5),
    .X(_112_));
 sky130_fd_sc_hd__mux2i_1 _215_ (.A0(\debug_reg_1[8] ),
    .A1(\debug_reg_2[8] ),
    .S(net85),
    .Y(_115_));
 sky130_fd_sc_hd__nor2_1 _216_ (.A(net76),
    .B(net86),
    .Y(_116_));
 sky130_fd_sc_hd__a211oi_1 _218_ (.A1(net86),
    .A2(_115_),
    .B1(_116_),
    .C1(_108_),
    .Y(_049_));
 sky130_fd_sc_hd__mux2i_1 _219_ (.A0(\debug_reg_1[9] ),
    .A1(\debug_reg_2[9] ),
    .S(net85),
    .Y(_118_));
 sky130_fd_sc_hd__nor2_1 _220_ (.A(net77),
    .B(net86),
    .Y(_119_));
 sky130_fd_sc_hd__a211oi_1 _221_ (.A1(net86),
    .A2(_118_),
    .B1(_119_),
    .C1(_108_),
    .Y(_048_));
 sky130_fd_sc_hd__mux2i_1 _222_ (.A0(\debug_reg_1[10] ),
    .A1(\debug_reg_2[10] ),
    .S(net85),
    .Y(_120_));
 sky130_fd_sc_hd__nor2_1 _223_ (.A(net47),
    .B(net86),
    .Y(_121_));
 sky130_fd_sc_hd__a211oi_1 _224_ (.A1(net86),
    .A2(_120_),
    .B1(_121_),
    .C1(_108_),
    .Y(_047_));
 sky130_fd_sc_hd__mux2i_1 _225_ (.A0(\debug_reg_1[11] ),
    .A1(\debug_reg_2[11] ),
    .S(net85),
    .Y(_122_));
 sky130_fd_sc_hd__nor2_1 _226_ (.A(net48),
    .B(net86),
    .Y(_123_));
 sky130_fd_sc_hd__a211oi_1 _227_ (.A1(net86),
    .A2(_122_),
    .B1(_123_),
    .C1(_108_),
    .Y(_046_));
 sky130_fd_sc_hd__mux2i_1 _228_ (.A0(\debug_reg_1[12] ),
    .A1(\debug_reg_2[12] ),
    .S(net85),
    .Y(_124_));
 sky130_fd_sc_hd__nor2_1 _229_ (.A(net49),
    .B(net86),
    .Y(_125_));
 sky130_fd_sc_hd__a211oi_1 _230_ (.A1(net86),
    .A2(_124_),
    .B1(_125_),
    .C1(_108_),
    .Y(_045_));
 sky130_fd_sc_hd__mux2i_1 _231_ (.A0(\debug_reg_1[13] ),
    .A1(\debug_reg_2[13] ),
    .S(net85),
    .Y(_126_));
 sky130_fd_sc_hd__nor2_1 _232_ (.A(net50),
    .B(net86),
    .Y(_127_));
 sky130_fd_sc_hd__a211oi_1 _233_ (.A1(net86),
    .A2(_126_),
    .B1(_127_),
    .C1(_108_),
    .Y(_044_));
 sky130_fd_sc_hd__mux2i_1 _234_ (.A0(\debug_reg_1[14] ),
    .A1(\debug_reg_2[14] ),
    .S(net85),
    .Y(_128_));
 sky130_fd_sc_hd__nor2_1 _235_ (.A(net51),
    .B(net86),
    .Y(_129_));
 sky130_fd_sc_hd__a211oi_1 _236_ (.A1(net86),
    .A2(_128_),
    .B1(_129_),
    .C1(_108_),
    .Y(_043_));
 sky130_fd_sc_hd__mux2i_1 _237_ (.A0(\debug_reg_2[15] ),
    .A1(\debug_reg_1[15] ),
    .S(_101_),
    .Y(_130_));
 sky130_fd_sc_hd__nor2_1 _239_ (.A(net52),
    .B(net86),
    .Y(_132_));
 sky130_fd_sc_hd__a211oi_1 _240_ (.A1(net86),
    .A2(_130_),
    .B1(_132_),
    .C1(_108_),
    .Y(_042_));
 sky130_fd_sc_hd__mux2i_1 _241_ (.A0(\debug_reg_1[16] ),
    .A1(\debug_reg_2[16] ),
    .S(net85),
    .Y(_133_));
 sky130_fd_sc_hd__nor2_1 _242_ (.A(net53),
    .B(_098_),
    .Y(_134_));
 sky130_fd_sc_hd__a211oi_1 _243_ (.A1(_098_),
    .A2(_133_),
    .B1(_134_),
    .C1(_108_),
    .Y(_041_));
 sky130_fd_sc_hd__mux2i_1 _245_ (.A0(\debug_reg_1[17] ),
    .A1(\debug_reg_2[17] ),
    .S(net85),
    .Y(_136_));
 sky130_fd_sc_hd__nor2_1 _246_ (.A(net54),
    .B(_098_),
    .Y(_137_));
 sky130_fd_sc_hd__a211oi_1 _248_ (.A1(_098_),
    .A2(_136_),
    .B1(_137_),
    .C1(_108_),
    .Y(_040_));
 sky130_fd_sc_hd__mux2i_1 _249_ (.A0(\debug_reg_1[18] ),
    .A1(\debug_reg_2[18] ),
    .S(net85),
    .Y(_139_));
 sky130_fd_sc_hd__nor2_1 _250_ (.A(net55),
    .B(_098_),
    .Y(_140_));
 sky130_fd_sc_hd__a211oi_1 _251_ (.A1(_098_),
    .A2(_139_),
    .B1(_140_),
    .C1(_108_),
    .Y(_039_));
 sky130_fd_sc_hd__mux2i_1 _253_ (.A0(\debug_reg_1[19] ),
    .A1(\debug_reg_2[19] ),
    .S(net85),
    .Y(_142_));
 sky130_fd_sc_hd__nor2_1 _254_ (.A(net56),
    .B(net86),
    .Y(_143_));
 sky130_fd_sc_hd__a211oi_1 _255_ (.A1(net86),
    .A2(_142_),
    .B1(_143_),
    .C1(_108_),
    .Y(_038_));
 sky130_fd_sc_hd__mux2i_1 _256_ (.A0(\debug_reg_1[20] ),
    .A1(\debug_reg_2[20] ),
    .S(net85),
    .Y(_144_));
 sky130_fd_sc_hd__nor2_1 _257_ (.A(net58),
    .B(net86),
    .Y(_145_));
 sky130_fd_sc_hd__a211oi_1 _258_ (.A1(net86),
    .A2(_144_),
    .B1(_145_),
    .C1(_108_),
    .Y(_037_));
 sky130_fd_sc_hd__mux2i_1 _259_ (.A0(\debug_reg_1[21] ),
    .A1(\debug_reg_2[21] ),
    .S(net85),
    .Y(_146_));
 sky130_fd_sc_hd__nor2_1 _260_ (.A(net59),
    .B(_098_),
    .Y(_147_));
 sky130_fd_sc_hd__a211oi_1 _261_ (.A1(_098_),
    .A2(_146_),
    .B1(_147_),
    .C1(_108_),
    .Y(_036_));
 sky130_fd_sc_hd__mux2i_1 _262_ (.A0(\debug_reg_1[22] ),
    .A1(\debug_reg_2[22] ),
    .S(net85),
    .Y(_148_));
 sky130_fd_sc_hd__nor2_1 _263_ (.A(net60),
    .B(_098_),
    .Y(_149_));
 sky130_fd_sc_hd__a211oi_1 _264_ (.A1(_098_),
    .A2(_148_),
    .B1(_149_),
    .C1(_108_),
    .Y(_035_));
 sky130_fd_sc_hd__mux2i_1 _265_ (.A0(\debug_reg_2[23] ),
    .A1(\debug_reg_1[23] ),
    .S(_101_),
    .Y(_150_));
 sky130_fd_sc_hd__nor2_1 _266_ (.A(net61),
    .B(_098_),
    .Y(_151_));
 sky130_fd_sc_hd__a211oi_1 _267_ (.A1(_098_),
    .A2(_150_),
    .B1(_151_),
    .C1(_108_),
    .Y(_034_));
 sky130_fd_sc_hd__mux2i_1 _268_ (.A0(\debug_reg_1[24] ),
    .A1(\debug_reg_2[24] ),
    .S(net85),
    .Y(_152_));
 sky130_fd_sc_hd__nor2_1 _269_ (.A(net62),
    .B(net86),
    .Y(_153_));
 sky130_fd_sc_hd__a211oi_1 _270_ (.A1(net86),
    .A2(_152_),
    .B1(_153_),
    .C1(_108_),
    .Y(_033_));
 sky130_fd_sc_hd__mux2i_1 _271_ (.A0(\debug_reg_1[25] ),
    .A1(\debug_reg_2[25] ),
    .S(net85),
    .Y(_154_));
 sky130_fd_sc_hd__nor2_1 _273_ (.A(net63),
    .B(net86),
    .Y(_156_));
 sky130_fd_sc_hd__a211oi_1 _274_ (.A1(net86),
    .A2(_154_),
    .B1(_156_),
    .C1(_108_),
    .Y(_032_));
 sky130_fd_sc_hd__mux2i_1 _275_ (.A0(\debug_reg_1[26] ),
    .A1(\debug_reg_2[26] ),
    .S(net85),
    .Y(_157_));
 sky130_fd_sc_hd__nor2_1 _276_ (.A(net64),
    .B(net86),
    .Y(_158_));
 sky130_fd_sc_hd__a211oi_1 _277_ (.A1(net86),
    .A2(_157_),
    .B1(_158_),
    .C1(_108_),
    .Y(_031_));
 sky130_fd_sc_hd__mux2i_1 _279_ (.A0(\debug_reg_1[27] ),
    .A1(\debug_reg_2[27] ),
    .S(net85),
    .Y(_160_));
 sky130_fd_sc_hd__nor2_1 _280_ (.A(net65),
    .B(net86),
    .Y(_161_));
 sky130_fd_sc_hd__a211oi_1 _282_ (.A1(net86),
    .A2(_160_),
    .B1(_161_),
    .C1(_108_),
    .Y(_030_));
 sky130_fd_sc_hd__mux2i_1 _283_ (.A0(\debug_reg_1[28] ),
    .A1(\debug_reg_2[28] ),
    .S(net85),
    .Y(_163_));
 sky130_fd_sc_hd__nor2_1 _284_ (.A(net66),
    .B(net86),
    .Y(_164_));
 sky130_fd_sc_hd__a211oi_1 _285_ (.A1(net86),
    .A2(_163_),
    .B1(_164_),
    .C1(_108_),
    .Y(_029_));
 sky130_fd_sc_hd__mux2i_1 _286_ (.A0(\debug_reg_1[29] ),
    .A1(\debug_reg_2[29] ),
    .S(net85),
    .Y(_165_));
 sky130_fd_sc_hd__nor2_1 _287_ (.A(net67),
    .B(net86),
    .Y(_166_));
 sky130_fd_sc_hd__a211oi_1 _288_ (.A1(net86),
    .A2(_165_),
    .B1(_166_),
    .C1(_108_),
    .Y(_028_));
 sky130_fd_sc_hd__mux2i_1 _289_ (.A0(\debug_reg_1[30] ),
    .A1(\debug_reg_2[30] ),
    .S(net85),
    .Y(_167_));
 sky130_fd_sc_hd__nor2_1 _290_ (.A(net69),
    .B(net86),
    .Y(_168_));
 sky130_fd_sc_hd__a211oi_1 _291_ (.A1(net86),
    .A2(_167_),
    .B1(_168_),
    .C1(_108_),
    .Y(_027_));
 sky130_fd_sc_hd__nand2_1 _292_ (.A(net44),
    .B(net42),
    .Y(_169_));
 sky130_fd_sc_hd__nor4_4 _293_ (.A(net4),
    .B(_104_),
    .C(net83),
    .D(_169_),
    .Y(_170_));
 sky130_fd_sc_hd__mux2_2 _294_ (.A0(\debug_reg_1[24] ),
    .A1(net23),
    .S(_170_),
    .X(_026_));
 sky130_fd_sc_hd__mux2_2 _295_ (.A0(\debug_reg_1[25] ),
    .A1(net24),
    .S(_170_),
    .X(_025_));
 sky130_fd_sc_hd__mux2_2 _296_ (.A0(\debug_reg_1[26] ),
    .A1(net25),
    .S(_170_),
    .X(_024_));
 sky130_fd_sc_hd__mux2_2 _297_ (.A0(\debug_reg_1[27] ),
    .A1(net26),
    .S(_170_),
    .X(_023_));
 sky130_fd_sc_hd__mux2_2 _298_ (.A0(\debug_reg_1[28] ),
    .A1(net27),
    .S(_170_),
    .X(_022_));
 sky130_fd_sc_hd__mux2_2 _299_ (.A0(\debug_reg_1[29] ),
    .A1(net28),
    .S(_170_),
    .X(_021_));
 sky130_fd_sc_hd__mux2_2 _300_ (.A0(\debug_reg_1[30] ),
    .A1(net30),
    .S(_170_),
    .X(_020_));
 sky130_fd_sc_hd__nand2_1 _301_ (.A(net44),
    .B(net41),
    .Y(_171_));
 sky130_fd_sc_hd__nor4_4 _302_ (.A(net4),
    .B(_104_),
    .C(net83),
    .D(_171_),
    .Y(_172_));
 sky130_fd_sc_hd__mux2_2 _303_ (.A0(\debug_reg_1[16] ),
    .A1(net14),
    .S(_172_),
    .X(_019_));
 sky130_fd_sc_hd__mux2_2 _304_ (.A0(\debug_reg_1[17] ),
    .A1(net15),
    .S(_172_),
    .X(_018_));
 sky130_fd_sc_hd__mux2_2 _305_ (.A0(\debug_reg_1[18] ),
    .A1(net16),
    .S(_172_),
    .X(_017_));
 sky130_fd_sc_hd__mux2_2 _306_ (.A0(\debug_reg_1[19] ),
    .A1(net17),
    .S(_172_),
    .X(_016_));
 sky130_fd_sc_hd__mux2_2 _307_ (.A0(\debug_reg_1[20] ),
    .A1(net19),
    .S(_172_),
    .X(_015_));
 sky130_fd_sc_hd__mux2_2 _308_ (.A0(\debug_reg_1[21] ),
    .A1(net20),
    .S(_172_),
    .X(_014_));
 sky130_fd_sc_hd__mux2_2 _309_ (.A0(\debug_reg_1[22] ),
    .A1(net21),
    .S(_172_),
    .X(_013_));
 sky130_fd_sc_hd__nand2_1 _310_ (.A(net44),
    .B(net40),
    .Y(_173_));
 sky130_fd_sc_hd__nor4_4 _311_ (.A(net4),
    .B(_104_),
    .C(net83),
    .D(_173_),
    .Y(_174_));
 sky130_fd_sc_hd__mux2_2 _312_ (.A0(\debug_reg_1[8] ),
    .A1(net37),
    .S(_174_),
    .X(_012_));
 sky130_fd_sc_hd__mux2_2 _313_ (.A0(\debug_reg_1[9] ),
    .A1(net38),
    .S(_174_),
    .X(_011_));
 sky130_fd_sc_hd__mux2_2 _314_ (.A0(\debug_reg_1[10] ),
    .A1(net8),
    .S(_174_),
    .X(_010_));
 sky130_fd_sc_hd__mux2_2 _315_ (.A0(\debug_reg_1[11] ),
    .A1(net9),
    .S(_174_),
    .X(_009_));
 sky130_fd_sc_hd__mux2_2 _316_ (.A0(\debug_reg_1[12] ),
    .A1(net10),
    .S(_174_),
    .X(_008_));
 sky130_fd_sc_hd__mux2_2 _317_ (.A0(\debug_reg_1[13] ),
    .A1(net11),
    .S(_174_),
    .X(_007_));
 sky130_fd_sc_hd__mux2_2 _318_ (.A0(\debug_reg_1[14] ),
    .A1(net12),
    .S(_174_),
    .X(_006_));
 sky130_fd_sc_hd__nand2_1 _319_ (.A(net44),
    .B(net39),
    .Y(_175_));
 sky130_fd_sc_hd__nor4_4 _320_ (.A(net4),
    .B(_104_),
    .C(net83),
    .D(_175_),
    .Y(_176_));
 sky130_fd_sc_hd__mux2_2 _321_ (.A0(\debug_reg_1[0] ),
    .A1(net7),
    .S(_176_),
    .X(_005_));
 sky130_fd_sc_hd__mux2_2 _322_ (.A0(\debug_reg_1[1] ),
    .A1(net18),
    .S(_176_),
    .X(_004_));
 sky130_fd_sc_hd__mux2_2 _323_ (.A0(\debug_reg_1[2] ),
    .A1(net29),
    .S(_176_),
    .X(_003_));
 sky130_fd_sc_hd__mux2_2 _324_ (.A0(\debug_reg_1[3] ),
    .A1(net32),
    .S(_176_),
    .X(_002_));
 sky130_fd_sc_hd__inv_1 _325_ (.A(_108_),
    .Y(_000_));
 sky130_fd_sc_hd__inv_4 _326_ (.A(net1),
    .Y(_001_));
 sky130_fd_sc_hd__mux2_2 _327_ (.A0(\debug_reg_1[4] ),
    .A1(net33),
    .S(_176_),
    .X(_097_));
 sky130_fd_sc_hd__mux2_2 _328_ (.A0(\debug_reg_1[5] ),
    .A1(net34),
    .S(_176_),
    .X(_096_));
 sky130_fd_sc_hd__mux2_2 _329_ (.A0(\debug_reg_1[6] ),
    .A1(net35),
    .S(_176_),
    .X(_095_));
 sky130_fd_sc_hd__nor4_4 _330_ (.A(_104_),
    .B(_101_),
    .C(net83),
    .D(_175_),
    .Y(_177_));
 sky130_fd_sc_hd__mux2_2 _331_ (.A0(\debug_reg_2[7] ),
    .A1(net36),
    .S(_177_),
    .X(_094_));
 sky130_fd_sc_hd__nor4_4 _332_ (.A(_104_),
    .B(_101_),
    .C(net83),
    .D(_169_),
    .Y(_178_));
 sky130_fd_sc_hd__mux2_2 _333_ (.A0(\debug_reg_2[24] ),
    .A1(net23),
    .S(_178_),
    .X(_093_));
 sky130_fd_sc_hd__mux2_2 _334_ (.A0(\debug_reg_2[25] ),
    .A1(net24),
    .S(_178_),
    .X(_092_));
 sky130_fd_sc_hd__mux2_2 _335_ (.A0(\debug_reg_2[26] ),
    .A1(net25),
    .S(_178_),
    .X(_091_));
 sky130_fd_sc_hd__mux2_2 _336_ (.A0(\debug_reg_2[27] ),
    .A1(net26),
    .S(_178_),
    .X(_090_));
 sky130_fd_sc_hd__mux2_2 _337_ (.A0(\debug_reg_2[28] ),
    .A1(net27),
    .S(_178_),
    .X(_089_));
 sky130_fd_sc_hd__mux2_2 _338_ (.A0(\debug_reg_2[29] ),
    .A1(net28),
    .S(_178_),
    .X(_088_));
 sky130_fd_sc_hd__mux2_2 _339_ (.A0(\debug_reg_2[30] ),
    .A1(net30),
    .S(_178_),
    .X(_087_));
 sky130_fd_sc_hd__nor4_4 _340_ (.A(_104_),
    .B(_101_),
    .C(net83),
    .D(_171_),
    .Y(_179_));
 sky130_fd_sc_hd__mux2_2 _341_ (.A0(\debug_reg_2[16] ),
    .A1(net14),
    .S(_179_),
    .X(_086_));
 sky130_fd_sc_hd__mux2_2 _342_ (.A0(\debug_reg_2[17] ),
    .A1(net15),
    .S(_179_),
    .X(_085_));
 sky130_fd_sc_hd__mux2_2 _343_ (.A0(\debug_reg_2[18] ),
    .A1(net16),
    .S(_179_),
    .X(_084_));
 sky130_fd_sc_hd__mux2_2 _344_ (.A0(\debug_reg_2[19] ),
    .A1(net17),
    .S(_179_),
    .X(_083_));
 sky130_fd_sc_hd__mux2_2 _345_ (.A0(\debug_reg_2[20] ),
    .A1(net19),
    .S(_179_),
    .X(_082_));
 sky130_fd_sc_hd__mux2_2 _346_ (.A0(\debug_reg_2[21] ),
    .A1(net20),
    .S(_179_),
    .X(_081_));
 sky130_fd_sc_hd__mux2_2 _347_ (.A0(\debug_reg_2[22] ),
    .A1(net21),
    .S(_179_),
    .X(_080_));
 sky130_fd_sc_hd__nor4_4 _348_ (.A(_104_),
    .B(_101_),
    .C(net83),
    .D(_173_),
    .Y(_180_));
 sky130_fd_sc_hd__mux2_2 _349_ (.A0(\debug_reg_2[8] ),
    .A1(net37),
    .S(_180_),
    .X(_079_));
 sky130_fd_sc_hd__mux2_2 _350_ (.A0(\debug_reg_2[9] ),
    .A1(net38),
    .S(_180_),
    .X(_078_));
 sky130_fd_sc_hd__mux2_2 _351_ (.A0(\debug_reg_2[10] ),
    .A1(net8),
    .S(_180_),
    .X(_077_));
 sky130_fd_sc_hd__mux2_2 _352_ (.A0(\debug_reg_2[11] ),
    .A1(net9),
    .S(_180_),
    .X(_076_));
 sky130_fd_sc_hd__mux2_2 _353_ (.A0(\debug_reg_2[12] ),
    .A1(net10),
    .S(_180_),
    .X(_075_));
 sky130_fd_sc_hd__mux2_2 _354_ (.A0(\debug_reg_2[13] ),
    .A1(net11),
    .S(_180_),
    .X(_074_));
 sky130_fd_sc_hd__mux2_2 _355_ (.A0(\debug_reg_2[14] ),
    .A1(net12),
    .S(_180_),
    .X(_073_));
 sky130_fd_sc_hd__mux2_2 _356_ (.A0(\debug_reg_2[0] ),
    .A1(net7),
    .S(_177_),
    .X(_072_));
 sky130_fd_sc_hd__mux2_2 _357_ (.A0(\debug_reg_2[1] ),
    .A1(net18),
    .S(_177_),
    .X(_071_));
 sky130_fd_sc_hd__mux2_2 _358_ (.A0(\debug_reg_2[2] ),
    .A1(net29),
    .S(_177_),
    .X(_070_));
 sky130_fd_sc_hd__mux2_2 _359_ (.A0(\debug_reg_2[3] ),
    .A1(net32),
    .S(_177_),
    .X(_069_));
 sky130_fd_sc_hd__mux2_2 _360_ (.A0(\debug_reg_2[4] ),
    .A1(net33),
    .S(_177_),
    .X(_068_));
 sky130_fd_sc_hd__mux2_2 _361_ (.A0(\debug_reg_2[5] ),
    .A1(net34),
    .S(_177_),
    .X(_067_));
 sky130_fd_sc_hd__mux2_2 _362_ (.A0(\debug_reg_2[6] ),
    .A1(net35),
    .S(_177_),
    .X(_066_));
 sky130_fd_sc_hd__mux2i_1 _363_ (.A0(\debug_reg_2[31] ),
    .A1(\debug_reg_1[31] ),
    .S(_101_),
    .Y(_181_));
 sky130_fd_sc_hd__nor2_1 _364_ (.A(net86),
    .B(net70),
    .Y(_182_));
 sky130_fd_sc_hd__a211oi_1 _365_ (.A1(net86),
    .A2(_181_),
    .B1(_182_),
    .C1(_108_),
    .Y(_065_));
 sky130_fd_sc_hd__mux2_2 _366_ (.A0(\debug_reg_1[31] ),
    .A1(net31),
    .S(_170_),
    .X(_064_));
 sky130_fd_sc_hd__mux2_2 _367_ (.A0(\debug_reg_1[23] ),
    .A1(net22),
    .S(_172_),
    .X(_063_));
 sky130_fd_sc_hd__mux2_2 _368_ (.A0(\debug_reg_1[15] ),
    .A1(net13),
    .S(_174_),
    .X(_062_));
 sky130_fd_sc_hd__mux2_2 _369_ (.A0(\debug_reg_1[7] ),
    .A1(net36),
    .S(_176_),
    .X(_061_));
 sky130_fd_sc_hd__mux2_2 _370_ (.A0(\debug_reg_2[31] ),
    .A1(net31),
    .S(_178_),
    .X(_060_));
 sky130_fd_sc_hd__mux2_2 _371_ (.A0(\debug_reg_2[23] ),
    .A1(net22),
    .S(_179_),
    .X(_059_));
 sky130_fd_sc_hd__mux2_2 _372_ (.A0(\debug_reg_2[15] ),
    .A1(net13),
    .S(_180_),
    .X(_058_));
 sky130_fd_sc_hd__mux2i_1 _373_ (.A0(\debug_reg_1[0] ),
    .A1(\debug_reg_2[0] ),
    .S(net85),
    .Y(_183_));
 sky130_fd_sc_hd__nor2_1 _374_ (.A(_098_),
    .B(net46),
    .Y(_184_));
 sky130_fd_sc_hd__a211oi_1 _375_ (.A1(_098_),
    .A2(_183_),
    .B1(_184_),
    .C1(_108_),
    .Y(_057_));
 sky130_fd_sc_hd__mux2i_1 _376_ (.A0(\debug_reg_1[1] ),
    .A1(\debug_reg_2[1] ),
    .S(net85),
    .Y(_185_));
 sky130_fd_sc_hd__nor2_1 _377_ (.A(_098_),
    .B(net57),
    .Y(_186_));
 sky130_fd_sc_hd__a211oi_1 _378_ (.A1(_098_),
    .A2(_185_),
    .B1(_186_),
    .C1(_108_),
    .Y(_056_));
 sky130_fd_sc_hd__mux2i_1 _379_ (.A0(\debug_reg_1[2] ),
    .A1(\debug_reg_2[2] ),
    .S(net85),
    .Y(_187_));
 sky130_fd_sc_hd__nor2_1 _380_ (.A(_098_),
    .B(net68),
    .Y(_188_));
 sky130_fd_sc_hd__a211oi_1 _381_ (.A1(_098_),
    .A2(_187_),
    .B1(_188_),
    .C1(_108_),
    .Y(_055_));
 sky130_fd_sc_hd__mux2i_1 _382_ (.A0(\debug_reg_1[3] ),
    .A1(\debug_reg_2[3] ),
    .S(net85),
    .Y(_189_));
 sky130_fd_sc_hd__nor2_1 _383_ (.A(_098_),
    .B(net71),
    .Y(_190_));
 sky130_fd_sc_hd__a211oi_1 _384_ (.A1(_098_),
    .A2(_189_),
    .B1(_190_),
    .C1(_108_),
    .Y(_054_));
 sky130_fd_sc_hd__mux2i_1 _385_ (.A0(\debug_reg_2[4] ),
    .A1(\debug_reg_1[4] ),
    .S(_101_),
    .Y(_191_));
 sky130_fd_sc_hd__nor2_1 _386_ (.A(_098_),
    .B(net72),
    .Y(_192_));
 sky130_fd_sc_hd__a211oi_1 _387_ (.A1(_098_),
    .A2(_191_),
    .B1(_192_),
    .C1(_108_),
    .Y(_053_));
 sky130_fd_sc_hd__mux2i_1 _388_ (.A0(\debug_reg_2[5] ),
    .A1(\debug_reg_1[5] ),
    .S(_101_),
    .Y(_193_));
 sky130_fd_sc_hd__nor2_1 _389_ (.A(_098_),
    .B(net73),
    .Y(_194_));
 sky130_fd_sc_hd__a211oi_1 _390_ (.A1(_098_),
    .A2(_193_),
    .B1(_194_),
    .C1(_108_),
    .Y(_052_));
 sky130_fd_sc_hd__mux2i_1 _391_ (.A0(\debug_reg_2[6] ),
    .A1(\debug_reg_1[6] ),
    .S(_101_),
    .Y(_195_));
 sky130_fd_sc_hd__nor2_1 _392_ (.A(_098_),
    .B(net74),
    .Y(_196_));
 sky130_fd_sc_hd__a211oi_1 _393_ (.A1(_098_),
    .A2(_195_),
    .B1(_196_),
    .C1(_108_),
    .Y(_051_));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_0_wb_clk_i (.A(wb_clk_i),
    .X(clknet_0_wb_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_3_0__f_wb_clk_i (.A(clknet_0_wb_clk_i),
    .X(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_3_1__f_wb_clk_i (.A(clknet_0_wb_clk_i),
    .X(clknet_3_1__leaf_wb_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_3_2__f_wb_clk_i (.A(clknet_0_wb_clk_i),
    .X(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_3_3__f_wb_clk_i (.A(clknet_0_wb_clk_i),
    .X(clknet_3_3__leaf_wb_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_3_4__f_wb_clk_i (.A(clknet_0_wb_clk_i),
    .X(clknet_3_4__leaf_wb_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_3_5__f_wb_clk_i (.A(clknet_0_wb_clk_i),
    .X(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_3_6__f_wb_clk_i (.A(clknet_0_wb_clk_i),
    .X(clknet_3_6__leaf_wb_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_3_7__f_wb_clk_i (.A(clknet_0_wb_clk_i),
    .X(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__clkbuf_1 clkload0 (.A(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__clkinvlp_4 clkload1 (.A(clknet_3_1__leaf_wb_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkload2 (.A(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__bufinv_16 clkload3 (.A(clknet_3_3__leaf_wb_clk_i));
 sky130_fd_sc_hd__clkinvlp_4 clkload4 (.A(clknet_3_4__leaf_wb_clk_i));
 sky130_fd_sc_hd__clkbuf_8 clkload5 (.A(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__bufinv_16 clkload6 (.A(clknet_3_6__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[0]$_DFFE_PP0P_  (.D(_005_),
    .Q(\debug_reg_1[0] ),
    .RESET_B(net84),
    .CLK(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[10]$_DFFE_PP0P_  (.D(_010_),
    .Q(\debug_reg_1[10] ),
    .RESET_B(net84),
    .CLK(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[11]$_DFFE_PP0P_  (.D(_009_),
    .Q(\debug_reg_1[11] ),
    .RESET_B(net84),
    .CLK(clknet_3_6__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[12]$_DFFE_PP0P_  (.D(_008_),
    .Q(\debug_reg_1[12] ),
    .RESET_B(_001_),
    .CLK(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[13]$_DFFE_PP0P_  (.D(_007_),
    .Q(\debug_reg_1[13] ),
    .RESET_B(_001_),
    .CLK(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[14]$_DFFE_PP0P_  (.D(_006_),
    .Q(\debug_reg_1[14] ),
    .RESET_B(net84),
    .CLK(clknet_3_6__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[15]$_DFFE_PP0P_  (.D(_062_),
    .Q(\debug_reg_1[15] ),
    .RESET_B(net84),
    .CLK(clknet_3_6__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[16]$_DFFE_PP0P_  (.D(_019_),
    .Q(\debug_reg_1[16] ),
    .RESET_B(net84),
    .CLK(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[17]$_DFFE_PP0P_  (.D(_018_),
    .Q(\debug_reg_1[17] ),
    .RESET_B(net84),
    .CLK(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[18]$_DFFE_PP0P_  (.D(_017_),
    .Q(\debug_reg_1[18] ),
    .RESET_B(net84),
    .CLK(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[19]$_DFFE_PP0P_  (.D(_016_),
    .Q(\debug_reg_1[19] ),
    .RESET_B(net84),
    .CLK(clknet_3_3__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[1]$_DFFE_PP0P_  (.D(_004_),
    .Q(\debug_reg_1[1] ),
    .RESET_B(net84),
    .CLK(clknet_3_1__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[20]$_DFFE_PP0P_  (.D(_015_),
    .Q(\debug_reg_1[20] ),
    .RESET_B(net84),
    .CLK(clknet_3_3__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[21]$_DFFE_PP0P_  (.D(_014_),
    .Q(\debug_reg_1[21] ),
    .RESET_B(net84),
    .CLK(clknet_3_3__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[22]$_DFFE_PP0P_  (.D(_013_),
    .Q(\debug_reg_1[22] ),
    .RESET_B(net84),
    .CLK(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[23]$_DFFE_PP0P_  (.D(_063_),
    .Q(\debug_reg_1[23] ),
    .RESET_B(net84),
    .CLK(clknet_3_3__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[24]$_DFFE_PP0P_  (.D(_026_),
    .Q(\debug_reg_1[24] ),
    .RESET_B(_001_),
    .CLK(clknet_3_4__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[25]$_DFFE_PP0P_  (.D(_025_),
    .Q(\debug_reg_1[25] ),
    .RESET_B(_001_),
    .CLK(clknet_3_4__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[26]$_DFFE_PP0P_  (.D(_024_),
    .Q(\debug_reg_1[26] ),
    .RESET_B(_001_),
    .CLK(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[27]$_DFFE_PP0P_  (.D(_023_),
    .Q(\debug_reg_1[27] ),
    .RESET_B(_001_),
    .CLK(clknet_3_4__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[28]$_DFFE_PP0P_  (.D(_022_),
    .Q(\debug_reg_1[28] ),
    .RESET_B(_001_),
    .CLK(clknet_3_4__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[29]$_DFFE_PP0P_  (.D(_021_),
    .Q(\debug_reg_1[29] ),
    .RESET_B(_001_),
    .CLK(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[2]$_DFFE_PP0P_  (.D(_003_),
    .Q(\debug_reg_1[2] ),
    .RESET_B(net84),
    .CLK(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[30]$_DFFE_PP0P_  (.D(_020_),
    .Q(\debug_reg_1[30] ),
    .RESET_B(_001_),
    .CLK(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[31]$_DFFE_PP0P_  (.D(_064_),
    .Q(\debug_reg_1[31] ),
    .RESET_B(_001_),
    .CLK(clknet_3_4__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[3]$_DFFE_PP0P_  (.D(_002_),
    .Q(\debug_reg_1[3] ),
    .RESET_B(net84),
    .CLK(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[4]$_DFFE_PP0P_  (.D(_097_),
    .Q(\debug_reg_1[4] ),
    .RESET_B(net84),
    .CLK(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[5]$_DFFE_PP0P_  (.D(_096_),
    .Q(\debug_reg_1[5] ),
    .RESET_B(net84),
    .CLK(clknet_3_1__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[6]$_DFFE_PP0P_  (.D(_095_),
    .Q(\debug_reg_1[6] ),
    .RESET_B(net84),
    .CLK(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[7]$_DFFE_PP0P_  (.D(_061_),
    .Q(\debug_reg_1[7] ),
    .RESET_B(net84),
    .CLK(clknet_3_1__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[8]$_DFFE_PP0P_  (.D(_012_),
    .Q(\debug_reg_1[8] ),
    .RESET_B(_001_),
    .CLK(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_1[9]$_DFFE_PP0P_  (.D(_011_),
    .Q(\debug_reg_1[9] ),
    .RESET_B(net84),
    .CLK(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[0]$_DFFE_PP0P_  (.D(_072_),
    .Q(\debug_reg_2[0] ),
    .RESET_B(net84),
    .CLK(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[10]$_DFFE_PP0P_  (.D(_077_),
    .Q(\debug_reg_2[10] ),
    .RESET_B(net84),
    .CLK(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[11]$_DFFE_PP0P_  (.D(_076_),
    .Q(\debug_reg_2[11] ),
    .RESET_B(net84),
    .CLK(clknet_3_6__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[12]$_DFFE_PP0P_  (.D(_075_),
    .Q(\debug_reg_2[12] ),
    .RESET_B(_001_),
    .CLK(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[13]$_DFFE_PP0P_  (.D(_074_),
    .Q(\debug_reg_2[13] ),
    .RESET_B(_001_),
    .CLK(clknet_3_6__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[14]$_DFFE_PP0P_  (.D(_073_),
    .Q(\debug_reg_2[14] ),
    .RESET_B(net84),
    .CLK(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[15]$_DFFE_PP0P_  (.D(_058_),
    .Q(\debug_reg_2[15] ),
    .RESET_B(net84),
    .CLK(clknet_3_6__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[16]$_DFFE_PP0P_  (.D(_086_),
    .Q(\debug_reg_2[16] ),
    .RESET_B(net84),
    .CLK(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[17]$_DFFE_PP0P_  (.D(_085_),
    .Q(\debug_reg_2[17] ),
    .RESET_B(net84),
    .CLK(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[18]$_DFFE_PP0P_  (.D(_084_),
    .Q(\debug_reg_2[18] ),
    .RESET_B(net84),
    .CLK(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[19]$_DFFE_PP0P_  (.D(_083_),
    .Q(\debug_reg_2[19] ),
    .RESET_B(net84),
    .CLK(clknet_3_3__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[1]$_DFFE_PP0P_  (.D(_071_),
    .Q(\debug_reg_2[1] ),
    .RESET_B(net84),
    .CLK(clknet_3_1__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[20]$_DFFE_PP0P_  (.D(_082_),
    .Q(\debug_reg_2[20] ),
    .RESET_B(net84),
    .CLK(clknet_3_3__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[21]$_DFFE_PP0P_  (.D(_081_),
    .Q(\debug_reg_2[21] ),
    .RESET_B(net84),
    .CLK(clknet_3_3__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[22]$_DFFE_PP0P_  (.D(_080_),
    .Q(\debug_reg_2[22] ),
    .RESET_B(net84),
    .CLK(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[23]$_DFFE_PP0P_  (.D(_059_),
    .Q(\debug_reg_2[23] ),
    .RESET_B(net84),
    .CLK(clknet_3_3__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[24]$_DFFE_PP0P_  (.D(_093_),
    .Q(\debug_reg_2[24] ),
    .RESET_B(_001_),
    .CLK(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[25]$_DFFE_PP0P_  (.D(_092_),
    .Q(\debug_reg_2[25] ),
    .RESET_B(_001_),
    .CLK(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[26]$_DFFE_PP0P_  (.D(_091_),
    .Q(\debug_reg_2[26] ),
    .RESET_B(_001_),
    .CLK(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[27]$_DFFE_PP0P_  (.D(_090_),
    .Q(\debug_reg_2[27] ),
    .RESET_B(_001_),
    .CLK(clknet_3_4__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[28]$_DFFE_PP0P_  (.D(_089_),
    .Q(\debug_reg_2[28] ),
    .RESET_B(_001_),
    .CLK(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[29]$_DFFE_PP0P_  (.D(_088_),
    .Q(\debug_reg_2[29] ),
    .RESET_B(_001_),
    .CLK(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[2]$_DFFE_PP0P_  (.D(_070_),
    .Q(\debug_reg_2[2] ),
    .RESET_B(net84),
    .CLK(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[30]$_DFFE_PP0P_  (.D(_087_),
    .Q(\debug_reg_2[30] ),
    .RESET_B(_001_),
    .CLK(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[31]$_DFFE_PP0P_  (.D(_060_),
    .Q(\debug_reg_2[31] ),
    .RESET_B(_001_),
    .CLK(clknet_3_4__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[3]$_DFFE_PP0P_  (.D(_069_),
    .Q(\debug_reg_2[3] ),
    .RESET_B(net84),
    .CLK(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[4]$_DFFE_PP0P_  (.D(_068_),
    .Q(\debug_reg_2[4] ),
    .RESET_B(net84),
    .CLK(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[5]$_DFFE_PP0P_  (.D(_067_),
    .Q(\debug_reg_2[5] ),
    .RESET_B(net84),
    .CLK(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[6]$_DFFE_PP0P_  (.D(_066_),
    .Q(\debug_reg_2[6] ),
    .RESET_B(net84),
    .CLK(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[7]$_DFFE_PP0P_  (.D(_094_),
    .Q(\debug_reg_2[7] ),
    .RESET_B(net84),
    .CLK(clknet_3_1__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[8]$_DFFE_PP0P_  (.D(_079_),
    .Q(\debug_reg_2[8] ),
    .RESET_B(_001_),
    .CLK(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \debug_reg_2[9]$_DFFE_PP0P_  (.D(_078_),
    .Q(\debug_reg_2[9] ),
    .RESET_B(net84),
    .CLK(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input1 (.A(wb_rst_i),
    .X(net1));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input10 (.A(wbs_dat_i[12]),
    .X(net10));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input11 (.A(wbs_dat_i[13]),
    .X(net11));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input12 (.A(wbs_dat_i[14]),
    .X(net12));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input13 (.A(wbs_dat_i[15]),
    .X(net13));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input14 (.A(wbs_dat_i[16]),
    .X(net14));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input15 (.A(wbs_dat_i[17]),
    .X(net15));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input16 (.A(wbs_dat_i[18]),
    .X(net16));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input17 (.A(wbs_dat_i[19]),
    .X(net17));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input18 (.A(wbs_dat_i[1]),
    .X(net18));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input19 (.A(wbs_dat_i[20]),
    .X(net19));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input2 (.A(wbs_adr_i[0]),
    .X(net2));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input20 (.A(wbs_dat_i[21]),
    .X(net20));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input21 (.A(wbs_dat_i[22]),
    .X(net21));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input22 (.A(wbs_dat_i[23]),
    .X(net22));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input23 (.A(wbs_dat_i[24]),
    .X(net23));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input24 (.A(wbs_dat_i[25]),
    .X(net24));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input25 (.A(wbs_dat_i[26]),
    .X(net25));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input26 (.A(wbs_dat_i[27]),
    .X(net26));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input27 (.A(wbs_dat_i[28]),
    .X(net27));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input28 (.A(wbs_dat_i[29]),
    .X(net28));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input29 (.A(wbs_dat_i[2]),
    .X(net29));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input3 (.A(wbs_adr_i[1]),
    .X(net3));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input30 (.A(wbs_dat_i[30]),
    .X(net30));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input31 (.A(wbs_dat_i[31]),
    .X(net31));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input32 (.A(wbs_dat_i[3]),
    .X(net32));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input33 (.A(wbs_dat_i[4]),
    .X(net33));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input34 (.A(wbs_dat_i[5]),
    .X(net34));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input35 (.A(wbs_dat_i[6]),
    .X(net35));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input36 (.A(wbs_dat_i[7]),
    .X(net36));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input37 (.A(wbs_dat_i[8]),
    .X(net37));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input38 (.A(wbs_dat_i[9]),
    .X(net38));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input39 (.A(wbs_sel_i[0]),
    .X(net39));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input4 (.A(wbs_adr_i[2]),
    .X(net4));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input40 (.A(wbs_sel_i[1]),
    .X(net40));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input41 (.A(wbs_sel_i[2]),
    .X(net41));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input42 (.A(wbs_sel_i[3]),
    .X(net42));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input43 (.A(wbs_stb_i),
    .X(net43));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input44 (.A(wbs_we_i),
    .X(net44));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input5 (.A(wbs_adr_i[3]),
    .X(net5));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input6 (.A(wbs_cyc_i),
    .X(net6));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input7 (.A(wbs_dat_i[0]),
    .X(net7));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input8 (.A(wbs_dat_i[10]),
    .X(net8));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input9 (.A(wbs_dat_i[11]),
    .X(net9));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output45 (.A(net45),
    .X(wbs_ack_o));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output46 (.A(net46),
    .X(wbs_dat_o[0]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output47 (.A(net47),
    .X(wbs_dat_o[10]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output48 (.A(net48),
    .X(wbs_dat_o[11]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output49 (.A(net49),
    .X(wbs_dat_o[12]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output50 (.A(net50),
    .X(wbs_dat_o[13]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output51 (.A(net51),
    .X(wbs_dat_o[14]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output52 (.A(net52),
    .X(wbs_dat_o[15]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output53 (.A(net53),
    .X(wbs_dat_o[16]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output54 (.A(net54),
    .X(wbs_dat_o[17]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output55 (.A(net55),
    .X(wbs_dat_o[18]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output56 (.A(net56),
    .X(wbs_dat_o[19]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output57 (.A(net57),
    .X(wbs_dat_o[1]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output58 (.A(net58),
    .X(wbs_dat_o[20]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output59 (.A(net59),
    .X(wbs_dat_o[21]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output60 (.A(net60),
    .X(wbs_dat_o[22]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output61 (.A(net61),
    .X(wbs_dat_o[23]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output62 (.A(net62),
    .X(wbs_dat_o[24]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output63 (.A(net63),
    .X(wbs_dat_o[25]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output64 (.A(net64),
    .X(wbs_dat_o[26]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output65 (.A(net65),
    .X(wbs_dat_o[27]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output66 (.A(net66),
    .X(wbs_dat_o[28]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output67 (.A(net67),
    .X(wbs_dat_o[29]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output68 (.A(net68),
    .X(wbs_dat_o[2]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output69 (.A(net69),
    .X(wbs_dat_o[30]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output70 (.A(net70),
    .X(wbs_dat_o[31]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output71 (.A(net71),
    .X(wbs_dat_o[3]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output72 (.A(net72),
    .X(wbs_dat_o[4]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output73 (.A(net73),
    .X(wbs_dat_o[5]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output74 (.A(net74),
    .X(wbs_dat_o[6]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output75 (.A(net75),
    .X(wbs_dat_o[7]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output76 (.A(net76),
    .X(wbs_dat_o[8]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output77 (.A(net77),
    .X(wbs_dat_o[9]));
 sky130_fd_sc_hd__buf_4 place83 (.A(_106_),
    .X(net83));
 sky130_fd_sc_hd__buf_4 place84 (.A(_001_),
    .X(net84));
 sky130_fd_sc_hd__buf_4 place85 (.A(_112_),
    .X(net85));
 sky130_fd_sc_hd__buf_4 place86 (.A(_098_),
    .X(net86));
 sky130_fd_sc_hd__dfrtp_1 \wbs_ack_o$_DFF_PP0_  (.D(_000_),
    .Q(net45),
    .RESET_B(_001_),
    .CLK(clknet_3_1__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[0]$_DFFE_PP0N_  (.D(_057_),
    .Q(net46),
    .RESET_B(net84),
    .CLK(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[10]$_DFFE_PP0N_  (.D(_047_),
    .Q(net47),
    .RESET_B(net84),
    .CLK(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[11]$_DFFE_PP0N_  (.D(_046_),
    .Q(net48),
    .RESET_B(net84),
    .CLK(clknet_3_6__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[12]$_DFFE_PP0N_  (.D(_045_),
    .Q(net49),
    .RESET_B(_001_),
    .CLK(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[13]$_DFFE_PP0N_  (.D(_044_),
    .Q(net50),
    .RESET_B(_001_),
    .CLK(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[14]$_DFFE_PP0N_  (.D(_043_),
    .Q(net51),
    .RESET_B(net84),
    .CLK(clknet_3_6__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[15]$_DFFE_PP0N_  (.D(_042_),
    .Q(net52),
    .RESET_B(net84),
    .CLK(clknet_3_6__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[16]$_DFFE_PP0N_  (.D(_041_),
    .Q(net53),
    .RESET_B(net84),
    .CLK(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[17]$_DFFE_PP0N_  (.D(_040_),
    .Q(net54),
    .RESET_B(net84),
    .CLK(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[18]$_DFFE_PP0N_  (.D(_039_),
    .Q(net55),
    .RESET_B(net84),
    .CLK(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[19]$_DFFE_PP0N_  (.D(_038_),
    .Q(net56),
    .RESET_B(net84),
    .CLK(clknet_3_6__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[1]$_DFFE_PP0N_  (.D(_056_),
    .Q(net57),
    .RESET_B(net84),
    .CLK(clknet_3_1__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[20]$_DFFE_PP0N_  (.D(_037_),
    .Q(net58),
    .RESET_B(net84),
    .CLK(clknet_3_3__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[21]$_DFFE_PP0N_  (.D(_036_),
    .Q(net59),
    .RESET_B(net84),
    .CLK(clknet_3_3__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[22]$_DFFE_PP0N_  (.D(_035_),
    .Q(net60),
    .RESET_B(net84),
    .CLK(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[23]$_DFFE_PP0N_  (.D(_034_),
    .Q(net61),
    .RESET_B(net84),
    .CLK(clknet_3_3__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[24]$_DFFE_PP0N_  (.D(_033_),
    .Q(net62),
    .RESET_B(_001_),
    .CLK(clknet_3_6__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[25]$_DFFE_PP0N_  (.D(_032_),
    .Q(net63),
    .RESET_B(_001_),
    .CLK(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[26]$_DFFE_PP0N_  (.D(_031_),
    .Q(net64),
    .RESET_B(_001_),
    .CLK(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[27]$_DFFE_PP0N_  (.D(_030_),
    .Q(net65),
    .RESET_B(_001_),
    .CLK(clknet_3_4__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[28]$_DFFE_PP0N_  (.D(_029_),
    .Q(net66),
    .RESET_B(_001_),
    .CLK(clknet_3_4__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[29]$_DFFE_PP0N_  (.D(_028_),
    .Q(net67),
    .RESET_B(_001_),
    .CLK(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[2]$_DFFE_PP0N_  (.D(_055_),
    .Q(net68),
    .RESET_B(net84),
    .CLK(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[30]$_DFFE_PP0N_  (.D(_027_),
    .Q(net69),
    .RESET_B(_001_),
    .CLK(clknet_3_5__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[31]$_DFFE_PP0N_  (.D(_065_),
    .Q(net70),
    .RESET_B(_001_),
    .CLK(clknet_3_4__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[3]$_DFFE_PP0N_  (.D(_054_),
    .Q(net71),
    .RESET_B(net84),
    .CLK(clknet_3_1__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[4]$_DFFE_PP0N_  (.D(_053_),
    .Q(net72),
    .RESET_B(net84),
    .CLK(clknet_3_2__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[5]$_DFFE_PP0N_  (.D(_052_),
    .Q(net73),
    .RESET_B(net84),
    .CLK(clknet_3_1__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[6]$_DFFE_PP0N_  (.D(_051_),
    .Q(net74),
    .RESET_B(net84),
    .CLK(clknet_3_0__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[7]$_DFFE_PP0N_  (.D(_050_),
    .Q(net75),
    .RESET_B(net84),
    .CLK(clknet_3_1__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[8]$_DFFE_PP0N_  (.D(_049_),
    .Q(net76),
    .RESET_B(_001_),
    .CLK(clknet_3_7__leaf_wb_clk_i));
 sky130_fd_sc_hd__dfrtp_1 \wbs_dat_o[9]$_DFFE_PP0N_  (.D(_048_),
    .Q(net77),
    .RESET_B(net84),
    .CLK(clknet_3_7__leaf_wb_clk_i));
endmodule