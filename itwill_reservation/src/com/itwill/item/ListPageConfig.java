package com.itwill.item;

public class ListPageConfig {
	private int rowCountPerPage;  // ���̺�(����Ʈ)�� ������
	private int pageCountPerPage; // ���������� �������� ������ ��
	private String selectPage;    // ������ ���� ������ ��ȣ
	
	public ListPageConfig() {
		// TODO Auto-generated constructor stub
	}
	
	public ListPageConfig(int rowCountPerPage, int pageCountPerPage, String selectPage) {
		super();
		this.rowCountPerPage = rowCountPerPage;
		this.pageCountPerPage = pageCountPerPage;
		this.selectPage = selectPage;
	}

	//getter setter
	public int getRowCountPerPage() {
		return rowCountPerPage;
	}
	public void setRowCountPerPage(int rowCountPerPage) {
		this.rowCountPerPage = rowCountPerPage;
	}
	public int getPageCountPerPage() {
		return pageCountPerPage;
	}
	public void setPageCountPerPage(int pageCountPerPage) {
		this.pageCountPerPage = pageCountPerPage;
	}
	public String getSelectPage() {
		return selectPage;
	}
	public void setSelectPage(String selectPage) {
		this.selectPage = selectPage;
	}
	
	
}
