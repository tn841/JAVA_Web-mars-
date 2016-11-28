package com.itwill.guest;



public class Guest {
/*
  Name                                      Null?    Type
 -------------------------------------- -------- --------------
 GUEST_NO                               NOT NULL NUMBER(10)
 GUEST_NAME                             NOT NULL VARCHAR2(10)
 GUEST_DATE                             NOT NULL DATE
 GUEST_EMAIL                                     VARCHAR2(50)
 GUEST_HOMEPAGE                                  VARCHAR2(50)
 GUEST_TITLE                            NOT NULL VARCHAR2(100)
 GUEST_CONTENT                          NOT NULL VARCHAR2(4000) 
 */
 public int guest_no;
 public String guest_name;
 public String guest_date;
 public String guest_email;
 public String guest_homepage;
 public String guest_title;
 public String guest_content;
 public Guest() {
	// TODO Auto-generated constructor stub
 }
public Guest(int guest_no, String guest_name, String guest_date, String guest_email, String guest_homepage,
		String guest_title, String guest_content) {
	super();
	this.guest_no = guest_no;
	this.guest_name = guest_name;
	this.guest_date = guest_date;
	this.guest_email = guest_email;
	this.guest_homepage = guest_homepage;
	this.guest_title = guest_title;
	this.guest_content = guest_content;
}
 
}

















