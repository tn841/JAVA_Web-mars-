package com.itwill.reservation;

import java.util.ArrayList;

public class ReservationService {
	/*
	 * 1. 모든 좌석의 예약 정보 출력
	 */
	public ArrayList<String> selectAllSeat() throws Exception{
		ArrayList<String> reservedSeatList = new ArrayList<String>();
		ReservationDao rDao = ReservationDao.getInstance();
		return rDao.selectAllSeat();
	}
	
	/*
	 * 2. 특정 사용자의 예약정보 출력
	 */
	
	
	/*
	 * 3. 새로운 예약 추가 (동반 예약자 필수)
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
	 * 4. 예약 시간 변경
	 */
	
	
	/*
	 * 5. 예약 자리 변경
	 */
	
	
	/*
	 * 6. 예약 취소
	 */
	
	
	/*
	 * 7. 
	 */
}
