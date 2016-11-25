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
		1.�Ķ��Ÿ�ٳ�
		2.GuestDao.selectByNoȣ��
		3.Guest �����ֱ�
		*/
		//POST
		
		String guest_noStr=request.getParameter("guest_no");
		GuestDao guestDao=new GuestDao();
		try {
			Guest guest=guestDao.selectByNo(Integer.parseInt(guest_noStr));
			request.setAttribute("guest", guest);
						
		} catch (Exception e) {//ȸ�� ���� �ҷ����� ���н�
			request.setAttribute("error_msg", e.getMessage());
		}
		
		
	
		RequestDispatcher rd = request.getRequestDispatcher(forwardPath);
		rd.forward(request, response);
	}

}
