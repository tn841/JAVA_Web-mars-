<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<h1>클라이언트가 업로드한 내용 보기</h1>   
 
<%
	InputStream in = request.getInputStream();	//클라가 보낸 데이터 요청을 바이트 인풋스트림을 통해 까보자
	out.println("<xmp>");

	while(true){

		int read = in.read();
		if(read == -1){
			break;
		}
		out.print((char)(read));

	}
	out.println("</xmp>");	//파싱 방지
	
	
%>