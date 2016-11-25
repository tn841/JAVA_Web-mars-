package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestBadCommandController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		request.setAttribute("error_msg", "잘못된요청입니다.");
		forwardPath="forward:guest_error";
		return forwardPath;
	}

}
