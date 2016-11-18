package com.itwill.reservation;

import java.util.ArrayList;

import com.itwill.user.Member;

public class Reservation {
	private int r_no;
	private String r_date;
	private String r_time;
	private int s_no;
	private int r_m_no;
	private ArrayList<Member> memberList;
	

	public Reservation() {
		super();
	}


	public Reservation(int s_no, int r_m_no) {
		super();
		this.s_no = s_no;
		this.r_m_no = r_m_no;
	}
	
	public Reservation(int s_no, int r_m_no, ArrayList<Member> mList){
		this.s_no = s_no;
		this.r_m_no = r_m_no;
		this.memberList = mList;
	}
	
	
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public String getR_time() {
		return r_time;
	}
	public void setR_time(String r_time) {
		this.r_time = r_time;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getR_m_no() {
		return r_m_no;
	}
	public void setR_m_no(int r_m_no) {
		this.r_m_no = r_m_no;
	}

	public ArrayList<Member> getMemberList() {
		return memberList;
	}
	public void setMemberList(ArrayList<Member> memberList) {
		this.memberList = memberList;
	}

	
	

}
