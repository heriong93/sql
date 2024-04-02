
DROP TABLE od_detail CASCADE CONSTRAINTS PURGE;



DROP TABLE send CASCADE CONSTRAINTS PURGE;



DROP TABLE rtn CASCADE CONSTRAINTS PURGE;



DROP TABLE od CASCADE CONSTRAINTS PURGE;



DROP TABLE disc_pd CASCADE CONSTRAINTS PURGE;



DROP TABLE pd_stk CASCADE CONSTRAINTS PURGE;



DROP TABLE pd CASCADE CONSTRAINTS PURGE;



DROP TABLE mt_rtn CASCADE CONSTRAINTS PURGE;



DROP TABLE mt_disc CASCADE CONSTRAINTS PURGE;



DROP TABLE mt_ck CASCADE CONSTRAINTS PURGE;



DROP TABLE mf_ck CASCADE CONSTRAINTS PURGE;



DROP TABLE fc_ins CASCADE CONSTRAINTS PURGE;



DROP TABLE nonop_mgmt CASCADE CONSTRAINTS PURGE;



DROP TABLE fc CASCADE CONSTRAINTS PURGE;



DROP TABLE emp CASCADE CONSTRAINTS PURGE;



DROP TABLE pay CASCADE CONSTRAINTS PURGE;



DROP TABLE enter CASCADE CONSTRAINTS PURGE;



DROP TABLE auth CASCADE CONSTRAINTS PURGE;



DROP TABLE sub CASCADE CONSTRAINTS PURGE;



DROP TABLE pdt_hist CASCADE CONSTRAINTS PURGE;



DROP TABLE mf_pd_dur_time CASCADE CONSTRAINTS PURGE;



DROP TABLE mf_ps CASCADE CONSTRAINTS PURGE;



DROP TABLE qual_ck_std_mgmt CASCADE CONSTRAINTS PURGE;



DROP TABLE pack_ck CASCADE CONSTRAINTS PURGE;



DROP TABLE pdt_inst_detail CASCADE CONSTRAINTS PURGE;



DROP TABLE pdt_inst CASCADE CONSTRAINTS PURGE;



DROP TABLE mt_send CASCADE CONSTRAINTS PURGE;



DROP TABLE mt_stk CASCADE CONSTRAINTS PURGE;



DROP TABLE mt_str CASCADE CONSTRAINTS PURGE;



DROP TABLE mt_placeod CASCADE CONSTRAINTS PURGE;



DROP TABLE bom CASCADE CONSTRAINTS PURGE;



DROP TABLE mt CASCADE CONSTRAINTS PURGE;



DROP TABLE cli CASCADE CONSTRAINTS PURGE;



DROP TABLE com_detail_cd CASCADE CONSTRAINTS PURGE;



DROP TABLE com_cd CASCADE CONSTRAINTS PURGE;



DROP TABLE pdt_plan_detail CASCADE CONSTRAINTS PURGE;



DROP TABLE pdtplan CASCADE CONSTRAINTS PURGE;



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
	stt_time             TIMESTAMP WITH LOCAL TIME ZONE NULL ,
	fn_time              TIMESTAMP WITH LOCAL TIME ZONE NULL ,
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
	rt_dt                DATE NULL ,
	rt_chg               VARCHAR2(50) NULL ,
	first_cc             NUMBER NULL ,
	second_cc            NUMBER NULL ,
	third_cc             NUMBER NULL ,
	fourth_cc            NUMBER NULL ,
	fifth_cc             NUMBER NULL ,
	cc_avg               NUMBER NULL ,
	mfck_res             VARCHAR2(20) NULL ,
	ck_dt                DATE NULL ,
	ck_chg               VARCHAR2(50) NULL ,
	pass_std             VARCHAR2(100) NULL ,
	pdt_inst_detail_no   NUMBER(20) NULL 
);



CREATE UNIQUE INDEX XPK공정_검사 ON mf_ck
(mf_ck_no   ASC);



ALTER TABLE mf_ck
	ADD CONSTRAINT  XPK공정_검사 PRIMARY KEY (mf_ck_no);



CREATE TABLE mf_pd_dur_time
(
	pdt_pd_cd            VARCHAR2(100) NULL ,
	add_mf_time          VARCHAR2(100) NULL ,
	pdt_ps_cd            VARCHAR2(100) NOT NULL ,
	mf_cd                VARCHAR2(150) NOT NULL 
);



CREATE UNIQUE INDEX XPK공정_제품_소요_시간 ON mf_pd_dur_time
(mf_cd   ASC);



ALTER TABLE mf_pd_dur_time
	ADD CONSTRAINT  XPK공정_제품_소요_시간 PRIMARY KEY (mf_cd);



CREATE TABLE mf_ps
(
	pdt_ps_cd            VARCHAR2(100) NOT NULL ,
	mf_ps_div            VARCHAR2(100) NULL ,
	mf_step_time         NUMBER(10) NULL ,
	mf_step              VARCHAR2(150) NULL 
);



CREATE UNIQUE INDEX XPK공정_과정 ON mf_ps
(pdt_ps_cd   ASC);



ALTER TABLE mf_ps
	ADD CONSTRAINT  XPK공정_과정 PRIMARY KEY (pdt_ps_cd);



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
	first_mc             NUMBER NULL ,
	second_mc            NUMBER NULL ,
	third_mc             NUMBER NULL ,
	fourth_mc            NUMBER NULL ,
	fifth_mc             NUMBER NULL ,
	mc_avg               NUMBER NULL ,
	mc_res               VARCHAR2(50) NULL ,
	ck_dt                DATE NULL ,
	ck_chg               VARCHAR2(50) NULL ,
	first_ic             NUMBER NULL ,
	second_ic            NUMBER NULL ,
	third_ic             NUMBER NULL ,
	fourth_ic            NUMBER NULL ,
	fifth_ic             NUMBER NULL ,
	ic_avgval            NUMBER NULL ,
	pass_std             NUMBER NULL ,
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
	nonop_stt_time       TIMESTAMP WITH LOCAL TIME ZONE NULL ,
	nonop_fn_time        TIMESTAMP WITH LOCAL TIME ZONE NULL ,
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
	pd_lot               VARCHAR2(100) NULL ,
	pack_dt              DATE NULL ,
	pack_chg             VARCHAR2(50) NULL ,
	first_nc             NUMBER NULL ,
	second_nc            NUMBER  NULL ,
	third_nc             NUMBER  NULL ,
	fourth_nc            NUMBER  NULL ,
	fifth_nc             NUMBER  NULL ,
	nc_avg_val           NUMBER  NULL ,
	packck_res           VARCHAR2(20) NULL ,
	ck_dt                DATE NULL ,
	ck_chg               VARCHAR2(50) NULL ,
	pass_std             NUMBER NULL ,
	pdt_inst_detail_no   NUMBER(20) NULL 
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
	pd_cd                VARCHAR2(100) NOT NULL ,
	pdt_inst_detail_no   NUMBER(20) NULL 
);



CREATE UNIQUE INDEX XPK제품_재고 ON pd_stk
(pd_lot   ASC);



ALTER TABLE pd_stk
	ADD CONSTRAINT  XPK제품_재고 PRIMARY KEY (pd_lot);



CREATE TABLE pdt_hist
(
	pdt_hist_no          NUMBER(20) NOT NULL ,
	pdt_dt               DATE NULL ,
	pd_name              VARCHAR2(50) NULL ,
	pdt_qt               NUMBER(10) NULL ,
	pdt_expt_stt_time    TIMESTAMP WITH LOCAL TIME ZONE NULL ,
	pdt_expt_fn_time     TIMESTAMP WITH LOCAL TIME ZONE NULL ,
	pdt_stt_time         TIMESTAMP WITH LOCAL TIME ZONE NULL ,
	pdt_fn_time          TIMESTAMP WITH LOCAL TIME ZONE NULL ,
	pdt_inst_detail_no   NUMBER(20) NULL ,
	mf_qual_st           NUMBER(20) NULL ,
	pack_qual_st         NUMBER(20) NULL ,
	fail_rsn             VARCHAR2(150) NULL ,
	mf_cd                VARCHAR2(150) NULL 
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
	mt_send_no           NUMBER(20) NULL 
);



CREATE UNIQUE INDEX XPK생산_지시 ON pdt_inst
(pdt_inst_no   ASC);



ALTER TABLE pdt_inst
	ADD CONSTRAINT  XPK생산_지시 PRIMARY KEY (pdt_inst_no);



CREATE TABLE pdt_inst_detail
(
	pdt_inst_detail_no   NUMBER(20) NOT NULL ,
	pd_cd                VARCHAR2(100) NULL ,
	qt                   NUMBER(10) NULL ,
	pdt_stt_time         DATE NULL ,
	pdtexpt_fn_time      DATE NULL ,
	pdt_inst_no          NUMBER(20) NULL ,
	comp_st              VARCHAR2(100) NULL 
);



CREATE UNIQUE INDEX XPK생산_지시_상세 ON pdt_inst_detail
(pdt_inst_detail_no   ASC);



ALTER TABLE pdt_inst_detail
	ADD CONSTRAINT  XPK생산_지시_상세 PRIMARY KEY (pdt_inst_detail_no);



CREATE TABLE pdt_plan_detail
(
	pdt_plan_cd          VARCHAR2(100) NULL ,
	pdt_plan_detail_no   NUMBER(20) NOT NULL ,
	pd_name              VARCHAR2(100) NULL ,
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
	od_name              VARCHAR2(100) NULL 
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
	pass_std             NUMBER NULL ,
	input_avail_val      NUMBER NULL 
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



ALTER TABLE mf_ck
	ADD (CONSTRAINT R_56 FOREIGN KEY (pdt_inst_detail_no) REFERENCES pdt_inst_detail (pdt_inst_detail_no) ON DELETE SET NULL);



ALTER TABLE mf_pd_dur_time
	ADD (CONSTRAINT R_65 FOREIGN KEY (pdt_ps_cd) REFERENCES mf_ps (pdt_ps_cd));



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



ALTER TABLE pack_ck
	ADD (CONSTRAINT R_57 FOREIGN KEY (pdt_inst_detail_no) REFERENCES pdt_inst_detail (pdt_inst_detail_no) ON DELETE SET NULL);



ALTER TABLE pay
	ADD (CONSTRAINT R_24 FOREIGN KEY (sub_no) REFERENCES sub (sub_no));



ALTER TABLE pay
	ADD (CONSTRAINT R_25 FOREIGN KEY (enter_cd) REFERENCES enter (enter_cd));



ALTER TABLE pd_stk
	ADD (CONSTRAINT R_42 FOREIGN KEY (pd_cd) REFERENCES pd (pd_cd));



ALTER TABLE pd_stk
	ADD (CONSTRAINT R_61 FOREIGN KEY (pdt_inst_detail_no) REFERENCES pdt_inst_detail (pdt_inst_detail_no) ON DELETE SET NULL);



ALTER TABLE pdt_hist
	ADD (CONSTRAINT R_53 FOREIGN KEY (pdt_inst_detail_no) REFERENCES pdt_inst_detail (pdt_inst_detail_no) ON DELETE SET NULL);



ALTER TABLE pdt_hist
	ADD (CONSTRAINT R_62 FOREIGN KEY (mf_cd) REFERENCES mf_pd_dur_time (mf_cd) ON DELETE SET NULL);



ALTER TABLE pdt_inst
	ADD (CONSTRAINT R_29 FOREIGN KEY (pdt_plan_cd) REFERENCES pdtplan (pdt_plan_cd));



ALTER TABLE pdt_inst
	ADD (CONSTRAINT R_60 FOREIGN KEY (mt_send_no) REFERENCES mt_send (mt_send_no) ON DELETE SET NULL);



ALTER TABLE pdt_inst_detail
	ADD (CONSTRAINT R_55 FOREIGN KEY (pdt_inst_no) REFERENCES pdt_inst (pdt_inst_no) ON DELETE SET NULL);



ALTER TABLE pdt_plan_detail
	ADD (CONSTRAINT R_47 FOREIGN KEY (pdt_plan_cd) REFERENCES pdtplan (pdt_plan_cd) ON DELETE SET NULL);



ALTER TABLE rtn
	ADD (CONSTRAINT R_7 FOREIGN KEY (od_no) REFERENCES od (od_no));



ALTER TABLE send
	ADD (CONSTRAINT R_5 FOREIGN KEY (od_no) REFERENCES od (od_no));



ALTER TABLE send
	ADD (CONSTRAINT R_6 FOREIGN KEY (pd_lot) REFERENCES pd_stk (pd_lot));



COMMENT ON TABLE auth IS '권한';
        COMMENT ON COLUMN auth.auth_no IS '권한 번호';
         COMMENT ON COLUMN auth.auth_lvl IS '권한 레벨';
         COMMENT ON COLUMN auth.auth_name IS '권한 명';
         
COMMENT ON TABLE bom IS 'BOM';
        COMMENT ON COLUMN bom.pd_cd IS '제품 코드';
         COMMENT ON COLUMN bom.mt_cd IS '자재 코드';
         COMMENT ON COLUMN bom.unit IS '단위';
         COMMENT ON COLUMN bom.detail_unit IS '상세 단위';
         COMMENT ON COLUMN bom.consum IS '소모량';
         
COMMENT ON TABLE cli IS '거래처';
        COMMENT ON COLUMN cli.cli_cd IS '거래처 코드';
         COMMENT ON COLUMN cli.cli_name IS '거래처 명';
         COMMENT ON COLUMN cli.bussno IS '사업자번호';
         COMMENT ON COLUMN cli.tel IS '전화번호';
         COMMENT ON COLUMN cli.addr IS '주소';
         COMMENT ON COLUMN cli.cli_chg IS '거래처 담당자';
         COMMENT ON COLUMN cli.mail IS '이메일';
         
COMMENT ON TABLE com_cd IS '공통 코드';
        COMMENT ON COLUMN com_cd.wk_cd_no IS '주 코드 번호';
         COMMENT ON COLUMN com_cd.cd_name IS '코드 명';
         COMMENT ON COLUMN com_cd.cd_desc IS '코드 설명';
         
COMMENT ON TABLE com_detail_cd IS '공통 상세 코드';
        COMMENT ON COLUMN com_detail_cd.detail_cd_no IS '세부 코드 번호';
         COMMENT ON COLUMN com_detail_cd.wk_cd_no IS '주 코드 번호';
         COMMENT ON COLUMN com_detail_cd.detail_cd_name IS '세부 코드 명';
         COMMENT ON COLUMN com_detail_cd.detail_cd_desc IS '세부 코드 설명';
         
COMMENT ON TABLE disc_pd IS '폐기 제품';
        COMMENT ON COLUMN disc_pd.disc_no IS '폐기 번호';
         COMMENT ON COLUMN disc_pd.pd_lot IS '제품 LOT';
         COMMENT ON COLUMN disc_pd.qt IS '수량';
         COMMENT ON COLUMN disc_pd.cost IS '비용';
         COMMENT ON COLUMN disc_pd.disc_dt IS '폐기 일';
         COMMENT ON COLUMN disc_pd.rsn IS '사유';
         COMMENT ON COLUMN disc_pd.disc_chg IS '폐기 담당자';
         
COMMENT ON TABLE emp IS '사원';
        COMMENT ON COLUMN emp.emp_no IS '사원 번호';
         COMMENT ON COLUMN emp.auth_no IS '권한 번호';
         COMMENT ON COLUMN emp.enter_cd IS '기업 코드';
         COMMENT ON COLUMN emp.id IS '아이디';
         COMMENT ON COLUMN emp.pw IS '비밀번호';
         COMMENT ON COLUMN emp.name IS '이름';
         COMMENT ON COLUMN emp.tel IS '전화번호';
         COMMENT ON COLUMN emp.dpt IS '부서명';
         
COMMENT ON TABLE enter IS '기업';
        COMMENT ON COLUMN enter.enter_cd IS '기업 코드';
         COMMENT ON COLUMN enter.auth_no IS '권한 번호';
         COMMENT ON COLUMN enter.id IS '아이디';
         COMMENT ON COLUMN enter.pw IS '비밀번호';
         COMMENT ON COLUMN enter.bussno IS '사업자번호';
         COMMENT ON COLUMN enter.enter_name IS '기업 명';
         COMMENT ON COLUMN enter.chg IS '담당자';
         COMMENT ON COLUMN enter.mail IS '이메일';
         COMMENT ON COLUMN enter.ceo IS '대표자';
         COMMENT ON COLUMN enter.st IS '상태';
         
COMMENT ON TABLE fc IS '설비';
        COMMENT ON COLUMN fc.fc_cd IS '설비 코드';
         COMMENT ON COLUMN fc.fc_name IS '설비 명';
         COMMENT ON COLUMN fc.st IS '상태';
         COMMENT ON COLUMN fc.ins_mf IS '투입 공정';
         COMMENT ON COLUMN fc.mnf_com IS '제조 업체';
         COMMENT ON COLUMN fc.str_dt IS '입고 일';
         COMMENT ON COLUMN fc.ins_cycle IS '점검 주기';
         COMMENT ON COLUMN fc.last_ins_dt IS '마지막 점검 일';
         COMMENT ON COLUMN fc.output IS '생산량';
         COMMENT ON COLUMN fc.dur_time IS '소요 시간';
         
COMMENT ON TABLE fc_ins IS '설비 점검';
        COMMENT ON COLUMN fc_ins.ins_cd IS '점검 코드';
         COMMENT ON COLUMN fc_ins.nonop_cd IS '비가동 코드';
         COMMENT ON COLUMN fc_ins.fc_cd IS '설비 코드';
         COMMENT ON COLUMN fc_ins.ins_dt IS '점검 일';
         COMMENT ON COLUMN fc_ins.stt_time IS '시작 시간';
         COMMENT ON COLUMN fc_ins.fn_time IS '종료 시간';
         COMMENT ON COLUMN fc_ins.ins_cat IS '점검 구분';
         COMMENT ON COLUMN fc_ins.ins_cont IS '점검 내용';
         COMMENT ON COLUMN fc_ins.cc IS '판정';
         COMMENT ON COLUMN fc_ins.chg IS '담당자';
         
COMMENT ON TABLE mf_ck IS '공정 검사';
        COMMENT ON COLUMN mf_ck.mf_ck_no IS '공정 검사 번호';
         COMMENT ON COLUMN mf_ck.ck_name IS '검사 명';
         COMMENT ON COLUMN mf_ck.ck_st IS '검사 상태';
         COMMENT ON COLUMN mf_ck.pd_name IS '제품 명';
         COMMENT ON COLUMN mf_ck.pdt_qt IS '생산 수량';
         COMMENT ON COLUMN mf_ck.rt_dt IS '로스팅 일';
         COMMENT ON COLUMN mf_ck.rt_chg IS '로스팅 담당자';
         COMMENT ON COLUMN mf_ck.first_cc IS '1차 색도검사';
         COMMENT ON COLUMN mf_ck.second_cc IS '2차 색도검사';
         COMMENT ON COLUMN mf_ck.third_cc IS '3차 색도검사';
         COMMENT ON COLUMN mf_ck.fourth_cc IS '4차 색도검사';
         COMMENT ON COLUMN mf_ck.fifth_cc IS '5차 색도검사';
         COMMENT ON COLUMN mf_ck.cc_avg IS '색도검사 평균';
         COMMENT ON COLUMN mf_ck.mfck_res IS '공정검사 결과';
         COMMENT ON COLUMN mf_ck.ck_dt IS '검사 일';
         COMMENT ON COLUMN mf_ck.ck_chg IS '검사 담당자';
         COMMENT ON COLUMN mf_ck.pass_std IS '통과 기준';
         COMMENT ON COLUMN mf_ck.pdt_inst_detail_no IS '생산 지시 상세 번호';
         
COMMENT ON TABLE mf_pd_dur_time IS '공정 제품 소요 시간';
        COMMENT ON COLUMN mf_pd_dur_time.mf_cd IS '공정 코드';
         COMMENT ON COLUMN mf_pd_dur_time.pdt_ps_cd IS '생산 과정 코드';
         COMMENT ON COLUMN mf_pd_dur_time.pdt_pd_cd IS '생산 제품 코드';
         COMMENT ON COLUMN mf_pd_dur_time.add_mf_time IS '추가 공정 시간';
         
COMMENT ON TABLE mf_ps IS '공정 과정';
        COMMENT ON COLUMN mf_ps.pdt_ps_cd IS '생산 과정 코드';
         COMMENT ON COLUMN mf_ps.mf_ps_div IS '공정 과정 분류';
         COMMENT ON COLUMN mf_ps.mf_step_time IS '공정 순서 시간';
         COMMENT ON COLUMN mf_ps.mf_step IS '공정 순서';
         
COMMENT ON TABLE mt IS '자재';
        COMMENT ON COLUMN mt.mt_cd IS '자재 코드';
         COMMENT ON COLUMN mt.cli_cd IS '거래처 코드';
         COMMENT ON COLUMN mt.mt_div IS '자재 분류';
         COMMENT ON COLUMN mt.mt_name IS '자재 명';
         COMMENT ON COLUMN mt.cost IS '단가';
         COMMENT ON COLUMN mt.unit IS '단위';
         COMMENT ON COLUMN mt.exp_dt IS '유통기한';
         COMMENT ON COLUMN mt.leadtm IS '리드타임';
         COMMENT ON COLUMN mt.safe_stk_rate IS '안전재고 비율';
         
COMMENT ON TABLE mt_ck IS '자재 검사';
        COMMENT ON COLUMN mt_ck.mt_ck_no IS '자재 검사 번호';
         COMMENT ON COLUMN mt_ck.mt_placeod_cd IS '자재 발주 코드';
         COMMENT ON COLUMN mt_ck.mt_cd IS '자재 코드';
         COMMENT ON COLUMN mt_ck.str_qt IS '입고 수량';
         COMMENT ON COLUMN mt_ck.str_comp_dt IS '입고 완료 일';
         COMMENT ON COLUMN mt_ck.cli_name IS '거래처 명';
         COMMENT ON COLUMN mt_ck.str_chg IS '입고 담당자';
         COMMENT ON COLUMN mt_ck.ck_name IS '검사 명';
         COMMENT ON COLUMN mt_ck.first_mc IS '1차 수분검사';
         COMMENT ON COLUMN mt_ck.second_mc IS '2차 수분검사';
         COMMENT ON COLUMN mt_ck.third_mc IS '3차 수분검사';
         COMMENT ON COLUMN mt_ck.fourth_mc IS '4차 수분검사';
         COMMENT ON COLUMN mt_ck.fifth_mc IS '5차 수분검사';
         COMMENT ON COLUMN mt_ck.mc_avg IS '수분검사 평균';
         COMMENT ON COLUMN mt_ck.mc_res IS '수분검사 결과';
         COMMENT ON COLUMN mt_ck.ck_dt IS '검사 일';
         COMMENT ON COLUMN mt_ck.ck_chg IS '검사 담당자';
         COMMENT ON COLUMN mt_ck.first_ic IS '1차 외관검사';
         COMMENT ON COLUMN mt_ck.second_ic IS '2차 외관검사';
         COMMENT ON COLUMN mt_ck.third_ic IS '3차 외관검사';
         COMMENT ON COLUMN mt_ck.fourth_ic IS '4차 외관검사';
         COMMENT ON COLUMN mt_ck.fifth_ic IS '5차 외관검사';
         COMMENT ON COLUMN mt_ck.ic_avgval IS '외관검사 평균값';
         COMMENT ON COLUMN mt_ck.pass_std IS '통과 기준';
         COMMENT ON COLUMN mt_ck.ic_res IS '외관검사 결과';
         
COMMENT ON TABLE mt_disc IS '자재 폐기';
        COMMENT ON COLUMN mt_disc.mt_disc_no IS '자재 폐기 번호';
         COMMENT ON COLUMN mt_disc.mt_lot IS '자재 LOT';
         COMMENT ON COLUMN mt_disc.disc_qt IS '폐기 수량';
         COMMENT ON COLUMN mt_disc.disc_cost IS '폐기 비용';
         COMMENT ON COLUMN mt_disc.disc_compdt IS '폐기 완료일';
         COMMENT ON COLUMN mt_disc.rsn IS '사유';
         COMMENT ON COLUMN mt_disc.disc_chg IS '폐기 담당자';
         COMMENT ON COLUMN mt_disc.mt_cd IS '자재 코드';
         
COMMENT ON TABLE mt_placeod IS '자재 발주';
        COMMENT ON COLUMN mt_placeod.mt_placeod_cd IS '자재 발주 코드';
         COMMENT ON COLUMN mt_placeod.cli_cd IS '거래처 코드';
         COMMENT ON COLUMN mt_placeod.mt_cd IS '자재 코드';
         COMMENT ON COLUMN mt_placeod.placeod_qt IS '발주 수량';
         COMMENT ON COLUMN mt_placeod.placeod_reqdt IS '발주 요청일';
         COMMENT ON COLUMN mt_placeod.placeod_compdt IS '발주 완료일';
         COMMENT ON COLUMN mt_placeod.placeod_requester IS '발주 요청자';
         COMMENT ON COLUMN mt_placeod.placeod_chg IS '발주 담당자';
         COMMENT ON COLUMN mt_placeod.placeod_st IS '발주 상태';
         
COMMENT ON TABLE mt_rtn IS '자재 반품';
        COMMENT ON COLUMN mt_rtn.mt_rtn_no IS '자재 반품 번호';
         COMMENT ON COLUMN mt_rtn.mt_placeod_cd IS '자재 발주 코드';
         COMMENT ON COLUMN mt_rtn.rtn_qt IS '반품 수량';
         COMMENT ON COLUMN mt_rtn.rtn_compdt IS '반품 완료일';
         COMMENT ON COLUMN mt_rtn.rtn_chg IS '반품 담당자';
         COMMENT ON COLUMN mt_rtn.mt_cd IS '자재 코드';
         
COMMENT ON TABLE mt_send IS '자재 출고';
        COMMENT ON COLUMN mt_send.mt_send_no IS '자재 출고 번호';
         COMMENT ON COLUMN mt_send.mt_lot IS '자재 LOT';
         COMMENT ON COLUMN mt_send.send_qt IS '출고 수량';
         COMMENT ON COLUMN mt_send.send_reqdt IS '출고 요청일';
         COMMENT ON COLUMN mt_send.send_compdt IS '출고 완료일';
         COMMENT ON COLUMN mt_send.send_requester IS '출고 요청자';
         COMMENT ON COLUMN mt_send.send_chg IS '출고 담당자';
         COMMENT ON COLUMN mt_send.send_st IS '출고 상태';
         
COMMENT ON TABLE mt_stk IS '자재 재고';
        COMMENT ON COLUMN mt_stk.mt_lot IS '자재 LOT';
         COMMENT ON COLUMN mt_stk.mt_str_no IS '자재 입고 번호';
         COMMENT ON COLUMN mt_stk.mt_cd IS '자재 코드';
         COMMENT ON COLUMN mt_stk.stk_qt IS '재고 수량';
         COMMENT ON COLUMN mt_stk.exp_dt IS '유통기한';
         
COMMENT ON TABLE mt_str IS '자재 입고';
        COMMENT ON COLUMN mt_str.mt_str_no IS '자재 입고 번호';
         COMMENT ON COLUMN mt_str.mt_placeod_cd IS '자재 발주 코드';
         COMMENT ON COLUMN mt_str.str_qt IS '입고 수량';
         COMMENT ON COLUMN mt_str.str_compdt IS '입고 완료일';
         COMMENT ON COLUMN mt_str.str_chg IS '입고 담당자';
         COMMENT ON COLUMN mt_str.mt_cd IS '자재 코드';
         
COMMENT ON TABLE nonop_mgmt IS '비가동 관리';
        COMMENT ON COLUMN nonop_mgmt.nonop_cd IS '비가동 코드';
         COMMENT ON COLUMN nonop_mgmt.fc_cd IS '설비 코드';
         COMMENT ON COLUMN nonop_mgmt.nonop_stt_time IS '비가동 시작 시간';
         COMMENT ON COLUMN nonop_mgmt.nonop_fn_time IS '비가동 종료 시간';
         COMMENT ON COLUMN nonop_mgmt.fc_chg IS '설비 담당자';
         COMMENT ON COLUMN nonop_mgmt.rsn IS '사유';
         COMMENT ON COLUMN nonop_mgmt.rsn_desc IS '사유 설명';
         
COMMENT ON TABLE od IS '주문';
        COMMENT ON COLUMN od.od_no IS '주문 번호';
         COMMENT ON COLUMN od.cli_cd IS '거래처 코드';
         COMMENT ON COLUMN od.od_dt IS '주문 일';
         COMMENT ON COLUMN od.od_chg IS '주문 담당자';
         COMMENT ON COLUMN od.dc_rate IS '할인율';
         COMMENT ON COLUMN od.total_price IS '총 금액';
         
COMMENT ON TABLE od_detail IS '주문 상세';
        COMMENT ON COLUMN od_detail.od_detailno IS '주문 상세번호';
         COMMENT ON COLUMN od_detail.pd_cd IS '제품 코드';
         COMMENT ON COLUMN od_detail.od_no IS '주문 번호';
         COMMENT ON COLUMN od_detail.qt IS '수량';
         COMMENT ON COLUMN od_detail.cost IS '단가';
         COMMENT ON COLUMN od_detail.detail_price IS '상세 금액';
         COMMENT ON COLUMN od_detail.due_dt IS '납기 일';
         
COMMENT ON TABLE pack_ck IS '포장 검사';
        COMMENT ON COLUMN pack_ck.pack_ck_no IS '포장 검사 번호';
         COMMENT ON COLUMN pack_ck.ck_name IS '검사 명';
         COMMENT ON COLUMN pack_ck.ck_st IS '검사 상태';
         COMMENT ON COLUMN pack_ck.pd_name IS '제품 명';
         COMMENT ON COLUMN pack_ck.pdt_qt IS '생산 수량';
         COMMENT ON COLUMN pack_ck.pd_lot IS '제품 LOT';
         COMMENT ON COLUMN pack_ck.pack_dt IS '포장 일';
         COMMENT ON COLUMN pack_ck.pack_chg IS '포장 담당자';
         COMMENT ON COLUMN pack_ck.first_nc IS '1차 질소충전검사';
         COMMENT ON COLUMN pack_ck.second_nc IS '2차 질소충전검사';
         COMMENT ON COLUMN pack_ck.third_nc IS '3차 질소충전검사';
         COMMENT ON COLUMN pack_ck.fourth_nc IS '4차 질소충전검사';
         COMMENT ON COLUMN pack_ck.fifth_nc IS '5차 질소충전검사';
         COMMENT ON COLUMN pack_ck.nc_avg_val IS '질소충전검사 평균 값';
         COMMENT ON COLUMN pack_ck.packck_res IS '포장검사 결과';
         COMMENT ON COLUMN pack_ck.ck_dt IS '검사 일';
         COMMENT ON COLUMN pack_ck.ck_chg IS '검사 담당자';
         COMMENT ON COLUMN pack_ck.pass_std IS '통과 기준';
         COMMENT ON COLUMN pack_ck.pdt_inst_detail_no IS '생산 지시 상세 번호';
         
COMMENT ON TABLE pay IS '결제';
        COMMENT ON COLUMN pay.pay_cd IS '결제 코드';
         COMMENT ON COLUMN pay.enter_cd IS '기업 코드';
         COMMENT ON COLUMN pay.sub_no IS '구독 번호';
         COMMENT ON COLUMN pay.pay_dt IS '결제 일';
         COMMENT ON COLUMN pay.key IS '빌링키';
         COMMENT ON COLUMN pay.price IS '금액';
         
COMMENT ON TABLE pd IS '제품';
        COMMENT ON COLUMN pd.pd_cd IS '제품 코드';
         COMMENT ON COLUMN pd.pd_name IS '제품 명';
         COMMENT ON COLUMN pd.unit IS '단위';
         COMMENT ON COLUMN pd.cost IS '단가';
         
COMMENT ON TABLE pd_stk IS '제품 재고';
        COMMENT ON COLUMN pd_stk.pd_lot IS '제품 LOT';
         COMMENT ON COLUMN pd_stk.pd_cd IS '제품 코드';
         COMMENT ON COLUMN pd_stk.unit IS '단위';
         COMMENT ON COLUMN pd_stk.qt IS '수량';
         COMMENT ON COLUMN pd_stk.pdt_dt IS '생산 일';
         COMMENT ON COLUMN pd_stk.exp_dt IS '유통기한';
         COMMENT ON COLUMN pd_stk.st IS '상태';
         COMMENT ON COLUMN pd_stk.pdt_inst_detail_no IS '생산 지시 상세 번호';
         
COMMENT ON TABLE pdt_hist IS '생산 내역';
        COMMENT ON COLUMN pdt_hist.pdt_hist_no IS '생산 내역 번호';
         COMMENT ON COLUMN pdt_hist.pdt_dt IS '생산 일';
         COMMENT ON COLUMN pdt_hist.pd_name IS '제품 명';
         COMMENT ON COLUMN pdt_hist.pdt_qt IS '생산 수량';
         COMMENT ON COLUMN pdt_hist.pdt_expt_stt_time IS '생산 예상 시작 시간';
         COMMENT ON COLUMN pdt_hist.pdt_expt_fn_time IS '생산 예상 종료 시간';
         COMMENT ON COLUMN pdt_hist.pdt_stt_time IS '생산 시작 시간';
         COMMENT ON COLUMN pdt_hist.pdt_fn_time IS '생산 종료 시간';
         COMMENT ON COLUMN pdt_hist.pdt_inst_detail_no IS '생산 지시 상세 번호';
         COMMENT ON COLUMN pdt_hist.mf_qual_st IS '공정 품질 상태';
         COMMENT ON COLUMN pdt_hist.pack_qual_st IS '포장 품질 상태';
         COMMENT ON COLUMN pdt_hist.fail_rsn IS '실패사유';
         COMMENT ON COLUMN pdt_hist.mf_cd IS '공정 코드';
         
COMMENT ON TABLE pdt_inst IS '생산 지시';
        COMMENT ON COLUMN pdt_inst.pdt_inst_no IS '생산 지시 번호';
         COMMENT ON COLUMN pdt_inst.pdt_plan_cd IS '생산 계획 코드';
         COMMENT ON COLUMN pdt_inst.pdt_inst_dt IS '생산 지시 일';
         COMMENT ON COLUMN pdt_inst.pdt_pd_cd IS '생산 제품 코드';
         COMMENT ON COLUMN pdt_inst.mt_send_no IS '자재 출고 번호';
         
COMMENT ON TABLE pdt_inst_detail IS '생산 지시 상세';
        COMMENT ON COLUMN pdt_inst_detail.pdt_inst_detail_no IS '생산 지시 상세 번호';
         COMMENT ON COLUMN pdt_inst_detail.pd_cd IS '제품 코드';
         COMMENT ON COLUMN pdt_inst_detail.qt IS '수량';
         COMMENT ON COLUMN pdt_inst_detail.pdt_stt_time IS '생산 시작 시간';
         COMMENT ON COLUMN pdt_inst_detail.pdtexpt_fn_time IS '생산예상 종료 시간';
         COMMENT ON COLUMN pdt_inst_detail.pdt_inst_no IS '생산 지시 번호';
         COMMENT ON COLUMN pdt_inst_detail.comp_st IS '완료 상태';
         
COMMENT ON TABLE pdt_plan_detail IS '생산 계획 상세';
        COMMENT ON COLUMN pdt_plan_detail.pdt_plan_detail_no IS '생산 계획 상세 번호';
         COMMENT ON COLUMN pdt_plan_detail.pdt_plan_cd IS '생산 계획 코드';
         COMMENT ON COLUMN pdt_plan_detail.pd_name IS '제품 명';
         COMMENT ON COLUMN pdt_plan_detail.qt IS '수량';
         COMMENT ON COLUMN pdt_plan_detail.due_dt IS '납기 일';
         
COMMENT ON TABLE pdtplan IS '생산계획';
        COMMENT ON COLUMN pdtplan.pdt_plan_cd IS '생산 계획 코드';
         COMMENT ON COLUMN pdtplan.wk_plan_stt_dt IS '주간계획 시작 일';
         COMMENT ON COLUMN pdtplan.od_name IS '주문 명';
         
COMMENT ON TABLE qual_ck_std_mgmt IS '품질 검사 기준 관리';
        COMMENT ON COLUMN qual_ck_std_mgmt.std_mgmt_no IS '기준 관리 번호';
         COMMENT ON COLUMN qual_ck_std_mgmt.category IS '카테고리';
         COMMENT ON COLUMN qual_ck_std_mgmt.ck_name IS '검사 명';
         COMMENT ON COLUMN qual_ck_std_mgmt.pass_std IS '통과 기준';
         COMMENT ON COLUMN qual_ck_std_mgmt.input_avail_val IS '입력 가능 값';
         
COMMENT ON TABLE rtn IS '반품';
        COMMENT ON COLUMN rtn.rtn_no IS '반품 번호';
         COMMENT ON COLUMN rtn.od_no IS '주문 번호';
         COMMENT ON COLUMN rtn.cli_chg IS '거래처 담당자';
         COMMENT ON COLUMN rtn.rtn_chg IS '반품 담당자';
         COMMENT ON COLUMN rtn.rtn_compdt IS '반품 완료일';
         
COMMENT ON TABLE send IS '출고';
        COMMENT ON COLUMN send.send_no IS '출고 번호';
         COMMENT ON COLUMN send.pd_lot IS '제품 LOT';
         COMMENT ON COLUMN send.od_no IS '주문 번호';
         COMMENT ON COLUMN send.qt IS '수량';
         COMMENT ON COLUMN send.send_dt IS '출고 일';
         COMMENT ON COLUMN send.send_chg IS '출고 담당자';
         
COMMENT ON TABLE sub IS '구독';
        COMMENT ON COLUMN sub.sub_no IS '구독 번호';
         COMMENT ON COLUMN sub.rank IS '등급';
         COMMENT ON COLUMN sub.sub_name IS '구독 명';
         COMMENT ON COLUMN sub.pr IS '가격';
         COMMENT ON COLUMN sub.detail_desc IS '상세 설명';
         



