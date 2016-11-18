package com.itwill.util;
//����¡ ó����  �ʿ��� ���� ��� ��ƿ Ŭ����
public class PageCounter{	
	public static ListResultBean getPagingInfo(	int selectPage,
												int rowCountPerPage,
												int pageCountPerPage, 
												int totalRecordCount){
		ListResultBean resultBean = new ListResultBean();
		
		int totalPageCount = 1;    			// ��ü��������
		int startPageNo = 1;        		// ���������� ��ȣ
		int endPageNo = 1;         			// �� ȭ��(�׷�)���� �������� ��ȣ
		int selectPageNo = 1;      			// ���õ� ������ ��ȣ
		int previousGroupStartPageNo = 1;  	// ���� �׷��� ���������� ��ȣ
		int nextGroupStartPageNo = 1;       // ���� �׷��� ����������
		int groupNo = 0;           			// �������� �׷�ѹ�
		
		// DB Query ��������� ����..
		int startRow = 0; // ���° ���ڵ����..
		int endRow   = 0; // ���° ���ڵ����..
		
		
		//**********  DB ���ڵ���� ���� ���  *********************
		// 1.��ü �������� ���
		int modula = 0;
		if (totalRecordCount > 1){ //1�� �̻��� ���ڵ尡 �����ϸ�...
			modula = (totalRecordCount) % rowCountPerPage;
			if (modula != 0){//�������� 2, 3, 4, 5,...., 9�̸�
				modula = 1;
			}else{// �������� 0�̸�(�� ��������)
				modula = 0;
			}		
			totalPageCount = (totalRecordCount)/rowCountPerPage + modula;
		}else{
			totalPageCount = 1;
		}		

		// ����ڰ� ��������ȣ�� ������ ������ ������ ����� �ٸ���.
		// 2.�� ȭ��(�׷�) ���� �������� �׷�ѹ�,
		selectPageNo = selectPage;		
		groupNo = (selectPageNo-1)/pageCountPerPage;
		// ���� pageCountPerPage �� 5 ���� �����Ͽ��� ���
		/*  
		      1  2  3  4   5 �� --> 0
	 	  ��  6  7  8  9  10 �� --> 1
		  �� 11 12 13 14  15 �� --> 2
		 */
		// 3.�� ȭ��(�׷�) ���� ������������ �������� 
		startPageNo = groupNo*pageCountPerPage + 1;
		endPageNo   = groupNo*pageCountPerPage+pageCountPerPage;
		// 4.���� ȭ��׷��� ������������ ��������
		previousGroupStartPageNo = startPageNo - pageCountPerPage;		
		if(previousGroupStartPageNo < 0){// groupNo�� 0�� ���(������ �ε����� 0~10����)
			previousGroupStartPageNo = 0;
		}
		nextGroupStartPageNo = startPageNo + pageCountPerPage;
		
		if (startPageNo > totalPageCount)   startPageNo = startPageNo - pageCountPerPage + 1;
		if (endPageNo > totalPageCount)     endPageNo = totalPageCount;
		
		// 5. �����࿩�� �Խù� ���̺� ����Ÿ�� ���۹�ȣ,����ȣ
		if (selectPageNo == 1 && selectPageNo == totalPageCount){// 1�������ΰ��..
			startRow=1;
			endRow = totalRecordCount;
		}else if (selectPageNo < totalPageCount){
			startRow=rowCountPerPage*selectPageNo-rowCountPerPage + 1;
			endRow = rowCountPerPage*selectPageNo-rowCountPerPage + rowCountPerPage;
		}else if ( selectPageNo == totalPageCount){ // ���������ΰ��..
			startRow=rowCountPerPage * selectPageNo - rowCountPerPage + 1;
			endRow = totalRecordCount;
		}
		
		
		// ����¡ó���� �ʿ��� ������ ListResultBean�� ����
		resultBean.setStartPageNo(startPageNo);
		resultBean.setEndPageNo(endPageNo);
		resultBean.setSelectPageNo(selectPageNo);
		resultBean.setTotalRecordCount(totalRecordCount);
		resultBean.setTotalPageCountCount(totalPageCount);
		resultBean.setPreviousGroupStartPageNo(previousGroupStartPageNo);
		resultBean.setNextGroupStartPageNo(nextGroupStartPageNo);
		resultBean.setStartRowNum(startRow);
		resultBean.setEndRowNum(endRow);
		//resultBean.setShowPrevious(isShowPreviousIcon(selectPageNo));
		//resultBean.setShowNext(isShowNextIcon(selectPageNo, totalPageCount));
		resultBean.setShowPreviousGroup(isShowPreviousMoreIcon(groupNo,totalPageCount));
		resultBean.setShowNextGroup(isShowNextMoreIcon(endPageNo,totalPageCount));
		resultBean.setShowFirst(isShowFirstIcon(groupNo,totalPageCount));
		resultBean.setShowLast(isShowLastIcon(endPageNo,totalPageCount));
		System.out.println("***************����������***************");
		System.out.println("01.selectPage:\t\t\t"+resultBean.getSelectPageNo());
		System.out.println("02.rowCountPerPage:\t\t"+rowCountPerPage);
		System.out.println("03.pageCountPerPage:\t\t"+pageCountPerPage);
		System.out.println("02.totalRecordCount:\t\t"+resultBean.getTotalRecordCount());
		System.out.println("03.totalPageCount:\t\t"+resultBean.getTotalPageCount());
		System.out.println("04.pagegroupNo:\t\t\t"+groupNo);
		System.out.println("05.startPageNo:\t\t\t"+resultBean.getStartPageNo());
		System.out.println("06.endPageNo:\t\t\t"+resultBean.getEndPageNo());
		System.out.println("07.startRowNum:\t\t\t"+resultBean.getStartRowNum());
		System.out.println("08.endRowNum:\t\t\t"+resultBean.getEndRowNum());
		System.out.println("09.previousGroupStartPageNo:\t"+resultBean.getPreviousGroupStartPageNo());
		System.out.println("10.nextGroupStartPageNo:\t"+resultBean.getNextGroupStartPageNo());
		System.out.println("11.isShowPreviousGroup:\t\t"+resultBean.isShowPreviousGroup());
		System.out.println("12.isShowNextGroup:\t\t"+resultBean.isShowNextGroup()); 		
		System.out.println("13.isShowFirst:\t\t\t"+resultBean.isShowFirst());
		System.out.println("14.isShowLast:\t\t\t"+resultBean.isShowLast()); 		
		System.out.println("**************************************");
		return resultBean;				
	}
	// �������� [����������] ��¿��θ� �Ǵ��ϴ� �޼ҵ�
	/* 
	public static boolean isShowPreviousIcon(int sPage){
		boolean isShow = false;	
		if (sPage > 1) isShow = true;
		return isShow;

	  }
    */
	  // �������� [����������] ��¿��θ� �Ǵ��ϴ� �޼ҵ�
	/*
	public static boolean isShowNextIcon(int sPage,int pCount){
		  boolean isShow = false;
		  if (sPage < pCount) isShow = true;
		  return isShow;
	  }	  
     */
	  // �������� [���� �׷�] ��¿��θ� �Ǵ��ϴ� �޼ҵ�
	  public  static boolean isShowPreviousMoreIcon(int groupNo,int totalPageCount) {
		   boolean isShow = false;
		  int modula = 0;
		  modula = groupNo % totalPageCount;
		  if (modula !=0 ) modula = 1;		  
		  if ((groupNo / totalPageCount + modula) >0) {
			  isShow =true;
		  }else{
			  isShow = false;
		  }
		 		  
		  return isShow;
	  }
	  

	  // �������� [���� �׷�] ��¿��θ� �Ǵ��ϴ� �޼ҵ�
	  public  static boolean isShowNextMoreIcon(int endPageNo,int totalPageCount) {
		  if (endPageNo < totalPageCount) 
				return true;
			else 
				return false;
	  }
	  
//	 �������� [ó������] ������ ��¿��θ� �Ǵ��ϴ� �޼ҵ�
	  public  static boolean isShowFirstIcon(int groupNo,int totalPageCount){
			int modula = 0;
			modula = groupNo % totalPageCount;
			if (modula!=0) modula = 1;
			if ((groupNo / totalPageCount + modula) > 0) 
				return true;
			else 
				return false;
			  
	  }  

	  // �������� [����������] ������ ��¿��θ� �Ǵ��ϴ� �޼ҵ�
	  public  static boolean isShowLastIcon(int endPageNo,int totalPageCount) {
			if (endPageNo < totalPageCount)
				return true;
			else 
				return false;
	  } 
	  // �׽�Ʈ ����
	  public static void main(String[] args) {
		  /*
		  PageCounter.getPagingInfo(selectPage,rowCountPerPage,pageCountPerPage,totalRecordCount)
		  */
		  int selectPage =8;
		  int rowCountPerPage=10;
		  int pageCountPerPage=5;
		  int totalRecordCount=563;
		  ListResultBean resultBean = PageCounter.getPagingInfo(selectPage,rowCountPerPage,pageCountPerPage,totalRecordCount);
		  System.out.println("***************����������***************");
			System.out.println("01.selectPage:\t\t\t"+resultBean.getSelectPageNo());
			System.out.println("02.rowCountPerPage:\t\t"+rowCountPerPage);
			System.out.println("03.pageCountPerPage:\t\t"+pageCountPerPage);
			System.out.println("02.totalRecordCount:\t\t"+resultBean.getTotalRecordCount());
			System.out.println("03.totalPageCount:\t\t"+resultBean.getTotalPageCount());
			System.out.println("04.pagegroupNo:\t\t\t"+(resultBean.getTotalPageCount()/pageCountPerPage==0?resultBean.getTotalPageCount()/pageCountPerPage-1 :resultBean.getTotalPageCount()/pageCountPerPage));
			System.out.println("05.startPageNo:\t\t\t"+resultBean.getStartPageNo());
			System.out.println("06.endPageNo:\t\t\t"+resultBean.getEndPageNo());
			System.out.println("07.startRowNum:\t\t\t"+resultBean.getStartRowNum());
			System.out.println("08.endRowNum:\t\t\t"+resultBean.getEndRowNum());
			System.out.println("09.previousGroupStartPageNo:\t"+resultBean.getPreviousGroupStartPageNo());
			System.out.println("10.nextGroupStartPageNo:\t"+resultBean.getNextGroupStartPageNo());
			System.out.println("11.isShowPreviousGroup:\t\t"+resultBean.isShowPreviousGroup());
			System.out.println("12.isShowNextGroup:\t\t"+resultBean.isShowNextGroup()); 		
			System.out.println("13.isShowFirst:\t\t\t"+resultBean.isShowFirst());
			System.out.println("14.isShowLast:\t\t\t"+resultBean.isShowLast()); 		
			System.out.println("**************************************");
	}
	  
	  
 }