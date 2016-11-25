package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestDao;

public class GuestModifyActionController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		String guest_noStr=request.getParameter("guest_no");
		String guest_name=request.getParameter("guest_name");
		String guest_email=request.getParameter("guest_email");
		String guest_homepage=request.getParameter("guest_homepage");
		String guest_title=request.getParameter("guest_title");
		String guest_content=request.getParameter("guest_content");
		Guest updateGuest = new Guest(Integer.parseInt(guest_noStr),
										guest_name,
										null,
										guest_email,
										guest_homepage,
										guest_title,
										guest_content
									  );
		GuestDao guestDao=new GuestDao();
		boolean updateOK=guestDao.updateGuest(updateGuest);
		if(updateOK){
			forwardPath="redirect:guest_view.do?guest_no="+guest_noStr;
		}else{
			request.setAttribute("error_msg","방명록 수정실패!!" );
			forwardPath="forward:guest_error";
		}
		return forwardPath;
	}

}
