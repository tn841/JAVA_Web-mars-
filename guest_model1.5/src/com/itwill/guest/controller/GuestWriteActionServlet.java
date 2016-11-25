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
 * Servlet implementation class GuestWriteActionServlet
 */
@WebServlet("/guest_write_action.do")
public class GuestWriteActionServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fowardPath = "";
		/*
		 * 1.파라메타받기 2.GuestDao.insert(); 3.guest_list.jsp redirection
		 */
		if (request.getMethod().equalsIgnoreCase("GET")) {
			fowardPath="guest_list.do";
			response.sendRedirect(fowardPath);
			return;
		}
		// POST
		// request.setCharacterEncoding("EUC-KR");
		String guest_name = request.getParameter("guest_name");
		String guest_email = request.getParameter("guest_email");
		String guest_homepage = request.getParameter("guest_homepage");
		String guest_title = request.getParameter("guest_title");
		String guest_content = request.getParameter("guest_content");
		GuestDao guestDao = new GuestDao();
		boolean insertOK = false;
		try {
			insertOK = guestDao
					.insertGuest(new Guest(-1, guest_name, "", guest_email, guest_homepage, guest_title, guest_content));
			if (insertOK) {
				fowardPath = "guest_list.do";
				response.sendRedirect(fowardPath);
			} else {
				/*
				out.println("<script>");
				out.println("alert('방명록 쓰기실패!!');");
				out.println("location.href='guest_write_form.jsp';");
				out.println("</script>");
				*/
				fowardPath = "/WEB-INF/jsp/guest_write_form.jsp";
				request.setAttribute("error_msg", "방명록 쓰기 실패.");
				RequestDispatcher rd = request.getRequestDispatcher(fowardPath);
				rd.forward(request, response);
			}
		} catch (Exception e) {
			fowardPath = "/WEB-INF/jsp/guest_error.jsp";
			request.setAttribute("error_msg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher(fowardPath);
			rd.forward(request, response);
		}
	}

}
