package com.itwill.board;

import java.sql.Date;
import java.util.ArrayList;

public class Board {
	
	private int b_no;
	private String b_title;
	private String b_writer;
	private String b_content;
	private Date b_date;
	private int b_click;
	
	
	//글의 논리적인 순서번호를 관리하기 위한 필드 (3개)
	private int b_groupno;
	
	public Board() {
		
	}
	
	public Board(int b_no, String b_title, String b_writer, String b_content, Date b_date, int b_click, int b_groupno,
			int b_step, int b_depth, String b_score) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_writer = b_writer;
		this.b_content = b_content;
		this.b_date = b_date;
		this.b_click = b_click;
		this.b_groupno = b_groupno;
		this.b_step = b_step;
		this.b_depth = b_depth;
		this.b_score = b_score;
	}
	
	private int b_step;
	private int b_depth;
	//평점 위한 변수
	private String b_score;
	
	
	public String getB_score() {
		return b_score;
	}
	public void setB_score(String b_score) {
		this.b_score = b_score;
	}
	public int getBoardNo() {
		return b_no;
	}
	public void setBoardNo(int boardNo) {
		this.b_no = boardNo;
	}
	public String getTitle() {
		return b_title;
	}
	public void setTitle(String title) {
		this.b_title = title;
	}
	public String getWriter() {
		return b_writer;
	}
	public void setWriter(String writer) {
		this.b_writer = writer;
	}
	public String getContent() {
		return b_content;
	}
	public void setContent(String content) {
		this.b_content = content;
	}
	public Date getRegDate() {
		return b_date;
	}
	public void setRegDate(Date regDate) {
		this.b_date = regDate;
	}
	public int getReadCount() {
		return b_click;
	}
	public void setReadCount(int readCount) {
		this.b_click = readCount;
	}

	public int getGroupNo() {
		return b_groupno;
	}
	public void setGroupNo(int groupNo) {
		this.b_groupno = groupNo;
	}
	public int getStep() {
		return b_step;
	}
	public void setStep(int step) {
		this.b_step = step;
	}
	public int getDepth() {
		return b_depth;
	}
	public void setDepth(int depth) {
		this.b_depth = depth;
	}
	
}
