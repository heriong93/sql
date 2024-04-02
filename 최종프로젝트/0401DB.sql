-- 시퀀스 생성 
DROP SEQUENCE SEQ_FCLT;
CREATE SEQUENCE SEQ_FCLT; 

-- 테이블 데이터 입력

INSERT INTO FC (
                                fc_cd,
                                fc_name,
                                st,
                                ins_mf,
                                mnf_com,
                                str_dt,
                                ins_cycle,
                                output,
                                dur_time
                                ) 
            VALUES  (
                            SEQ_FCLT.nextval, 
                            'RoastMaster 120',
                            0,
                            '로스팅',
                            'Buhler',
                            '24/04/02',
                            60,
                            30,
                            30
                            );
                            
select * from fc;
commit;
                                