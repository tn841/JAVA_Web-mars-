package com.itwill.winter;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */
//@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private HandlerMapping handlerMapping;
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		ServletContext servletContext = this.getServletContext();
		String mappingPropLocation = config.getInitParameter("propertiesFileLocation");
		//System.out.println("Prop ���� ��ġ : "+mappingPropLocation);
		
		String contextRealPath = servletContext.getRealPath(mappingPropLocation);
		//System.out.println("Prop ������ ���� ��ġ : "+contextRealPath);
		
		handlerMapping = new HandlerMapping(contextRealPath);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String command;
		
		//1. ��û URI �м� (command)
		command = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println(command);
		
		//2. command�� ���� ���� ����
		String forwardPath = "";
		Controller controller = null;
		
		controller = handlerMapping.getControllerMap(command);	//��� controller�� ���� ������ ����??
		
		//3. forwarding �Ǵ� redirection
		forwardPath = controller.handleRequest(request, response);
		//System.out.println("�ڸ����� path : "+forwardPath);
		String[] tempArr = forwardPath.split(":");
		String forwardStr = tempArr[0];
		try{
			forwardPath = tempArr[1];
		}catch(Exception e){
			throw new ServletException(e.getMessage());
		}
		
		if(forwardStr.equals("redirect")){
			response.sendRedirect(forwardPath);
		}else if(forwardStr.equals("forward")){
			String prefix = "/WEB-INF/jsp/";
			String surffix = ".jsp";
			forwardPath = prefix+forwardPath+surffix;
			RequestDispatcher rd = request.getRequestDispatcher(forwardPath);
			rd.forward(request, response);
		}else if(forwardStr.equals("forward-chain")){
			//controller�� forward
			RequestDispatcher rd = request.getRequestDispatcher(forwardPath);
			rd.forward(request, response);
		}
	}

}
