package com.itwill.reservation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.itwill.order.OrderDao;

public class ReservationTestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ReservationDao rDao = ReservationDao.getInstance();
		OrderDao oDao = OrderDao.getInstance();
		System.out.println(rDao);
		System.out.println(oDao);
		
		SimpleDateFormat format = new SimpleDateFormat("HH:mm");
		String fechaStr = "10:49";  
		Date fechaNueva;
		try {
			fechaNueva = format.parse(fechaStr);
			System.out.println(format.format(fechaNueva));
			
		
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
