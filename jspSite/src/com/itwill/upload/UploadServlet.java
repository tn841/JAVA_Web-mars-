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
		fileSizeThreshold=1024*1024,	//1MB보다 크면 임시데이터 저장
		maxFileSize=-1,
		maxRequestSize=-1
)

public class UploadServlet extends HttpServlet {

	/*
		1. httpServletRequset.getContentType()으로 multipart/form-data인지 판단
		2. HttpServletRequest.getParts() or getPart(str) 메서드를 이용해 Part를 구한다.
			- 업로드 데이터에 접근
		3-1. Part의 Content-Disposition 헤더가 "filename="을 포함하면 파일이다.
		3-2. "filename="이 없으면 파라미터로 처리 
	*/
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		response.setContentType("text/html; charset=euc-kr");
		
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		out.print("<h1>파일 업로드 Servlet</h1><hr>");
		
		String contentType = request.getContentType();
		if(contentType != null && contentType.toLowerCase().startsWith("multipart/")){
			Collection<Part> parts = request.getParts();	//모든 part들을 가지고 온다.
			for(Part part : parts){
				if(part.getHeader("Content-Disposition").contains("filename=")){	//파일을 가진 part이면
					out.println("<h3>파일 정보</h3>");
					out.println("<p>file Name : "+part.getSubmittedFileName()+"</p>");
					out.println("<p>file Size : "+part.getSize()+"</p>");
					if(part.getSize() > 0){	//파일 데이터가 있으면
						part.write("/"+part.getSubmittedFileName()); //파일 이름지정
						part.delete();  //임시파일 삭제
					}
				}
				else{	//파일을 갖지 않은 part이면, 즉 일반 폼 데이터
					out.println("<h3>파트에 담긴 일반 파라미터 정보</h3>");
					out.println("<p>part Name : "+part.getName()+"</p>");
					out.println("<p>parameter Info : "+request.getParameter(part.getName())+"</p>");
					
				}
				out.println("<hr>");
			}
		}else{
			
		}
	}

}
