package com.itwill.user;



/*
 * 사용자관리를 위하여 필요한 도메인클래스(VO,DTO)
 * Member 테이블의 각컬럼에해당하는 멤버를 가지고있다
 */

public class Member {
	/*
	 * =================================== 
	 * 이름 		널? 		유형
	 * =================================== 
	 * m_no 		NOT NULL 	NUMBER(10) 
	 * m_id 		NULL 		VARCHAR2(20) 
	 * m_password	NULL	 	VARCHAR2(20)
	 * m_name 		NULL 		VARCHAR2(20) 
	 * m_phone 		NULL 		VARCHAR2(20) 
	 * m_email 		NULL 		VARCHAR2(30) 
	 * m_birth 		NULL 		String 
	 * m_address 	NULL	 	VARCHAR2(100)
	 * m_class      NULL   		VARCHAR2(10)
	 * m_point      NULL       	NUMBER(20)
	 * ===================================
	 */
	private int    m_no;
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_phone;
	private String m_email;
	private String m_birth;
	private String m_address;
	private String m_class; 
	private int m_point;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(int m_no, String m_id, String m_password, String m_name, String m_phone, String m_email, String m_birth, String m_address, String m_class, int m_point) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_birth = m_birth;
		this.m_address = m_address;
		this.m_class = m_class;
		this.m_point = m_point;
	}
	
	public Member(int m_no, String m_id, String m_password, String m_name, String m_phone, String m_email, String m_birth, String m_address, String m_class) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_birth = m_birth;
		this.m_address = m_address;
		this.m_class = m_class;
	}

	
	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_birth() {
		return m_birth;
	}

	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public String getM_class() {
		return m_class;
	}

	public void setM_class(String m_class) {
		this.m_class = m_class;
	}

	public int getM_point() {
		return m_point;
	}

	public void setM_point(int m_point) {
		this.m_point = m_point;
	}

	/*
	 *패스워드 일치여부 검사 
	 */
	public boolean isMatchPassword(String password){
		boolean isMatch = false;
		if(this.m_password.equals(password)){
			isMatch = true;
		}
		return isMatch;
	}
	
	
	

}


