package com.itwill.guest;

import java.util.ArrayList;

public class GuestDaoTestMain {

	public static void main(String[] args) throws Exception{
		/*
		 * tomat dbcp DataSouce��ü�� naming server
		 * JNDI name ���� ã�� �۾��� Java SEȯ�濡���� �ȵ�
		 */
		
		GuestDao guestDao=new GuestDao();
		ArrayList<Guest> guestList=guestDao.selectAll();
		for (Guest guest : guestList) {
			System.out.println(guest.guest_no+"\t"+guest.guest_content);
			
		}
	}

}
