package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.user.User;
import com.itwill.user.UserService;
import com.itwill.winter.Controller;

public class UserModifyActionController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		
		//request.setCharacterEncoding("euc-kr");
		String id = (String)request.getParameter("userId");
		String password = (String)request.getParameter("password");
		String name = (String)request.getParameter("name");
		String email = (String)request.getParameter("email");
		
		User user = new User(id, password, name, email);
		int rows = 0;
		
		try {
			rows = UserService.getInstance().updateUser(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rows > 0 ){
			//업데이트 성공
			//request.setAttribute("userId", id);
			forwardPath = "redirect:user_view.do?userId="+id;
			
			
		}else{
			//업데이트 실패
			request.setAttribute("fUser", user);
			forwardPath = "forward:user_modify_form";
		}
		
		
		return forwardPath;
	}

}


