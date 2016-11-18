package com.itwill.item;


import java.util.ArrayList;
import java.util.HashMap;

import com.itwill.order.OrderDao;
import com.itwill.reservation.ReservationDao;
import com.itwill.seat.SeatDao;
import com.itwill.user.MemberDao;

public class ItemService {
	
	public static ItemService _Instance;
	public static final int PLUSPOINT=0;
	public static final int MINUSPOINT=1;
	
	/******������ Ÿ�Ժ� ����******/
	public static final int TAKE_AWAY_SEAT=0;
	
	private ItemService() {
		System.out.println("ItemService Constructor");
	}
	public static ItemService getInstance(){
		if(_Instance == null){
			_Instance=new ItemService();
		}
		return _Instance;
	}
	
	public void ItemAbility(int type){
		
		if(TAKE_AWAY_SEAT == type){
			takeAwaySeat();
		}
	}
	/*
	 * �ڸ����� ������ ����
	 *  1. �ڸ����� ����
	 *  2. ������Ÿ�Կ� ���� �ٸ� ��� ���� �ο�
	 */
	public void takeAwaySeat(){
		//1. �ڸ����� ����
		SeatDao.getInstance();
				
		//2. ������Ÿ�Կ� ���� �ٸ� ��� ���� �ο�
	}
	/*
	 * ����Ʈ ����
	 */
	public int getPoint(int itemType, int calType) throws Exception{
		Item item=ItemDao.getInstance().findItem(itemType);
		int point=0;
		switch(calType){
			//����Ʈ ������
			case PLUSPOINT:
				point= item.getI_point();
				break;
			//����Ʈ ����
			case MINUSPOINT:
				point= -item.getI_point();
				break;
		}
		return point;
	}
	
	/*
	 * �ڸ� �ٲٱ�(�̹� ������ �α��ε� ȸ����ȣ��
	 * �ٲٰ��� �ϴ� �¼��� �����ڸ� ���ڷ� �޴´�)
	 */
	public boolean swithSeat(int login_m_no, int victim_m_no) throws Exception {
		ReservationDao rd = ReservationDao.getInstance();
		ArrayList<HashMap<String, Object>> rList1 = rd.selectByRmno(login_m_no);
		ArrayList<HashMap<String, Object>> rList2 = rd.selectByRmno(victim_m_no);
		rd.updateSeatByRmno((int)rList1.get(0).get("r_no"), (int)rList2.get(0).get("s_no"));
		rd.updateSeatByRmno((int)rList2.get(0).get("r_no"), (int)rList1.get(0).get("s_no"));
		return true;
	}
}




























