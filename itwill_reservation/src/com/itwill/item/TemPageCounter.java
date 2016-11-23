package com.itwill.item;

//페이징 처리에 필요한 정보 계산 유틸 클래스
public class TemPageCounter {
	public static ListNowGroup getPageInfo( int selectPage,
											int rowCountPerPage,
											int pageCountPerPage,	
											int totalRecordCount){
		ListNowGroup currGroup = new ListNowGroup();
		int totalPageCount 		= 1;	// 전체페이지수
		int startPageNo 		= 1;	// 시작페이지 번호
		int endPageNo 			= 1;	// 한 화면(그룹)에서 끝페이지
		int selectPageNo 		= 1;	// 선택된 페이지 번호
		int preGroupStartPage 	= 1;	// 이전 그룹의 시작페이지
		int nextGroupStartPage 	= 1;	// 다음 그룹의 시작페이지
		int groupNo 			= 0;	// 페이지별 그룹넘버
		
		// DB Query 성능향상을 위해
		int startRow = 0;
		int endRow	 = 0;
		
		/************* DB 레코드수에 따른 계산 ***************/
		// 1. 전체 페이지수 계산
		int modula = 0;
		if (totalRecordCount > 1){ //1개 이상의 레코드가 존재하면...
			modula = (totalRecordCount) % rowCountPerPage;
			if(modula != 0){//나머지가 2,3,4,5,.....9이면
				modula = 1;
			}else{ //나머지가 0이면(딱 떨어지면)
				modula = 0;
			}
			totalPageCount = (totalRecordCount) / rowCountPerPage + modula;
		}else{
			totalPageCount = 1;
		}
		
		// 사용자가 페이지번호를 선택할 때마다 각각의 결과값 다르다.
		// 2. 한 화면(그룹)에서 보여지는 그룹넘버,
		selectPageNo = selectPage;
		/*
		 * 요청페이지번호가 전체페이지보다 큰경우
		 */
		if (selectPageNo > totalPageCount){
			selectPageNo = totalPageCount;
		}
		//if(selectPageNo < 0) selectPageNo=1;
		groupNo = (selectPageNo-1)/pageCountPerPage;
		// 만일 pageCountPerPage 를 5 으로 설정하였을 경우
				/*  
				      1  2  3  4   5 ▶ --> 0
			 	  ◀  6  7  8  9  10 ▶ --> 1
				  ◀ 11 12 13 14  15 ▶ --> 2
				 */
		// 3.한 화면(그룹) 에서 시작페이지와 끝페이지
		startPageNo = groupNo*pageCountPerPage + 1;
		endPageNo	= groupNo*pageCountPerPage + pageCountPerPage;
		// 4.이전 화면그룹의 시작페이지와 다음그룹의 시작페이지
		preGroupStartPage = (groupNo-1)*pageCountPerPage + 1;
		if(preGroupStartPage < 0){
			preGroupStartPage = 1;
		}
		nextGroupStartPage = (groupNo+1)*pageCountPerPage + 1;
		
		if (startPageNo > totalPageCount)   startPageNo = startPageNo - pageCountPerPage + 1;
		if (endPageNo > totalPageCount)     endPageNo = totalPageCount;
		// 5. 보여줘여할 게시물 테이블 데이타의 시작번호,끝번호
		if(selectPageNo == 1 && selectPageNo == totalPageCount){
			startRow = 1;
			endRow	 =totalRecordCount;
		}else if (selectPageNo < totalPageCount){
			startRow=rowCountPerPage*selectPageNo-rowCountPerPage + 1;
			endRow = rowCountPerPage*selectPageNo-rowCountPerPage + rowCountPerPage;
		}else if (selectPageNo == totalPageCount) {// 끝페이지인경우..
			startRow=rowCountPerPage * selectPageNo - rowCountPerPage + 1;
			endRow = totalRecordCount;
		}
		
		// 페이징처리에 필요한 정보를 ListResultBean에 세팅
		System.out.println("스타트페이지 넘버 확인:"+startPageNo);
		currGroup.setStartPageNo(startPageNo);
		currGroup.setEndPageNo(endPageNo);
		currGroup.setSelectPageNo(selectPageNo);
		currGroup.setTotalRecordCount(totalRecordCount);
		currGroup.setTotalPageCount(totalPageCount);
		currGroup.setPreGroupStartPage(preGroupStartPage);
		currGroup.setNextGroupStartPage(nextGroupStartPage);
		currGroup.setStartRowNum(startRow);
		currGroup.setEndRowNum(endRow);
		currGroup.setShowPreGroup(isShowPreviousIcon(groupNo));
		currGroup.setShowNextGroup(isShowNextIcon(endPageNo, totalPageCount));
		currGroup.setShowFirst(isShowFirstIcon(groupNo));
		currGroup.setShowLast(isShowLastIcon(endPageNo, totalPageCount));
		
		System.out.println("***************페이지정보***************");
		System.out.println("01.selectPage:\t\t\t"+currGroup.getSelectPageNo());
		System.out.println("02.rowCountPerPage:\t\t"+rowCountPerPage);
		System.out.println("03.pageCountPerPage:\t\t"+pageCountPerPage);
		System.out.println("02.totalRecordCount:\t\t"+currGroup.getTotalRecordCount());
		System.out.println("03.totalPageCount:\t\t"+currGroup.getTotalPageCount());
		System.out.println("04.pagegroupNo:\t\t\t"+groupNo);
		System.out.println("05.startPageNo:\t\t\t"+currGroup.getStartPageNo());
		System.out.println("06.endPageNo:\t\t\t"+currGroup.getEndPageNo());
		System.out.println("07.startRowNum:\t\t\t"+currGroup.getStartRowNum());
		System.out.println("08.endRowNum:\t\t\t"+currGroup.getEndRowNum());
		System.out.println("09.previousGroupStartPageNo:\t"+currGroup.getPreGroupStartPage());
		System.out.println("10.nextGroupStartPageNo:\t"+currGroup.getNextGroupStartPage());
		System.out.println("11.isShowPreviousGroup:\t\t"+currGroup.isShowPreGroup());
		System.out.println("12.isShowNextGroup:\t\t"+currGroup.isShowNextGroup()); 		
		System.out.println("13.isShowFirst:\t\t\t"+currGroup.isShowFirst());
		System.out.println("14.isShowLast:\t\t\t"+currGroup.isShowLast()); 		
		System.out.println("**************************************");
		
		return currGroup;
	}
			//ListNowGroup currGroup=new ListNowGroup();
			// 페이지에 [이전 그룹] 출력여부를 판단하는 메소드
			public static boolean isShowPreviousIcon(int groupNo){
				ListNowGroup currGroup=new ListNowGroup();
				boolean isShow = false;
				if(groupNo > 0)  isShow=true;
				return isShow;
			}
			// 페이지에 [다음 그룹] 출력여부를 판단하는 메소드
			public static boolean isShowNextIcon(int endPageNo,int totalPageCount){
				boolean isShow = false;
				if(endPageNo < totalPageCount )  isShow=true;
				return isShow;
			}
			// 페이지에 [처음으로] 아이콘 출력여부를 판단하는 메소드
			public static boolean isShowFirstIcon(int groupNo){
				boolean isShow = false;
				if(groupNo > 0) isShow = true;
				return isShow;
			}
			// 페이지에 [마지막으로] 아이콘 출력여부를 판단하는 메소드
			public static boolean isShowLastIcon(int endPageNo,int totalPageCount){
				boolean isShow = false;
				if(endPageNo < totalPageCount) isShow = true;
				return isShow;
			}
	
		//테스트 메인
		public static void main(String[] args) {
			  int selectPage =1;
			  int rowCountPerPage=3;
			  int pageCountPerPage=3;
			  int totalRecordCount=10;
			  ListNowGroup currGroup = TemPageCounter.getPageInfo(selectPage,rowCountPerPage,pageCountPerPage,totalRecordCount);
			  System.out.println("***************페이지정보***************");
				System.out.println("01.selectPage:\t\t\t"+currGroup.getSelectPageNo());
				System.out.println("02.rowCountPerPage:\t\t"+rowCountPerPage);
				System.out.println("03.pageCountPerPage:\t\t"+pageCountPerPage);
				System.out.println("02.totalRecordCount:\t\t"+currGroup.getTotalRecordCount());
				System.out.println("03.totalPageCount:\t\t"+currGroup.getTotalPageCount());
				System.out.println("04.pagegroupNo:\t\t\t"+(currGroup.getTotalPageCount()/pageCountPerPage==0?currGroup.getTotalPageCount()/pageCountPerPage-1 :currGroup.getTotalPageCount()/pageCountPerPage));
				System.out.println("05.startPageNo:\t\t\t"+currGroup.getStartPageNo());
				System.out.println("06.endPageNo:\t\t\t"+currGroup.getEndPageNo());
				System.out.println("07.startRowNum:\t\t\t"+currGroup.getStartRowNum());
				System.out.println("08.endRowNum:\t\t\t"+currGroup.getEndRowNum());
				System.out.println("09.previousGroupStartPageNo:\t"+currGroup.getPreGroupStartPage());
				System.out.println("10.nextGroupStartPageNo:\t"+currGroup.getNextGroupStartPage());
				System.out.println("11.isShowPreviousGroup:\t\t"+currGroup.isShowPreGroup());
				System.out.println("12.isShowNextGroup:\t\t"+currGroup.isShowNextGroup()); 		
				System.out.println("13.isShowFirst:\t\t\t"+currGroup.isShowFirst());
				System.out.println("14.isShowLast:\t\t\t"+currGroup.isShowLast()); 		
				System.out.println("15.isShowLast:\t\t\t"+TemPageCounter.isShowLastIcon(3, 10)); 		
				System.out.println("**************************************");
		}
			
			
			
			
			
			
			
			
}
