package com.itwill.el;

public class Car {
	private String model;
	private String company;
	private int cc;
	
	
	public Car(String model, String company, int cc) {
		super();
		this.model = model;
		this.company = company;
		this.cc = cc;
	}
	public Car() {
		super();
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getCc() {
		return cc;
	}
	public void setCc(int cc) {
		this.cc = cc;
	}
	
}
