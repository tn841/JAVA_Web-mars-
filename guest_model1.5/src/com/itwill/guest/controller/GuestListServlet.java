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
		���� ��ü����Ʈ
		*/

		/*
		1. GuestDao��ü����
		2. GuestDao.selectAll();
		3. ����
		*/
		GuestDao guestDao=new GuestDao();
		try {
			ArrayList<Guest> guestList=guestDao.selectAll();
			request.setAttribute("guestList", guestList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/guest_list.jsp");	//�ܺο����� web-inf������ �Ұ��������� ���������� ���� �����ϴ�.(������ ����)
		rd.forward(request, response);
	}

}
