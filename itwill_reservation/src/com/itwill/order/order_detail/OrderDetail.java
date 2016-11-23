package com.itwill.order.order_detail;

public class OrderDetail {
	private int jd_no;
	private int i_type;
	private int jd_quantity;
	private int jd_tot;
	private int j_no;
	
	public OrderDetail(int jd_no, int i_type, int jd_quantity, int jd_tot, int j_no) {
		super();
		this.jd_no = jd_no;
		this.i_type = i_type;
		this.jd_quantity = jd_quantity;
		this.jd_tot = jd_tot;
		this.j_no = j_no;
	}

	public int getJd_no() {
		return jd_no;
	}

	public void setJd_no(int jd_no) {
		this.jd_no = jd_no;
	}

	public int getI_type() {
		return i_type;
	}

	public void setI_type(int i_no) {
		this.i_type = i_type;
	}

	public int getJd_quantity() {
		return jd_quantity;
	}

	public void setJd_quantity(int jd_quantity) {
		this.jd_quantity = jd_quantity;
	}

	public int getJd_tot() {
		return jd_tot;
	}

	public void setJd_tot(int jd_tot) {
		this.jd_tot = jd_tot;
	}

	public int getJ_no() {
		return j_no;
	}

	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}
	
	
	
}
