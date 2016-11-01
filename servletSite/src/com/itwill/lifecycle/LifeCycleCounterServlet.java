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
		System.out.println("0.LifeCycleCounterServlet()������ȣ��");
	}
	
	@Override
	public void init() throws ServletException {
		super.init();
		System.out.println("1.init()�޽��");
		/*
    	 * ������ȣ�����Ŀ� ���ѹ�ȣ��Ǵ¸޽��
    	 * 		- ��ü�ʱ�ȭ
    	 * 		- ���ҽ�ȹ��
    	 */
	}
	
	private int count;
		
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("2.service()�޽��");
		/*
		 * Ŭ���̾�Ʈ���� ��û����������
		 */
		res.setContentType("text/html;charset=euc-kr");
		PrintWriter out = res.getWriter();
		out.println("<html>");
		out.println("<body bgcolor=#40e0d0 style=font-size:9pt;line-height:140%;>");
		out.println("<center>		");
		out.println("��������� �����ڼ�");
		out.println("<font color=#0000FF>");
		++count;
		out.println(count);
		out.println("</font>");
		out.println("���Դϴ� ");
		out.println("</center> ");
		out.println("</body> ");
		out.println("</html>");
	}
	
	@Override
	public void destroy() {
		super.destroy();
		System.out.println("3.destroy()�޽��");
		/*
    	 * ��ü�� �޸𸮿��� �����ɶ�ȣ��
    	 * 		- ���ҽ� ����
    	 * 		
    	 */
	}
}
