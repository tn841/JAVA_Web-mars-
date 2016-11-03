<%@ page
	session = "true"
	pageEncoding="euc-kr"
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>page 지시어 [contentType]</h1>
<h2>형태:&lt;%@page contentType="text/html;charset=euc-kr"&gt;</h2>
<hr/>	
<ol>
	<li>세션객체:<%=session %></li>
	<li>세션ID:<%=session.getId() %></li>
	<li>세션생성시간:<%=session.getCreationTime() %></li>
	<li>세션isNew:<%=session.isNew() %></li>
	<li>세션유효시간:<%=session.getMaxInactiveInterval() %></li>
	<li>세션마지막접근시간:<%=session.getLastAccessedTime() %></li>
</ol>
</body>
</html>