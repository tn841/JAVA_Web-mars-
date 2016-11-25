package com.itwill.guest;

import java.util.ArrayList;

public class GuestDaoTestMain {

	public static void main(String[] args) throws Exception{
		/*
		 * tomat dbcp DataSouce객체를 naming server
		 * JNDI name 으로 찾는 작업은 Java SE환경에서는 안됨
		 */
		
		GuestDao guestDao=new GuestDao();
		ArrayList<Guest> guestList=guestDao.selectAll();
		for (Guest guest : guestList) {
			System.out.println(guest.guest_no+"\t"+guest.guest_content);
			
		}
	}

}
