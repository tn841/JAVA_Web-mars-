<%@page import="com.itwill.user.PasswordMismatchException"%>
<%@page import="com.itwill.user.UserNotFoundException"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="com.itwill.user.Member"%>
<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="org.apache.catalina.tribes.MembershipService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    
    if(request.getMethod().equalsIgnoreCase("get")) {
    	response.sendRedirect("../User/user_login_form.jsp");
    }
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String forwardPath ="";
    try{
    Member loginMember = MemberDaoService.getInstance().login(id, pass);
    //
    session.setAttribute("sUserId", id);
    session.setAttribute("sUser", loginMember);
    int point =  loginMember.getM_point();
    
    int point2 = point+5;
    
    System.out.println(point);
    System.out.println(point2);
    System.out.println();
    
    
    MemberDaoService.getInstance().modifyPoint(loginMember.getM_no(), 5);
   
    
    //System.out.println(loginMember.getM_id());
    //System.out.println(loginMember.get);
    
    out.print("<script>");
    out.print("alert('로그인하신 것을 축하드립니다. 5포인트 퍼먹어~');");
    out.print("location.href='../main.jsp'");
    out.print("</script>");
//    response.sendRedirect("../main.jsp");
    return;
    }catch(UserNotFoundException e){
    	request.setAttribute("MSG1", e.getMessage());
    	forwardPath = "user_login_form.jsp";
    	
    }catch(PasswordMismatchException e) {
    	request.setAttribute("MSG2", e.getMessage());
    	forwardPath = "user_login_form.jsp";
    	
    }catch(Exception e) {
    	request.setAttribute("MSG3", e.getMessage());
    	forwardPath = "../main.jsp"; //
    }
    
    RequestDispatcher rd = request.getRequestDispatcher(forwardPath);
    rd.forward(request, response);
    
    %>