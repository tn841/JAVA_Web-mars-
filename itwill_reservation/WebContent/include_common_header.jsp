<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <% 
    String sUserId =  (String)session.getAttribute("sUserId");
    
    %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><img src="img/logo.JPG" style="margin-top: -28px;
"></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">메인</a></li>
      <li><a href="seat_reserve_view.jsp">예약</a></li>
      <li><a href="#">게시판</a></li> 
    </ul>
    <%if(sUserId!=null) {
    	
     %>
    <ul class="nav navbar-nav navbar-right">
      <li><a href=""><span class="glyphicon glyphicon-user"></span><%=sUserId+"님 환영합니다"%></a></li>
      <li><a href="user_logout_action.jsp"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
    </ul>
    <% }else{
            %>    	
      <ul class="nav navbar-nav navbar-right">
      <li><a href="user_write_form.jsp"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
      <li><a href="user_login_form.jsp"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
    </ul>
    
    <% 
    } 
    %>
  </div>
</nav>

