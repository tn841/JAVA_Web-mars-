package com.itwill.guest.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestDao;
/*
 * 클라이언트의 모든요청을 받는 서블릿
 */
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}
	private void processRequest(
			HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		/*
		  1.클라이언트 요청분석
		  << 요청command >>
		   /guest_main.do
		   /guest_list.do
		   /guest_view.do
		   /guest_write_form.do
		   /guest_write_action.do
		   /guest_remove_action.do
		   /guest_modify_form.do
		   /guest_modify_action.do 
		 */
		String command = 
				request.getRequestURI()
					.substring(
							request.getContextPath().length());	
		System.out.println("1.request command:"+command);
		
		/*
		 * 2.요청에따른 업무실행
		 */
		String forwardPath="";
		Controller controller = null;
		/****************************************/
		if(command.equals("/guest_main.do")){
			controller = new GuestMainController();
		}else if(command.equals("/guest_list.do")){
			controller = new GuestListController();
		}else if(command.equals("/guest_view.do")){
			controller = new GuestViewController();
		}else if(command.equals("/guest_write_form.do")){
			controller = new GuestWriteFormController();
		}else if(command.equals("/guest_write_action.do")){
			controller = new GuestWriteActionController();
		}else if(command.equals("/guest_remove_action.do")){
			controller = new GuestRemoveActionController();
		}else if(command.equals("/guest_modify_form.do")){
			controller = new GuestModifyFormController();
		}else if(command.equals("/guest_modify_action.do")){
			controller = new GuestModifyActionController();
		}else{
			controller = new GuestBadCommandController();
		}
		
		/****************************************/
		/*
		 * 3.forward,redirect
		 */
		forwardPath = controller.handleRequest(request, response);
		/*
		 * ex> forward:/xxx.jsp
		 *     redirect:/xxx.do 
		 */
		String[] tempPath = forwardPath.split(":");
		String forwardString = tempPath[0];
		forwardPath = tempPath[1];
		
		
		
		if(forwardString.equals("redirect")){
			response.sendRedirect(forwardPath);
		}else if(forwardString.equals("forward")){
			String prefix = "/WEB-INF/jsp/";
			String suffix = ".jsp";
			forwardPath = prefix+forwardPath+suffix;
			RequestDispatcher rd=
					request.getRequestDispatcher(forwardPath);
			rd.forward(request, response);
		}
		
	}

}






