package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestBadCommandController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		request.setAttribute("error_msg", "�߸��ȿ�û�Դϴ�.");
		forwardPath="forward:guest_error";
		return forwardPath;
	}

}
