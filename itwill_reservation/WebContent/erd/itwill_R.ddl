DROP TABLE Reserve_detail CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE iOrder_detail CASCADE CONSTRAINTS;
DROP TABLE iOrder CASCADE CONSTRAINTS;
DROP TABLE Reserve_info CASCADE CONSTRAINTS;
DROP TABLE Seat CASCADE CONSTRAINTS;
DROP TABLE Item CASCADE CONSTRAINTS;
DROP TABLE Member CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 회원 */
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

COMMENT ON TABLE Member is '회원';
COMMENT ON COLUMN Member.m_no is '회원번호';
COMMENT ON COLUMN Member.m_id is '회원아이디';
COMMENT ON COLUMN Member.m_password is '회원비밀번호';
COMMENT ON COLUMN Member.m_name is '회원이름';
COMMENT ON COLUMN Member.m_phone is '회원전화번호';
COMMENT ON COLUMN Member.m_email is '회원이메일';
COMMENT ON COLUMN Member.m_birth is '회원생년월일';
COMMENT ON COLUMN Member.m_address is '회원주소';
COMMENT ON COLUMN Member.m_class is '회원반';
COMMENT ON COLUMN Member.m_point is '회원포인트';


/**********************************/
/* Table Name: 아이템 */
/**********************************/
CREATE TABLE Item(
		i_type                        		NUMBER(10)		 NULL ,
		i_name                        		VARCHAR2(50)		 NULL ,
		i_point                       		NUMBER(10)		 NULL ,
		i_image                       		VARCHAR2(20)		 NULL ,
		i_desc                        		VARCHAR2(1000)		 NULL 
);

COMMENT ON TABLE Item is '아이템';
COMMENT ON COLUMN Item.i_type is '아이템종류';
COMMENT ON COLUMN Item.i_name is '아이템이름';
COMMENT ON COLUMN Item.i_point is '아이템가격';
COMMENT ON COLUMN Item.i_image is '아이템이미지';
COMMENT ON COLUMN Item.i_desc is '아이템설명';


/**********************************/
/* Table Name: 좌석 정보 */
/**********************************/
CREATE TABLE Seat(
		s_no                          		NUMBER(10)		 NOT NULL,
		s_loc                         		VARCHAR2(10)		 NULL ,
		s_image                       		VARCHAR2(50)		 NULL ,
		s_capacity                    		VARCHAR2(10)		 NULL 
);

COMMENT ON TABLE Seat is '좌석 정보';
COMMENT ON COLUMN Seat.s_no is '좌석번호';
COMMENT ON COLUMN Seat.s_loc is '좌석위치';
COMMENT ON COLUMN Seat.s_image is '좌석이미지';
COMMENT ON COLUMN Seat.s_capacity is '좌석수용인원';


/**********************************/
/* Table Name: 예약 정보 */
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

COMMENT ON TABLE Reserve_info is '예약 정보';
COMMENT ON COLUMN Reserve_info.r_no is '예약 번호';
COMMENT ON COLUMN Reserve_info.enroll_time is '등록시간';
COMMENT ON COLUMN Reserve_info.modify_time is '수정시간';
COMMENT ON COLUMN Reserve_info.r_date is '예약 일자';
COMMENT ON COLUMN Reserve_info.r_s_time is '예약 시작 시간';
COMMENT ON COLUMN Reserve_info.r_e_time is '예약 끝 시간';
COMMENT ON COLUMN Reserve_info.s_no is '좌석 번호';
COMMENT ON COLUMN Reserve_info.r_m_no is '예약한 사람 번호';


/**********************************/
/* Table Name: 주문 */
/**********************************/
CREATE TABLE iOrder(
		j_no                          		NUMBER(10)		 NOT NULL,
		m_no                          		NUMBER(10)		 NULL ,
		j_date                        		DATE		 NULL ,
		j_desc                        		VARCHAR2(1000)		 NULL 
);

COMMENT ON TABLE iOrder is '주문';
COMMENT ON COLUMN iOrder.j_no is '주문번호';
COMMENT ON COLUMN iOrder.m_no is '주문자번호';
COMMENT ON COLUMN iOrder.j_date is '주문날짜';
COMMENT ON COLUMN iOrder.j_desc is '주문설명';


/**********************************/
/* Table Name: 주문상세 */
/**********************************/
CREATE TABLE iOrder_detail(
		jd_no                         		NUMBER(10)		 NOT NULL,
		i_type                        		NUMBER(10)		 NULL ,
		jd_quantity                   		NUMBER(10)		 NULL ,
		jd_tot                        		NUMBER(10)		 NULL ,
		j_no                          		NUMBER(10)		 NULL 
);

COMMENT ON TABLE iOrder_detail is '주문상세';
COMMENT ON COLUMN iOrder_detail.jd_no is '주문상세번호';
COMMENT ON COLUMN iOrder_detail.i_type is '아이템번호';
COMMENT ON COLUMN iOrder_detail.jd_quantity is '아이템수량';
COMMENT ON COLUMN iOrder_detail.jd_tot is '아이템총포인트';
COMMENT ON COLUMN iOrder_detail.j_no is '주문번호';


/**********************************/
/* Table Name: 게시판 */
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

COMMENT ON TABLE board is '게시판';
COMMENT ON COLUMN board.b_no is '게시글번호';
COMMENT ON COLUMN board.b_type is '게시판타입';
COMMENT ON COLUMN board.b_score is '게시글평점';
COMMENT ON COLUMN board.b_title is '게시글제목';
COMMENT ON COLUMN board.b_writer is '게시글쓴이';
COMMENT ON COLUMN board.b_content is '게시글내용';
COMMENT ON COLUMN board.b_date is '게시글작성일';
COMMENT ON COLUMN board.b_click is '게시글조회수';
COMMENT ON COLUMN board.b_groupno is '게시글그룹번호';
COMMENT ON COLUMN board.b_depth is '게시글깊이';
COMMENT ON COLUMN board.b_step is '게시글스텝';
COMMENT ON COLUMN board.b_image is '게시글이미지';
COMMENT ON COLUMN board.m_no is '회원번호';


/**********************************/
/* Table Name: 예약 상세 정보 */
/**********************************/
CREATE TABLE Reserve_detail(
		r_detail_no                   		NUMBER(10)		 NULL ,
		r_no                          		NUMBER(10)		 NULL ,
		m_no                          		NUMBER(10)		 NULL ,
		master                        		NUMBER(10)		 NULL 
);

COMMENT ON TABLE Reserve_detail is '예약 상세 정보';
COMMENT ON COLUMN Reserve_detail.r_detail_no is '예약 상세 번호';
COMMENT ON COLUMN Reserve_detail.r_no is '예약 번호';
COMMENT ON COLUMN Reserve_detail.m_no is '구성원 번호';
COMMENT ON COLUMN Reserve_detail.master is '팀장인지 여부';



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

