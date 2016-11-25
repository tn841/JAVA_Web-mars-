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
 * Servlet implementation class GuestViewServlet
 */
@WebServlet("/guest_view.do")
public class GuestViewServlet extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forwardPath = "/WEB-INF/jsp/guest_view.jsp";
		
		
		/*
		방명록 1개 상세보기
		요청URL:
		 ==>http://192.168.12.31/guest/guest_view.jsp?guest_no=3-->정상
		 ==>http://192.168.12.31/guest/guest_view.jsp  			-->null
		 ==>http://192.168.12.31/guest/guest_view.jsp?guest_no= -->""
		*/
		
		/*
			1.파라메타바끼
			2.GuestDao객체생성
			3.GuestDao.selectByNo()호출
			4.view.jsp로 forwarding
		*/
		String guest_noStr=request.getParameter("guest_no");
		if(guest_noStr==null){
			response.sendRedirect("guest_list.do");
			return;
		} 
		GuestDao guestDao=new GuestDao();
		try {
			Guest guest=guestDao.selectByNo(Integer.parseInt(guest_noStr));
			request.setAttribute("guest", guest);
			forwardPath="WEB-INF/jsp/guest_view.jsp";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("error_msg", e.getMessage());
			forwardPath="WEB-INF/jsp/guest_error.jsp";
		}
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher(forwardPath);
		rd.forward(request, response);
	}

}
