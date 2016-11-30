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
		1. 파라미터 받기
		2. UserService.remove실행
		3. 결과 반환
		*/
		
		String userId = (String)request.getParameter("userId");
		
		try{
		UserService.getInstance().removeUserById(userId);
		
		//삭제 성공
		//response.sendRedirect("user_list.jsp");
		request.setAttribute("MSG", "삭제 되었습니다.");
		forwardPath = "redirect:user_logout_action.do";
	
		
		}catch(RemoveUserException e){
			request.setAttribute("MSG", "삭제 도중 에러가 발생했습니다.");
			forwardPath = "forward:user_list";
		}catch(Exception e){
			forwardPath = "forward:error";		
		}
		
		return forwardPath;
	}

}


