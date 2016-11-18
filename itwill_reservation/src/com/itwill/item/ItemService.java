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
	
	/******아이템 타입별 구분******/
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
	 * 자리뺏기 아이템 구현
	 *  1. 자리주인 변경
	 *  2. 아이템타입에 따라 다른 요소 결정 부여
	 */
	public void takeAwaySeat(){
		//1. 자리주인 변경
		SeatDao.getInstance();
				
		//2. 아이템타입에 따라 다른 요소 결정 부여
	}
	/*
	 * 포인트 리턴
	 */
	public int getPoint(int itemType, int calType) throws Exception{
		Item item=ItemDao.getInstance().findItem(itemType);
		int point=0;
		switch(calType){
			//포인트 누적시
			case PLUSPOINT:
				point= item.getI_point();
				break;
			//포인트 사용시
			case MINUSPOINT:
				point= -item.getI_point();
				break;
		}
		return point;
	}
	
	/*
	 * 자리 바꾸기(이미 예약한 로그인된 회원번호와
	 * 바꾸고자 하는 좌석의 예약자를 인자로 받는다)
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




























