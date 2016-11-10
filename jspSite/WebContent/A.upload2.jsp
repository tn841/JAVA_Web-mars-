<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <h1>Upload Data</h1>
  
<%
	
	String saveDirectory = application.getRealPath("/upload");
	
	/*
		1. httpServletRequset.getContentType()���� multipart/form-data���� �Ǵ�
		2. HttpServletRequest.getParts() or getPart(str) �޼��带 �̿��� Part�� ���Ѵ�.
			- ���ε� �����Ϳ� ����
		3-1. Part�� Content-Disposition ����� "filename="�� �����ϸ� �����̴�.
		3-2. "filename="�� ������ �Ķ���ͷ� ó�� 
	*/
	
	String contentType = request.getContentType();
	String partName = "";
	String partContentType = "";
	String fileSize = "";
	String fileName = "";
	
	try{
	
	if(contentType != null && contentType.toLowerCase().startsWith("multipart/")){
		Collection<Part> parts = request.getParts();	//Part�� ��� ���ϱ�, form�� name�Ӽ��� �������� ��������-> getPart("name")
		for(Part part : parts){
			partName = part.getName();
			partContentType = part.getContentType();
			if(part.getHeader("Content-Disposition").contains("filename=")){	//���� part
				out.println("<hr>");
				out.println("<li>fileSize : "+part.getSize()+"</li>");
				out.println("<li>fileName : "+part.getSubmittedFileName()+"</li>");
				if(part.getSize() > 0){	//�����Ͱ� ������ ���ε带 �����Ѵ�.
					part.write(saveDirectory);
					part.delete();
				}
				out.println("<br>");
				
			}
			else{//�Ϲ� �Ķ���� part
				out.println("<hr>");
				out.println("<li>parameter value : "+request.getParameter(part.getName())+"</li>");
				out.println("<br>");
			}
		}
	}else{
		out.println("<script>alert('mulipart�� �ƴմϴ�.'); location.href='A.file_upload.jsp';</script>");
	}
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

