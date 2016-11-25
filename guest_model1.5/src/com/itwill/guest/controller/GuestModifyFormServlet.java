package com.itwill.guest.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestDao;

/**
 * Servlet implementation class GuestModifyFormServlet
 */
@WebServlet("/guest_modify_form.do")
public class GuestModifyFormServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forwardPath = "/WEB-INF/jsp/guest_modify_form.jsp";
		
		if(request.getMethod().equalsIgnoreCase("GET")){
			response.sendRedirect("guest_list.jsp");
			return;
		}
		/*
		1.파라메타바끼
		2.GuestDao.selectByNo호출
		3.Guest 보여주기
		*/
		//POST
		
		String guest_noStr=request.getParameter("guest_no");
		GuestDao guestDao=new GuestDao();
		try {
			Guest guest=guestDao.selectByNo(Integer.parseInt(guest_noStr));
			request.setAttribute("guest", guest);
						
		} catch (Exception e) {//회원 정보 불러오기 실패시
			request.setAttribute("error_msg", e.getMessage());
		}
		
		
	
		RequestDispatcher rd = request.getRequestDispatcher(forwardPath);
		rd.forward(request, response);
	}

}
