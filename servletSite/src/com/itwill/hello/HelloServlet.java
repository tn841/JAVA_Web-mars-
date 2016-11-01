package com.itwill.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// #2-1. 클라이언트에 전송할 타입 설정
		response.setContentType("text/html;charset=EUC-KR");
		
		// #2-2. 클라이언트에 데이터를 전송하기위한 출력스트림 생성
		PrintWriter out = response.getWriter();
		
		// #2-3. 클라이언트로 데이터(HTML) 전송
		for(int i=0; i<1000; i++){
			out.println("<h1>Hello Servlet!!!"+i+"</h1><hr>");
		}
	}

}
