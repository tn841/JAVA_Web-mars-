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

	/****** ������ Ÿ�Ժ� ���� ******/
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
	 * ������ ĸ��ȭ
	 */
	private ItemService() {
		System.out.println("ItemService Constructor");
	}

	/*
	 * �̱���
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
	 * ������ �Ѱ� ��ȯ Ÿ������ ã��
	 */
	public Item findItem(int itemType) throws Exception{
		return getItemDao().findItem(itemType);
	}
	/*
	 * ��ü����Ʈ
	 */

	public ArrayList<Item> selectAll(int start, int last) throws Exception {
		ArrayList<Item> itemList = null;
		// ItemService is=new ItemService();
		itemList = getItemDao().findItemList(start, last);

		return itemList;
	}

	/*
	 * ������ ����Ʈ
	 */
	public ListNowGroup findItemList(ListPageConfig pageConfig) throws Exception {
		// 1.��ü���� ����
		int totalRecordCount = getItemDao().getItemCount();
		// ListResultBean Ŭ���� --> �������Ÿ DTO,VO(Item ArrayList + Paging)

		// 2.paging ���(PageCounter ��ƿŬ����)
		ListNowGroup currGroup = TemPageCounter.getPageInfo(Integer.parseInt(pageConfig.getSelectPage()),
				pageConfig.getRowCountPerPage(), pageConfig.getPageCountPerPage(), totalRecordCount);
		// 3.�Խù�����Ÿ ���
		ArrayList<Item> itemList = getItemDao().findItemList(currGroup.getStartRowNum(), currGroup.getEndRowNum());
		currGroup.setItemList(itemList);

		return currGroup;
	}
	/*
	 * ������ ����Ʈ ��Ʈ ������ �̱�
	 */
	public ArrayList<Item> findItemListAsHit(int start,int end) throws Exception{
		
		return getItemDao().findItemListAsHits(1, 4);
	}
	
	/*
	 * ��Ʈ ����
	 */
	public boolean hitsUp(int itemType) throws Exception{
		Item item=getItemDao().findItem(itemType);
		return getItemDao().updateItem(item);
	}
	/*
	 * ����Ʈ ����
	 */
	public int getPoint(int itemType, int calType) throws Exception {
		Item item = ItemDao.getInstance().findItem(itemType);
		int point = 0;
		switch (calType) {
		// ����Ʈ ������
		case PLUSPOINT:
			point = item.getI_point();
			break;
		// ����Ʈ ����
		case MINUSPOINT:
			point = -item.getI_point();
			break;
		}
		return point;
	}
	/***********************Item Ability***********************************/
	
	public boolean takeAwaySeat(Reservation r) throws Exception{
		boolean isSuccess = false; //������ ��������
		// 1.�ڸ� �ش� ���� ã��
		int s_no=r.getS_no();
		ArrayList<HashMap<String, Object>> otherList=getReservationDao().select_members_by_sno(s_no);
		int other_m_no=(int)otherList.get(0).get("r_m_no");	
		System.out.println(other_m_no);
		// 2.�ڸ����� �������
		getReservationDao().deleteByRmno(other_m_no);
		ReservationService rs=new ReservationService();
		r.setS_no(s_no);
		int action=rs.createReservation(r);
		if(action != 0) isSuccess = true;
		return isSuccess;
	}
	
	/*
	 * �ڸ� �ٲٱ�(�̹� ������ �α��ε� ȸ����ȣ�� �ٲٰ��� �ϴ� �¼��� �����ڸ� ���ڷ� �޴´�)
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
	 * �¼� ���ѱ� 1.���� ���࿡�� �¼���ȣ ���� 2.���� ���� ���� 3.���ο� �������
	 */

	/*
	 * ���� ����
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
	 * �켱 ����
	 */
	public boolean reserveNextDay(int login_m_no) throws Exception {
		if (!HaveItem(login_m_no, RESERVE_NEXT_DAY)) {
			return false;
		}
		OrderService.getInstance().quanDecre(login_m_no, RESERVE_NEXT_DAY);
		return true;
	}

	/*
	 * 30�� ����
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
	 * 10�� ��� : ���� ����
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
	 * ��ü ����
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
	 * �������� ������ �ִ��� check!!
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
	 * �ڸ� ���� ���
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
