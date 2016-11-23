<%@page import="com.itwill.board.BoardException"%>
<%@page import="com.itwill.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
Integer boardno=null;
Integer pageno=null;
try{
	boardno=Integer.valueOf(request.getParameter("boardno"));	
	pageno=Integer.valueOf(request.getParameter("pageno"));	
}catch(Exception ex){
}
boolean result=true;
String msg="";
if(boardno==null){
	result=false;
	msg="삭제실패";
}else{
	try{
		BoardService.getInstance().remove(boardno);
		result=true;
		msg="삭제성공";
	}catch(BoardException e){
		result=false;
		msg="삭제실패:"+e.getMessage();
	}
}
%>
<script type="text/javascript">
<%if(result){ %>
	alert('<%=msg %>');
	location.href='board_list.jsp?pageno=<%=pageno%>';
<%}else{%>
	alert('<%=msg %>');
	//history.back();
	location.href='board_list.jsp?pageno=<%=pageno%>';
<%} %>
</script>




    