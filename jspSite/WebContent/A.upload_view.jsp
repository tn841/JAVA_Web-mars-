<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<h1>Ŭ���̾�Ʈ�� ���ε��� ���� ����</h1>   
 
<%
	InputStream in = request.getInputStream();	//Ŭ�� ���� ������ ��û�� ����Ʈ ��ǲ��Ʈ���� ���� ���
	out.println("<xmp>");
	int count = 0;
	while(true){
		count++;
		int read = in.read();
		if(read == -1){
			break;
		}
		out.print(Integer.toUnsignedString(read)+"\t");
		if(count%10 == 0){
			out.println();
		}
	}
	out.println("</xmp>");	//�Ľ� ����
	
	
%>