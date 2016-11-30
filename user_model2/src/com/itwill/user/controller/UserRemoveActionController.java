package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.user.RemoveUserException;
import com.itwill.user.UserService;
import com.itwill.winter.Controller;

public class UserRemoveActionController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		
		/*
		1. �Ķ���� �ޱ�
		2. UserService.remove����
		3. ��� ��ȯ
		*/
		
		String userId = (String)request.getParameter("userId");
		
		try{
		UserService.getInstance().removeUserById(userId);
		
		//���� ����
		//response.sendRedirect("user_list.jsp");
		request.setAttribute("MSG", "���� �Ǿ����ϴ�.");
		forwardPath = "redirect:user_logout_action.do";
	
		
		}catch(RemoveUserException e){
			request.setAttribute("MSG", "���� ���� ������ �߻��߽��ϴ�.");
			forwardPath = "forward:user_list";
		}catch(Exception e){
			forwardPath = "forward:error";		
		}
		
		return forwardPath;
	}

}


