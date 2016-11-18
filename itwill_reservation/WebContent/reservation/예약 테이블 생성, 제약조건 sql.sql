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

COMMENT ON TABLE Reserve_info is '���� ����';
COMMENT ON COLUMN Reserve_info.r_no is '���� ��ȣ';
COMMENT ON COLUMN Reserve_info.enroll_time is '��Ͻð�';
COMMENT ON COLUMN Reserve_info.modify_time is '�����ð�';
COMMENT ON COLUMN Reserve_info.r_date is '���� ����';
COMMENT ON COLUMN Reserve_info.r_s_time is '���� ���� �ð�';
COMMENT ON COLUMN Reserve_info.r_e_time is '���� �� �ð�';
COMMENT ON COLUMN Reserve_info.s_no is '�¼� ��ȣ';
COMMENT ON COLUMN Reserve_info.r_m_no is '������ ��� ��ȣ';

ALTER TABLE Reserve_info ADD CONSTRAINT IDX_Reserve_info_PK PRIMARY KEY (r_no);
ALTER TABLE Reserve_info ADD CONSTRAINT IDX_Reserve_info_FK0 FOREIGN KEY (s_no) REFERENCES Seat (s_no) ON DELETE CASCADE;
ALTER TABLE Reserve_info ADD CONSTRAINT IDX_Reserve_info_FK1 FOREIGN KEY (r_m_no) REFERENCES Member (m_no) ON DELETE CASCADE;
ALTER TABLE reserve_info ADD CONSTRAINT r_s_no_uq UNIQUE(s_no); --�ڸ���ȣ(s_no)�� �����ؾ���
ALTER TABLE reserve_info ADD CONSTRAINT r_r_m_no_uq UNIQUE(r_m_no); --������ �����ȣ(r_m_no)�� �����ؾ���

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