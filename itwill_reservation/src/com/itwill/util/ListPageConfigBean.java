package com.itwill.util;

// ����Ʈ ������ ���� ����� ������ ���� DTO(VO)
public class ListPageConfigBean{
	
	private int rowCountPerPage;   // ���̺�(����Ʈ)�� ��� ���
	private int pageCountPerPage;  // ���������� �������� ������ ��
	private String selectPage;     // ������ ���� ������ ��ȣ
	private String searchType;     // ����� ���� �˻�Ÿ��
	private String searchContent;  // ����� �Է� �˻�����
	public ListPageConfigBean() {}
	public ListPageConfigBean(	int rowCountPerPage, 
								int pageCountPerPage,
								String selectPage,
								String searchType,
								String searchContent) {
		this.rowCountPerPage = rowCountPerPage;
		this.pageCountPerPage = pageCountPerPage;
		this.selectPage = selectPage;
		this.searchType = searchType;
		this.searchContent = searchContent;
	}
	
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
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSelectPage() {
		return selectPage;
	}
	public void setSelectPage(String selectPage) {
		this.selectPage = selectPage;
	}
			
}