package com.itwill.winter;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestDao;
/*
 * Ŭ���̾�Ʈ�� ����û�� �޴� ����
 */
//@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private HandlerMapping handlerMap;
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println(">>> 1.DispatcherServlet.init() ���� ������ȣ������ ���ѹ�ȣ��Ǵ¸޽��");
		ServletContext context = this.getServletContext();
		String controllerMappingLocation = config.getInitParameter("controllerMappingLocation");
		
		String contextRealPath = context.getRealPath(controllerMappingLocation);
		System.out.println(">>> 2.�������ϰ��:"+contextRealPath);
		this.handlerMap=new HandlerMapping(contextRealPath);
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}
	
	private void processRequest(
			HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		/*
		  1.Ŭ���̾�Ʈ ��û�м�
		  << ��ûcommand >>
		   /guest_main.do
		   /guest_list.do
		   /guest_view.do
		   /guest_write_form.do
		   /guest_write_action.do
		   /guest_remove_action.do
		   /guest_modify_form.do
		   /guest_modify_action.do 
		 */
		String command = 
				request.getRequestURI()
					.substring(
							request.getContextPath().length());	
		System.out.println("1.request command:"+command);
		
		/*
		 * 2.��ûcommand������ ��������
		 */
		String forwardPath="";
		Controller controller=null;
		/****************************************/
		//HandlerMap��ü�κ��� ��ûcommand���ش��ϴ�
		//Controller��ü��ȯ
		controller = handlerMap.getControllerMap(command);
		/****************************************/
		/*
		 * 3.forward,redirect
		 */
		forwardPath = controller.handleRequest(request,response);
		/*
		 * ex> forward:/xxx.jsp
		 *     redirect:/xxx.do 
		 */
		String[] tempPath = forwardPath.split(":");
		String forwardString = tempPath[0];
		forwardPath = tempPath[1];
		
		
		
		if(forwardString.equals("redirect")){
			response.sendRedirect(forwardPath);
		}else if(forwardString.equals("forward")){
			String prefix="/WEB-INF/jsp/";
			String surffix=".jsp";
			forwardPath=prefix+forwardPath+surffix;
			RequestDispatcher rd=
					request.getRequestDispatcher(forwardPath);
			rd.forward(request, response);
		}
		
	}

}






