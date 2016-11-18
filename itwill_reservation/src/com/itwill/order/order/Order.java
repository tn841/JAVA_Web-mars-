package com.itwill.order.order;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;

import com.itwill.order.order_detail.OrderDetail;

public class Order {
	private int j_no;
	private int m_no;
	private Date j_date;
	private int j_tot;
	private int j_quantity;
	private String j_desc;
	private HashMap<Integer,OrderDetail> odMap;
	
	public Order(int j_no, int m_no, Date j_date, String j_desc, HashMap<Integer,OrderDetail> odMap) {
		super();
		int tot=0;
		int quantity=0;
		Collection<OrderDetail> odCol = odMap.values();
		for (OrderDetail orderDetail : odCol) {
			quantity=quantity+orderDetail.getJd_quantity();
			tot=tot+orderDetail.getJd_tot();
		}
		this.j_no = j_no;
		this.m_no = m_no;
		this.j_date = j_date;
		this.j_tot = tot;
		this.j_quantity = quantity;
		this.j_desc = j_desc;
		this.odMap = odMap;
	}

	public HashMap<Integer, OrderDetail> getOdMap() {
		return odMap;
	}

	public void setOdMap(HashMap<Integer, OrderDetail> odMap) {
		this.odMap = odMap;
	}

	public int getJ_quantity() {
		return j_quantity;
	}

	public void setJ_quantity(int j_quantity) {
		this.j_quantity = j_quantity;
	}

	public int getJ_no() {
		return j_no;
	}

	public void setJ_no(int j_no) {
		this.j_no = j_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public Date getJ_date() {
		return j_date;
	}

	public void setJ_date(Date j_date) {
		this.j_date = j_date;
	}

	public int getJ_tot() {
		return j_tot;
	}

	public void setJ_tot(int j_tot) {
		this.j_tot = j_tot;
	}

	public String getJ_desc() {
		return j_desc;
	}

	public void setJ_desc(String j_desc) {
		this.j_desc = j_desc;
	}

}
