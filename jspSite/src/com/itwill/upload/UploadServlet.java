package com.itwill.upload;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/upload.do")
@MultipartConfig(
		location="C:/GIT/JAVA_Web (eclipse mars)/jspSite/WebContent/upload",
		fileSizeThreshold=1024*1024,	//1MB���� ũ�� �ӽõ����� ����
		maxFileSize=-1,
		maxRequestSize=-1
)

public class UploadServlet extends HttpServlet {

	/*
		1. httpServletRequset.getContentType()���� multipart/form-data���� �Ǵ�
		2. HttpServletRequest.getParts() or getPart(str) �޼��带 �̿��� Part�� ���Ѵ�.
			- ���ε� �����Ϳ� ����
		3-1. Part�� Content-Disposition ����� "filename="�� �����ϸ� �����̴�.
		3-2. "filename="�� ������ �Ķ���ͷ� ó�� 
	*/
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		response.setContentType("text/html; charset=euc-kr");
		
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		out.print("<h1>���� ���ε� Servlet</h1><hr>");
		
		String contentType = request.getContentType();
		if(contentType != null && contentType.toLowerCase().startsWith("multipart/")){
			Collection<Part> parts = request.getParts();	//��� part���� ������ �´�.
			for(Part part : parts){
				if(part.getHeader("Content-Disposition").contains("filename=")){	//������ ���� part�̸�
					out.println("<h3>���� ����</h3>");
					out.println("<p>file Name : "+part.getSubmittedFileName()+"</p>");
					out.println("<p>file Size : "+part.getSize()+"</p>");
					if(part.getSize() > 0){	//���� �����Ͱ� ������
						part.write("/"+part.getSubmittedFileName()); //���� �̸�����
						part.delete();  //�ӽ����� ����
					}
				}
				else{	//������ ���� ���� part�̸�, �� �Ϲ� �� ������
					out.println("<h3>��Ʈ�� ��� �Ϲ� �Ķ���� ����</h3>");
					out.println("<p>part Name : "+part.getName()+"</p>");
					out.println("<p>parameter Info : "+request.getParameter(part.getName())+"</p>");
					
				}
				out.println("<hr>");
			}
		}else{
			
		}
	}

}
