package com.itwill.response;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HttpServletResponseDemo
 */
@WebServlet("/response.do")
public class HttpServletResponseDemo extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		String cmd = request.getParameter("cmd");
		
		out.println("<h1> 서버응답 확인</h1>");
		out.print("<hr>");
		
		if(cmd.equals("1")){
			out.println("<h3> 정상응답 </h3>");
		}
		else if(cmd.equals("2")){
			out.println("<h3> 에러응답 </h3>");			
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
		else if(cmd.equals("3")){
			out.println("<h3> 리다이렉트 </h3>");
			response.sendRedirect("04.HttpServletResponse.html");
			return;
		}
		else{
			out.println("<h3> 잘못된 요청 </h3>");
		}
		
		
		
	}

}
