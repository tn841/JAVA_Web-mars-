package com.itwill.item;

import java.util.ArrayList;

public class ListNowGroup {
	private ArrayList<Item> itemList;		// ����Ʈ ������ �ݷ���
	private int startPageNo;				// ������������ȣ
	private int endPageNo;					// ����������ȣ
	private int selectPageNo;				// ������������ȣ
	private int totalRecordCount;			// ��ü ���
	private int totalPageCount;				// ��ü ��������
	private int preGroupStartPage;			// �����׷��� ����������
	private int nextGroupStartPage;			// �����׸��� ����������
	private boolean showPrevious;			// ���������� ���̱� ����
	private boolean showNext;				// ���������� ���̱� ����
	private boolean showPreGroup;			// �����׷� ���̱� ����
	private boolean showNextGroup;			// �����׷� ���̱� ����
	private boolean showFirst;				// ó������ ���̱� ����
	private boolean showLast;				// ���������� ���̱� ����
	
	// DB ���� ����� ���� ����
	private int startRowNum;
	private int endRowNum;

	public ListNowGroup() {
		
	}

	public ListNowGroup(ArrayList<Item> itemList, int startPageNo, int endPageNo, int selectPageNo,
			int totalRecordCount, int totalPageCount, int preGroupStartPage, int nextGroupStartPage,
			boolean showPrevious, boolean showNext, boolean showPreGroup, boolean showNextGroup, boolean showFirst,
			boolean showLast, int startRowNum, int endRowNum) {
		super();
		this.itemList = itemList;
		this.startPageNo = startPageNo;
		this.endPageNo = endPageNo;
		this.selectPageNo = selectPageNo;
		this.totalRecordCount = totalRecordCount;
		this.totalPageCount = totalPageCount;
		this.preGroupStartPage = preGroupStartPage;
		this.nextGroupStartPage = nextGroupStartPage;
		this.showPrevious = showPrevious;
		this.showNext = showNext;
		this.showPreGroup = showPreGroup;
		this.showNextGroup = showNextGroup;
		this.showFirst = showFirst;
		this.showLast = showLast;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}



	//setter getter
	public ArrayList<Item> getItemList() {
		return itemList;
	}

	public void setItemList(ArrayList<Item> itemList) {
		this.itemList = itemList;
	}
	public int getStartPageNo() {
		return startPageNo;
	}

	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}

	public int getEndPageNo() {
		return endPageNo;
	}

	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}

	public int getSelectPageNo() {
		return selectPageNo;
	}

	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getPreGroupStartPage() {
		return preGroupStartPage;
	}

	public void setPreGroupStartPage(int preGroupStartPage) {
		this.preGroupStartPage = preGroupStartPage;
	}

	public int getNextGroupStartPage() {
		return nextGroupStartPage;
	}

	public void setNextGroupStartPage(int nextGroupStartPage) {
		this.nextGroupStartPage = nextGroupStartPage;
	}

	public boolean isShowPrevious() {
		return showPrevious;
	}

	public void setShowPrevious(boolean showPrevious) {
		this.showPrevious = showPrevious;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}

	public boolean isShowPreGroup() {
		return showPreGroup;
	}

	public void setShowPreGroup(boolean shwoPreGroup) {
		this.showPreGroup = shwoPreGroup;
	}

	public boolean isShowNextGroup() {
		return showNextGroup;
	}

	public void setShowNextGroup(boolean showNextGroup) {
		this.showNextGroup = showNextGroup;
	}

	public boolean isShowFirst() {
		return showFirst;
	}

	public void setShowFirst(boolean showFirst) {
		this.showFirst = showFirst;
	}

	public boolean isShowLast() {
		return showLast;
	}

	public void setShowLast(boolean showLast) {
		this.showLast = showLast;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	
}
