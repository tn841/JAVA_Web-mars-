package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestDao;

public class GuestWriteActionController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		String guest_name = request.getParameter("guest_name");
		String guest_email = request.getParameter("guest_email");
		String guest_homepage = request.getParameter("guest_homepage");
		String guest_title = request.getParameter("guest_title");
		String guest_content = request.getParameter("guest_content");
		GuestDao guestDao = new GuestDao();
		boolean insertOK = false;
		try {
			insertOK = guestDao.insertGuest(
					new Guest(-1, guest_name, "", guest_email, guest_homepage, guest_title, guest_content));
			if (insertOK) {
				forwardPath = "redirect:guest_list.do";
			} else {
				forwardPath = "forward:guest_write_form";
				request.setAttribute("error_msg", "방명록 쓰기실패!!");
			}
		} catch (Exception e) {
			forwardPath = "forward:guest_error";
			request.setAttribute("error_msg", e.getMessage());
		}
		return forwardPath;
	}

}
