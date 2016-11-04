package com.itwill.guest;

public class GuestSQL {
	public static final String SELECT_ALL = "select * from guest order by guest_no desc";
	public static final String SELECT_BY_NO = "select * from guest where guest_no = ?";
	public static final String INSERT = "insert into GUEST values(guest_no_seq.nextval , ?, sysdate, ?, ?, ?, ?)";
	public static final String UPDATE = "update guest set GUEST_NAME=?, GUEST_email=?, GUEST_homepage=?, GUEST_title=?, GUEST_content=? where guest_no=?";

}
