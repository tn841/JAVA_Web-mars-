<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String cmd=request.getParameter("cmd");
	if(cmd==null){
		response.sendRedirect("6-1.member_menu.jsp");
		return;
	}	
	
	String forwardPath="";
	if(cmd.equals("member_list")){
		
		//MemberDao°´Ã¼¸¦ »ç¿ëÇØ¼­ ArrayList°´Ã¼¸¦ ¾ò´Â´Ù.
		
		ArrayList<String> memberList=new ArrayList<String>();
		memberList.add("ÀÌÈ¿¸®");
		memberList.add("½Å¸í¼÷");
		memberList.add("ÃÖ°æ³à");
		memberList.add("±èÀºÈñ");
		
		request.setAttribute("memberList", memberList);
		
		forwardPath="6-1.member_list.jsp";
		
		
	}else if(cmd.equals("member_login")){
		
		forwardPath="6-1.member_login.jsp";
		
	}else if(cmd.equals("member_detail")){
		//MemberDao°´Ã¼¸¦ »ç¿ëÇØ¼­ MemberDto °´Ã¼¸¦ ¾ò´Â´Ù.
		request.setAttribute("member", "±èÀºÈñ");
		forwardPath="6-1.member_detail.jsp";
	}else{
		forwardPath="../error/error.jsp";
	}
%>
<%--
	¸ðµç action tagÀÇ property¿¡´Â <%=%>ÀÌ±â¼úµÉ¼öÀÖ´Ù

 --%>

<jsp:forward page="<%=forwardPath%>"/>

<%-- 
<jsp:forward page="6-1.member_list.jsp"/>
<jsp:forward page="6-1.member_detail.jsp"/>
<jsp:forward page="6-1.member_login.jsp"/>
--%>









 