package com.itwill.seat;

public class Seat {
	private int s_no; 			// 테이블 번호
	private String s_loc; 		// 테이블 위치 (층)
	private String s_image; 	// 이미지 경로
	private String s_capacity;  // 한 테이블당 자리 갯수
	public Seat() {
		
	}
	
	public Seat(int s_no, String s_loc, String s_image, String s_capacity) {
		super();
		this.s_no = s_no;
		this.s_loc = s_loc;
		this.s_image = s_image;
		this.s_capacity = s_capacity;
	}

	// setter getter
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getS_loc() {
		return s_loc;
	}
	public void setS_loc(String s_loc) {
		this.s_loc = s_loc;
	}
	public String getS_image() {
		return s_image;
	}
	public void setS_image(String s_image) {
		this.s_image = s_image;
	}
	public String getS_capacity() {
		return s_capacity;
	}
	public void setS_capacity(String s_capacity) {
		this.s_capacity = s_capacity;
	}
	
	
}
