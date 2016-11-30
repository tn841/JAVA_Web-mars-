package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.user.User;
import com.itwill.user.UserService;
import com.itwill.winter.Controller;

public class UserViewController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "forward:user_view";
		
		/*
		1. 파라미터 받기
		2. UserService.finduser 호출
		3. 결과출력
		*/
		
		String userId = (String)request.getParameter("userId");
		User findUser = null;
		
		try {
			findUser = UserService.getInstance().findUserById(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("user", findUser);
		if(userId.equals(request.getSession().getAttribute("sUserId"))){
			request.setAttribute("inputButton", "Button");
		}
		return forwardPath;
	}

}


