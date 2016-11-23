package com.itwill.item;

import java.util.ArrayList;

public class ListNowGroup {
	private ArrayList<Item> itemList;		// 리스트 데이터 콜렉션
	private int startPageNo;				// 시작페이지번호
	private int endPageNo;					// 끝페이지번호
	private int selectPageNo;				// 선택페이지번호
	private int totalRecordCount;			// 전체 행수
	private int totalPageCount;				// 전체 페이지수
	private int preGroupStartPage;			// 이전그룹의 시작페이지
	private int nextGroupStartPage;			// 다음그릅의 시작페이지
	private boolean showPrevious;			// 이전페이지 보이기 여부
	private boolean showNext;				// 다음페이지 보이기 여부
	private boolean showPreGroup;			// 이전그룹 보이기 여부
	private boolean showNextGroup;			// 다음그룹 보이기 여부
	private boolean showFirst;				// 처음으로 보이기 여부
	private boolean showLast;				// 마지막으로 보이기 여부
	
	// DB 성능 향상을 위한 변수
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
