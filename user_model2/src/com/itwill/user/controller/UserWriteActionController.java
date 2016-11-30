package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.user.ExistedUserException;
import com.itwill.user.User;
import com.itwill.user.UserService;
import com.itwill.winter.Controller;

public class UserWriteActionController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		
		//0. get��� url ��� �� �ؽ�Ʈ ���ڵ�
		if(request.getMethod().equalsIgnoreCase("GET")){
			forwardPath = "redirect:user_write_form.do";
			return forwardPath;
		}
		//request.setCharacterEncoding("EUC-KR");

		//1. �Ķ���� �ޱ�
		String userId = request.getParameter("userId");
		String pass = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
			
		//2. Service �޼ҵ� ȣ��
		try{
			int result = UserService.getInstance().create(new User(userId, pass, name, email));
			
		
			forwardPath = "forward:user_login_form";	
			return forwardPath;
			
		}catch(ExistedUserException e){
			/*******case1*******
			response.sendRedirect("user_write_form.jsp");
			return;
			*********************/
			
			/*******case2********
			out.println("<script>");
			out.println("alert('"+e.getMessage()+"');");
			out.println("location.href='user_write_form.jsp';");
			out.println("</script>");
			return;
			**********************/
			/*request.setAttribute("userId", userId);
			request.setAttribute("password", pass);
			request.setAttribute("name", name);
			request.setAttribute("email", email);*/
			
			//�̷��� ��ü�� ��Ƽ� request�� ���� �� ����
			User user = new User(userId, pass, name, email);
			request.setAttribute("fuser", user);	
			
			//���� �޽����� attribute�� ����
			request.setAttribute("MSG", "�ߺ��Ǵ� ���̵� �Դϴ�.");
			request.setAttribute("IdFocus", "1");
			forwardPath = "forward:user_write_form";
			return forwardPath;
			
		}catch(Exception e){
			forwardPath = "forward:user_error";
			return forwardPath;
		}
		
		
	
	}

}


