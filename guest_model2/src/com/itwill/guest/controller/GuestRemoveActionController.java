package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.GuestDao;

public class GuestRemoveActionController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		String guest_noStr=request.getParameter("guest_no");
		GuestDao guestDao=new GuestDao();
		boolean isDelete=guestDao.deleteGuest(Integer.parseInt(guest_noStr));
	    if(isDelete){
	    	forwardPath="redirect:guest_list.do";
	    }else{
	    	request.setAttribute("error_msg","방명록 삭제실패!!" );
	    	forwardPath="forward:guest_error";
	    }
		return forwardPath;
	}

}
