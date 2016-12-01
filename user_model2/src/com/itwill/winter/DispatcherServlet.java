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
		//System.out.println("Prop 파일 위치 : "+mappingPropLocation);
		
		String contextRealPath = servletContext.getRealPath(mappingPropLocation);
		//System.out.println("Prop 파일의 실제 위치 : "+contextRealPath);
		
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
		
		//1. 요청 URI 분석 (command)
		command = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println(command);
		
		//2. command에 따른 업무 실행
		String forwardPath = "";
		Controller controller = null;
		
		controller = handlerMapping.getControllerMap(command);	//모든 controller를 전부 생성해 놓음??
		
		//3. forwarding 또는 redirection
		forwardPath = controller.handleRequest(request, response);
		//System.out.println("자르기전 path : "+forwardPath);
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
			//controller로 forward
			RequestDispatcher rd = request.getRequestDispatcher(forwardPath);
			rd.forward(request, response);
		}
	}

}
