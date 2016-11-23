package com.itwill.reservation;

import java.util.ArrayList;

import com.itwill.user.Member;

public class Reservation {
	private int r_no;
	private String r_date;
	private String enroll_time;
	private String modify_time;
	private String start_time;
	private String end_time;
	private int s_no;
	private int r_m_no;
	private ArrayList<Member> memberList;
	
	public Reservation(String r_date, String start_time, String end_time, int s_no, int r_m_no,	ArrayList<Member> memberList) {
		super();
		this.r_date = r_date;
		this.start_time = start_time;
		this.end_time = end_time;
		this.s_no = s_no;
		this.r_m_no = r_m_no;
		this.memberList = memberList;
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
	public String getEnroll_time() {
		return enroll_time;
	}
	public void setEnroll_time(String enroll_time) {
		this.enroll_time = enroll_time;
	}
	public String getModify_time() {
		return modify_time;
	}
	public void setModify_time(String modify_time) {
		this.modify_time = modify_time;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
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
