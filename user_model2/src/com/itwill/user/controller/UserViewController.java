package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.user.User;
import com.itwill.user.UserService;
import com.itwill.winter.Controller;

public class UserViewController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		
		/*
		1. �Ķ���� �ޱ�
		2. UserService.finduser ȣ��
		3. ������
		*/
		
		String userId = (String)request.getParameter("userId");
		
		try {
			User findUser = UserService.getInstance().findUserById(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String inputButton = "Button"; 
	
		return forwardPath;
	}

}


