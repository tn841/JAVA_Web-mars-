<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<h1>Ŭ���̾�Ʈ�� ���ε��� ���� ����</h1>   
 
<%
	InputStream in = request.getInputStream();	//Ŭ�� ���� ������ ��û�� ����Ʈ ��ǲ��Ʈ���� ���� ���
	out.println("<xmp>");

	while(true){

		int read = in.read();
		if(read == -1){
			break;
		}
		out.print((char)(read));

	}
	out.println("</xmp>");	//�Ľ� ����
	
	
%>