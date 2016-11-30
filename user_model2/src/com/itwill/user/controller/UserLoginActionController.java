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
		System.out.println("action ����");
		String forwardPath = "";
		
		if(request.getMethod().equalsIgnoreCase("GET")){
			forwardPath="redirect:user_login_form";
		}else{

			String userId = request.getParameter("userId");
			String pass = request.getParameter("password");
			ArrayList<String> msgList = new ArrayList<String>();

			try{
				//System.out.println("�α��� �õ�");
				User loginUser = UserService.getInstance().login(userId, pass);
				//System.out.println("�α��� �������� ���ܹ߻�");
				//session.setAttribute("sUserId",	userId);
				//session.setAttribute("sUser", loginUser);
				//response.sendRedirect("user_list.jsp");
				request.getSession().setAttribute("sUserId", userId);
				request.getSession().setAttribute("sUser", loginUser);
				
				//List<User> userlist = UserService.getInstance().findUserList();
				//request.setAttribute("userList",userlist);
				forwardPath = "redirect:user_list.do";
				//System.out.println("�α��� ����");
				
			}catch(UserNotFoundException e){
				//���̵� ����
	
				msgList.add(new String("���̵� �������� �ʽ��ϴ�."));
				request.setAttribute("MSG", msgList);
				forwardPath = "forward:user_login_form";
				
			}catch(PasswordMismatchException e){
				//��� ����ġ
				
				String msg = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
				request.setAttribute("passMSG", msg);
				request.setAttribute("idInfo", userId);
				forwardPath = "forward:user_login_form";
		
			}catch(Exception e){
				//response.sendRedirect("error/error.jsp");
				request.setAttribute("error_msg", e.getMessage());
				forwardPath= "forward:error";

			}
		}
		System.out.println("login action���� forwardPath : "+forwardPath);
		return forwardPath;
	}

}


