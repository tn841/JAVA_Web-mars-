package com.itwill.item;

public class Item {
	private int i_type;			 // ������ �� Ÿ��
	private String i_name;		 // �������̸�
	private int i_point;		 // ������ �䱸 ����Ʈ
	private String i_image;		 // ������ �̹��� ���
	private String i_desc;		 // ������ �󼼼���
	private int hits;            // ������ īƮor���Ž� ����
	
	
	public void setHits(int hits) {
		this.hits = hits;
	}

	public Item() {
		
	}

	public Item(int i_type, String i_name, int i_point, String i_image, String i_desc) {
		super();
		this.i_type = i_type;
		this.i_name = i_name;
		this.i_point = i_point;
		this.i_image = i_image;
		this.i_desc = i_desc;
	}

	public Item(int i_type, String i_name, int i_point, String i_image, String i_desc, int hits) {
		super();
		this.i_type = i_type;
		this.i_name = i_name;
		this.i_point = i_point;
		this.i_image = i_image;
		this.i_desc = i_desc;
		this.hits = hits;
	}

	//getter setter

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public int getI_point() {
		return i_point;
	}

	public void setI_point(int i_point) {
		this.i_point = i_point;
	}

	public String getI_image() {
		return i_image;
	}

	public void setI_image(String i_image) {
		this.i_image = i_image;
	}

	public String getI_desc() {
		return i_desc;
	}

	public void setI_desc(String i_desc) {
		this.i_desc = i_desc;
	}

	public int getI_type() {
		return i_type;
	}

	public void setI_type(int i_type) {
		this.i_type = i_type;
	}
	public int getHits() {
		return hits;
	}

}
