package com.itwill.board;

import java.sql.SQLException;
import java.util.List;

import com.itwill.util.ListPageConfigBean;
import com.itwill.util.ListResultBean;
import com.itwill.util.PageCounter;
public class BoardService {
	private static BoardService _instance;
	private BoardService() {
		
	}
	public static  BoardService getInstance(){
		if(_instance==null){
			_instance=new BoardService();
		}
		return _instance;
	}
	/*
	 * �Խù�����
	 */
	public int remove(int boardno) throws Exception,BoardException{
		Board tempBoard=getBoardDao().findBoard(boardno);
		boolean rExist=getBoardDao().countReplay(tempBoard);
		System.out.println("������翩��:"+rExist);
		if(getBoardDao().countReplay(tempBoard)){
			//�������
			throw new BoardException("����� �ִ� �Խñ��� �����ӵſ�!!");
		}else{
			//��۾�����
			return getBoardDao().remove(tempBoard.getBoardNo());
		}
		
		
	}
	
	/*
	 * ��۾���
	 */
	public int createReplay(Board board){
		
		return getBoardDao().createReply(board);
		
	}
	/*
	 * �Խù� 1��
	 */
	public Board findBoard(int boardNo)throws Exception{
		return getBoardDao().findBoard(boardNo);
	}
	public void updateHitCount(int boardNo){
		getBoardDao().increaseReadCount(boardNo);
	}
	/*
	 * �Խù�����Ʈ
	 */
	public ListResultBean findBoardList(ListPageConfigBean pageConfig){
		//1.��ü���� ����
		int totalRecordCount = getBoardDao().getBoardCount();
		//ListResultBean Ŭ����-->�������Ÿ DTO,VO(Board ArrayList + Paging)
		
		//2.paging���(PageCounter ��ƿŬ����)
		ListResultBean resultBean=PageCounter.getPagingInfo(
								Integer.parseInt(pageConfig.getSelectPage()),
								pageConfig.getRowCountPerPage(),
								pageConfig.getPageCountPerPage(),
								totalRecordCount);
		
		/*
		 * ListResultBean resultBean=PageCounter.getPagingInfo(
								Integer.parseInt(8,
								10,
								5,
								563);
								���� ���� �ǹ���.
		 */
		
		//3.�Խù�����Ÿ ���
		List<Board> boardList=
				getBoardDao().findBoardList(resultBean.getStartRowNum(),
											resultBean.getEndRowNum());
		resultBean.setList(boardList);
		
		return resultBean;
	}
	
	
	/*
	 * �Խù�����
	 */
	public int create(Board board){
		return  getBoardDao().create(board);
	}
	/*
	 * �Խù�����
	 */
	public int update(Board board) throws SQLException {
		return getBoardDao().update(board);
	}
	private BoardDao  getBoardDao(){
		return BoardDao.getInstance();
	}
}
