package com.itwill.item;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import com.itwill.order.OrderDao;
import com.itwill.order.OrderService;
import com.itwill.order.order.Order;
import com.itwill.order.order_detail.OrderDetail;
import com.itwill.reservation.Reservation;
import com.itwill.reservation.ReservationDao;
import com.itwill.reservation.ReservationService;
import com.itwill.seat.Seat;

import oracle.net.aso.e;

public class ItemService {
	public static ItemService _Instance;
	public static final int PLUSPOINT = 0;
	public static final int MINUSPOINT = 1;

	/****** 아이템 타입별 구분 ******/
	public static final int TAKE_AWAY_SEAT = 10;
	public static final int SWITCH_SEAT = 1;
	public static final int DEFENSE_SWITCH_SEAT = 2;
	public static final int DELETER = 3;
	public static final int INIT = 4;
	public static final int SHRINK = 5;
	public static final int DEFENSE_TAKE_AWAY_SEAT = 6;
	public static final int EXTEND = 7;
	public static final int RESERVE_NEXT_DAY = 8;

	/*
	 * 생성자 캡슐화
	 */
	private ItemService() {
		System.out.println("ItemService Constructor");
	}

	/*
	 * 싱글턴
	 */
	public static ItemService getInstance() {
		if (_Instance == null) {
			_Instance = new ItemService();
		}
		return _Instance;
	}

	public void ItemAbility(int type) {

		if (TAKE_AWAY_SEAT == type) {
			//takeAwaySeat();
		}else if(SWITCH_SEAT == type){
			
		}else if(DEFENSE_SWITCH_SEAT == type){
			
		}else if(DELETER == type){
			
		}else if(INIT == type){
			
		}else if(SHRINK == type){
			
		}else if(DEFENSE_TAKE_AWAY_SEAT == type){
			
		}else if(EXTEND == type){
			
		}else if(RESERVE_NEXT_DAY == type){
			
		}
	}
	/*
	 * 아이템 한개 반환 타입으로 찾기
	 */
	public Item findItem(int itemType) throws Exception{
		return getItemDao().findItem(itemType);
	}
	/*
	 * 전체리스트
	 */

	public ArrayList<Item> selectAll(int start, int last) throws Exception {
		ArrayList<Item> itemList = null;
		// ItemService is=new ItemService();
		itemList = getItemDao().findItemList(start, last);

		return itemList;
	}

	/*
	 * 아이템 리스트
	 */
	public ListNowGroup findItemList(ListPageConfig pageConfig) throws Exception {
		// 1.전체글의 갯수
		int totalRecordCount = getItemDao().getItemCount();
		// ListResultBean 클래스 --> 결과데이타 DTO,VO(Item ArrayList + Paging)

		// 2.paging 계산(PageCounter 유틸클래스)
		ListNowGroup currGroup = TemPageCounter.getPageInfo(Integer.parseInt(pageConfig.getSelectPage()),
				pageConfig.getRowCountPerPage(), pageConfig.getPageCountPerPage(), totalRecordCount);
		// 3.게시물데이타 얻기
		ArrayList<Item> itemList = getItemDao().findItemList(currGroup.getStartRowNum(), currGroup.getEndRowNum());
		currGroup.setItemList(itemList);

		return currGroup;
	}
	/*
	 * 아이템 리스트 히트 순으로 뽑기
	 */
	public ArrayList<Item> findItemListAsHit(int start,int end) throws Exception{
		
		return getItemDao().findItemListAsHits(1, 4);
	}
	
	/*
	 * 히트 증가
	 */
	public boolean hitsUp(int itemType) throws Exception{
		Item item=getItemDao().findItem(itemType);
		return getItemDao().updateItem(item);
	}
	/*
	 * 포인트 리턴
	 */
	public int getPoint(int itemType, int calType) throws Exception {
		Item item = ItemDao.getInstance().findItem(itemType);
		int point = 0;
		switch (calType) {
		// 포인트 누적시
		case PLUSPOINT:
			point = item.getI_point();
			break;
		// 포인트 사용시
		case MINUSPOINT:
			point = -item.getI_point();
			break;
		}
		return point;
	}
	/***********************Item Ability***********************************/
	
	public boolean takeAwaySeat(Reservation r) throws Exception{
		boolean isSuccess = false; //아이템 성공여부
		// 1.자리 해당 주인 찾기
		int s_no=r.getS_no();
		ArrayList<HashMap<String, Object>> otherList=getReservationDao().select_members_by_sno(s_no);
		int other_m_no=(int)otherList.get(0).get("r_m_no");	
		System.out.println(other_m_no);
		// 2.자리주인 예약삭제
		getReservationDao().deleteByRmno(other_m_no);
		ReservationService rs=new ReservationService();
		r.setS_no(s_no);
		int action=rs.createReservation(r);
		if(action != 0) isSuccess = true;
		return isSuccess;
	}
	
	/*
	 * 자리 바꾸기(이미 예약한 로그인된 회원번호와 바꾸고자 하는 좌석의 예약자를 인자로 받는다)
	 */
	public boolean swithSeat(int login_m_no, int victim_m_no) throws Exception {
		if (HaveItem(victim_m_no, DEFENSE_SWITCH_SEAT)) {
			OrderService.getInstance().quanDecre(victim_m_no, DEFENSE_SWITCH_SEAT);
			return false;
		}
		if (!HaveItem(login_m_no, SWITCH_SEAT)) {
			return false;
		}
		ReservationDao rd = getReservationDao();
		ArrayList<HashMap<String, Object>> rList1 = rd.selectByRmno(login_m_no);
		ArrayList<HashMap<String, Object>> rList2 = rd.selectByRmno(victim_m_no);
		rd.updateSeatByRmno((int) rList2.get(0).get("r_no"), 6);
		rd.updateSeatByRmno((int) rList1.get(0).get("r_no"), (int) rList2.get(0).get("s_no"));
		rd.updateSeatByRmno((int) rList2.get(0).get("r_no"), (int) rList1.get(0).get("s_no"));
		OrderService.getInstance().quanDecre(login_m_no, SWITCH_SEAT);
		return true;
	}

	public Item selectByType(int itemType) throws Exception {
		Item item = getItemDao().findItem(itemType);
		return item;
	}

	/*
	 * 좌석 빼앗기 1.기존 예약에서 좌석번호 추출 2.기존 예약 삭제 3.새로운 예약생성
	 */

	/*
	 * 예약 삭제
	 */
	public boolean deleteR(int login_m_no, int r_m_no) throws Exception {
		if (!HaveItem(login_m_no, DELETER)) {
			return false;
		}
		OrderService.getInstance().quanDecre(login_m_no, DELETER);
		ReservationDao.getInstance().deleteByRmno(r_m_no);
		return true;
	}

	/*
	 * 우선 예약
	 */
	public boolean reserveNextDay(int login_m_no) throws Exception {
		if (!HaveItem(login_m_no, RESERVE_NEXT_DAY)) {
			return false;
		}
		OrderService.getInstance().quanDecre(login_m_no, RESERVE_NEXT_DAY);
		return true;
	}

	/*
	 * 30분 연장
	 */
	public boolean extendRT(int login_m_no) throws Exception {
		if (!HaveItem(login_m_no, EXTEND)) {
			return false;
		}
		Calendar r_e_time = Calendar.getInstance();
		ArrayList<HashMap<String, Object>> rList = ReservationDao.getInstance().selectByRmno(login_m_no);
		r_e_time.setTimeInMillis((long)(rList.get(0).get("r_e_time")));
		r_e_time.add(Calendar.MINUTE, 30);
		long d = r_e_time.getTimeInMillis();
		System.out.println(d);
		ReservationDao.getInstance().updateSeatByRmnoET(d, login_m_no);
		OrderService.getInstance().quanDecre(login_m_no, EXTEND);
		return true;
	}

	/*
	 * 10분 축소 : 위와 같음
	 */
	public boolean shrinkRT(int login_m_no, int victim_m_no) throws Exception {
		if (!HaveItem(login_m_no, SHRINK)) {
			return false;
		}
		ArrayList<HashMap<String, Object>> rList = ReservationDao.getInstance().selectByRmno(login_m_no);
		for (HashMap<String, Object> hashMap : rList) {
			Calendar r_e_time = Calendar.getInstance();
			Date d = (Date) hashMap.get("r_e_time");
			Date sd = (Date) hashMap.get("r_s_time");
			r_e_time.setTime(d);
			r_e_time.add(Calendar.MINUTE, -10);
			d = new Date(r_e_time.getTimeInMillis());
			if (sd.compareTo(d) > 0) {
				return false;
			}
			//getReservationDao().updateSeatByRmnoET(d.getTime(), login_m_no);
		}
		OrderService.getInstance().quanDecre(login_m_no, SHRINK);
		return true;
	}

	/*
	 * 전체 리셋
	 */
	public boolean init(int login_m_no) throws Exception {
		if (!HaveItem(login_m_no, INIT)) {
			return false;
		}
		getReservationDao().deleteAll();
		OrderService.getInstance().quanDecre(login_m_no, INIT);
		return true;
	}

	/*
	 * 아이템을 가지고 있는지 check!!
	 */
	public boolean HaveItem(int login_m_no, int i_type) throws Exception {
		Order o = OrderDao.getInstance().selectOrder(login_m_no);
		Collection<OrderDetail> colOD = o.getOdMap().values();
		for (OrderDetail orderDetail : colOD) {
			if (orderDetail.getI_type() == i_type) {
				return true;
			}
		}
		return false;
	}

	/*
	 * 자리 뺏기 방어
	 */
	/**************************************************************************************/
	/*
	 * get instance
	 */
	private ItemDao getItemDao() {
		return ItemDao.getInstance();
	}

	private ReservationDao getReservationDao() {
		return ReservationDao.getInstance();
	}

	private OrderDao getOderDao() {
		return OrderDao.getInstance();
	}
}
