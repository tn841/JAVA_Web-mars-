<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%!
	int count = 0;
%>

<%!
//jsp lifeCycle 재정의
public void jspInit(){
	System.out.println("0. jspInit:객체생성시 단 한번 호출");
}
	
public void jspDestroy(){
	System.out.println("3. jspDestory:객체가 메모리에서 해제시 단 한번 호출");	
}
%>


<%
	System.out.println("service method 실행");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
			<body bgcolor=#40e0d0 style=font-size:9pt;line-height:140%;> 
			<center>			
			 현재까지의 접속자수
			<font color=#0000FF>
			<%
				count++;
				out.print(count);
			%>
			</font>
			 명입니다 
			</center> 
			</body> 
</html> 