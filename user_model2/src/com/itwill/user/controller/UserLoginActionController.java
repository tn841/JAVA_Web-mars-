package com.itwill.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwill.user.PasswordMismatchException;
import com.itwill.user.User;
import com.itwill.user.UserNotFoundException;
import com.itwill.user.UserService;
import com.itwill.winter.Controller;

public class UserLoginActionController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("action 수행");
		String forwardPath = "";
		
		if(request.getMethod().equalsIgnoreCase("GET")){
			forwardPath="redirect:user_login_form";
		}else{

			String userId = request.getParameter("userId");
			String pass = request.getParameter("password");
			ArrayList<String> msgList = new ArrayList<String>();

			try{
				//System.out.println("로그인 시도");
				User loginUser = UserService.getInstance().login(userId, pass);
				//System.out.println("로그인 과정에서 예외발생");
				//session.setAttribute("sUserId",	userId);
				//session.setAttribute("sUser", loginUser);
				//response.sendRedirect("user_list.jsp");
				request.getSession().setAttribute("sUserId", userId);
				request.getSession().setAttribute("sUser", loginUser);
				
				//List<User> userlist = UserService.getInstance().findUserList();
				//request.setAttribute("userList",userlist);
				forwardPath = "redirect:user_list.do";
				//System.out.println("로그인 성공");
				
			}catch(UserNotFoundException e){
				//아이디 없음
	
				msgList.add(new String("아이디가 존재하지 않습니다."));
				request.setAttribute("MSG", msgList);
				forwardPath = "forward:user_login_form";
				
			}catch(PasswordMismatchException e){
				//비번 불일치
				
				String msg = "비밀번호가 일치하지 않습니다.";
				request.setAttribute("passMSG", msg);
				request.setAttribute("idInfo", userId);
				forwardPath = "forward:user_login_form";
		
			}catch(Exception e){
				//response.sendRedirect("error/error.jsp");
				request.setAttribute("error_msg", e.getMessage());
				forwardPath= "forward:error";

			}
		}
		System.out.println("login action에서 forwardPath : "+forwardPath);
		return forwardPath;
	}

}


