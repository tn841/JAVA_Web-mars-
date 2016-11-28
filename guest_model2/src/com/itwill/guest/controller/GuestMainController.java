package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.winter.Controller;

public class GuestMainController implements Controller {
	/* (non-Javadoc)
	 * @see com.itwill.guest.controller.Controller#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response){
		String forwardPath="forward:guest_main";
		return forwardPath;
	}
}
