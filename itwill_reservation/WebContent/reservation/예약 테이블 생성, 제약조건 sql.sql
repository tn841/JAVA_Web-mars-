drop table Reserve_info;
CREATE TABLE Reserve_info(
		r_no                          		NUMBER(10)		 NOT NULL,
		enroll_time                   		TIMESTAMP		 NULL ,
		modify_time                   		TIMESTAMP		 NULL ,
		r_date                        		DATE		 NULL ,
		r_s_time                      		TIMESTAMP		 NULL ,
		r_e_time                      		TIMESTAMP		 NULL ,
		s_no                          		NUMBER(10)		 NULL ,
		r_m_no                        		NUMBER(10)		 NULL 
);

COMMENT ON TABLE Reserve_info is '예약 정보';
COMMENT ON COLUMN Reserve_info.r_no is '예약 번호';
COMMENT ON COLUMN Reserve_info.enroll_time is '등록시간';
COMMENT ON COLUMN Reserve_info.modify_time is '수정시간';
COMMENT ON COLUMN Reserve_info.r_date is '예약 일자';
COMMENT ON COLUMN Reserve_info.r_s_time is '예약 시작 시간';
COMMENT ON COLUMN Reserve_info.r_e_time is '예약 끝 시간';
COMMENT ON COLUMN Reserve_info.s_no is '좌석 번호';
COMMENT ON COLUMN Reserve_info.r_m_no is '예약한 사람 번호';

ALTER TABLE Reserve_info ADD CONSTRAINT IDX_Reserve_info_PK PRIMARY KEY (r_no);
ALTER TABLE Reserve_info ADD CONSTRAINT IDX_Reserve_info_FK0 FOREIGN KEY (s_no) REFERENCES Seat (s_no) ON DELETE CASCADE;
ALTER TABLE Reserve_info ADD CONSTRAINT IDX_Reserve_info_FK1 FOREIGN KEY (r_m_no) REFERENCES Member (m_no) ON DELETE CASCADE;
ALTER TABLE reserve_info ADD CONSTRAINT r_s_no_uq UNIQUE(s_no); --자리번호(s_no)는 유일해야함
ALTER TABLE reserve_info ADD CONSTRAINT r_r_m_no_uq UNIQUE(r_m_no); --예약한 사람번호(r_m_no)는 유일해야함

drop table reserve_detail;
CREATE TABLE Reserve_detail(
		r_detail_no                   		NUMBER(10)		 NULL ,
		r_no                          		NUMBER(10)		 NULL ,
		m_no                          		NUMBER(10)		 NULL ,
		master                        		NUMBER(10)		 NULL 
);


ALTER TABLE Reserve_detail ADD CONSTRAINT IDX_Reserve_detail_PK PRIMARY KEY (r_detail_no);
ALTER TABLE Reserve_detail ADD CONSTRAINT IDX_Reserve_detail_FK0 FOREIGN KEY (r_no) REFERENCES Reserve_info (r_no) ON DELETE CASCADE;
ALTER TABLE Reserve_detail ADD CONSTRAINT IDX_Reserve_detail_FK1 FOREIGN KEY (m_no) REFERENCES Member (m_no) ON DELETE CASCADE;
ALTER TABLE reserve_detail ADD CONSTRAINT rd_m_no_uq UNIQUE(m_no);