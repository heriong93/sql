CREATE TABLE auth
(
	auth_no              NUMBER(20) NOT NULL ,
	auth_lvl             NUMBER(20) NULL ,
	auth_name            VARCHAR2(100) NULL 
);



CREATE UNIQUE INDEX XPK권한 ON auth
(auth_no   ASC);



ALTER TABLE auth
	ADD CONSTRAINT  XPK권한 PRIMARY KEY (auth_no);



CREATE TABLE bom
(
	pd_cd                VARCHAR2(100) NOT NULL ,
	unit                 VARCHAR2(100) NULL ,
	detail_unit          VARCHAR2(100) NULL ,
	consum               NUMBER(20) NOT NULL ,
	mt_cd                VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPKBOM ON bom
(pd_cd   ASC);



ALTER TABLE bom
	ADD CONSTRAINT  XPKBOM PRIMARY KEY (pd_cd);



CREATE TABLE cli
(
	cli_cd               VARCHAR2(100) NOT NULL ,
	cli_name             VARCHAR2(100) NULL ,
	bussno               VARCHAR2(30) NULL ,
	tel                  VARCHAR2(50) NULL ,
	addr                 VARCHAR2(150) NULL ,
	cli_chg              VARCHAR2(50) NULL ,
	mail                 VARCHAR2(150) NULL 
);



CREATE UNIQUE INDEX XPK거래처 ON cli
(cli_cd   ASC);



ALTER TABLE cli
	ADD CONSTRAINT  XPK거래처 PRIMARY KEY (cli_cd);



CREATE TABLE com_cd
(
	wk_cd_no             NUMBER(20) NOT NULL ,
	cd_name              VARCHAR2(100) NULL ,
	cd_desc              VARCHAR2(150) NULL 
);



CREATE UNIQUE INDEX XPK공통_코드 ON com_cd
(wk_cd_no   ASC);



ALTER TABLE com_cd
	ADD CONSTRAINT  XPK공통_코드 PRIMARY KEY (wk_cd_no);



CREATE TABLE com_detail_cd
(
	detail_cd_no         NUMBER(20) NOT NULL ,
	detail_cd_name       VARCHAR2(100) NULL ,
	detail_cd_desc       VARCHAR2(100) NOT NULL ,
	wk_cd_no             NUMBER(20) NOT NULL 
);



CREATE UNIQUE INDEX XPK공통_상세_코드 ON com_detail_cd
(detail_cd_no   ASC);



ALTER TABLE com_detail_cd
	ADD CONSTRAINT  XPK공통_상세_코드 PRIMARY KEY (detail_cd_no);



CREATE TABLE disc_pd
(
	disc_no              NUMBER(20) NOT NULL ,
	qt                   NUMBER(10) NULL ,
	cost                 NUMBER(20) NULL ,
	disc_dt              DATE NULL ,
	rsn                  NUMBER(20) NOT NULL ,
	disc_chg             VARCHAR2(50) NULL ,
	pd_lot               VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPK폐기_제품 ON disc_pd
(disc_no   ASC);



ALTER TABLE disc_pd
	ADD CONSTRAINT  XPK폐기_제품 PRIMARY KEY (disc_no);



CREATE TABLE emp
(
	emp_no               NUMBER(20) NOT NULL ,
	id                   VARCHAR2(100) NULL ,
	pw                   VARCHAR2(100) NULL ,
	name                 VARCHAR2(100) NULL ,
	tel                  VARCHAR2(50) NULL ,
	enter_cd             VARCHAR2(100) NOT NULL ,
	auth_no              NUMBER(20) NOT NULL ,
	dpt                  VARCHAR2(100) NULL 
);



CREATE UNIQUE INDEX XPK사원 ON emp
(emp_no   ASC);



ALTER TABLE emp
	ADD CONSTRAINT  XPK사원 PRIMARY KEY (emp_no);



CREATE TABLE enter
(
	enter_cd             VARCHAR2(100) NOT NULL ,
	id                   VARCHAR2(100) NULL ,
	pw                   VARCHAR2(100) NULL ,
	bussno               VARCHAR2(30) NOT NULL ,
	enter_name           VARCHAR2(100) NULL ,
	chg                  VARCHAR2(50) NULL ,
	mail                 VARCHAR2(150) NULL ,
	ceo                  VARCHAR2(100) NULL ,
	auth_no              NUMBER(20) NOT NULL ,
	st                   NUMBER(20) NULL 
);



CREATE UNIQUE INDEX XPK기업 ON enter
(enter_cd   ASC);



ALTER TABLE enter
	ADD CONSTRAINT  XPK기업 PRIMARY KEY (enter_cd);



CREATE TABLE fc
(
	fc_cd                VARCHAR2(100) NOT NULL ,
	fc_name              VARCHAR2(100) NULL ,
	st                   NUMBER(20) NULL ,
	ins_mf               VARCHAR2(150) NULL ,
	mnf_com              VARCHAR2(150) NULL ,
	str_dt               DATE NULL ,
	ins_cycle            NUMBER(20) NULL ,
	last_ins_dt          DATE NULL ,
	output               NUMBER(10) NULL ,
	dur_time             INTEGER NULL 
);



CREATE UNIQUE INDEX XPK설비 ON fc
(fc_cd   ASC);



ALTER TABLE fc
	ADD CONSTRAINT  XPK설비 PRIMARY KEY (fc_cd);



CREATE TABLE fc_ins
(
	ins_cd               VARCHAR2(100) NOT NULL ,
	ins_dt               DATE NULL ,
	stt_time             TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL ,
	fn_time              TIMESTAMP  DEFAULT CURRENT_TIMESTAMP NULL ,
	ins_cat              NUMBER(20) NULL ,
	ins_cont             VARCHAR2(150) NULL ,
	cc                   VARCHAR2(150) NULL ,
	chg                  VARCHAR2(50) NULL ,
	fc_cd                VARCHAR2(100) NOT NULL ,
	nonop_cd             VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPK설비_점검 ON fc_ins
(ins_cd   ASC);



ALTER TABLE fc_ins
	ADD CONSTRAINT  XPK설비_점검 PRIMARY KEY (ins_cd);



CREATE TABLE mf_ck
(
	mf_ck_no             NUMBER(20) NOT NULL ,
	ck_name              VARCHAR2(100) NULL ,
	ck_st                NUMBER(20) NULL ,
	pd_name              VARCHAR2(100) NULL ,
	pdt_qt               NUMBER(10) NULL ,
	pdt_lot              VARCHAR2(100) NULL ,
	rt_dt                DATE NULL ,
	rt_chg               VARCHAR2(50) NULL ,
	first_cc             NUMBER(20) NULL ,
	second_cc            NUMBER(20) NULL ,
	third_cc             NUMBER(20) NULL ,
	fourth_cc            NUMBER(20) NULL ,
	fifth_cc             NUMBER(20) NULL ,
	cc_avg               NUMBER(20) NULL ,
	mfck_res             VARCHAR2(20) NULL ,
	ck_dt                DATE NULL ,
	ck_chg               VARCHAR2(50) NULL ,
	pass_std             VARCHAR2(100) NULL 
);



CREATE UNIQUE INDEX XPK공정_검사 ON mf_ck
(mf_ck_no   ASC);



ALTER TABLE mf_ck
	ADD CONSTRAINT  XPK공정_검사 PRIMARY KEY (mf_ck_no);



CREATE TABLE mt
(
	mt_cd                VARCHAR2(100) NOT NULL ,
	mt_div               VARCHAR2(50) NULL ,
	mt_name              VARCHAR2(100) NULL ,
	cost                 NUMBER(20) NULL ,
	unit                 VARCHAR2(20) NULL ,
	exp_dt               DATE NULL ,
	leadtm               NUMBER(20) NOT NULL ,
	safe_stk_rate        NUMBER(10) NULL ,
	cli_cd               VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPK자재 ON mt
(mt_cd   ASC);



ALTER TABLE mt
	ADD CONSTRAINT  XPK자재 PRIMARY KEY (mt_cd);



CREATE TABLE mt_ck
(
	mt_ck_no             NUMBER(20) NOT NULL ,
	mt_cd                VARCHAR2(100) NOT NULL ,
	str_qt               NUMBER(10) NULL ,
	str_comp_dt          DATE NULL ,
	cli_name             VARCHAR2(100) NULL ,
	str_chg              VARCHAR2(50) NULL ,
	ck_name              VARCHAR2(100) NULL ,
	first_mc             NUMBER(20) NULL ,
	second_mc            NUMBER(20) NULL ,
	third_mc             NUMBER(20) NULL ,
	fourth_mc            NUMBER(20) NULL ,
	fifth_mc             NUMBER(20) NULL ,
	mc_avg               NUMBER(20) NULL ,
	mc_res               VARCHAR2(50) NULL ,
	ck_dt                DATE NULL ,
	ck_chg               VARCHAR2(50) NULL ,
	first_ic             NUMBER(20) NULL ,
	second_ic            NUMBER(20) NULL ,
	third_ic             NUMBER(20) NULL ,
	fourth_ic            NUMBER(20) NULL ,
	fifth_ic             NUMBER(20) NULL ,
	ic_avgval            NUMBER(20) NULL ,
	pass_std             NUMBER(20) NULL ,
	ic_res               VARCHAR2(100) NULL ,
	mt_placeod_cd        VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPK자재_검사 ON mt_ck
(mt_ck_no   ASC);



ALTER TABLE mt_ck
	ADD CONSTRAINT  XPK자재_검사 PRIMARY KEY (mt_ck_no);



CREATE TABLE mt_disc
(
	mt_disc_no           NUMBER(20) NOT NULL ,
	disc_qt              NUMBER(10) NULL ,
	disc_cost            NUMBER(20) NULL ,
	disc_compdt          DATE NULL ,
	rsn                  NUMBER(20) NOT NULL ,
	disc_chg             VARCHAR2(50) NULL ,
	mt_lot               VARCHAR2(100) NOT NULL ,
	mt_cd                VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPK자재_폐기 ON mt_disc
(mt_disc_no   ASC);



ALTER TABLE mt_disc
	ADD CONSTRAINT  XPK자재_폐기 PRIMARY KEY (mt_disc_no);



CREATE TABLE mt_placeod
(
	mt_placeod_cd        VARCHAR2(100) NOT NULL ,
	placeod_qt           NUMBER(10) NULL ,
	placeod_reqdt        DATE NULL ,
	placeod_compdt       DATE NULL ,
	placeod_requester    VARCHAR2(50) NULL ,
	placeod_chg          VARCHAR2(50) NULL ,
	placeod_st           NUMBER(20) NULL ,
	mt_cd                VARCHAR2(100) NOT NULL ,
	cli_cd               VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPK자재_발주 ON mt_placeod
(mt_placeod_cd   ASC);



ALTER TABLE mt_placeod
	ADD CONSTRAINT  XPK자재_발주 PRIMARY KEY (mt_placeod_cd);



CREATE TABLE mt_rtn
(
	mt_rtn_no            NUMBER(20) NOT NULL ,
	rtn_qt               NUMBER(10) NULL ,
	rtn_compdt           DATE NULL ,
	rtn_chg              VARCHAR2(50) NULL ,
	mt_placeod_cd        VARCHAR2(100) NOT NULL ,
	mt_cd                VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPK자재_반품 ON mt_rtn
(mt_rtn_no   ASC);



ALTER TABLE mt_rtn
	ADD CONSTRAINT  XPK자재_반품 PRIMARY KEY (mt_rtn_no);



CREATE TABLE mt_send
(
	mt_send_no           NUMBER(20) NOT NULL ,
	send_qt              NUMBER(10) NULL ,
	send_reqdt           DATE NULL ,
	send_compdt          DATE NULL ,
	send_requester       VARCHAR2(50) NULL ,
	send_chg             VARCHAR2(50) NULL ,
	send_st              NUMBER(20) NULL ,
	mt_lot               VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPK자재_출고 ON mt_send
(mt_send_no   ASC);



ALTER TABLE mt_send
	ADD CONSTRAINT  XPK자재_출고 PRIMARY KEY (mt_send_no);



CREATE TABLE mt_stk
(
	mt_lot               VARCHAR2(100) NOT NULL ,
	stk_qt               NUMBER(10) NULL ,
	exp_dt               DATE NULL ,
	mt_cd                VARCHAR2(100) NOT NULL ,
	mt_str_no            NUMBER(20) NOT NULL 
);



CREATE UNIQUE INDEX XPK자재_재고 ON mt_stk
(mt_lot   ASC);



ALTER TABLE mt_stk
	ADD CONSTRAINT  XPK자재_재고 PRIMARY KEY (mt_lot);



CREATE TABLE mt_str
(
	mt_str_no            NUMBER(20) NOT NULL ,
	str_qt               NUMBER(10) NULL ,
	str_compdt           DATE NULL ,
	str_chg              VARCHAR2(50) NULL ,
	mt_placeod_cd        VARCHAR2(100) NOT NULL ,
	mt_cd                VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPK자재_입고 ON mt_str
(mt_str_no   ASC);



ALTER TABLE mt_str
	ADD CONSTRAINT  XPK자재_입고 PRIMARY KEY (mt_str_no);



CREATE TABLE nonop_mgmt
(
	nonop_cd             VARCHAR2(100) NOT NULL ,
	nonop_stt_time       TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL ,
	nonop_fn_time        TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL ,
	fc_chg               VARCHAR2(50) NULL ,
	rsn                  VARCHAR2(150) NULL ,
	rsn_desc             VARCHAR2(150) NULL ,
	fc_cd                VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPK비가동_관리 ON nonop_mgmt
(nonop_cd   ASC);



ALTER TABLE nonop_mgmt
	ADD CONSTRAINT  XPK비가동_관리 PRIMARY KEY (nonop_cd);



CREATE TABLE od
(
	od_no                NUMBER(20) NOT NULL ,
	od_dt                DATE NULL ,
	od_chg               VARCHAR2(50) NULL ,
	dc_rate              NUMBER(10) NULL ,
	total_price          NUMBER(20) NULL ,
	cli_cd               VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPK주문 ON od
(od_no   ASC);



ALTER TABLE od
	ADD CONSTRAINT  XPK주문 PRIMARY KEY (od_no);



CREATE TABLE od_detail
(
	od_detailno          NUMBER(20) NOT NULL ,
	qt                   NUMBER(10) NULL ,
	cost                 NUMBER(20) NULL ,
	detail_price         NUMBER(20) NULL ,
	od_no                NUMBER(20) NOT NULL ,
	pd_cd                VARCHAR2(100) NOT NULL ,
	due_dt               DATE NULL 
);



CREATE UNIQUE INDEX XPK주문_상세 ON od_detail
(od_detailno   ASC);



ALTER TABLE od_detail
	ADD CONSTRAINT  XPK주문_상세 PRIMARY KEY (od_detailno);



CREATE TABLE pack_ck
(
	pack_ck_no           NUMBER(20) NOT NULL ,
	ck_name              VARCHAR2(100) NULL ,
	ck_st                NUMBER(20) NULL ,
	pd_name              VARCHAR2(100) NULL ,
	pdt_qt               NUMBER(10) NULL ,
	pdt_lot              VARCHAR2(100) NULL ,
	pd_lot               VARCHAR2(100) NULL ,
	pack_dt              DATE NULL ,
	pack_chg             VARCHAR2(50) NULL ,
	first_nc             NUMBER(100) NULL ,
	second_nc            NUMBER(100) NULL ,
	third_nc             NUMBER(100) NULL ,
	fourth_nc            NUMBER(100) NULL ,
	fifth_nc             NUMBER(100) NULL ,
	nc_avgval            NUMBER(100) NULL ,
	pack_ck_res          VARCHAR2(20) NULL ,
	ck_dt                DATE NULL ,
	ck_chg               VARCHAR2(50) NULL ,
	pass_std             NUMBER(100) NULL 
);



CREATE UNIQUE INDEX XPK포장_검사 ON pack_ck
(pack_ck_no   ASC);



ALTER TABLE pack_ck
	ADD CONSTRAINT  XPK포장_검사 PRIMARY KEY (pack_ck_no);



CREATE TABLE pay
(
	pay_cd               VARCHAR2(100) NOT NULL ,
	pay_dt               DATE NULL ,
	key                  VARCHAR2(150) NULL ,
	price                NUMBER(20) NULL ,
	sub_no               NUMBER(20) NOT NULL ,
	enter_cd             VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPK결제 ON pay
(pay_cd   ASC);



ALTER TABLE pay
	ADD CONSTRAINT  XPK결제 PRIMARY KEY (pay_cd);



CREATE TABLE pd
(
	pd_cd                VARCHAR2(100) NOT NULL ,
	pd_name              VARCHAR2(100) NULL ,
	unit                 VARCHAR2(20) NULL ,
	cost                 NUMBER(20) NULL 
);



CREATE UNIQUE INDEX XPK제품 ON pd
(pd_cd   ASC);



ALTER TABLE pd
	ADD CONSTRAINT  XPK제품 PRIMARY KEY (pd_cd);



CREATE TABLE pd_stk
(
	pd_lot               VARCHAR2(100) NOT NULL ,
	unit                 VARCHAR2(100) NULL ,
	qt                   NUMBER(10) NULL ,
	pdt_dt               DATE NULL ,
	exp_dt               DATE NULL ,
	st                   NUMBER(20) NOT NULL ,
	pd_cd                VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPK제품_재고 ON pd_stk
(pd_lot   ASC);



ALTER TABLE pd_stk
	ADD CONSTRAINT  XPK제품_재고 PRIMARY KEY (pd_lot);



CREATE TABLE pdt_achv
(
	pdt_achv_no          NUMBER(20) NOT NULL ,
	pdt_dt               DATE NULL ,
	pdt_lot              VARCHAR2(100) NULL ,
	pdt_pd_cd            VARCHAR2(100) NOT NULL ,
	pd_name              VARCHAR2(100) NULL ,
	pdt_qt               NUMBER(10) NULL ,
	pdt_stt_time         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL ,
	pdt_fn_time          TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL ,
	pdt_inst_no          NUMBER(20) NULL ,
	mt_lot               VARCHAR2(100) NULL 
);



CREATE UNIQUE INDEX XPK생산_실적 ON pdt_achv
(pdt_achv_no   ASC);



ALTER TABLE pdt_achv
	ADD CONSTRAINT  XPK생산_실적 PRIMARY KEY (pdt_achv_no);



CREATE TABLE pdt_fail
(
	pdt_fail_no          NUMBER(20) NOT NULL ,
	pdt_inst_dt          DATE NULL ,
	pdt_lot              VARCHAR2(100) NULL ,
	pdt_pd_cd            VARCHAR2(100) NOT NULL ,
	mfps                 VARCHAR2(150) NULL ,
	mfplace              VARCHAR2(150) NULL ,
	pd_name              VARCHAR2(100) NULL ,
	pdt_qt               NUMBER(10) NULL ,
	pdt_stt_time         TIMESTAMP DEFAULT CURRENT_TIMESTAMP  NULL ,
	pdt_fn_time          TIMESTAMP DEFAULT CURRENT_TIMESTAMP  NULL ,
	fail_rsn             VARCHAR2(150) NULL ,
	pdt_inst_no          NUMBER(20) NULL ,
	mt_lot               VARCHAR2(100) NULL 
);



CREATE UNIQUE INDEX XPK생산_실패 ON pdt_fail
(pdt_fail_no   ASC);



ALTER TABLE pdt_fail
	ADD CONSTRAINT  XPK생산_실패 PRIMARY KEY (pdt_fail_no);



CREATE TABLE pdt_hist
(
	pdt_hist_no          NUMBER(20) NOT NULL ,
	pdt_dt               DATE NULL ,
	pdt_lot              VARCHAR2(100) NULL ,
	pdt_pd_cd            VARCHAR2(100) NOT NULL ,
	mfps                 VARCHAR2(100) NULL ,
	mfplace              VARCHAR2(150) NULL ,
	pd_name              VARCHAR2(50) NULL ,
	pdt_qt               NUMBER(10) NULL ,
	pdt_expt_stt_time    TIMESTAMP DEFAULT CURRENT_TIMESTAMP  NULL ,
	pdt_expt_fn_time     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL ,
	pdt_stt_time         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL ,
	pdt_fn_time          TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL ,
	pdt_inst_no          NUMBER(20) NULL 
);



CREATE UNIQUE INDEX XPK생산_내역 ON pdt_hist
(pdt_hist_no   ASC);



ALTER TABLE pdt_hist
	ADD CONSTRAINT  XPK생산_내역 PRIMARY KEY (pdt_hist_no);



CREATE TABLE pdt_inst
(
	pdt_inst_no          NUMBER(20) NOT NULL ,
	pdt_inst_dt          DATE NULL ,
	pdt_pd_cd            VARCHAR2(100) NOT NULL ,
	pdt_plan_cd          VARCHAR2(100) NOT NULL ,
	mt_lot               VARCHAR2(100) NULL 
);



CREATE UNIQUE INDEX XPK생산_지시 ON pdt_inst
(pdt_inst_no   ASC);



ALTER TABLE pdt_inst
	ADD CONSTRAINT  XPK생산_지시 PRIMARY KEY (pdt_inst_no);



CREATE TABLE pdt_inst_detail
(
	pdt_inst_detail_no   NUMBER(20) NOT NULL ,
	pdtlot               VARCHAR2(100) NULL ,
	pd_name              VARCHAR2(100) NULL ,
	qt                   NUMBER(10) NULL ,
	pdt_stt_time         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL ,
	pdtexpt_fn_time    TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL ,
	pdt_inst_no          NUMBER(20) NULL 
);



CREATE UNIQUE INDEX XPK생산_지시_상세 ON pdt_inst_detail
(pdt_inst_detail_no   ASC);



ALTER TABLE pdt_inst_detail
	ADD CONSTRAINT  XPK생산_지시_상세 PRIMARY KEY (pdt_inst_detail_no);



CREATE TABLE pdt_mgmt
(
	pdt_st_no            NUMBER(20) NOT NULL ,
	pdt_inst_dt          DATE NULL ,
	pdt_lot              VARCHAR2(100) NULL ,
	pdt_pd_cd            VARCHAR2(100) NOT NULL ,
	mfps                 VARCHAR2(150) NULL ,
	mfplace              VARCHAR2(150) NULL ,
	pd_name              VARCHAR2(100) NULL ,
	pdt_stt_time       TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL ,
	mt_placeod_st        NUMBER(20) NULL ,
	mt_send_st           NUMBER(20) NULL ,
	mf_qual_st           NUMBER(20) NULL ,
	pack_qual_st         NUMBER(20) NULL ,
	pdt_inst_no          NUMBER(20) NULL 
);



CREATE UNIQUE INDEX XPK생산_관리 ON pdt_mgmt
(pdt_st_no   ASC);



ALTER TABLE pdt_mgmt
	ADD CONSTRAINT  XPK생산_관리 PRIMARY KEY (pdt_st_no);



CREATE TABLE pdt_plan_detail
(
	pdt_plan_cd          VARCHAR2(100) NULL ,
	pdt_plan_detail_no   NUMBER(20) NOT NULL ,
	pdname               VARCHAR2(100) NULL ,
	qt                   NUMBER(10) NULL ,
	due_dt               DATE NULL 
);



CREATE UNIQUE INDEX XPK생산_계획_상세 ON pdt_plan_detail
(pdt_plan_detail_no   ASC);



ALTER TABLE pdt_plan_detail
	ADD CONSTRAINT  XPK생산_계획_상세 PRIMARY KEY (pdt_plan_detail_no);



CREATE TABLE pdtplan
(
	pdt_plan_cd          VARCHAR2(100) NOT NULL ,
	wk_plan_stt_dt       DATE NULL ,
	od_detailno          NUMBER(20) NULL 
);



CREATE UNIQUE INDEX XPK생산계획 ON pdtplan
(pdt_plan_cd   ASC);



ALTER TABLE pdtplan
	ADD CONSTRAINT  XPK생산계획 PRIMARY KEY (pdt_plan_cd);



CREATE TABLE qual_ck_std_mgmt
(
	std_mgmt_no          NUMBER(20) NOT NULL ,
	category             VARCHAR2(100) NULL ,
	ck_name              VARCHAR2(100) NULL ,
	pass_std             NUMBER(100) NULL ,
	input_avail_val      NUMBER(100) NULL 
);



CREATE UNIQUE INDEX XPK품질_검사_기준_관리 ON qual_ck_std_mgmt
(std_mgmt_no   ASC);



ALTER TABLE qual_ck_std_mgmt
	ADD CONSTRAINT  XPK품질_검사_기준_관리 PRIMARY KEY (std_mgmt_no);



CREATE TABLE rtn
(
	rtn_no               NUMBER(20) NOT NULL ,
	cli_chg              VARCHAR2(50) NULL ,
	rtn_chg              VARCHAR2(50) NULL ,
	rtn_compdt           DATE NULL ,
	od_no                NUMBER(20) NOT NULL 
);



CREATE UNIQUE INDEX XPK반품 ON rtn
(rtn_no   ASC);



ALTER TABLE rtn
	ADD CONSTRAINT  XPK반품 PRIMARY KEY (rtn_no);



CREATE TABLE send
(
	send_no              NUMBER(20) NOT NULL ,
	qt                   NUMBER(10) NULL ,
	send_dt              DATE NULL ,
	send_chg             VARCHAR2(50) NULL ,
	od_no                NUMBER(20) NOT NULL ,
	pd_lot               VARCHAR2(100) NOT NULL 
);



CREATE UNIQUE INDEX XPK출고 ON send
(send_no   ASC);



ALTER TABLE send
	ADD CONSTRAINT  XPK출고 PRIMARY KEY (send_no);



CREATE TABLE sub
(
	sub_no               NUMBER(20) NOT NULL ,
	rank                 NUMBER(20) NOT NULL ,
	sub_name             VARCHAR2(100) NULL ,
	pr                   NUMBER(20) NULL ,
	detail_desc          VARCHAR2(150) NULL 
);



CREATE UNIQUE INDEX XPK구독 ON sub
(sub_no   ASC);



ALTER TABLE sub
	ADD CONSTRAINT  XPK구독 PRIMARY KEY (sub_no);



ALTER TABLE bom
	ADD (CONSTRAINT R_39 FOREIGN KEY (mt_cd) REFERENCES mt (mt_cd));



ALTER TABLE com_detail_cd
	ADD (CONSTRAINT R_38 FOREIGN KEY (wk_cd_no) REFERENCES com_cd (wk_cd_no));



ALTER TABLE disc_pd
	ADD (CONSTRAINT R_8 FOREIGN KEY (pd_lot) REFERENCES pd_stk (pd_lot));



ALTER TABLE emp
	ADD (CONSTRAINT R_22 FOREIGN KEY (enter_cd) REFERENCES enter (enter_cd));



ALTER TABLE emp
	ADD (CONSTRAINT R_27 FOREIGN KEY (auth_no) REFERENCES auth (auth_no));



ALTER TABLE enter
	ADD (CONSTRAINT R_26 FOREIGN KEY (auth_no) REFERENCES auth (auth_no));



ALTER TABLE fc_ins
	ADD (CONSTRAINT R_20 FOREIGN KEY (fc_cd) REFERENCES fc (fc_cd));



ALTER TABLE fc_ins
	ADD (CONSTRAINT R_21 FOREIGN KEY (nonop_cd) REFERENCES nonop_mgmt (nonop_cd));



ALTER TABLE mt
	ADD (CONSTRAINT R_9 FOREIGN KEY (cli_cd) REFERENCES cli (cli_cd));



ALTER TABLE mt_ck
	ADD (CONSTRAINT R_46 FOREIGN KEY (mt_placeod_cd) REFERENCES mt_placeod (mt_placeod_cd));



ALTER TABLE mt_disc
	ADD (CONSTRAINT R_18 FOREIGN KEY (mt_lot) REFERENCES mt_stk (mt_lot));



ALTER TABLE mt_placeod
	ADD (CONSTRAINT R_10 FOREIGN KEY (mt_cd) REFERENCES mt (mt_cd));



ALTER TABLE mt_placeod
	ADD (CONSTRAINT R_50 FOREIGN KEY (cli_cd) REFERENCES cli (cli_cd));



ALTER TABLE mt_rtn
	ADD (CONSTRAINT R_45 FOREIGN KEY (mt_placeod_cd) REFERENCES mt_placeod (mt_placeod_cd));



ALTER TABLE mt_send
	ADD (CONSTRAINT R_14 FOREIGN KEY (mt_lot) REFERENCES mt_stk (mt_lot));



ALTER TABLE mt_stk
	ADD (CONSTRAINT R_16 FOREIGN KEY (mt_cd) REFERENCES mt (mt_cd));



ALTER TABLE mt_stk
	ADD (CONSTRAINT R_52 FOREIGN KEY (mt_str_no) REFERENCES mt_str (mt_str_no));



ALTER TABLE mt_str
	ADD (CONSTRAINT R_51 FOREIGN KEY (mt_placeod_cd) REFERENCES mt_placeod (mt_placeod_cd));



ALTER TABLE nonop_mgmt
	ADD (CONSTRAINT R_41 FOREIGN KEY (fc_cd) REFERENCES fc (fc_cd));



ALTER TABLE od
	ADD (CONSTRAINT R_2 FOREIGN KEY (cli_cd) REFERENCES cli (cli_cd));



ALTER TABLE od_detail
	ADD (CONSTRAINT R_3 FOREIGN KEY (od_no) REFERENCES od (od_no));



ALTER TABLE od_detail
	ADD (CONSTRAINT R_4 FOREIGN KEY (pd_cd) REFERENCES pd (pd_cd));



ALTER TABLE pay
	ADD (CONSTRAINT R_24 FOREIGN KEY (sub_no) REFERENCES sub (sub_no));



ALTER TABLE pay
	ADD (CONSTRAINT R_25 FOREIGN KEY (enter_cd) REFERENCES enter (enter_cd));



ALTER TABLE pd_stk
	ADD (CONSTRAINT R_42 FOREIGN KEY (pd_cd) REFERENCES pd (pd_cd));



ALTER TABLE pdt_achv
	ADD (CONSTRAINT R_35 FOREIGN KEY (pdt_inst_no) REFERENCES pdt_inst (pdt_inst_no) ON DELETE SET NULL);



ALTER TABLE pdt_fail
	ADD (CONSTRAINT R_36 FOREIGN KEY (pdt_inst_no) REFERENCES pdt_inst (pdt_inst_no) ON DELETE SET NULL);



ALTER TABLE pdt_hist
	ADD (CONSTRAINT R_34 FOREIGN KEY (pdt_inst_no) REFERENCES pdt_inst (pdt_inst_no) ON DELETE SET NULL);



ALTER TABLE pdt_inst
	ADD (CONSTRAINT R_29 FOREIGN KEY (pdt_plan_cd) REFERENCES pdtplan (pdt_plan_cd));



ALTER TABLE pdt_inst_detail
	ADD (CONSTRAINT R_48 FOREIGN KEY (pdt_inst_no) REFERENCES pdt_inst (pdt_inst_no) ON DELETE SET NULL);



ALTER TABLE pdt_mgmt
	ADD (CONSTRAINT R_33 FOREIGN KEY (pdt_inst_no) REFERENCES pdt_inst (pdt_inst_no) ON DELETE SET NULL);



ALTER TABLE pdt_plan_detail
	ADD (CONSTRAINT R_47 FOREIGN KEY (pdt_plan_cd) REFERENCES pdtplan (pdt_plan_cd) ON DELETE SET NULL);



ALTER TABLE pdtplan
	ADD (CONSTRAINT R_37 FOREIGN KEY (od_detailno) REFERENCES od_detail (od_detailno) ON DELETE SET NULL);



ALTER TABLE rtn
	ADD (CONSTRAINT R_7 FOREIGN KEY (od_no) REFERENCES od (od_no));



ALTER TABLE send
	ADD (CONSTRAINT R_5 FOREIGN KEY (od_no) REFERENCES od (od_no));



ALTER TABLE send
	ADD (CONSTRAINT R_6 FOREIGN KEY (pd_lot) REFERENCES pd_stk (pd_lot));


