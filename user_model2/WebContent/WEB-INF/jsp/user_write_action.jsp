<%@page import="com.itwill.user.UserService"%>
<%@page import="com.itwill.user.ExistedUserException"%>
<%@page import="com.itwill.user.User"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	//0. get��� url ��� �� �ؽ�Ʈ ���ڵ�
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_write_form.jsp");
		return;
	}
	request.setCharacterEncoding("EUC-KR");

	//1. �Ķ���� �ޱ�
	String userId = request.getParameter("userId");
	String pass = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
		
	//2. Service �޼ҵ� ȣ��
	try{
		int result = UserService.getInstance().create(new User(userId, pass, name, email));
		
		//3. ����
		response.sendRedirect("user_login_form.jsp");	
		return;
		
	}catch(ExistedUserException e){
		/*******case1*******
		response.sendRedirect("user_write_form.jsp");
		return;
		*********************/
		
		/*******case2********
		out.println("<script>");
		out.println("alert('"+e.getMessage()+"');");
		out.println("location.href='user_write_form.jsp';");
		out.println("</script>");
		return;
		**********************/
		request.setAttribute("userId", userId);
		request.setAttribute("password", pass);
		request.setAttribute("name", name);
		request.setAttribute("email", email);
		
		//�̷��� ��ü�� ��Ƽ� request�� ���� �� ����
		User user = new User(userId, pass, name, email);
		request.setAttribute("fuser", user);	
		
		//���� �޽����� attribute�� ����
		request.setAttribute("MSG", "�ߺ��Ǵ� ���̵� �Դϴ�.");
		request.setAttribute("IdFocus", "1");
		
		//<jsp:forward page="user_write_form.jsp"/>
		RequestDispatcher rd = request.getRequestDispatcher("user_write_form.jsp");
		rd.forward(request, response);
		
		return;
	}catch(Exception e){
		//response.sendRedirect("error/error.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("error/error.jsp");
		rd.forward(request, response);
	} 
%>


