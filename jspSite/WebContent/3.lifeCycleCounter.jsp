<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%!
	int count = 0;
%>

<%!
//jsp lifeCycle ������
public void jspInit(){
	System.out.println("0. jspInit:��ü������ �� �ѹ� ȣ��");
}
	
public void jspDestroy(){
	System.out.println("3. jspDestory:��ü�� �޸𸮿��� ������ �� �ѹ� ȣ��");	
}
%>


<%
	System.out.println("service method ����");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
			<body bgcolor=#40e0d0 style=font-size:9pt;line-height:140%;> 
			<center>			
			 ��������� �����ڼ�
			<font color=#0000FF>
			<%
				count++;
				out.print(count);
			%>
			</font>
			 ���Դϴ� 
			</center> 
			</body> 
</html> 