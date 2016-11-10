<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <h1>Upload Data</h1>
  
<%
	
	String saveDirectory = application.getRealPath("/upload");
	
	/*
		1. httpServletRequset.getContentType()으로 multipart/form-data인지 판단
		2. HttpServletRequest.getParts() or getPart(str) 메서드를 이용해 Part를 구한다.
			- 업로드 데이터에 접근
		3-1. Part의 Content-Disposition 헤더가 "filename="을 포함하면 파일이다.
		3-2. "filename="이 없으면 파라미터로 처리 
	*/
	
	String contentType = request.getContentType();
	String partName = "";
	String partContentType = "";
	String fileSize = "";
	String fileName = "";
	
	try{
	
	if(contentType != null && contentType.toLowerCase().startsWith("multipart/")){
		Collection<Part> parts = request.getParts();	//Part의 목록 구하기, form의 name속성을 기준으로 가져오기-> getPart("name")
		for(Part part : parts){
			partName = part.getName();
			partContentType = part.getContentType();
			if(part.getHeader("Content-Disposition").contains("filename=")){	//파일 part
				out.println("<hr>");
				out.println("<li>fileSize : "+part.getSize()+"</li>");
				out.println("<li>fileName : "+part.getSubmittedFileName()+"</li>");
				if(part.getSize() > 0){	//데이터가 있으면 업로드를 수행한다.
					part.write(saveDirectory);
					part.delete();
				}
				out.println("<br>");
				
			}
			else{//일반 파라미터 part
				out.println("<hr>");
				out.println("<li>parameter value : "+request.getParameter(part.getName())+"</li>");
				out.println("<br>");
			}
		}
	}else{
		out.println("<script>alert('mulipart가 아닙니다.'); location.href='A.file_upload.jsp';</script>");
	}
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

