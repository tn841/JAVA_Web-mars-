package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.user.User;
import com.itwill.user.UserService;
import com.itwill.winter.Controller;

public class UserModifyFormController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "forward:user_modify_form";
		
		String userId = (String)request.getParameter("userId");
		User findUser = null;
		try {
			findUser =  UserService.getInstance().findUserById(userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("user", findUser);

		if(userId.equals(request.getSession().getAttribute("sUserId"))){
			request.setAttribute("inputButton", "button");
		}
		
		return forwardPath;
	}

}


