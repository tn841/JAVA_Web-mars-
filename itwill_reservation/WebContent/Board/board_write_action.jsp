<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="com.itwill.user.Member"%>
<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.board.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("board_list.jsp");
		return;
	}
	request.setCharacterEncoding("euc-kr");
	Board board=new Board();
	board.setTitle(request.getParameter("title"));
	board.setWriter(request.getParameter("writer"));
	board.setContent(request.getParameter("content"));
	
	
	BoardService.getInstance().create(board);
	
	String sUserId= (String)session.getAttribute("sUserId");
	Member sMember = (Member)session.getAttribute("sUser");
	
    MemberDaoService.getInstance().modifyPoint(sMember.getM_no(), 100);

    out.print("<script>");
    out.print("alert('글을 써주셔서 감사합니다. 넌 이미 100포인트를 받았다');");
    out.print("location.href='../Board/board_list.jsp'");
    out.print("</script>");
	
	
	//response.sendRedirect("board_list.jsp");
%>
