package com.itwill.el;

public class Member {
	private int no;
	private String name;
	private Car car;
	private boolean isMarried;
	
	
	
	public Member(int no, String name, Car car, boolean isMarried) {
		super();
		this.no = no;
		this.name = name;
		this.car = car;
		this.isMarried = isMarried;
	}
	public Member() {
		super();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	public boolean isMarried() {
		return isMarried;
	}
	public void setMarried(boolean isMarried) {
		this.isMarried = isMarried;
	}
	
	
	
}
