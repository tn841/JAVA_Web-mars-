<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL core Choose tag</h1><hr>
<form action="jstl_core_choose.jsp">
	<p>레벨을 입력하세요</p>
	<input type="text" name="level">
	<input type="submit" value="전송">
</form>
<hr>

<c:choose>
	<c:when test="${empty param.level}">
		<p>비어있음</p>
	</c:when>
	<c:when test="${param.level < '10' && param.level > '0'}">
		<p>lv.${param.level}, 초보입니다.</p>
	</c:when>
	<c:when test="${param.level < '20' && param.level >= '10'}">
		<p>lv.${param.level}, 좀 하시네요.</p>
	</c:when>
	<c:when test="${param.level < '30' && param.level >= '20'}">
		<p>lv.${param.level}, 꽤 하셨네요.</p>
	</c:when>
	<c:when test="${param.level < '40' && param.level >= '30'}">
		<p>lv.${param.level}, 고수입니다.</p>
	</c:when>
	<c:otherwise>
		<p>알수 없는 값입니다.</p>
	</c:otherwise>
</c:choose>

</body>
</html>