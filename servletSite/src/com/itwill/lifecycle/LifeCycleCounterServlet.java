package com.itwill.lifecycle;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lifecycle.do")
public class LifeCycleCounterServlet extends HttpServlet{
	
	public LifeCycleCounterServlet() {
		System.out.println("0.LifeCycleCounterServlet()생성자호출");
	}
	
	@Override
	public void init() throws ServletException {
		super.init();
		System.out.println("1.init()메쏘드");
		/*
    	 * 생성자호출직후에 단한번호출되는메쏘드
    	 * 		- 객체초기화
    	 * 		- 리소스획득
    	 */
	}
	
	private int count;
		
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("2.service()메쏘드");
		/*
		 * 클라이언트에서 요청했을때실행
		 */
		res.setContentType("text/html;charset=euc-kr");
		PrintWriter out = res.getWriter();
		out.println("<html>");
		out.println("<body bgcolor=#40e0d0 style=font-size:9pt;line-height:140%;>");
		out.println("<center>		");
		out.println("현재까지의 접속자수");
		out.println("<font color=#0000FF>");
		++count;
		out.println(count);
		out.println("</font>");
		out.println("명입니다 ");
		out.println("</center> ");
		out.println("</body> ");
		out.println("</html>");
	}
	
	@Override
	public void destroy() {
		super.destroy();
		System.out.println("3.destroy()메쏘드");
		/*
    	 * 객체가 메모리에서 해제될때호출
    	 * 		- 리소스 해지
    	 * 		
    	 */
	}
}
