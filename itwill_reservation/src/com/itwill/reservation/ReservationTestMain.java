package com.itwill.reservation;

import com.itwill.order.OrderDao;

public class ReservationTestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ReservationDao rDao = ReservationDao.getInstance();
		OrderDao oDao = OrderDao.getInstance();
		System.out.println(rDao);
		System.out.println(oDao);
		
		
	}

}
