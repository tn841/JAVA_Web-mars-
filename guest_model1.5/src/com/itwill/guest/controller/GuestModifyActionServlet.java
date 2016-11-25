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
 * Servlet implementation class GuestModifyActionServlet
 */
@WebServlet("/guest_modify_action.do")
public class GuestModifyActionServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String forwardPath = "";

		/*
		 * 1. 파라메타바끼 
		 * 2. GuestDao.updateGuest()호출 
		 * 3. 성공시:guest_view.jsp 로 redirection 3. 실패시:guest_list.jsp 로 redirection
		 */
		if (request.getMethod().equalsIgnoreCase("GET")) {
			response.sendRedirect("guest_list.do");
			return;
		}
		
		// POST
		// request.setCharacterEncoding("EUC-KR");
		String guest_noStr = request.getParameter("guest_no");
		String guest_name = request.getParameter("guest_name");
		String guest_email = request.getParameter("guest_email");
		String guest_homepage = request.getParameter("guest_homepage");
		String guest_title = request.getParameter("guest_title");
		String guest_content = request.getParameter("guest_content");

		Guest updateGuest = new Guest(Integer.parseInt(guest_noStr), guest_name, null, guest_email, guest_homepage,	guest_title, guest_content);
		GuestDao guestDao = new GuestDao();
		boolean updateOK = guestDao.updateGuest(updateGuest);
		if (updateOK) {
			forwardPath = "WEB-INF/jsp/guest_view.jsp?guest_no=" + guest_noStr;
			request.setAttribute("success_msg", "성공적으로 수정되었습니다.");
			request.setAttribute("guest", updateGuest);
			//response.sendRedirect("guest_view.jsp?guest_no=" + guest_noStr);
		} else {
			/*out.println("<script>");
			out.println("alert('방명록 수정실패!!');");
			out.println("location.href='guest_list.jsp';");
			out.println("</script>");*/
			forwardPath = "WEB-INF/jsp/guest_view.jsp?guest_no=" + guest_noStr;
			request.setAttribute("error_msg", "오류가 발생하였습니다.");
		}

		RequestDispatcher rd = request.getRequestDispatcher(forwardPath);
		rd.forward(request, response);
	}

}
