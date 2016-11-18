package com.itwill.seat;

import java.util.ArrayList;

public class SeatDaoTest {

	public static void main(String[] args) {
		SeatDao.getInstance();
		
		try {
			//번호로찾기
			Seat seat=SeatDao.getInstance().findSeat(1);
			System.out.println("1.자리번호로찾기:"+seat);
			
			//전체찾기
			ArrayList<Seat> seatList=SeatDao.getInstance().findSeatList();
			for (Seat seat2 : seatList) {
				System.out.println("2.자리전체출력:"+seat2);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
