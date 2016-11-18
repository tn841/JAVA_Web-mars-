DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE Reserve_info CASCADE CONSTRAINTS;
DROP TABLE Seat CASCADE CONSTRAINTS;
DROP TABLE Item CASCADE CONSTRAINTS;
DROP TABLE jumun_detail CASCADE CONSTRAINTS;
DROP TABLE Jumun CASCADE CONSTRAINTS;
DROP TABLE Member CASCADE CONSTRAINTS;

CREATE TABLE Member(
		member_no                     		NUMBER(10)		 NULL ,
		member_id                     		VARCHAR2(10)		 NULL ,
		member_password               		VARCHAR2(10)		 NULL ,
		member_name                   		VARCHAR2(10)		 NULL ,
		member_phone                  		NUMBER(10)		 NULL ,
		member_email                  		VARCHAR2(10)		 NULL ,
		member_birth                  		DATE		 NULL ,
		member_address                		VARCHAR2(10)		 NULL ,
		member_class                  		VARCHAR2(10)		 NULL ,
		member_point                  		VARCHAR2(10)		 NULL ,
		jumun_detail_no               		NUMBER(10)		 NULL 
);


CREATE TABLE Jumun(
		Jumun_no                      		NUMBER(10)		 NULL ,
		member_no                     		NUMBER(10)		 NULL ,
		Jumun_date                    		DATE		 NULL ,
		Jumun_tot                     		NUMBER(10)		 NULL ,
		Jumun_desc                    		VARCHAR2(100)		 NULL 
);


CREATE TABLE jumun_detail(
		jumun_detail_no               		NUMBER(10)		 NULL ,
		item_no                       		NUMBER(10)		 NULL ,
		jumun_detail_quantity         		NUMBER(10)		 NULL ,
		member_no                     		NUMBER(10)		 NULL ,
		jumun_detail_tot              		NUMBER(10)		 NULL ,
		Jumun_no                      		NUMBER(10)		 NULL 
);


CREATE TABLE Item(
		item_no                       		NUMBER(10)		 NULL ,
		item_name                     		VARCHAR2(10)		 NULL ,
		item_point                    		NUMBER(10)		 NULL ,
		item_image                    		VARCHAR2(10)		 NULL ,
		item_desc                     		VARCHAR2(100)		 NULL ,
		item_type                     		VARCHAR2(10)		 NULL ,
		jumun_detail_no               		NUMBER(10)		 NULL 
);


CREATE TABLE Seat(
		seat_no                       		NUMBER(10)		 NULL ,
		seat_loc                      		VARCHAR2(10)		 NULL ,
		seat_image                    		VARCHAR2(20)		 NULL ,
		seat_capacity                 		VARCHAR2(10)		 NULL 
);


CREATE TABLE Reserve_info(
		reserve_no                    		NUMBER(10)		 NULL ,
		reserve_date                  		DATE		 NULL ,
		reserve_time                  		DATE		 NULL ,
		reserve_name                  		VARCHAR2(10)		 NULL ,
		reserve_capacity              		NUMBER(10)		 NULL ,
		reserver_tblno                		NUMBER(10)		 NULL ,
		member_no                     		NUMBER(10)		 NULL 
);


CREATE TABLE board(
		board_type                    		NUMBER(10)		 NULL ,
		board_no                      		NUMBER(10)		 NULL ,
		board_title                   		VARCHAR2(10)		 NULL ,
		board_writer                  		VARCHAR2(10)		 NULL ,
		board_content                 		VARCHAR2(200)		 NULL ,
		board_date                    		DATE		 DEFAULT sysdate		 NULL ,
		board_click                   		NUMBER(10)		 NULL ,
		board_groupno                 		NUMBER(10)		 NULL ,
		board_depth                   		NUMBER(10)		 NULL ,
		board_step                    		NUMBER(10)		 NULL ,
		board_image                   		VARCHAR2(20)		 NULL 
);



ALTER TABLE Member ADD CONSTRAINT IDX_Member_PK PRIMARY KEY (member_no);

ALTER TABLE Jumun ADD CONSTRAINT IDX_Jumun_PK PRIMARY KEY (Jumun_no);
ALTER TABLE Jumun ADD CONSTRAINT IDX_Jumun_FK0 FOREIGN KEY (member_no) REFERENCES Member (member_no);

ALTER TABLE jumun_detail ADD CONSTRAINT IDX_jumun_detail_PK PRIMARY KEY (jumun_detail_no);
ALTER TABLE jumun_detail ADD CONSTRAINT IDX_jumun_detail_FK0 FOREIGN KEY (Jumun_no) REFERENCES Jumun (Jumun_no);

ALTER TABLE Item ADD CONSTRAINT IDX_Item_PK PRIMARY KEY (item_no);
ALTER TABLE Item ADD CONSTRAINT IDX_Item_FK0 FOREIGN KEY (jumun_detail_no) REFERENCES jumun_detail (jumun_detail_no);

ALTER TABLE Seat ADD CONSTRAINT IDX_Seat_PK PRIMARY KEY (seat_no);

ALTER TABLE Reserve_info ADD CONSTRAINT IDX_Reserve_info_PK PRIMARY KEY (reserve_no);
ALTER TABLE Reserve_info ADD CONSTRAINT IDX_Reserve_info_FK0 FOREIGN KEY (reserver_tblno) REFERENCES Seat (seat_no);
ALTER TABLE Reserve_info ADD CONSTRAINT IDX_Reserve_info_FK1 FOREIGN KEY (member_no) REFERENCES Member (member_no);

ALTER TABLE board ADD CONSTRAINT IDX_board_PK PRIMARY KEY (board_no);