package com.itwill.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.user.User;
import com.itwill.user.UserService;
import com.itwill.winter.Controller;

public class UserListController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "forward:user_list";
		
		try {
			List<User> userlist = UserService.getInstance().findUserList();
			request.setAttribute("userList", userlist);
			System.out.println("controllerø°º≠ ªÃ¿∫ user LIst : "+userlist.size());
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return forwardPath;
	}

}


