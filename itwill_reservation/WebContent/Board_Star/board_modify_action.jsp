<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.board.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%    
 //post ��û�� ��� ��û �����Ϳ� �ѱ� ���ڼ����� ����
if (request.getMethod().toLowerCase().equals("post")) {
	request.setCharacterEncoding("euc-kr");
}else{
	response.sendRedirect("../Board_Star/board_list.jsp");
	return;
}

//1. Board ��ü�� ����� ����ڰ� �Է��� �����͸� ����
Board board = new Board();
board.setBoardNo(
	Integer.parseInt(request.getParameter("boardno")));
board.setTitle(request.getParameter("title"));
board.setWriter(request.getParameter("writer"));
board.setContent(request.getParameter("content"));

//2. �����ͺ��̽��� ����� ���� ����
BoardService.getInstance().update_star(board);
String pageno = "1";
if (request.getParameter("pageno") != null) {
	pageno = request.getParameter("pageno");
}
//3. boardview.jsp�� �̵�
//response.sendRedirect(
//	String.format("board_view.jsp?boardno=%d&pageno=%s",
//	board.getBoardNo(), pageno));
response.sendRedirect("board_view.jsp?boardno="+board.getBoardNo()+"&pageno="+pageno);

%>
    
