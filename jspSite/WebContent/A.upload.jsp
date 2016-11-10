<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	/*
	MultipartRequest

	public MultipartRequest(javax.servlet.http.HttpServletRequest request,
	                        java.lang.String saveDirectory,
	                        int maxPostSize,
	                        java.lang.String encoding)  throws java.io.IOException
	
	Constructs a new MultipartRequest to handle the specified request, saving any uploaded files to the given directory, 
	and limiting the upload size to the specified length. If the content is too large, an IOException is thrown. 
	This constructor actually parses the multipart/form-data and throws an IOException if there's any problem reading or 
	parsing the request.
	
	Parameters:
	request - the servlet request.
	saveDirectory - the directory in which to save any uploaded files.
	maxPostSize - the maximum size of the POST content.
	encoding - the encoding of the response, such as ISO-8859-1
	Throws:
	java.io.IOException - if the uploaded content is larger than maxPostSize or there's a problem reading or parsing the request.

	*/
	String saveDirectory = application.getRealPath("/upload");
	MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory, 1024*1024*100, "EUC-KR");
	
%>
<h1>Upload Data</h1>
<hr/>
<h3>upload directory:<%=saveDirectory%></h3>
<br/>
<br/>
<br/>
<li>name:<%=multipartRequest.getParameter("name")%></li>
<li>fileone:<%=multipartRequest.getFilesystemName("fileone")%></li>
<li>filetwo:<%=multipartRequest.getFilesystemName("filetwo")%></li>