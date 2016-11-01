package com.itwill.session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.util.calendar.BaseCalendar.Date;

/**
 * Servlet implementation class SessionCountServlet
 */
@WebServlet("/session_count.do")
public class SessionCountServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out = response.getWriter();
	
		/*
		 *  <<어떤 클라이언트가 처음으로 요청을 보내서 JSESSIONID쿠키가 존재하지 않으면>>
		 *  	1. 세션 아이디를 발행[16진수의 ID]
		 *  	2. HttpSession객체 생성한 후 해당 클라이언트에 세션아이디를 설정한 후 반환
		 *  	3. 응답에 쿠키(이름:JSESSIONID, 값:세션아이디)를 add하여 클라이언트에 전송
		 *  
		 *  <<JSESSIONID쿠키가 존재하는 클라이언트가 요청을 보낸 경우>>
		 *  	1. JSESSIONID쿠키의 값(세션ID) 얻기
		 *  	2. 세션아이디에 해당하는 HttpSession객체 바인딩
		 */
		HttpSession session = request.getSession();
		
		System.out.println(request.getRequestedSessionId());
		
		boolean isNew = session.isNew();
		String sessionID = session.getId();
		long sesison_creation_time = session.getCreationTime();
		long valid_time = session.getMaxInactiveInterval();
		long last_access_time = session.getLastAccessedTime();
		
		out.println("<h1>HttpSession객체이용하여 세션카운트</h1>");
		out.println("<ol>");
		out.println("<li> 세션이 새로 생성되었는지 여부 : "+isNew+"</li>");
		out.println("<li> 세션 ID : "+sessionID+"</li>");
		out.println("<li> 세션의 생성시간 : "+sesison_creation_time+"</li>");
		out.println("<li> 세션의 유효시간 : "+valid_time+"</li>");
		out.println("<li> 세션 마지막 바인딩 시간 : "+last_access_time+"</li>");
		
		Integer countInteger = (Integer)session.getAttribute("count");
		
		int count=0;
		
		if(countInteger != null){
			//최초 요청 이후 
			count = countInteger.intValue();
		}
		

		
		
		
		count++;
		session.setAttribute("count", count);
		
		out.println("<li> 당신의 브라우저의 세션카운트 값 : "+count+"</li>");

		out.println("</ol>");
		
		
		
		
		
	}

}
