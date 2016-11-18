package com.itwill.reservation;

import java.util.ArrayList;

public class ReservationService {
	/*
	 * 1. ��� �¼��� ���� ���� ���
	 */
	public ArrayList<String> selectAllSeat() throws Exception{
		ArrayList<String> reservedSeatList = new ArrayList<String>();
		ReservationDao rDao = ReservationDao.getInstance();
		return rDao.selectAllSeat();
	}
	
	/*
	 * 2. Ư�� ������� �������� ���
	 */
	
	
	/*
	 * 3. ���ο� ���� �߰� (���� ������ �ʼ�)
	 */
	public int createReservation(Reservation r){
		int result = 0;
		
		ReservationDao rDao = ReservationDao.getInstance();
		try{
			result = rDao.create(r);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	/*
	 * 4. ���� �ð� ����
	 */
	
	
	/*
	 * 5. ���� �ڸ� ����
	 */
	
	
	/*
	 * 6. ���� ���
	 */
	
	
	/*
	 * 7. 
	 */
}
