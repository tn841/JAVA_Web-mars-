package com.itwill.item;

//����¡ ó���� �ʿ��� ���� ��� ��ƿ Ŭ����
public class TemPageCounter {
	public static ListNowGroup getPageInfo( int selectPage,
											int rowCountPerPage,
											int pageCountPerPage,	
											int totalRecordCount){
		ListNowGroup currGroup = new ListNowGroup();
		int totalPageCount 		= 1;	// ��ü��������
		int startPageNo 		= 1;	// ���������� ��ȣ
		int endPageNo 			= 1;	// �� ȭ��(�׷�)���� ��������
		int selectPageNo 		= 1;	// ���õ� ������ ��ȣ
		int preGroupStartPage 	= 1;	// ���� �׷��� ����������
		int nextGroupStartPage 	= 1;	// ���� �׷��� ����������
		int groupNo 			= 0;	// �������� �׷�ѹ�
		
		// DB Query ��������� ����
		int startRow = 0;
		int endRow	 = 0;
		
		/************* DB ���ڵ���� ���� ��� ***************/
		// 1. ��ü �������� ���
		int modula = 0;
		if (totalRecordCount > 1){ //1�� �̻��� ���ڵ尡 �����ϸ�...
			modula = (totalRecordCount) % rowCountPerPage;
			if(modula != 0){//�������� 2,3,4,5,.....9�̸�
				modula = 1;
			}else{ //�������� 0�̸�(�� ��������)
				modula = 0;
			}
			totalPageCount = (totalRecordCount) / rowCountPerPage + modula;
		}else{
			totalPageCount = 1;
		}
		
		// ����ڰ� ��������ȣ�� ������ ������ ������ ����� �ٸ���.
		// 2. �� ȭ��(�׷�)���� �������� �׷�ѹ�,
		selectPageNo = selectPage;
		/*
		 * ��û��������ȣ�� ��ü���������� ū���
		 */
		if (selectPageNo > totalPageCount){
			selectPageNo = totalPageCount;
		}
		//if(selectPageNo < 0) selectPageNo=1;
		groupNo = (selectPageNo-1)/pageCountPerPage;
		// ���� pageCountPerPage �� 5 ���� �����Ͽ��� ���
				/*  
				      1  2  3  4   5 �� --> 0
			 	  ��  6  7  8  9  10 �� --> 1
				  �� 11 12 13 14  15 �� --> 2
				 */
		// 3.�� ȭ��(�׷�) ���� ������������ ��������
		startPageNo = groupNo*pageCountPerPage + 1;
		endPageNo	= groupNo*pageCountPerPage + pageCountPerPage;
		// 4.���� ȭ��׷��� ������������ �����׷��� ����������
		preGroupStartPage = (groupNo-1)*pageCountPerPage + 1;
		if(preGroupStartPage < 0){
			preGroupStartPage = 1;
		}
		nextGroupStartPage = (groupNo+1)*pageCountPerPage + 1;
		
		if (startPageNo > totalPageCount)   startPageNo = startPageNo - pageCountPerPage + 1;
		if (endPageNo > totalPageCount)     endPageNo = totalPageCount;
		// 5. �����࿩�� �Խù� ���̺� ����Ÿ�� ���۹�ȣ,����ȣ
		if(selectPageNo == 1 && selectPageNo == totalPageCount){
			startRow = 1;
			endRow	 =totalRecordCount;
		}else if (selectPageNo < totalPageCount){
			startRow=rowCountPerPage*selectPageNo-rowCountPerPage + 1;
			endRow = rowCountPerPage*selectPageNo-rowCountPerPage + rowCountPerPage;
		}else if (selectPageNo == totalPageCount) {// ���������ΰ��..
			startRow=rowCountPerPage * selectPageNo - rowCountPerPage + 1;
			endRow = totalRecordCount;
		}
		
		// ����¡ó���� �ʿ��� ������ ListResultBean�� ����
		System.out.println("��ŸƮ������ �ѹ� Ȯ��:"+startPageNo);
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
		
		System.out.println("***************����������***************");
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
			// �������� [���� �׷�] ��¿��θ� �Ǵ��ϴ� �޼ҵ�
			public static boolean isShowPreviousIcon(int groupNo){
				ListNowGroup currGroup=new ListNowGroup();
				boolean isShow = false;
				if(groupNo > 0)  isShow=true;
				return isShow;
			}
			// �������� [���� �׷�] ��¿��θ� �Ǵ��ϴ� �޼ҵ�
			public static boolean isShowNextIcon(int endPageNo,int totalPageCount){
				boolean isShow = false;
				if(endPageNo < totalPageCount )  isShow=true;
				return isShow;
			}
			// �������� [ó������] ������ ��¿��θ� �Ǵ��ϴ� �޼ҵ�
			public static boolean isShowFirstIcon(int groupNo){
				boolean isShow = false;
				if(groupNo > 0) isShow = true;
				return isShow;
			}
			// �������� [����������] ������ ��¿��θ� �Ǵ��ϴ� �޼ҵ�
			public static boolean isShowLastIcon(int endPageNo,int totalPageCount){
				boolean isShow = false;
				if(endPageNo < totalPageCount) isShow = true;
				return isShow;
			}
	
		//�׽�Ʈ ����
		public static void main(String[] args) {
			  int selectPage =1;
			  int rowCountPerPage=3;
			  int pageCountPerPage=3;
			  int totalRecordCount=10;
			  ListNowGroup currGroup = TemPageCounter.getPageInfo(selectPage,rowCountPerPage,pageCountPerPage,totalRecordCount);
			  System.out.println("***************����������***************");
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
