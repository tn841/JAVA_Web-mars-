package com.itwill.seat;

import java.util.ArrayList;

public class SeatDaoTest {

	public static void main(String[] args) {
		SeatDao.getInstance();
		
		try {
			//��ȣ��ã��
			Seat seat=SeatDao.getInstance().findSeat(1);
			System.out.println("1.�ڸ���ȣ��ã��:"+seat);
			
			//��üã��
			ArrayList<Seat> seatList=SeatDao.getInstance().findSeatList();
			for (Seat seat2 : seatList) {
				System.out.println("2.�ڸ���ü���:"+seat2);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
