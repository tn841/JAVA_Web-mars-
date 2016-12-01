package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.winter.Controller;

public class UserLogoutActionController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "redirect:user_main.do";
		if(request.getAttribute("MSG") != null){
			forwardPath = "forward-chain:user_main.do";
		}
		request.getSession().invalidate();
		return forwardPath;
	}

}


