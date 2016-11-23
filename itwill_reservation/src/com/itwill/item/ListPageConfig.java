package com.itwill.item;

public class ListPageConfig {
	private int rowCountPerPage;  // 테이블(리스트)당 출력행수
	private int pageCountPerPage; // 한페이지에 보여지는 페이지 수
	private String selectPage;    // 선택한 현재 페이지 번호
	
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
