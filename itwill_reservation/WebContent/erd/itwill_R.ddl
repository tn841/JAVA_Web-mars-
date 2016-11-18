DROP TABLE Reserve_detail CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE iOrder_detail CASCADE CONSTRAINTS;
DROP TABLE iOrder CASCADE CONSTRAINTS;
DROP TABLE Reserve_info CASCADE CONSTRAINTS;
DROP TABLE Seat CASCADE CONSTRAINTS;
DROP TABLE Item CASCADE CONSTRAINTS;
DROP TABLE Member CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE Member(
		m_no                          		NUMBER(10)		 NOT NULL,
		m_id                          		VARCHAR2(20)		 NOT NULL,
		m_password                    		VARCHAR2(20)		 NOT NULL,
		m_name                        		VARCHAR2(20)		 NOT NULL,
		m_phone                       		VARCHAR2(20)		 NOT NULL,
		m_email                       		VARCHAR2(30)		 NULL ,
		m_birth                       		DATE		 NULL ,
		m_address                     		VARCHAR2(100)		 NULL ,
		m_class                       		VARCHAR2(10)		 NOT NULL,
		m_point                       		NUMBER(20)		 DEFAULT 0		 NULL 
);

COMMENT ON TABLE Member is 'ȸ��';
COMMENT ON COLUMN Member.m_no is 'ȸ����ȣ';
COMMENT ON COLUMN Member.m_id is 'ȸ�����̵�';
COMMENT ON COLUMN Member.m_password is 'ȸ����й�ȣ';
COMMENT ON COLUMN Member.m_name is 'ȸ���̸�';
COMMENT ON COLUMN Member.m_phone is 'ȸ����ȭ��ȣ';
COMMENT ON COLUMN Member.m_email is 'ȸ���̸���';
COMMENT ON COLUMN Member.m_birth is 'ȸ���������';
COMMENT ON COLUMN Member.m_address is 'ȸ���ּ�';
COMMENT ON COLUMN Member.m_class is 'ȸ����';
COMMENT ON COLUMN Member.m_point is 'ȸ������Ʈ';


/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE Item(
		i_type                        		NUMBER(10)		 NULL ,
		i_name                        		VARCHAR2(50)		 NULL ,
		i_point                       		NUMBER(10)		 NULL ,
		i_image                       		VARCHAR2(20)		 NULL ,
		i_desc                        		VARCHAR2(1000)		 NULL 
);

COMMENT ON TABLE Item is '������';
COMMENT ON COLUMN Item.i_type is '����������';
COMMENT ON COLUMN Item.i_name is '�������̸�';
COMMENT ON COLUMN Item.i_point is '�����۰���';
COMMENT ON COLUMN Item.i_image is '�������̹���';
COMMENT ON COLUMN Item.i_desc is '�����ۼ���';


/**********************************/
/* Table Name: �¼� ���� */
/**********************************/
CREATE TABLE Seat(
		s_no                          		NUMBER(10)		 NOT NULL,
		s_loc                         		VARCHAR2(10)		 NULL ,
		s_image                       		VARCHAR2(50)		 NULL ,
		s_capacity                    		VARCHAR2(10)		 NULL 
);

COMMENT ON TABLE Seat is '�¼� ����';
COMMENT ON COLUMN Seat.s_no is '�¼���ȣ';
COMMENT ON COLUMN Seat.s_loc is '�¼���ġ';
COMMENT ON COLUMN Seat.s_image is '�¼��̹���';
COMMENT ON COLUMN Seat.s_capacity is '�¼������ο�';


/**********************************/
/* Table Name: ���� ���� */
/**********************************/
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


/**********************************/
/* Table Name: �ֹ� */
/**********************************/
CREATE TABLE iOrder(
		j_no                          		NUMBER(10)		 NOT NULL,
		m_no                          		NUMBER(10)		 NULL ,
		j_date                        		DATE		 NULL ,
		j_desc                        		VARCHAR2(1000)		 NULL 
);

COMMENT ON TABLE iOrder is '�ֹ�';
COMMENT ON COLUMN iOrder.j_no is '�ֹ���ȣ';
COMMENT ON COLUMN iOrder.m_no is '�ֹ��ڹ�ȣ';
COMMENT ON COLUMN iOrder.j_date is '�ֹ���¥';
COMMENT ON COLUMN iOrder.j_desc is '�ֹ�����';


/**********************************/
/* Table Name: �ֹ��� */
/**********************************/
CREATE TABLE iOrder_detail(
		jd_no                         		NUMBER(10)		 NOT NULL,
		i_type                        		NUMBER(10)		 NULL ,
		jd_quantity                   		NUMBER(10)		 NULL ,
		jd_tot                        		NUMBER(10)		 NULL ,
		j_no                          		NUMBER(10)		 NULL 
);

COMMENT ON TABLE iOrder_detail is '�ֹ���';
COMMENT ON COLUMN iOrder_detail.jd_no is '�ֹ��󼼹�ȣ';
COMMENT ON COLUMN iOrder_detail.i_type is '�����۹�ȣ';
COMMENT ON COLUMN iOrder_detail.jd_quantity is '�����ۼ���';
COMMENT ON COLUMN iOrder_detail.jd_tot is '������������Ʈ';
COMMENT ON COLUMN iOrder_detail.j_no is '�ֹ���ȣ';


/**********************************/
/* Table Name: �Խ��� */
/**********************************/
CREATE TABLE board(
		b_no                          		NUMBER(10)		 NOT NULL,
		b_type                        		NUMBER(10)		 NULL ,
		b_score                       		NUMBER(10)		 NULL ,
		b_title                       		VARCHAR2(200)		 NULL ,
		b_writer                      		VARCHAR2(50)		 NULL ,
		b_content                     		VARCHAR2(4000)		 NULL ,
		b_date                        		DATE		 DEFAULT sysdate		 NULL ,
		b_click                       		NUMBER(20)		 NULL ,
		b_groupno                     		NUMBER(10)		 NULL ,
		b_depth                       		NUMBER(10)		 NULL ,
		b_step                        		NUMBER(10)		 NULL ,
		b_image                       		VARCHAR2(50)		 NULL ,
		m_no                          		NUMBER(10)		 NULL 
);

COMMENT ON TABLE board is '�Խ���';
COMMENT ON COLUMN board.b_no is '�Խñ۹�ȣ';
COMMENT ON COLUMN board.b_type is '�Խ���Ÿ��';
COMMENT ON COLUMN board.b_score is '�Խñ�����';
COMMENT ON COLUMN board.b_title is '�Խñ�����';
COMMENT ON COLUMN board.b_writer is '�Խñ۾���';
COMMENT ON COLUMN board.b_content is '�Խñ۳���';
COMMENT ON COLUMN board.b_date is '�Խñ��ۼ���';
COMMENT ON COLUMN board.b_click is '�Խñ���ȸ��';
COMMENT ON COLUMN board.b_groupno is '�Խñ۱׷��ȣ';
COMMENT ON COLUMN board.b_depth is '�Խñ۱���';
COMMENT ON COLUMN board.b_step is '�Խñ۽���';
COMMENT ON COLUMN board.b_image is '�Խñ��̹���';
COMMENT ON COLUMN board.m_no is 'ȸ����ȣ';


/**********************************/
/* Table Name: ���� �� ���� */
/**********************************/
CREATE TABLE Reserve_detail(
		r_detail_no                   		NUMBER(10)		 NULL ,
		r_no                          		NUMBER(10)		 NULL ,
		m_no                          		NUMBER(10)		 NULL ,
		master                        		NUMBER(10)		 NULL 
);

COMMENT ON TABLE Reserve_detail is '���� �� ����';
COMMENT ON COLUMN Reserve_detail.r_detail_no is '���� �� ��ȣ';
COMMENT ON COLUMN Reserve_detail.r_no is '���� ��ȣ';
COMMENT ON COLUMN Reserve_detail.m_no is '������ ��ȣ';
COMMENT ON COLUMN Reserve_detail.master is '�������� ����';



ALTER TABLE Member ADD CONSTRAINT IDX_Member_PK PRIMARY KEY (m_no);

ALTER TABLE Item ADD CONSTRAINT IDX_Item_PK PRIMARY KEY (i_type);

ALTER TABLE Seat ADD CONSTRAINT IDX_Seat_PK PRIMARY KEY (s_no);

ALTER TABLE Reserve_info ADD CONSTRAINT IDX_Reserve_info_PK PRIMARY KEY (r_no);
ALTER TABLE Reserve_info ADD CONSTRAINT IDX_Reserve_info_FK0 FOREIGN KEY (s_no) REFERENCES Seat (s_no);
ALTER TABLE Reserve_info ADD CONSTRAINT IDX_Reserve_info_FK1 FOREIGN KEY (r_m_no) REFERENCES Member (m_no);

ALTER TABLE iOrder ADD CONSTRAINT IDX_iOrder_PK PRIMARY KEY (j_no);
ALTER TABLE iOrder ADD CONSTRAINT IDX_iOrder_FK0 FOREIGN KEY (m_no) REFERENCES Member (m_no);

ALTER TABLE iOrder_detail ADD CONSTRAINT IDX_iOrder_detail_PK PRIMARY KEY (jd_no);
ALTER TABLE iOrder_detail ADD CONSTRAINT IDX_iOrder_detail_FK0 FOREIGN KEY (j_no) REFERENCES iOrder (j_no);
ALTER TABLE iOrder_detail ADD CONSTRAINT IDX_iOrder_detail_FK1 FOREIGN KEY (i_type) REFERENCES Item (i_type);

ALTER TABLE board ADD CONSTRAINT IDX_board_PK PRIMARY KEY (b_no);
ALTER TABLE board ADD CONSTRAINT IDX_board_FK0 FOREIGN KEY (b_writer) REFERENCES Member (m_no);

ALTER TABLE Reserve_detail ADD CONSTRAINT IDX_Reserve_detail_PK PRIMARY KEY (r_detail_no);
ALTER TABLE Reserve_detail ADD CONSTRAINT IDX_Reserve_detail_FK0 FOREIGN KEY (r_no) REFERENCES Reserve_info (r_no);
ALTER TABLE Reserve_detail ADD CONSTRAINT IDX_Reserve_detail_FK1 FOREIGN KEY (m_no) REFERENCES Member (m_no);

