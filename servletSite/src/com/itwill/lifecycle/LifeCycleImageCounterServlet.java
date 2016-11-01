package com.itwill.lifecycle;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/imageCounter")
public class LifeCycleImageCounterServlet extends HttpServlet{
	
	private int count;

	

	
	public LifeCycleImageCounterServlet() {
		// TODO Auto-generated constructor stub

	}
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();

	}
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
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
		out.println("<br>");
		
	
		String countStr = Integer.toString(count);
		for(int i=0; i<countStr.length(); i++){
			out.println("<img src=\"img\\"+countStr.charAt(i)+".png\">");
		}
		
			
		out.println("</center> ");
		out.println("</body> ");
		out.println("</html>");
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
	}
}
