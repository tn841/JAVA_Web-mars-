<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<students>
<% for(int i=0; i<5; i++){ %>
	<student id="a0<%=i%>">
		<name nickname="전기쥐">피카츄<%=i%></name>
		<age>24</age>
		<address>서울시 강남구<%=i%></address>
		<gender value="1"/>
		<![CDATA[
			1993년 <<풀숲에서 피츄로 출생>>
			2003년 <<피카츄로 진화>>
			2005년 <<지우와 만남>>
		]]>
	</student>
	<student id="a02">
		<name nickname="불용">파이리</name>
		<age>19</age>
		<address>백두산</address>
		<gender value="2"/>
	</student>
<%} %>
</students>