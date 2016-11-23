<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="com.itwill.user.Member"%>
<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.board.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	//Board객체를 생성하고 입력된데이타를 읽어서 객체에저장
	Board board=new Board();
	/*
	원글boardno
	*/
	board.setBoardNo(
			Integer.parseInt(request.getParameter("boardno")));
	/*
	답글 데이타
	*/
	board.setTitle(request.getParameter("title"));
	board.setWriter(request.getParameter("writer"));
	board.setContent(request.getParameter("content"));
	
	BoardService.getInstance().createReplay_star(board);
	
	String pageno = "1";
	if(request.getParameter("pageno")!=null){
		pageno=request.getParameter("pageno");
	}
	
	String sUserId= (String)session.getAttribute("sUserId");
	Member sMember = (Member)session.getAttribute("sUser");
	
    MemberDaoService.getInstance().modifyPoint(sMember.getM_no(), 100);

    out.print("<script>");
    out.print("alert('글을 써주셔서 감사합니다. 넌 이미 100포인트를 받았다');");
    out.print("location.href='board_list.jsp?pageno="+pageno+"'");
    out.print("</script>");
    return;
	
    /*
	response.sendRedirect(
			String.format("board_list.jsp?pageno=%s",pageno));
    */
	
%>