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

/**
 * Servlet implementation class GuestList
 */
@WebServlet("/guest_list.do")
public class GuestListServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		방명록 전체리스트
		*/

		/*
		1. GuestDao객체생성
		2. GuestDao.selectAll();
		3. 응답
		*/
		GuestDao guestDao=new GuestDao();
		try {
			ArrayList<Guest> guestList=guestDao.selectAll();
			request.setAttribute("guestList", guestList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/guest_list.jsp");	//외부에서는 web-inf접근이 불가능하지만 서버에서는 접근 가능하다.(보안적 측면)
		rd.forward(request, response);
	}

}
