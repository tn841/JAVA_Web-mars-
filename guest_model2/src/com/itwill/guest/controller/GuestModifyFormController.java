package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestDao;

public class GuestModifyFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		try {
			String guest_noStr=request.getParameter("guest_no");
			GuestDao guestDao=new GuestDao();
			Guest guest=
					guestDao.selectByNo(Integer.parseInt(guest_noStr));
			request.setAttribute("guest",guest);
			forwardPath="forward:guest_modify_form";
			
		} catch (Exception e){
			request.setAttribute("error_msg", e.getMessage());
			forwardPath="forward:guest_error";
		}
		
		return forwardPath;
	}

}
