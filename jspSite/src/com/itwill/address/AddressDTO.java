package com.itwill.address;
/*
 * DTO(Data Transfer Object),VO(Value Object),Domain객체
    - 주소 1개의데이타를 가지고있는 객체
    - address table의 한개의 row를 mapping할수있는 객체
     
 */

public class AddressDTO {
/*
		이름      널        유형           
		------- -------- ------------ 
		NO      NOT NULL NUMBER(4)    
		ID               VARCHAR2(6)  
		NAME             VARCHAR2(20) 
		PHONE            VARCHAR2(15) 
		ADDRESS          VARCHAR2(60) 
 */
	private int no;
	private String id;
	private String name;
	private String phone;
	private String address;
	public AddressDTO() {
	}
	public AddressDTO(int no, String id, String name, String phone, String address) {
		super();
		this.no = no;
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.address = address;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return no+"\t"+id+"\t"+name+"\t"+phone+"\t"+address;
	}
	
	
	
	
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
	
	
}
